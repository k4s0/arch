#!/bin/bash
clear
echo ==============================
echo  Checking root privileges...
echo ==============================
echo
if [[ $UID == 0 ]]; then
	echo "Please run this script WITHOUT sudo:"
	echo "$0 $*"
	exit 1
fi
echo
echo ===============
echo Updating pacman 
echo ===============
sudo pacman -Syyu
clear
echo ===============
echo Orphans package
echo ===============
orphans=$(sudo pacman -Qdt)
echo
echo
if [ -z "$orphans" ]
then
	echo No Oprhan package found
else
	echo =================
	echo  Remove Orphan package
	echo =================
	sudo pacman -Rsn $(sudo pacman -Qdtq)
fi	
echo
echo =============================
read -e -p "Updating AUR repo " -i "Y" REPLY
echo =============================
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	aurman -Syyu
fi
clear
echo UPPA SUCCESSFULLY TERMINATED !
