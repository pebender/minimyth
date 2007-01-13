/*
    vt1211.c - Part of lm_sensors, Linux kernel modules
                for hardware monitoring
                
    Copyright (c) 2002 Mark D. Studebaker <mdsxyz123@yahoo.com>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.



    Adapted to Linux 2.6 kernel by Lars Ekman <emil71se@yahoo.com>

    Updates (latest first):

    Sat Mar 19 11:23:36 CET 2005 -
	Preparations for official release;
	    - Remove all the #ifdef stuff (ALL_SENSORS and no convertion 
	      is now default).
	    - Remove normal_xxx_range defines which cause compile warnings.
	    - Remove uch_config  initialization in vt1211_init_client 
	      (trust the BIOS initialization instead, or use setting in 
	      sensors.conf)
    Tue Oct  5 17:17:01 CEST 2004 -
	Corrected faulty return value in "show_temp_hyst()".
    Sun Sep 26 09:14:36 CEST 2004 -
	Register conversion optional (disabled by default)

*/

/* Supports VIA VT1211 Super I/O sensors via ISA (LPC) accesses only. */

#include <linux/module.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/i2c.h>
#include <linux/i2c-sensor.h>
#include <linux/i2c-vid.h>
#include <asm/io.h>

/*
  Even if the register values are not converted to uasable units in
  the driver, the values should still be multiplied with some
  factor. This factor seems to be 10 for 2.4 versions and 1000 now for
  2.6. The multiplier for "in" values (voltages) was commented out in
  the 2.4 version, and I don't know the correct setting for 2.6 yet.
  Since there is still some confusion around this I made
  easy-to-change macros for the factors.
 */
#define TEMP3_MULTIPLIER 1000
#define TEMP_MULTIPLIER 1000
#define IN_MULTIPLIER 10		/* Or what? */


static int force_addr = 0;
MODULE_PARM(force_addr, "i");
MODULE_PARM_DESC(force_addr,
		 "Initialize the base address of the sensors");

static unsigned short normal_i2c[] = { I2C_CLIENT_END };
static unsigned int normal_isa[] = { 0x0000, I2C_CLIENT_ISA_END };

SENSORS_INSMOD_1(vt1211);

/* modified from kernel/include/traps.c */
#define	REG	0x2e	/* The register to read/write */
#define	DEV	0x07	/* Register: Logical device select */
#define	VAL	0x2f	/* The value to read/write */
#define PME	0x0b	/* The device with the hardware monitor */
#define	DEVID	0x20	/* Register: Device ID */

static inline void
superio_outb(int reg, int val)
{
	outb(reg, REG);
	outb(val, VAL);
}

static inline int
superio_inb(int reg)
{
	outb(reg, REG);
	return inb(VAL);
}

static inline void
superio_select(void)
{
	outb(DEV, REG);
	outb(PME, VAL);
}

static inline void
superio_enter(void)
{
	outb(0x87, REG);
	outb(0x87, REG);
}

static inline void
superio_exit(void)
{
	outb(0xAA, REG);
}


#define VT1211_DEVID 0x3c
#define VT1211_ACT_REG 0x30
#define VT1211_BASE_REG 0x60
#define VT1211_EXTENT 0x80

/* pwm numbered 1-2 */
#define VT1211_REG_PWM(nr) (0x5f + (nr))
#define VT1211_REG_PWM_CTL 0x51

/* The VT1211 registers */
/* We define the sensors as follows. Somewhat convoluted to minimize
   changes from via686a.
	Sensor		Voltage Mode	Temp Mode
	--------	------------	---------
	Reading 1			temp3
	Reading 3			temp1	not in vt1211
	UCH1/Reading2	in0		temp2
	UCH2		in1		temp4
	UCH3		in2		temp5
	UCH4		in3		temp6
	UCH5		in4		temp7
	3.3V		in5
	-12V		in6			not in vt1211
*/

/* ins numbered 0-6 */
#define VT1211_REG_IN_MAX(nr) ((nr)==0 ? 0x3d : 0x29 + ((nr) * 2))
#define VT1211_REG_IN_MIN(nr) ((nr)==0 ? 0x3e : 0x2a + ((nr) * 2))
#define VT1211_REG_IN(nr)     (0x21 + (nr))

/* fans numbered 1-2 */
#define VT1211_REG_FAN_MIN(nr) (0x3a + (nr))
#define VT1211_REG_FAN(nr)     (0x28 + (nr))

