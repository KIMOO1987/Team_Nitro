#!/bin/sh

# ==============================================
# SCRIPT : DOWNLOAD AND INSTALL DesertFHD #
# =====================================================================================================================
# Command: wget https://raw.githubusercontent.com/kaleem87/Team_Nitro/main/script/installerDs.sh -O - | /bin/sh #
# =====================================================================================================================

MY_IPK="enigma2-plugin-skins-desertfhd_v2.0_all.ipk"

# Decide : which package ?
MY_MAIN_URL="https://onedrive.live.com/download?cid=89E618BEC5025E42&resid=89E618BEC5025E42%212004&authkey=AEOSbylrP_BLMN0"

MY_TMP_FILE="/tmp/"$MY_IPK

echo ''
echo '************************************************************'
echo '**                         STARTED                        **'
echo '************************************************************'
echo "**                 Uploaded by: Biko_73                   **"
echo "**  https://www.tunisia-sat.com/forums/threads/3898738/   **"
echo "************************************************************"
echo ''

# Remove previous file (if any)
rm -f $MY_TMP_FILE > /dev/null 2>&1

# Download package file
MY_SEP='============================================================='
echo $MY_SEP
echo 'Downloading '$MY_IPK' ...'
echo $MY_SEP
echo ''
wget -T 2 $MY_MAIN_URL -P "/tmp/"
# Check download
if [ -f $MY_TMP_FILE ]; then
	# Install
	echo ''
	echo $MY_SEP
	echo 'Installation started'
	echo $MY_SEP
	echo ''
	if which dpkg > /dev/null 2>&1; then
		dpkg -i --force-overwrite $MY_TMP_FILE
		apt install -f -y
	else
		opkg install --force-reinstall $MY_TMP_FILE
	fi
	MY_RESULT=$?

	# Result
	echo ''
	echo ''
	if [ $MY_RESULT -eq 0 ]; then
		echo "   >>>>   SUCCESSFULLY INSTALLED   <<<<"
		echo ''
		echo "   >>>>         RESTARING         <<<<"
	else
		echo "   >>>>   INSTALLATION FAILED !   <<<<"
	fi
	echo ''
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
# ------------------------------------------------------------------------------------------------------------
