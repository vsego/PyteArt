<html>
<head>
  <title>%(title)s</title>
  <style>
    body {
      background-color: #ffffe0;
    }
    div.pyteart {
      background-color: #ffffff;
      border: 3px ridge #008000;
      font-family: monospace;
      font-size: %(size)dpt;
      position: absolute;
    }
    div.pyteart>div {
      color: #000000;
      left: 1ch;
      white-space: nowrap;
      position: absolute;
    }
  </style>
</head>

<body>

<div class="pyteart" style="height: %(height)dex; width: %(width)dch;">
%(body)s
</div>

</body>

</html>
