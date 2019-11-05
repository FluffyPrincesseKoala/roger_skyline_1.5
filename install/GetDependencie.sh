#!bin/sh
apt-get update && apt-get upgrade
apt-get install -y sudo vim fail2ban sendmail apache2 git portsentry openssl iptables
env | grep PATH | grep /sbin
export PATH=$PATH:/sbin

echo "koala   ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers