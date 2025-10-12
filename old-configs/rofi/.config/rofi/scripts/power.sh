if [ x"$@" = x"Off" ]
then
  poweroff
  exit 0
fi

if [ x"$@" = x"Sleep" ]
then
  systemctl suspend
  exit 0
fi

if [ x"$@" = x"Sleep" ]
then
  exit 0
fi

echo -en "\0markup-rows\x1ftrue\n"
echo -en "Sleep\0icon\x1f<span>󰤄 </span>\n"
echo -en "Hibernate\0icon\x1f<span>󰒲 </span>\n"
echo -en "Off\0icon\x1f<span>⭘ </span>\n"
