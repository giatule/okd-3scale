#!/bin/bash
# sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << FDISK_CMDS  | sudo fdisk  /dev/nvme1n1
# n      # add new partition
# e 	#



# n
# l

# 104800000
# n
# l


# w
sudo su
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << FDISK_CMDS  | sudo fdisk  /dev/nvme1n1
n      # add new partition
e 	



n
l

104800000
n
l


w
FDISK_CMDS
fdisk -l
mkfs -t xfs /dev/nvme1n1p5
mkfs -t xfs /dev/nvme1n1p6

# input new partion to /etc/fstab
echo "/dev/nvme1n1p5 /var/lib/docker xfs defaults 0 0" >> /etc/fstab
echo "/dev/nvme1n1p6 /var/lib/origin/openshift.local.volumes xfs defaults 0 0" >> /etc/fstab
# create opnshift and docker folder to mount 
mkdir -p /var/lib/origin/openshift.local.volumes
mkdir -p /var/lib/docker
# mount all
mount -a
# print mount point
findmnt