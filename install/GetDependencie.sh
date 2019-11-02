#!bin/sh
apt-get update && apt-get upgrade
apt-get install -y sudo vim ufw fail2ban sendmail apache2 git portsentry openssl iptables
env | grep PATH | grep /sbin
if [$? = "1"]
    then export PATH=$PATH:/sbin
fi