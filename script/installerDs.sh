#!/bin/sh
##########################################################
version=1.1
description="DesertFHD" !!!
#########################################################

MY_SEP='============================================================='
echo $MY_SEP
echo 'Downloading DesertFHD' ...'
echo $MY_SEP
echo ''

wget -O /var/volatile/tmp/enigma2-plugin-skins-desertfhd_v2.0_all.ipk --no-check-certificate "https://onedrive.live.com/download?cid=89E618BEC5025E42&resid=89E618BEC5025E42%212004&authkey=AEOSbylrP_BLMN0"

if [ -f /var/volatile/tmp/enigma2-plugin-skins-desertfhd_v2.0_all.ipk ]; then

	echo ''
	echo $MY_SEP
	echo 'Extracting ...'
	echo $MY_SEP
	echo ''
	opkg install /var/volatile/tmp/enigma2-plugin-skins-desertfhd_v2.0_all.ipk
	MY_RESULT=$?

	rm -f /var/volatile/tmp/enigma2-plugin-skins-desertfhd_v2.0_all.ipk > /dev/null 2>&1

	echo ''
	if [ $MY_RESULT -eq 0 ]; then
         echo "########################################################################"
         echo "#		Skin DesertFHD INSTALLED SUCCESSFULLY                 #"
         echo "#                      BY TeamNitro - support on                       #"
         echo "#              https://www.tunisia-sat.com/forums/forums               #"
         echo "########################################################################"
         echo "#        Sucessfully Download Please apply from skin selection         #"
         echo "########################################################################"
	else
		echo "   >>>>   INSTALLATION FAILED !   <<<<"
	fi;
	 echo '**************************************************'
	 echo '**                   FINISHED                   **'
	 echo '**************************************************'
	 echo ''
	 exit 0
else
	 echo ''
	 echo "Download failed !"
	 exit 1
fi
# ----------------------------------------------------------------------------------------------------------
