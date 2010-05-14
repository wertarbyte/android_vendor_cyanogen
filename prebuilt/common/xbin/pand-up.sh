#!/system/bin/sh
DEV=${1:-bnep0}
MAC=${2:-}

BRIDGE=tether

ifconfig $DEV up
brctl addif $BRIDGE $DEV

# echo 1 > /proc/sys/net/ipv4/conf/$DEV/forwarding
