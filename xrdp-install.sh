#!/bin/bash
sudo yum update -y grub2-common
# -	Install the gnome GUI components using the following command.
sudo yum groupinstall -y "Server with GUI"
# -	Issue the following commands to start the GUI during boot.
sudo systemctl set-default graphical.target

sudo systemctl default
# -	Install xrdp and tiger VNC server.
sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm
sudo yum install -y xrdp tigervnc-server

chcon --type=bin_t /usr/sbin/xrdp
chcon --type=bin_t /usr/sbin/xrdp-sesman
# -	Enable startup for Xrdp 
sudo systemctl start xrdp 

sudo systemctl enable xrdp
# -	Allow remote desktop 
sudo firewall-cmd --permanent --add-port=3389/tcp
sudo firewall-cmd --reload
sudo su
pass="gcsvn123"
echo "ec2-user:$pass" | chpasswd
echo "root:$pass" |chpasswd
useradd tugl -p $pass
exit