#!/usr/bin/env bash
WIRELESS_INTERFACES=($(nmcli device | awk '$2=="wifi" {print $1}'))
WIRED_INTERFACES=($(nmcli device | awk '$2=="ethernet" {print $1}'))
VPN_PATTERN='(wireguard|vpn)'

if [ x"$@" = x"quit" ]
then
    exit 0
fi

if [ x"$@" = x"reload" ]
then
    echo "AZAZAZA"
fi

echo "reload 󰦝"
echo "quit"
