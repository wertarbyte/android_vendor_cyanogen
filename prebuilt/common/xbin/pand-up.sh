#!/system/bin/sh
PAN_DEV=${1:-bnep0}
PAN_MAC=${2:-}

TETHER=tether

[ -e "/etc/tether.conf" ] && . /etc/tether.conf

ifconfig $PAN_DEV up
brctl addif $TETHER $PAN_DEV
