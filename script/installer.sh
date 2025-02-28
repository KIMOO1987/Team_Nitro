#!/bin/sh
#########################################################
version= 2.2
description= BoHlala V2.2 !!!
#########################################################
#########################################################
MY_FILE="BoHLALA_FHD.tar.gz"
MY_TMP_FILE="/var/volatile/tmp/"$MY_FILE
MY_FILE1="BO_HLALA_skin_V2.2.tar.gz"
MY_TMP_FILE1="/var/volatile/tmp/"$MY_FILE1
MY_FILE2="addons1.tar.gz"
MY_TMP_FILE2="/var/volatile/tmp/"$MY_FILE2
MY_FILE3="addons2.tar.gz"
MY_TMP_FILE3="/var/volatile/tmp/"$MY_FILE3
#########################################################

MY_SEP='============================================================='
echo $MY_SEP
echo 'Downloading '$MY_FILE' ...'
echo $MY_SEP
echo 'Downloading '$MY_FILE1' ...'
echo $MY_SEP
echo 'Downloading '$MY_FILE2' ...'
echo $MY_SEP
echo 'Downloading '$MY_FILE3' ...'
echo $MY_SEP
echo ''


wget -O /var/volatile/tmp/BoHLALA_FHD.tar.gz --no-check-certificate "https://github.com/KIMOO1987/Team_Nitro/raw/main/BoHLALA_FHD.tar.gz"
wget -O /var/volatile/tmp/BO_HLALA_skin_V2.2.tar.gz --no-check-certificate "https://github.com/KIMOO1987/Team_Nitro/raw/main/BO_HLALA_skin_V2.2.tar.gz"
wget -O /var/volatile/tmp/addons1.tar.gz --no-check-certificate "https://github.com/biko-73/KIMOO1987/Team_Nitro/raw/main/addons1.tar.gz"
wget -O /var/volatile/tmp/addons2.tar.gz --no-check-certificate "https://github.com/biko-73/KIMOO1987/Team_Nitro/raw/main/addons2.tar.gz"

rm -rf "/usr/lib/enigma2/python/Plugins/Extensions/BoHLALA_FHD"
rm -rf "/usr/share/enigma2/BoHLALA_FHD"


if [ -f $MY_TMP_FILE ]; [ -f $MY_TMP_FILE1 ]; [ -f $MY_TMP_FILE2 ]; [ -f $MY_TMP_FILE3 ]; then

	echo ''
	echo $MY_SEP
	echo 'Extracting ...'
	echo $MY_SEP
	echo ''
	tar -xzvf $MY_TMP_FILE -C /
	tar -xzvf $MY_TMP_FILE1 -C /
  tar -xzvf $MY_TMP_FILE2 -C /
  tar -xzvf $MY_TMP_FILE3 -C /
	MY_RESULT=$?

	rm -f $MY_TMP_FILE > /dev/null 2>&1
	rm -f $MY_TMP_FILE1 > /dev/null 2>&1
  rm -f $MY_TMP_FILE2 > /dev/null 2>&1
  rm -f $MY_TMP_FILE3 > /dev/null 2>&1

	echo ''
	if [ $MY_RESULT -eq 0 ]; then
        echo "########################################################################"
        echo "#                BoHLALA v_2.2 INSTALLED SUCCESSFULLY                  #"
        echo "#                      BY TeamNitro - support on                       #"
        echo "#              https://www.tunisia-sat.com/forums/forums               #"
        echo "########################################################################"
        echo "#        Sucessfully Download Please apply from skin selection         #"
        echo "########################################################################"
		if which systemctl > /dev/null 2>&1; then
			sleep 2; systemctl restart enigma2
		else
			init 4
			sleep 4 > /dev/null 2>&1
			init 3
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