static const u8 regtemp[] = { 0x20, 0x21, 0x1f, 0x22, 0x23, 0x24, 0x25 };
static const u8 regover[] = { 0x39, 0x3d, 0x1d, 0x2b, 0x2d, 0x2f, 0x31 };
static const u8 reghyst[] = { 0x3a, 0x3e, 0x1e, 0x2c, 0x2e, 0x30, 0x32 };

/* temps numbered 1-7 */
#define VT1211_REG_TEMP(nr)		(regtemp[(nr) - 1])
#define VT1211_REG_TEMP_OVER(nr)	(regover[(nr) - 1])
#define VT1211_REG_TEMP_HYST(nr)	(reghyst[(nr) - 1])
#define VT1211_REG_TEMP_LOW3	0x4b	/* bits 7-6 */
#define VT1211_REG_TEMP_LOW2	0x49	/* bits 5-4 */
#define VT1211_REG_TEMP_LOW47	0x4d

#define VT1211_REG_CONFIG 0x40
#define VT1211_REG_ALARM1 0x41
#define VT1211_REG_ALARM2 0x42
#define VT1211_REG_VID    0x45
#define VT1211_REG_FANDIV 0x47
#define VT1211_REG_UCH_CONFIG 0x4a
#define VT1211_REG_TEMP1_CONFIG 0x4b
#define VT1211_REG_TEMP2_CONFIG 0x4c

/* temps 1-7; voltages 0-6 */
#define ISTEMP(i, ch_config) ((i) == 1 ? 1 : \
			      (i) == 3 ? 1 : \
			      (i) == 2 ? ((ch_config) >> 2) & 0x01 : \
			                 ((ch_config) >> ((i)-1)) & 0x01)
#define ISVOLT(i, ch_config) ((i) > 4 ? 1 : !(((ch_config) >> ((i)+2)) & 0x01))

#define DIV_FROM_REG(val) (1 << (val))
#define DIV_TO_REG(val) ((val)==8?3:(val)==4?2:(val)==1?0:1)
#define PWM_FROM_REG(val) (val)
#define PWM_TO_REG(val) SENSORS_LIMIT((val), 0, 255)

#define TEMP3_FROM_REG(val) ((val)*TEMP3_MULTIPLIER)
#define TEMP3_FROM_REG10(val) (((val)*TEMP3_MULTIPLIER)/4)
#define TEMP3_TO_REG(val) (SENSORS_LIMIT(((val)<0? \
	(((val)-(TEMP3_MULTIPLIER/2))/TEMP3_MULTIPLIER):\
	((val)+(TEMP3_MULTIPLIER/2))/TEMP3_MULTIPLIER),0,255))
#define TEMP_FROM_REG(val) ((val)*TEMP_MULTIPLIER)
#define TEMP_FROM_REG10(val) (((val)*TEMP_MULTIPLIER)/4)
#define TEMP_TO_REG(val) (SENSORS_LIMIT(((val)<0? \
	(((val)-(TEMP_MULTIPLIER/2))/TEMP_MULTIPLIER):\
	((val)+(TEMP_MULTIPLIER/2))/TEMP_MULTIPLIER),0,255))


/********* FAN RPM CONVERT ********/
/* But this chip saturates back at 0, not at 255 like all the other chips.
   So, 0 means 0 RPM */
static inline u8 FAN_TO_REG(long rpm, int div)
{
	if (rpm == 0)
		return 0;
	rpm = SENSORS_LIMIT(rpm, 1, 1000000);
	return SENSORS_LIMIT((1310720 + rpm * div / 2) / (rpm * div), 1, 255);
}

#define MIN_TO_REG(a,b) FAN_TO_REG(a,b)
#define FAN_FROM_REG(val,div) ((val)==0?0:(val)==255?0:1310720/((val)*(div)))



struct vt1211_data {
	struct i2c_client client;
	struct semaphore lock;
	enum chips type;

	struct semaphore update_lock;
	char valid;		/* !=0 if following fields are valid */
	unsigned long last_updated;	/* In jiffies */

	u8 in[7];		/* Register value */
	u8 in_max[7];		/* Register value */
	u8 in_min[7];		/* Register value */
	u16 temp[7];		/* Register value 10 bit */
	u8 temp_over[7];	/* Register value */
	u8 temp_hyst[7];	/* Register value */
	u8 fan[2];		/* Register value */
	u8 fan_min[2];		/* Register value */
	u8 fan_div[2];		/* Register encoding, shifted right */
	u16 alarms;		/* Register encoding */
	u8 pwm[2];		/* Register value */
	u8 pwm_ctl;		/* Register value */
	u8 vid;			/* Register encoding */
	u8 vrm;
	u8 uch_config;
};

