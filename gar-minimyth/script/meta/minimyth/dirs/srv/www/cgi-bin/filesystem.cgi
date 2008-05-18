#!/bin/sh

. /etc/conf

page_host=`/bin/hostname`
page_date=`/bin/date +'%Y-%m-%d %H:%M:%S %Z'`

server=${HTTP_HOST:-${SERVER_ADDR}}

/bin/echo "Content-Type: text/html; charset=UTF-8"
/bin/echo
/bin/echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">"
/bin/echo "<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\">"
/bin/echo "  <head>"
/bin/echo "    <meta name=\"author\" content=\"Paul Bender\" />"
/bin/echo "    <meta name=\"copyright\" content=\"2006-2008 Paul Bender &amp; minimyth.org\" />"
/bin/echo "    <meta name=\"keywords\" content=\"PVR,Linux,MythTV,MiniMyth\" />"
/bin/echo "    <meta name=\"description\" content=\"\" />"
/bin/echo "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />"
/bin/echo "    <title>MiniMyth Frontend Filesystem</title>"
/bin/echo "    <style type=\"text/css\" title=\"main-styles\">"
/bin/echo "      @import \"../css/minimyth.css\";"
/bin/echo "    </style>"
/bin/echo "  </head>"
/bin/echo "  <body>"
/bin/echo "    <div class=\"main\">"
/bin/echo "      <div class=\"header\">"
/bin/echo "        <div class=\"heading\">MiniMyth from <a href=\"http://minimyth.org/\">minimyth.org</a></div>"
/bin/echo "        <div class=\"menu\">"
/bin/echo "          <span class=\"menuItemFirst\"><a href=\"../index.html\">Home</a></span>"
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
if /usr/bin/test "${MM_SECURITY_ENABLED}" = "no" ; then
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
/bin/echo "        <div class=\"valid-xhtml\">"
/bin/echo "          <a href=\"http://validator.w3.org/check?uri=referer\"><img"
/bin/echo "              src=\"/image/w3c-valid-xhtml11-blue.gif\""
/bin/echo "              alt=\"Valid XHTML 1.1\" height=\"31\" width=\"88\" /></a>"
/bin/echo "        </div>"
/bin/echo "        <div class=\"valid-css\">"
/bin/echo "          <a href=\"http://jigsaw.w3.org/css-validator/check/referer\"><img"
/bin/echo "              src=\"/image/w3c-valid-css2-blue.gif\""
/bin/echo "              alt=\"Valid CSS!\"      height=\"31\" width=\"88\" /></a>"
/bin/echo "        </div>"
/bin/echo "        <div class=\"version\">"
/bin/echo "          Last Updated on 2008-05-17"
/bin/echo "          <br />"
/bin/echo "          &lt;&nbsp;mailto&nbsp;:&nbsp;webmaster&nbsp;at&nbsp;minimyth&nbsp;dot&nbsp;org&nbsp;&gt;"
/bin/echo "        </div>"
/bin/echo "      </div>"
/bin/echo "    </div>"
/bin/echo "  </body>"
/bin/echo "</html>"
