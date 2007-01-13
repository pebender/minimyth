#!/bin/sh
hostname=`hostname`
date=`date`
echo "Content-Type"content="text/html; charset=iso-8859-1"
echo 
cat <<EOF
<html lang="en">
<head>
  <meta http-equiv="Content-Type"content="text/html; charset=iso-8859-1" />
  <style type="text/css" title="Default" media="all">
  <!--
  body {
    background-color:#fff;
    font:11px verdana, arial, helvetica, sans-serif;
    margin:20px;
  }
  h1 {
    font-size:28px;
    font-weight:900;
    color:#ccc;
    letter-spacing:0.5em;
    margin-bottom:30px;
    width:650px;
  }
  h2 {
    font-size:18px;
    font-weight:800;
    color:#360;
    border:none;
    letter-spacing:0.3em;
    padding:0px;
    margin-bottom:10px;
    margin-top:0px;
  }
  hr {
    display:none;
  }
  div.content {
    width:450px;
    border-top:1px solid #000;
    border-right:1px solid #000;
    border-bottom:1px solid #000;
    border-left:10px solid #000;
    padding:10px;
    margin-bottom:30px;
    -moz-border-radius:8px 0px 0px 8px;
  }
  -->
  </style>
  <title>MiniMyth Status - $hostname - $date </title>
</head>
<body>

  <h1>Status for $hostname</h1>
  <div class="content">
    <h2>Sensors Output</h2>
    <pre>
`sensors | sed -e 's/^ERROR:.*//' -e 's/\(\+[1234]....C\)/<span style="color: rgb(0, 102, 0); font-weight: bold;">\1<\/span>/' -e 's/\(\+[56]....C\)/<span style="color: rgb(205, 127, 0); font-weight: bold;">\1<\/span>/' -e 's/\(\+[78]....C\)/<span style="color: rgb(255, 0, 0); font-weight: bold;">\1<\/span>/'`
    </pre>
  </div>
  <br />
  <div class="content">
    <h2>Load Average Output</h2>
    <pre>
`cat /proc/loadavg`
    </pre>
  </div>
  <br />
  <h1>@mm_NAME_PRETTY@</h1>
</body>
</html>

EOF
