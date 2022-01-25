#!/bin/bash

HELP="./iso_boot.sh <dir_iso> <dir_usb>\n
		example:\n\t ./iso_boot.sh kali-linux.iso /dev/sdc"

if [[ -z $1 ]]
then
	echo -e $HELP
	exit 1
elif [[ -z $2 ]]
then
	echo -e $HELP
	exit 1
fi

if [[ `id -u` != "0" ]]
then
	echo " Run this program as root!"
	exit 1
fi

echo "Disassembling USB"
sudo umount $2 > /dev/null
echo "Formatting"
t=`sudo mkfs.vfat $21 > /dev/null`
echo "Successfully formatted"


echo "Extracting ISO to USB"
sudo dd if=$1 of=$2 status=progress && sync