static int vt1211_attach_adapter(struct i2c_adapter *adapter);
static int vt1211_detach_client(struct i2c_client *client);
static struct vt1211_data *vt1211_update_device(struct device *dev);

static struct i2c_driver vt1211_driver = {
	.owner		= THIS_MODULE,
	.name		= "vt1211",
	.id		= I2C_DRIVERID_VT1211,
	.flags		= I2C_DF_NOTIFY,
	.attach_adapter	= vt1211_attach_adapter,
	.detach_client	= vt1211_detach_client,
};

static inline int vt_rdval(struct i2c_client *client, u8 reg)
{
	return (inb_p(client->addr + reg));
}

static inline void vt1211_write_value(
	struct i2c_client *client, u8 reg, u8 value)
{
	outb_p(value, client->addr + reg);
}

static void vt1211_init_client(struct i2c_client *client)
{
	struct vt1211_data *data = i2c_get_clientdata(client);

	data->vrm = DEFAULT_VRM;
	/* set "default" interrupt mode for alarms, which isn't the default */
	vt1211_write_value(client, VT1211_REG_TEMP1_CONFIG, 0);
	vt1211_write_value(client, VT1211_REG_TEMP2_CONFIG, 0);
}

#define IN_FROM_REG(val,n) ((val)*IN_MULTIPLIER)
#define IN_TO_REG(val,n)  (SENSORS_LIMIT( \
	(((val)+(IN_MULTIPLIER/2))/IN_MULTIPLIER),0,255))

/* ----------------------------------------------------------------------
   Temerature file definitions;
*/

static ssize_t show_temp(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	if (nr == 2) {
		return sprintf(buf, "%d\n", TEMP3_FROM_REG10(data->temp[nr]));
	}
	return sprintf(buf, "%d\n", TEMP_FROM_REG10(data->temp[nr]));
}
static ssize_t show_temp_over(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	if (nr == 2) {
		return sprintf(buf, "%d\n", 
			       TEMP3_FROM_REG(data->temp_over[nr]));
	}
	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_over[nr]));
}

static ssize_t set_temp_over(
	struct device *dev, const char *buf, size_t count, int nr)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = i2c_get_clientdata(client);
	long val = simple_strtol(buf, NULL, 10);
	if (nr == 2) {
		data->temp_over[nr] = TEMP3_TO_REG(val);
	} else {
		data->temp_over[nr] = TEMP_TO_REG(val);
	}
	vt1211_write_value(client,
			   VT1211_REG_TEMP_OVER(nr + 1),
			   data->temp_over[nr]);
	return count;
}

static ssize_t show_temp_hyst(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	if (nr == 2) {
		return sprintf(buf, "%d\n", 
			       TEMP3_FROM_REG(data->temp_hyst[nr]));
	}
	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp_hyst[nr]));
}

static ssize_t set_temp_hyst(
	struct device *dev, const char *buf, size_t count, int nr)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = i2c_get_clientdata(client);
	long val = simple_strtol(buf, NULL, 10);
	if (nr == 2) {
		data->temp_hyst[nr] = TEMP3_TO_REG(val);
	} else {
		data->temp_hyst[nr] = TEMP_TO_REG(val);
	}
	vt1211_write_value(client,
			   VT1211_REG_TEMP_HYST(nr + 1),
			   data->temp_hyst[nr]);
	return count;
}

