#!/bin/sh 

[ -r /etc/lsb-release ] && . /etc/lsb-release	
	
if [ -z "$DISTRIB_DESCRIPTION" ] && [ -x /usr/bin/lsb_release ]; then
	# Fall back to using the very slow lsb_release utility
	DISTRIB_DESCRIPTION=$(lsb_release -s -d)
fi

display="\n

+---------------------------------------------------+\n
| Welcome to the Sycon Linux Management Controller.\n
| OS: Ubuntu $DISTRIB_DESCRIPTION\n
| To Login to the Sycon LMC Appliance:\n
| https://`ifconfig | grep "Ethernet" -A 1 | grep "inet addr" | awk '{ print $2 }' | sed s/addr://g`/\n 
| Username: admin\n
| Password: sycon\n
+---------------------------------------------------+\n

For more information visit https://github.com/fiquett/sycon/\n"

ok=0

while [ "$ok" != "1" ]; do
	dialog --no-shadow --timeout 20 --title "Sycon Appliance" --msgbox "$display" 30 80
	if [ "$?" = "0" ]; then
		ok=1
		chvt 1
	fi
done