#!bin/sh

# New user

sudo apt-get install -y sudo ufw fail2ban sendmail apache2 git portsentry openssl
#sudo useradd -g sudo -s /bin/bash -m koala

# Networking

sudo mv /etc/network/interfaces /etc/network/interfaces.old
sudo cp interfaces /etc/network/
sudo mv /etc/hosts /etc/hosts.old
sudo cp hosts /etc/

# Ssh

sudo mv /etc/ssh/sshd_config /etc/ssh/sshd_config.old
sudo cp sshd_config /etc/ssh/

# Firewall

sudo ufw enable
sudo ufw limit 2222
sudo ufw allow 80
sudo ufw allow 443

# DdOS

sudo mv /etc/fail2ban/jail.local /etc/fail2ban/jail.local.old
sudo cp jail.local /etc/fail2ban/

sudo cp http-get-dos.conf /etc/fail2ban/filter.d/

# Port Scan

sudo mv /etc/default/portsentry /etc/default/portsentry.old
sudo mv /etc/portsentry/portsentry.conf /etc/portsentry/portsentry.conf.old

sudo cp portsentry /etc/default/
sudo cp portsentry.conf /etc/portsentry/

# Crontab

sudo mv /etc/crontab /etc/crontab.old
sudo cp crontab /etc/crontab

# SSL

sudo mv roger-skyline.com.key /etc/ssl/private/
sudo mv roger-skyline.com.crt /etc/ssl/certs/

sudo mv ssl-params.conf /etc/apache2/conf-available/ssl-params.conf

sudo mv /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.old
sudo cp default-ssl.conf /etc/apache2/sites-available/

sudo mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.old
sudo cp 000-default.conf /etc/apache2/sites-available/

a2enmod ssl
a2enmod headers
a2ensite default-ssl
a2enconf ssl-params
apache2ctl configtest

# Web

mkdir /home/koala/html
mkdir /home/koala/server

git init --bare /home/koala/server
cp post-receive /home/koala/server/hooks

# Stop Useless service

sudo systemctl disable console-setup.service
sudo systemctl disable keyboard-setup.service
sudo systemctl disable apt-daily.timer
sudo systemctl disable apt-daily-upgrade.timer

# make executable script

#chmod +x update.sh
#chmod +x watch_script.sh
#chmod +x post-receive

# Reboot Service

sudo systemctl restart fail2ban.service
sudo systemctl restart portsentry.service
sudo systemctl restart apache2