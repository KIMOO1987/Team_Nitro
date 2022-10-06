#!/bin/sh
##########################################################
version=2.0
description="BoHLALA_FHD" !!!
#########################################################

#########################################################
MY_FILE="BoHLALA_FHD.tar.gz"
MY_TMP_FILE="/var/volatile/tmp/"$MY_FILE
#########################################################

MY_SEP='============================================================='
echo $MY_SEP
echo 'Downloading '$MY_FILE' ...'
echo $MY_SEP
echo ''

wget -O /var/volatile/tmp/BoHLALA_FHD.tar.gz "https://onedrive.live.com/download?cid=89E618BEC5025E42&resid=89E618BEC5025E42%211488&authkey=AJayhzMpnEN75PA"

rm -rf "/usr/share/enigma2/BoHLALA_FHD"

if [ -f $MY_TMP_FILE ]; then

	echo ''
	echo $MY_SEP
	echo 'Extracting ...'
	echo $MY_SEP
	echo ''
	tar -xf $MY_TMP_FILE -C /
	MY_RESULT=$?

	rm -f $MY_TMP_FILE > /dev/null 2>&1

	echo ''
	echo ''
	if [ $MY_RESULT -eq 0 ]; then
         echo "#####################################################################"
         echo "#     TeamNitro Skin BoHLALA_FHD $version INSTALLED SUCCESSFULLY    #"
         echo "#                     BY TeamNitro - support on                     #"
         echo "#             https://www.tunisia-sat.com/forums/forums             #"
         echo "#####################################################################"
         echo "#             	  your Device will RESTART Now                     #"
         echo "#####################################################################"
		if which systemctl > /dev/null 2>&1; then
			sleep 2; systemctl restart enigma2
		else
			init 4; sleep 4; init 3;
		fi
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