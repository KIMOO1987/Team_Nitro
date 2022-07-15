#!/bin/sh
##setup command=wget https://github.com/kaleem87/Team_Nitro/raw/main/installerTransparentPicons.sh -O - | /bin/sh
## This script to downlaod and install Transparent Picons by () to inside plugin

if [ ! -d /usr/lib64 ]; then
	PLUGINPATH=/usr/lib/enigma2/python/Plugins/Extensions/NitroAdvanceFHD
else
	PLUGINPATH=/usr/lib64/enigma2/python/Plugins/Extensions/NitroAdvanceFHD
fi

## Remove old file from tmp directory
[ -r /tmp/TransparentPicons.tar.gz ] && rm -f /tmp/TransparentPicons.tar.gz

### Remove Currenty file from plugin
rm -rf $PLUGINPATH/PICONS/emu
rm -rf $PLUGINPATH/PICONS/piconSat
rm -rf $PLUGINPATH/PICONS/piconProv
rm -rf $PLUGINPATH/PICONS/piconCrypt

# Download and install Transparent Picons
cd /tmp
set -e
wget "https://github.com/biko-73/NitroAdvanceFHD//raw/main/TransparentPicons.tar.gz"
tar -xzf TransparentPicons.tar.gz -C /
set +e
cd ..

### delete tmp files
rm -f /tmp/TransparentPicons.tar.gz
sync
echo ""
echo ""
echo "#########################################################"
echo "#  NitroAdvanceFHD TRANSPARENT_PICONS INSTALLED SUCCESSFULLY  #"
echo "#                     (Team Nitro)                      #"              
echo "#########################################################"
echo ""
echo ""
echo "#########################################################"
echo "#            Press ok to Exit from Console              #"
echo "#########################################################"
exit 0
