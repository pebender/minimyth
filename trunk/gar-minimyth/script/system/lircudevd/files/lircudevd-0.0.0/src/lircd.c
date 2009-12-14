/*
 * Copyright (C) 2009 Paul Bender.
 *
 * This file is part of lircudevd.
 *
 * lircudevd is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * lircudevd is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with lircudevd.  If not, see <http://www.gnu.org/licenses/>.
 */
#include <errno.h>
#include <fcntl.h>
#include <malloc.h>
#include <syslog.h>
#include <unistd.h>

#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/un.h>

#include <linux/input.h>
#include <linux/limits.h>

#include "lircd.h"
#include "monitor.h"

/*
 * The 'lircd' structure contains the information associated with the lircd
 * socket. In particular, it contains a linked list of 'lircd_client'
 * structures, each of which contains information associated with one connected
 * lirc client.
 */
struct lircd_client
{
    int fd;
    struct lircd_client *next;
};

struct
{
    int fd;
    char *path;
    mode_t mode;
    char *release_suffix;
    struct lircd_client *client_list;
} lircudevd_lircd =
{
    .fd = -1,
    .path = NULL,
    .mode = 0,
    .release_suffix = NULL,
    .client_list = NULL
};

static int lircd_client_add()
{
    struct lircd_client *client;

    if (lircudevd_lircd.fd == -1)
    {
        return -1;
    }

    if ((client = malloc(sizeof(struct lircd_client))) == NULL)
    {
        syslog(LOG_ERR, "failed to allocate memory for lircd client: %s\n", strerror(errno));
        return -1;
    }

    client->fd = accept(lircudevd_lircd.fd, NULL, NULL);

    if  (client->fd < 0)
    {
        syslog(LOG_ERR, "error during accept(): %s", strerror(errno));
        free(client);
        return -1;
    }

    int flags = fcntl(client->fd, F_GETFL);
    fcntl(client->fd, F_SETFL, flags | O_NONBLOCK);

    client->next = lircudevd_lircd.client_list;
    lircudevd_lircd.client_list = client;

    return 0;
}

static int lircd_handler(void *id)
{
    if (lircd_client_add() != 0)
    {
        return -1;
    }

    return 0;
}

static int lircd_client_close(struct lircd_client *client)
{
    if (client == NULL)
    {
        return -1;
    }

    if (client->fd >= 0)
    {
        shutdown(client->fd, 2);
        close(client->fd);
        client->fd = -1;
    }

    return 0;
}

static int lircd_client_purge()
{
    struct lircd_client **client_ptr;
    struct lircd_client *client;
    int return_code;

    return_code = 0;

    client_ptr = &(lircudevd_lircd.client_list);
    while (*client_ptr != NULL)
    {
        client = *client_ptr;
        if (client->fd == -1)
        {
            *client_ptr = client->next;
            if (lircd_client_close(client) != 0)
            {
                return_code = -1;
            }
            free(client);
        }
        else
        {
            client_ptr = &((*client_ptr)->next);
        }
    }
    return return_code;
}

int lircd_exit()
{
    struct lircd_client *client;
    int return_code;

    return_code = 0;

    if (lircudevd_lircd.fd >= 0)
    {
        if (monitor_client_remove(lircudevd_lircd.fd) != 0)
        {
            return_code = -1;
        }
        close(lircudevd_lircd.fd);
        lircudevd_lircd.fd = -1;
    }

    for (client = lircudevd_lircd.client_list ; client != NULL ; client = client->next)
    {
        if (lircd_client_close(client) != 0)
        {
            return_code = -1;
        }
    }
    if (lircd_client_purge() != 0)
    {
        return_code = -1;
    }

    if (lircudevd_lircd.path != NULL)
    {
        unlink(lircudevd_lircd.path);
        free(lircudevd_lircd.path);
        lircudevd_lircd.path = NULL;
    }

    return return_code;
}