#define show_temp_offset(offset)					\
static ssize_t show_temp_##offset (struct device *dev, char *buf)	\
{									\
	return show_temp(dev, buf, 0x##offset -1);			\
}									\
static ssize_t show_temp_over_##offset (struct device *dev, char *buf)\
{									\
	return show_temp_over(dev, buf, 0x##offset -1);			\
}									\
static ssize_t set_temp_over_##offset (					\
	struct device *dev, const char *buf, size_t count)		\
{									\
	return set_temp_over(dev, buf, count, 0x##offset - 1);		\
}									\
static ssize_t show_temp_hyst_##offset (struct device *dev, char *buf)	\
{									\
	return show_temp_hyst(dev, buf, 0x##offset -1);			\
}									\
static ssize_t set_temp_hyst_##offset (					\
	struct device *dev, const char *buf, size_t count)		\
{									\
	return set_temp_hyst(dev, buf, count, 0x##offset - 1);		\
}									\
static DEVICE_ATTR(temp##offset##_input, S_IRUGO, show_temp_##offset, NULL); \
static DEVICE_ATTR(temp##offset##_max, S_IRUGO | S_IWUSR,		\
		   show_temp_over_##offset, set_temp_over_##offset);	\
static DEVICE_ATTR(temp##offset##_max_hyst, S_IRUGO | S_IWUSR,		\
		show_temp_hyst_##offset, set_temp_hyst_##offset)


show_temp_offset(1);
show_temp_offset(2);
show_temp_offset(3);
show_temp_offset(4);
show_temp_offset(5);
show_temp_offset(6);
show_temp_offset(7);

/* ----------------------------------------------------------------------
   uch_config;
 */

static ssize_t show_uch_config(struct device *dev, char *buf)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", data->uch_config & 0x7c);
}

static ssize_t set_uch_config(
	struct device *dev, const char *buf, size_t count)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = vt1211_update_device(dev);
	long val = simple_strtol(buf, NULL, 10);
	data->uch_config = (data->uch_config & 0x83)|(val & 0x7c);
	vt1211_write_value(client, VT1211_REG_UCH_CONFIG, data->uch_config);
	return count;
}

static DEVICE_ATTR(uch_config, S_IRUGO | S_IWUSR, 
		   show_uch_config, set_uch_config);

/* ----------------------------------------------------------------------
   Fan definitions;
 */

static ssize_t show_fan(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", 
		       FAN_FROM_REG(data->fan[nr],
				    DIV_FROM_REG(data->fan_div[nr])));
}
static ssize_t show_fan_min(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", 
		       FAN_FROM_REG(data->fan_min[nr],
				    DIV_FROM_REG(data->fan_div[nr])));
}
static ssize_t set_fan_min(
	struct device *dev, const char *buf, size_t count, int nr)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = i2c_get_clientdata(client);
	long val = simple_strtol(buf, NULL, 10);
	data->fan_min[nr] = MIN_TO_REG(val, DIV_FROM_REG(data->fan_div[nr]));
	vt1211_write_value(client, VT1211_REG_FAN_MIN(nr+1), 
			   data->fan_min[nr]);
	return count;
}
static ssize_t show_fan_div(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", DIV_FROM_REG(data->fan_div[nr]));
}
static ssize_t set_fan_div(
	struct device *dev, const char *buf, size_t count, int nr)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = i2c_get_clientdata(client);
	long val = simple_strtol(buf, NULL, 10);
	int old = vt_rdval(client, VT1211_REG_FANDIV);
	if (nr == 0) {
		data->fan_div[0] = DIV_TO_REG(val);
		old = (old & 0xcf) | (data->fan_div[0] << 4);
	} else {
		data->fan_div[1] = DIV_TO_REG(val);
		old = (old & 0x3f) | (data->fan_div[1] << 6);
	}
	vt1211_write_value(client, VT1211_REG_FANDIV, old);
	return count;
}
static ssize_t show_fan_pwm(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", PWM_FROM_REG(data->pwm[nr]));
}
static ssize_t set_fan_pwm(
	struct device *dev, const char *buf, size_t count, int nr)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = i2c_get_clientdata(client);
	long val = simple_strtol(buf, NULL, 10);
	data->pwm[nr] = PWM_TO_REG(val);
	vt1211_write_value(client, VT1211_REG_PWM(nr+1), data->pwm[nr]);
	return count;
}
static ssize_t show_fan_pwm_ctl(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n",(data->pwm_ctl >> (3 + (4 * nr))) & 1);
}
static ssize_t set_fan_pwm_ctl(
	struct device *dev, const char *buf, size_t count, int nr)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = i2c_get_clientdata(client);
	long val = simple_strtol(buf, NULL, 10);
	if (val) {
		data->pwm_ctl |= (0x08 << (4 * nr));
		vt1211_write_value(client, VT1211_REG_PWM_CTL, data->pwm_ctl);
	} else {
		data->pwm_ctl &= ~ (0x08 << (4 * nr));
		vt1211_write_value(client, VT1211_REG_PWM_CTL, data->pwm_ctl);
	}
	return count;
}

