#!/bin/sh
##########################################################
version=2.0
description="TeamNitroPlugin" !!!
#########################################################

#########################################################
MY_FILE="TeamNitro.tar.gz"
MY_TMP_FILE="/var/volatile/tmp/"$MY_FILE
#########################################################

MY_SEP='============================================================='
echo $MY_SEP
echo 'Downloading '$MY_FILE' ...'
echo $MY_SEP
echo ''

wget -O /var/volatile/tmp/TeamNitro.tar.gz --no-check-certificate "https://onedrive.live.com/download?cid=89E618BEC5025E42&resid=89E618BEC5025E42%211494&authkey=AH9SxidQB4ztl-c"

rm -rf "/usr/lib/enigma2/python/Plugins/Extensions/TeamNitro"


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
	if [ $MY_RESULT -eq 0 ]; then
         echo "########################################################################"
         echo "#		Plugin TeamNitro INSTALLED SUCCESSFULLY               #"
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
