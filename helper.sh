#!/bin/bash
clear
echo ==============================
sleep 2
echo  Checking root privileges...
sleep 2
echo ==============================
echo
if [[ $UID == 0 ]]; then
	echo "Please run this script WITHOUT sudo:"
	echo "$0 $*"
	exit 1
fi
echo
echo
echo ===============
sleep 2
echo Updating pacman 
sleep 2
echo ===============
sudo pacman -Syyu
clear
echo ===============
sleep 2
echo Orphans package
sleep 2
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
clear
echo
echo =============================
sleep 2
echo "Updating AUR repo "
sleep 2
echo =============================
#echo
#if [[ $REPLY =~ ^[Yy]$ ]]
#then
	aurman -Syyu
#fi
clear
echo SUCCESSFULLY TERMINATED !
