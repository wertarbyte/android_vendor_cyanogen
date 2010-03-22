#!/system/xbin/bash
#
# /system/xbin/openvpn-up.sh
#
# Philip Freeman <philip.freeman@gmail.com>
#
# This should be called as an up script from openvpn to be able to
# set dns from push options..
#
#
#  $ adb push openvpn-up.sh /system/xbin/openvpn-up.sh
#  $ adb shell chmod 755 /system/xbin/openvpn-up.sh
#
#  $ adb shell
#  # foreign_option_0="dhcp-option DNS 10.0.0.2" foreign_option_1="dhcp-option DNS 10.0.0.2" foreign_option_2="dhcp-option DNS 10.0.0.2" openvpn-up.sh
#  Got DNS1: 10.0.0.2
#  /system/bin/setprop vpn.dns1 10.0.0.2
#  Got DNS2: 10.0.0.2
#  /system/bin/setprop vpn.dns2 10.0.0.2
#  Got DNS3: 10.0.0.2
#  # getprop vpn.dns2
#  10.0.0.2
#  # 
#  
#
# TODO:
#  - Modify the OpenVPN Service to call me!
#  - add support for grabbing search domains ?
#


SETPROP=/system/bin/setprop
stop=0
dns_num=1
i=0
eval opt=\$foreign_option_$i

while [ ${stop} -eq 0 ]; do
  if [ "`expr substr "$opt" 1 11`" = "dhcp-option" ]; then
    if [ "`expr substr "$opt" 13 3`" = "DNS" ]; then
      DNS="`expr substr "$opt" 17 1024`"
      echo "Got DNS${dns_num}: ${DNS}"
      if [ ${dns_num} -le 2 ]; then
	#Set it
	echo ${SETPROP} vpn.dns${dns_num} ${DNS}
	${SETPROP} vpn.dns${dns_num} ${DNS}
      fi
      dns_num=$(( ${dns_num}+1 ))
    fi
  fi
  i=$(( $i+1 ))
  eval opt=\$foreign_option_$i
  if [ "$opt" = "" ]; then
    stop=1
  fi
done
