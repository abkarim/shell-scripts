#!/bin/bash
# Get disk name of the device size 111.8 GB
user="karim"
diskSize="111.8"
diskName=$(lsblk | pcregrep -o1 "^└─([a-z]+[0-9])[^\n]+$diskSize[^\n]+[^part]")

# Where to mount the disk
mountPoint="/media/$user/Karim"

# exit if disk not found
if [ -z "$diskName" ]; then
	echo "Error: Could not find the disk with size: $diskSize"
	exit 1
fi

# create path if not exists
mkdir -p $mountPoint

# Mount the disk 
mount "/dev/$diskName" "$mountPoint"