#define show_fan_offset(offset)						\
static ssize_t show_fan_##offset (struct device *dev, char *buf)	\
{									\
	return show_fan(dev, buf, 0x##offset - 1);			\
}									\
static ssize_t show_fan_min_##offset (struct device *dev, char *buf)	\
{									\
	return show_fan_min(dev, buf, 0x##offset - 1);			\
}									\
static ssize_t set_fan_min_##offset (					\
	struct device *dev, const char *buf, size_t count)		\
{									\
	return set_fan_min(dev, buf, count, 0x##offset - 1);		\
}									\
static ssize_t show_fan_div_##offset (struct device *dev, char *buf)	\
{									\
	return show_fan_div(dev, buf, 0x##offset - 1);			\
}									\
static ssize_t set_fan_div_##offset (					\
	struct device *dev, const char *buf, size_t count)		\
{									\
	return set_fan_div(dev, buf, count, 0x##offset - 1);		\
}									\
static ssize_t show_fan_pwm_##offset (struct device *dev, char *buf)	\
{									\
	return show_fan_pwm(dev, buf, 0x##offset - 1);			\
}									\
static ssize_t set_fan_pwm_##offset (					\
	struct device *dev, const char *buf, size_t count)		\
{									\
	return set_fan_pwm(dev, buf, count, 0x##offset - 1);		\
}									\
static ssize_t show_fan_pwm_ctl_##offset (struct device *dev, char *buf)\
{									\
	return show_fan_pwm_ctl(dev, buf, 0x##offset - 1);		\
}									\
static ssize_t set_fan_pwm_ctl_##offset (				\
	struct device *dev, const char *buf, size_t count)		\
{									\
	return set_fan_pwm_ctl(dev, buf, count, 0x##offset - 1);	\
}									\
static DEVICE_ATTR(fan##offset##_input, S_IRUGO, show_fan_##offset, NULL); \
static DEVICE_ATTR(fan##offset##_min, S_IRUGO | S_IWUSR,		\
	show_fan_min_##offset, set_fan_min_##offset);			\
static DEVICE_ATTR(fan##offset##_div, S_IRUGO | S_IWUSR,		\
	 show_fan_div_##offset, set_fan_div_##offset);			\
static DEVICE_ATTR(fan##offset##_pwm, S_IRUGO | S_IWUSR,		\
	show_fan_pwm_##offset, set_fan_pwm_##offset);			\
static DEVICE_ATTR(fan##offset##_pwm_enable, S_IRUGO | S_IWUSR,		\
	show_fan_pwm_ctl_##offset, set_fan_pwm_ctl_##offset);

show_fan_offset(1);
show_fan_offset(2);

/* ----------------------------------------------------------------------
   Voltage (in) file definitions;
*/

static ssize_t show_in(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", IN_FROM_REG(data->in[nr], nr));
}
static ssize_t show_in_min(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_min[nr], nr));
}
static ssize_t set_in_min(
	struct device *dev, const char *buf, size_t count, int nr)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = i2c_get_clientdata(client);
	long val = simple_strtol(buf, NULL, 10);
	data->in_min[nr] = IN_TO_REG(val, nr);
	vt1211_write_value(client, VT1211_REG_IN_MIN(nr), data->in_min[nr]);
	return count;
}
static ssize_t show_in_max(struct device *dev, char *buf, int nr)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", IN_FROM_REG(data->in_max[nr], nr));
}
static ssize_t set_in_max(
	struct device *dev, const char *buf, size_t count, int nr)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = i2c_get_clientdata(client);
	long val = simple_strtol(buf, NULL, 10);
	data->in_max[nr] = IN_TO_REG(val, nr);
	vt1211_write_value(client, VT1211_REG_IN_MAX(nr), data->in_max[nr]);
	return count;
}

#define show_in_offset(offset)						\
static ssize_t show_in_##offset (struct device *dev, char *buf)		\
{									\
	return show_in(dev, buf, 0x##offset);				\
}									\
static ssize_t show_in_min_##offset (struct device *dev, char *buf)	\
{									\
	return show_in_min(dev, buf, 0x##offset);			\
}									\
static ssize_t set_in_min_##offset (					\
	struct device *dev, const char *buf, size_t count)		\
{									\
	return set_in_min(dev, buf, count, 0x##offset);			\
}									\
static ssize_t show_in_max_##offset (struct device *dev, char *buf)	\
{									\
	return show_in_max(dev, buf, 0x##offset);			\
}									\
static ssize_t set_in_max_##offset (					\
	struct device *dev, const char *buf, size_t count)		\
{									\
	return set_in_max(dev, buf, count, 0x##offset);			\
}									\
static DEVICE_ATTR(in##offset##_input, S_IRUGO, show_in_##offset, NULL); \
static DEVICE_ATTR(in##offset##_min, S_IRUGO | S_IWUSR,			\
	show_in_min_##offset, set_in_min_##offset);			\
static DEVICE_ATTR(in##offset##_max, S_IRUGO | S_IWUSR,			\
	show_in_max_##offset, set_in_max_##offset);			\

show_in_offset(0);
show_in_offset(1);
show_in_offset(2);
show_in_offset(3);
show_in_offset(4);
show_in_offset(5);
show_in_offset(6);

static ssize_t show_vid(struct device *dev, char *buf)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
}
static DEVICE_ATTR(in0_ref, S_IRUGO, show_vid, NULL);

static ssize_t show_vrm(struct device *dev, char *buf)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", data->vrm);
}
static ssize_t set_vrm(
	struct device *dev, const char *buf, size_t count)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = i2c_get_clientdata(client);
	long val = simple_strtol(buf, NULL, 10);
	data->vrm = val;
	return count;
}
static DEVICE_ATTR(vrm, S_IRUGO | S_IWUSR, show_vrm, set_vrm);

/* ----------------------------------------------------------------------
   alarm file definitions;
*/

static ssize_t show_alarms(struct device *dev, char *buf)
{
	struct vt1211_data *data = vt1211_update_device(dev);
	return sprintf(buf, "%d\n", data->alarms);
}
static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);


/*
  END of file definitions
  ---------------------------------------------------------------------- */

/*
  (vt1211_update_device is almost unchanged since 2.4.x)
 */
static struct vt1211_data *vt1211_update_device(struct device *dev)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct vt1211_data *data = i2c_get_clientdata(client);

	down(&data->update_lock);

	if ((jiffies - data->last_updated > HZ + HZ / 2) ||
	    (jiffies < data->last_updated) || !data->valid) {

		int i, j;

		dev_dbg(&client->dev, "Starting vt1211 update\n");

		for (i = 0; i <= 5; i++) {
			if(ISVOLT(i, data->uch_config)) {
				data->in[i] =vt_rdval(client,VT1211_REG_IN(i));
				data->in_min[i] = vt_rdval(client,
				                        VT1211_REG_IN_MIN(i));
				data->in_max[i] = vt_rdval(client,
				                        VT1211_REG_IN_MAX(i));
			} else {
				data->in[i] = 0;
				data->in_min[i] = 0;
				data->in_max[i] = 0;
			}
		}
		for (i = 1; i <= 2; i++) {
			data->fan[i - 1] = vt_rdval(client, VT1211_REG_FAN(i));
			data->fan_min[i - 1] = vt_rdval(client,
						     VT1211_REG_FAN_MIN(i));
		}
		for (i = 2; i <= 7; i++) {
			if(ISTEMP(i, data->uch_config)) {
				data->temp[i - 1] = vt_rdval(client,
					             VT1211_REG_TEMP(i)) << 2;
				switch(i) {
					case 1:
						/* ? */
						j = 0;
						break;
					case 2:
						j = (vt_rdval(client,
						  VT1211_REG_TEMP_LOW2) &
						                    0x30) >> 4;
						break;
					case 3:
						j = (vt_rdval(client,
						  VT1211_REG_TEMP_LOW3) &
						                    0xc0) >> 6;
						break;
					case 4:
					case 5:
					case 6:
					case 7:
					default:
						j = (vt_rdval(client,
						  VT1211_REG_TEMP_LOW47) >>
						            ((i-4)*2)) & 0x03;
						break;
	
				}
				data->temp[i - 1] |= j;
				data->temp_over[i - 1] = vt_rdval(client,
					              VT1211_REG_TEMP_OVER(i));
				data->temp_hyst[i - 1] = vt_rdval(client,
					              VT1211_REG_TEMP_HYST(i));
			} else {
				data->temp[i - 1] = 0;
				data->temp_over[i - 1] = 0;
				data->temp_hyst[i - 1] = 0;
			}
		}

		for (i = 1; i <= 2; i++) {
			data->fan[i - 1] = vt_rdval(client, VT1211_REG_FAN(i));
			data->fan_min[i - 1] = vt_rdval(client,
			                                VT1211_REG_FAN_MIN(i));
			data->pwm[i - 1] = vt_rdval(client, VT1211_REG_PWM(i));
		}

		data->pwm_ctl = vt_rdval(client, VT1211_REG_PWM_CTL);
		i = vt_rdval(client, VT1211_REG_FANDIV);
		data->fan_div[0] = (i >> 4) & 0x03;
		data->fan_div[1] = i >> 6;
		data->alarms = vt_rdval(client, VT1211_REG_ALARM1) |
		                    (vt_rdval(client, VT1211_REG_ALARM2) << 8);
		data->vid= vt_rdval(client, VT1211_REG_VID) & 0x1f;

		data->last_updated = jiffies;
		data->valid = 1;
	}

	up(&data->update_lock);

	return data;
}


int vt1211_detect(struct i2c_adapter *adapter, int address, int kind)
{
	struct i2c_client *new_client = 0;
	struct vt1211_data *data;
	int err = 0;
	u8 val;
	const char *client_name = "vt1211";

	if (!i2c_is_isa_adapter(adapter)) {
		return 0;
	}

	if(force_addr) {
		printk("vt1211.o: forcing ISA address 0x%04X\n", address);
		address = force_addr & ~(VT1211_EXTENT - 1);
		superio_enter();
		superio_select();
		superio_outb(VT1211_BASE_REG, address >> 8);
		superio_outb(VT1211_BASE_REG+1, address & 0xff);
		superio_exit();
	}

	superio_enter();
	superio_select();
	if((val = 0x01 & superio_inb(VT1211_ACT_REG)) == 0)
		superio_outb(VT1211_ACT_REG, 1);
	superio_exit();

	if (!request_region(address, VT1211_EXTENT, "vt1211-sensors")) {
		err = -EBUSY;
		goto ERROR0;
	}

	/* OK. For now, we presume we have a valid client. We now
	   create the client structure, even though we cannot fill it
	   completely yet.
	   */

	if (!(data = kmalloc(sizeof(struct vt1211_data), GFP_KERNEL))) {
		err = -ENOMEM;
		goto ERROR3;
	}
	memset(data, 0, sizeof(struct vt1211_data));
	new_client = &data->client;

	init_MUTEX(&data->lock);
	i2c_set_clientdata(new_client, data);
	new_client->addr = address;
	new_client->adapter = adapter;
	new_client->driver = &vt1211_driver;
	new_client->flags = 0;

	/* Fill in the remaining client fields and put into the global list */
	strlcpy(new_client->name, client_name, I2C_NAME_SIZE);
	data->type = vt1211;

	data->valid = 0;
	init_MUTEX(&data->update_lock);

	/* Tell the I2C layer a new client has arrived */
	if ((err = i2c_attach_client(new_client)))
		goto ERROR3;

	vt1211_init_client(new_client);

	device_create_file(&new_client->dev, &dev_attr_uch_config);

	device_create_file(&new_client->dev, &dev_attr_temp1_input);
	device_create_file(&new_client->dev, &dev_attr_temp1_max);
	device_create_file(&new_client->dev, &dev_attr_temp1_max_hyst);
	device_create_file(&new_client->dev, &dev_attr_temp2_input);
	device_create_file(&new_client->dev, &dev_attr_temp2_max);
	device_create_file(&new_client->dev, &dev_attr_temp2_max_hyst);
	device_create_file(&new_client->dev, &dev_attr_temp3_input);
	device_create_file(&new_client->dev, &dev_attr_temp3_max);
	device_create_file(&new_client->dev, &dev_attr_temp3_max_hyst);
	device_create_file(&new_client->dev, &dev_attr_temp4_input);
	device_create_file(&new_client->dev, &dev_attr_temp4_max);
	device_create_file(&new_client->dev, &dev_attr_temp4_max_hyst);
	device_create_file(&new_client->dev, &dev_attr_temp5_input);
	device_create_file(&new_client->dev, &dev_attr_temp5_max);
	device_create_file(&new_client->dev, &dev_attr_temp5_max_hyst);
	device_create_file(&new_client->dev, &dev_attr_temp6_input);
	device_create_file(&new_client->dev, &dev_attr_temp6_max);
	device_create_file(&new_client->dev, &dev_attr_temp6_max_hyst);
	device_create_file(&new_client->dev, &dev_attr_temp7_input);
	device_create_file(&new_client->dev, &dev_attr_temp7_max);
	device_create_file(&new_client->dev, &dev_attr_temp7_max_hyst);

	device_create_file(&new_client->dev, &dev_attr_fan1_input);
	device_create_file(&new_client->dev, &dev_attr_fan2_input);
	device_create_file(&new_client->dev, &dev_attr_fan1_div);
	device_create_file(&new_client->dev, &dev_attr_fan2_div);
	device_create_file(&new_client->dev, &dev_attr_fan1_min);
	device_create_file(&new_client->dev, &dev_attr_fan2_min);
	device_create_file(&new_client->dev, &dev_attr_fan1_pwm);
	device_create_file(&new_client->dev, &dev_attr_fan2_pwm);
	device_create_file(&new_client->dev, &dev_attr_fan1_pwm_enable);
	device_create_file(&new_client->dev, &dev_attr_fan2_pwm_enable);

	device_create_file(&new_client->dev, &dev_attr_in0_ref);
	device_create_file(&new_client->dev, &dev_attr_alarms);
	device_create_file(&new_client->dev, &dev_attr_vrm);
	device_create_file(&new_client->dev, &dev_attr_in0_input);
	device_create_file(&new_client->dev, &dev_attr_in0_min);
	device_create_file(&new_client->dev, &dev_attr_in0_max);
	device_create_file(&new_client->dev, &dev_attr_in1_input);
	device_create_file(&new_client->dev, &dev_attr_in1_min);
	device_create_file(&new_client->dev, &dev_attr_in1_max);
	device_create_file(&new_client->dev, &dev_attr_in2_input);
	device_create_file(&new_client->dev, &dev_attr_in2_min);
	device_create_file(&new_client->dev, &dev_attr_in2_max);
	device_create_file(&new_client->dev, &dev_attr_in3_input);
	device_create_file(&new_client->dev, &dev_attr_in3_min);
	device_create_file(&new_client->dev, &dev_attr_in3_max);
	device_create_file(&new_client->dev, &dev_attr_in4_input);
	device_create_file(&new_client->dev, &dev_attr_in4_min);
	device_create_file(&new_client->dev, &dev_attr_in4_max);
	device_create_file(&new_client->dev, &dev_attr_in5_input);
	device_create_file(&new_client->dev, &dev_attr_in5_min);
	device_create_file(&new_client->dev, &dev_attr_in5_max);
	device_create_file(&new_client->dev, &dev_attr_in6_input);
	device_create_file(&new_client->dev, &dev_attr_in6_min);
	device_create_file(&new_client->dev, &dev_attr_in6_max);
	return 0;

 ERROR3:
	kfree(new_client);
	release_region(address, VT1211_EXTENT);
 ERROR0:
	return err;
}


static int vt1211_attach_adapter(struct i2c_adapter *adapter)
{
	return i2c_detect(adapter, &addr_data, vt1211_detect);
}

static int vt1211_detach_client(struct i2c_client *client)
{
	int err;

	/* release ISA region first */
	release_region(client->addr, VT1211_EXTENT);

	/* now it's safe to scrap the rest */
	if ((err = i2c_detach_client(client))) {
		dev_err(&client->dev,
		    "Client deregistration failed, client not detached.\n");
		return err;
	}

	kfree(i2c_get_clientdata(client));
	return 0;
}

static int vt1211_find(int *address)
{
	u16 val;

	superio_enter();
	val= superio_inb(DEVID);
	if(VT1211_DEVID != val) {
		superio_exit();
		return -ENODEV;
	}

	superio_select();
	val = (superio_inb(VT1211_BASE_REG) << 8) |
	       superio_inb(VT1211_BASE_REG + 1);
	*address = val & ~(VT1211_EXTENT - 1);
	if (*address == 0 && force_addr == 0) {
		printk("vt1211: base address not set-use force_addr=0xaddr\n");
		superio_exit();
		return -ENODEV;
	}
	if (force_addr)
		*address = force_addr;	/* so detect will get called */

	superio_exit();
	return 0;
}





static int __init sm_vt1211_init(void)
{
	int addr;

	/*printk("vt1211 for 2.6: (%s %s) loaded ...\n", __DATE__, __TIME__);
	 */
	if (vt1211_find(&addr)) {
		printk("vt1211: not detected, module not inserted.\n");
		return -ENODEV;
	}
	normal_isa[0] = addr;
	return i2c_add_driver(&vt1211_driver);
}

static void __exit sm_vt1211_exit(void)
{
	i2c_del_driver(&vt1211_driver);
}



MODULE_AUTHOR("Mark D. Studebaker <mdsxyz123@yahoo.com>, "
	      "Updated to 2.6 by Lars Ekman <emil71se@yahoo.com>");
MODULE_DESCRIPTION("VT1211 sensors");
MODULE_LICENSE("GPL");

module_init(sm_vt1211_init);
module_exit(sm_vt1211_exit);
