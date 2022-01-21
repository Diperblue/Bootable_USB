#!/bin/bash

HELP="./iso_boot.sh <dir_iso> <dir_usb>\n
		example:\n\t ./iso_boot.sh /home/user/Download/arch-linux.iso /dev/sdc"

if [[ -z $1 ]]
then
	echo -e $HELP
	exit 1
elif [[ -z $2 ]]
then
	echo -e $HELP
	exit 1
fi

echo "Disassembling USB"
sudo umount $2 > /dev/null
echo "Formatting"
sudo mkfs.vfat $21 > /dev/null

echo "Extracting ISO to USB"
sudo dd if=$1 of=$2 status=progress && sync
