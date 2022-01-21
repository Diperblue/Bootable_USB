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

sudo umount $2
sudo mkfs.vfat $21

sudo dd if=$1 of=$2 status=progress && sync
