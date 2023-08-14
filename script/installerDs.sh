#!/bin/sh
#########################################################
version=3.1
description="DesertFHD V3.1\n 1-Control Center update issue fix\n 2-Subsupport screen issue fix\n 3-FPS icon add\n 4-Egami py3.11 issue fix\n 5-time log screen fix\n 6-missing buttons issue fix\n 7-OA Weather for OpenATV and Egami fix !!!"

#########################################################


###################################################################################
##										 ##
## Script Purpose: Download and install TeamNitro skin (based on Python version) ##
##										 ##
###################################################################################


############################################################
# Package Source
############################################################
MY_PLUGIN_NAME="TeamNitro Control center"
MY_PKG_NAME="TeamNitro DesertFHD Skin"
MY_MAIN_URL="https://raw.githubusercontent.com/biko-73/"
MY_PKG_DIR='TeamNitro/main/skins/'
MY_FILE_LESS="DesertFHD_v-3.1.tar.gz"			# For all Python-2 Images + OpenPLi + OpenBH
MY_FILE_FULL="DesertFHD_OA_v-3.1.tar.gz"		# For Python-3 Images except OpenPLi and OpenBH (works only on OpenATV and Egami)
MY_FILE_PLUGIN="TeamNitro.tar.gz"			# For all Images TeamNitro ControlCenter

# Dirs and Files to delete before installation
OLD_PATH1="/usr/lib/enigma2/python/Plugins/Extensions/TeamNitro"
OLD_PATH2="/usr/share/enigma2/DesertFHD"
OLD_FILE1="/usr/share/enigma2/TN_Skins_version"
OLD_FILE2="/usr/lib/enigma2/python/Components/Converter/TN*.py*"
OLD_FILE3="/usr/lib/enigma2/python/Components/Renderer/TN*.py*"
OLD_FILE4="/usr/lib/enigma2/python/Tools/Directories2.py*"

############################################################
# Download packge file
############################################################

# ------------------------------------------------
# Introduction
MY_SEP='============================================================='
echo $MY_SEP
echo 'Installing '$MY_PLUGIN_NAME' ...'
echo $MY_SEP

MY_SEP='============================================================='
echo $MY_SEP
echo 'Installing '$MY_PKG_NAME' ...'
echo $MY_SEP

# ------------------------------------------------
# Decide package file (based on Python-Version)
PY_VER=$(python -c "import platform; print(platform.python_version().split('.')[0])")
if [[ $PY_VER == "2" ]]; then
    MY_FILE=$MY_FILE_LESS
else
	# Check Image
	if $(grep -qs -i "openpli" /etc/issue); then
		MY_FILE=$MY_FILE_LESS
	elif [ -r '/usr/lib/enigma2/python/Blackhole' ]; then
		MY_FILE=$MY_FILE_LESS
	else
    	MY_FILE=$MY_FILE_FULL
	fi
fi
echo "Found Python-"$PY_VER

# ------------------------------------------------
# Result package file	... E.g. : https://raw.githubusercontent.com/biko-73/TeamNitro/main/skins/TeamNitro.tar.gz
MY_URL2=$MY_MAIN_URL$MY_PKG_DIR$MY_FILE_PLUGIN

# ------------------------------------------------
# Result package file	... E.g. : https://raw.githubusercontent.com/biko-73/TeamNitro/main/skins/DesertFHD_v-3.0.tar.gz
MY_URL=$MY_MAIN_URL$MY_PKG_DIR$MY_FILE

# ------------------------------------------------
# Result local /tmp/ file	... E.g. : /tmp/TeamNitro.tar.gz
MY_TMP_FILE2="/tmp/"$MY_FILE_PLUGIN

# ------------------------------------------------
# Result local /tmp/ file	... E.g. : /tmp/DesertFHD_v-3.0.tar.gz
MY_TMP_FILE="/tmp/"$MY_FILE

# ------------------------------------------------
# Download packge file
echo 'Downloading '$MY_FILE_PLUGIN' ...'
rm -f $MY_TMP_FILE2 > /dev/null 2>&1
wget --no-check-certificate -q -T 2 $MY_URL2 -P "/tmp/"

# ------------------------------------------------
# Download packge file
echo 'Downloading '$MY_FILE' ...'
rm -f $MY_TMP_FILE > /dev/null 2>&1
wget --no-check-certificate -q -T 2 $MY_URL -P "/tmp/"

############################################################
# Validate downloaded packge file
############################################################
PKG_IS_OK=false
if [ -f $MY_TMP_FILE ]; then
	echo "Validating package file ..."
	tar -tzf $MY_TMP_FILE > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "Package file is OK"
		PKG_IS_OK=true
	else
		echo "Invalid downloaded tar file : "$MY_TMP_FILE
	fi
else
	echo "Download failed !"
fi

# Exit f dowload fails or if invalid tar file
if [ "$PKG_IS_OK" = false ] ; then
	rm -f $MY_TMP_FILE > /dev/null 2>&1
	echo ""
	echo ">>>>> Installation failed ! <<<<<<"
	echo ""
	exit 1
fi

############################################################
# Install packge file
############################################################

# Remove old installation
echo "Removing previous installation ..."
rm -rf $OLD_PATH1 $OLD_PATH2 $OLD_PATH3
rm -f $OLD_FILE1 $OLD_FILE2 $OLD_FILE3 $OLD_FILE4

# Extract package
echo 'Extracting package TeamNitro Control Center ...'
tar -xf $MY_TMP_FILE2 -C /
MY_RESULT=$?

echo 'Extracting package DesertFHD...'
tar -xf $MY_TMP_FILE -C /
MY_RESULT=$?

# Remove package file
rm -f $MY_TMP_FILE > /dev/null 2>&1
rm -f $MY_TMP_FILE2 > /dev/null 2>&1

# Restart GUI
if [ $MY_RESULT -eq 0 ]; then
	echo ''
	echo ">>>>> INSTALLED SUCCESSFULLY ! <<<<<<"
	echo ''
    echo "For Support : https://www.tunisia-sat.com/forums/threads/4334347/"
	echo ''
    echo "#########################################################"
    echo "#           Your Device GUI will RESTART Now            #"
    echo "#########################################################"
	if which systemctl > /dev/null 2>&1; then
		sleep 3; systemctl restart enigma2
	else
		init 4; sleep 4; init 3;
	fi
else
	echo ''
	echo ">>>>> Installation failed ! <<<<<<"
	echo ''
	echo '**************************************************'
	echo '**                   FINISHED                   **'
	echo '**************************************************'
	echo ''
fi;
exit 0
##############################################################################################################

