
if [ x"$@" = x"Monitor" ]
then
  coproc ( hyprshot -m output --clipboard-only  > /dev/null  2>&1 )
  exit 0
fi

if [ x"$@" = x"Region" ]
then
  coproc ( hyprshot -m region --clipboard-only  > /dev/null  2>&1 )
  exit 0
fi

if [ x"$@" = x"reload" ]
then
  echo "AZAZAZA"
fi

echo -en "\0markup-rows\x1ftrue\n"
echo -en "Monitor\0icon\x1f<span>󰍹 </span>\n"
echo -en "Window\0icon\x1f<span> </span>\n"
echo -en "Region\0icon\x1f<span>󰆟 </span>\n"
echo -en "Active window\0icon\x1f<span> </span>\n"
