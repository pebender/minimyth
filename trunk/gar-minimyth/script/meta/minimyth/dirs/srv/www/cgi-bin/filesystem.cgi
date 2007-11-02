#!/bin/sh

. /etc/conf

page_host=`/bin/hostname`
page_date=`/bin/date +'%Y-%m-%d %H:%M:%S %Z'`

server=${HTTP_HOST:-${SERVER_ADDR}}

/bin/echo "Content-Type: text/html; charset=UTF-8"
/bin/echo
/bin/echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">"
/bin/echo "<html>"
/bin/echo "  <head>"
/bin/echo "    <meta name=\"author\" content=\"Paul Bender\" />"
/bin/echo "    <meta name=\"copyright\" content=\"2006 Paul Bender &amp; LinPVR.org\" />"
/bin/echo "    <meta name=\"keywords\" content=\"LinPVR,PVR,Linux,MythTV,MiniMyth\" />"
/bin/echo "    <meta name=\"description\" content=\"\" />"
/bin/echo "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />"
/bin/echo "    <title>MiniMyth Frontend Filesystem</title>"
/bin/echo "    <style type=\"text/css\" title=\"main-styles\">"
/bin/echo "      @import \"../css/linpvr.css\";"
/bin/echo "      @import \"../css/linpvr-sidebar-hide.css\";"
/bin/echo "    </style>"
/bin/echo "  </head>"
/bin/echo "  <body>"
/bin/echo "    <div class=\"main\">"
/bin/echo "      <div class=\"header\">"
/bin/echo "        <div class=\"heading\">MiniMyth from <a href=\"http://linpvr.org/\">LinPVR.org</a></div>"
/bin/echo "        <div class=\"menu\">"
/bin/echo "          <span class=\"menuItemFirst\"><a href=\"../index.shtml\">Home</a></span>"
/bin/echo "          <span class=\"menuItem\"     >Filesystem</span>"
/bin/echo "        </div>"
/bin/echo "        <div class=\"note\">"
/bin/echo "          ${page_date}<br />"
/bin/echo "          ${page_host}<br />"
/bin/echo "          ${MM_VERSION}"
/bin/echo "        </div>"
/bin/echo "      </div>"
/bin/echo "      <div class=\"middle\">"
/bin/echo "        <div class=\"heading\">MiniMyth Frontend Filesystem</div>"
/bin/echo "        <div class=\"section\">"
/bin/echo "          <p>"
if /usr/bin/test -z "${MM_SECURITY_LEVEL}"      || \
   /usr/bin/test     ${MM_SECURITY_LEVEL} -le 0 ; then
    /bin/echo "            You can use the URL <a href=\"http://${server}:8080/\">http://${server}:8080/</a> to access your MiniMyth frontend's filesystem."
else
    /bin/echo "            Your MiniMyth frontend has security enabled."
    /bin/echo "            Therefore, you cannot access your MiniMyth frontend's filesystem."
fi
/bin/echo "          </p>"
/bin/echo "        </div>"
/bin/echo "      </div>"
/bin/echo "      <div class=\"footer\">"
/bin/echo "        <hr />"
/bin/echo "        Last Updated: 2007-10-04 &lt;<a href=\"mailto:info at linpvr.org\">webmaster at linpvr.org</a>&gt;"
/bin/echo "      </div>"
/bin/echo "    </div>"
/bin/echo "  </body>"
/bin/echo "</html>"