int lircd_init(const char *path, mode_t mode, const char *release_suffix)
{
    struct sockaddr_un addr;

    lircudevd_lircd.fd = -1;
    lircudevd_lircd.path = NULL;
    lircudevd_lircd.mode = 0;
    lircudevd_lircd.release_suffix = NULL;
    lircudevd_lircd.client_list = NULL;

    if (path == NULL)
    {
        errno = EINVAL;
        return -1;
    }

    if (strnlen(path, PATH_MAX + 1) >= PATH_MAX + 1)
    {
        errno = ENAMETOOLONG;
        syslog(LOG_ERR, "lircd socket path: %s\n", PATH_MAX + 1, strerror(errno));
        return -1;
    }

    if ((lircudevd_lircd.path = strndup(path, PATH_MAX)) == NULL)
    {
        syslog(LOG_ERR, "failed to allocate memory for the lircd device %s: %s\n", path, strerror(errno));
        lircd_exit();
        return -1;
    }

    lircudevd_lircd.mode = mode;

    if (release_suffix != NULL)
    {
        if ((lircudevd_lircd.release_suffix = strndup(release_suffix, 128)) == NULL)
        {
            syslog(LOG_ERR, "failed to allocate memory for the lircd device %s: %s\n", path, strerror(errno));
            lircd_exit();
            return -1;
        }
    }

    if (unlink(lircudevd_lircd.path) != 0)
    {
        if (errno != ENOENT)
        {
            syslog(LOG_ERR, "failed to remove existing lircd socket %s: %s\n", path, strerror(errno));
            lircd_exit();
            return -1;
        }
    }

    lircudevd_lircd.fd = socket(AF_UNIX, SOCK_STREAM, 0);
    if (lircudevd_lircd.fd < 0)
    {
        syslog(LOG_ERR, "failed to create Unix socket for lircd output: %s\n", strerror(errno));
        lircd_exit();
        return -1;
    }

    addr.sun_family = AF_UNIX;
    strcpy(addr.sun_path, lircudevd_lircd.path);
    if(bind(lircudevd_lircd.fd, (struct sockaddr *)&addr, sizeof(addr)) < 0)
    {
        syslog(LOG_ERR, "failed to bind to Unix socket needed for lircd output; %s\n", strerror(errno));
        lircd_exit();
        return -1;
    }

    chmod(lircudevd_lircd.path, mode);

    if (listen(lircudevd_lircd.fd, 3) < 0)
    {
        syslog(LOG_ERR, "failed to listen on Unix socket needed for lircd output: %s\n", strerror(errno));
        lircd_exit();
        return -1;
    }

    if (monitor_client_add(lircudevd_lircd.fd, &lircd_handler, NULL) != 0)
    {
        syslog(LOG_ERR, "failed to add lircd to the monitor client list: %s\n", strerror(errno));
        lircd_exit();
        return -1;
    }

    return 0;
}

int lircd_send(const struct input_event *event, const char *name, int repeat_count, const char *remote)
{
    char message[1000];
    int message_len;
    struct lircd_client *client;

    if (event == NULL)
    {
        errno = EINVAL;
        return -1;
    }
    if (name == NULL)
    {
        errno = EINVAL;
        return -1;
    }
    if (repeat_count < 0)
    {
        errno = EINVAL;
        return -1;
    }
    if (remote == NULL)
    {
        errno = EINVAL;
        return -1;
    }

    if ((event->value == 0) && (lircudevd_lircd.release_suffix == NULL))
    {
        return 0;
    }

    /*
     * If this is a key release, so append the key release suffix.
     */
    if (event->value == 0)
    {
        message_len = snprintf(message, sizeof message, "%x %x %s%s %s\n",
                       event->code,
                       repeat_count,
                       name,
                       lircudevd_lircd.release_suffix,
                       remote);
    }
    else
    {
        message_len = snprintf(message, sizeof message, "%x %x %s %s\n",
                       event->code,
                       repeat_count,
                       name,
                       remote);
    }

    if (message_len > 0)
    {
        for(client = lircudevd_lircd.client_list ; client != NULL ; client = client->next)
        {
            if (write(client->fd, message, message_len) != message_len)
            {
                if (lircd_client_close(client) != 0)
                {
                    return -1;
                }
            }
        }
        if (lircd_client_purge() != 0)
        {
            return -1;
        }
    }

    return 0;
}
