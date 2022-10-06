#!/bin/sh
##########################################################
version=2.0
description="DragonFHD" !!!
#########################################################

#########################################################
MY_FILE="DragonFHD.tar.gz"
MY_TMP_FILE="/var/volatile/tmp/"$MY_FILE
MY_PLUGIN="TeamNitro.tar.gz"
MY_TMP_PLUGIN="/var/volatile/tmp/"$MY_PLUGIN
#########################################################

MY_SEP='============================================================='
echo $MY_SEP
echo 'Downloading '$MY_FILE' ...'
echo $MY_SEP
echo ''

wget -O /var/volatile/tmp/DragonFHD.tar.gz "https://onedrive.live.com/download?cid=89E618BEC5025E42&resid=89E618BEC5025E42%211487&authkey=AE7bkzgSF_aPNdw"

echo $MY_SEP
echo 'Downloading '$MY_PLUGIN' ...'
echo $MY_SEP
echo ''

wget -O /var/volatile/tmp/TeamNitro.tar.gz "https://onedrive.live.com/download?cid=89E618BEC5025E42&resid=89E618BEC5025E42%211494&authkey=AH9SxidQB4ztl-c"


rm -rf "/usr/share/enigma2/DragonFHD"
rm -rf "/usr/lib/enigma2/python/Plugins/Extensions/TeamNitro"



if [ -f $MY_TMP_FILE ]; [ -f $MY_TMP_PLUGIN ]; then

	echo ''
	echo $MY_SEP
	echo 'Extracting ...'
	echo $MY_SEP
	echo ''
	tar -xf $MY_TMP_FILE -C /
	tar -xf $MY_TMP_PLUGIN -C /
	MY_RESULT=$?

	rm -f $MY_TMP_FILE > /dev/null 2>&1
	rm -f $MY_TMP_PLUGIN > /dev/null 2>&1

	echo ''
	echo ''
	if [ $MY_RESULT -eq 0 ]; then
         echo "#####################################################################"
         echo "#   TeamNitro Skin NitroAdvanceFHD $version INSTALLED SUCCESSFULLY  #"
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