#!bin/sh

# New user
apt-get update && apt-get upgrade
apt-get install -y sudo ufw fail2ban sendmail apache2 git portsentry openssl iptables &
PID=$!
wait $PID

mv /home/koala/.bashrc /home/koala/.bashrc.old # todo
cp .bashrc /home/koala
source /home/koala/.bashrc
# Networking

mv /etc/network/interfaces /etc/network/interfaces.old &
PID=$!
wait $PID
cp interfaces /etc/network/

mv /etc/hosts /etc/hosts.old & #todo
PID=$!
wait $PID
cp hosts /etc/

# Ssh

mv /etc/ssh/sshd_config /etc/ssh/sshd_config.old &
PID=$!
wait $PID

cp sshd_config /etc/ssh/

# Firewall

mv iptables /etc/network/if-pre-up.d/
/etc/network/if-pre-up.d/iptables

ufw enable&
PID=$!
wait $PID
ufw limit 2222
ufw allow 80
ufw allow 443

# DdOS

mv /etc/fail2ban/jail.local /etc/fail2ban/jail.local.old &
PID=$!
wait $PID
cp jail.local /etc/fail2ban/ &

cp http-get-dos.conf /etc/fail2ban/filter.d/ &

# Port Scan

mv /etc/default/portsentry /etc/default/portsentry.old &
mv /etc/portsentry/portsentry.conf /etc/portsentry/portsentry.conf.old &
PID=$!
wait $PID
cp portsentry /etc/default/
cp portsentry.conf /etc/portsentry/

# Crontab

mv /etc/crontab /etc/crontab.old &
PID=$!
wait $PID
cp crontab /etc/crontab

# SSL

mv roger-skyline.com.key /etc/ssl/private/ &
mv roger-skyline.com.crt /etc/ssl/certs/ &

mv ssl-params.conf /etc/apache2/conf-available/ssl-params.conf &

mv /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.old &
PID=$!
wait $PID
cp default-ssl.conf /etc/apache2/sites-available/ &
PID=$!
wait $PID

mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.old &
PID=$!
wait $PID
cp 000-default.conf /etc/apache2/sites-available/

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

systemctl disable console-setup.service
systemctl disable keyboard-setup.service
systemctl disable apt-daily.timer
systemctl disable apt-daily-upgrade.timer

# make executable script

#chmod +x update.sh
#chmod +x watch_script.sh
#chmod +x post-receive

# Reboot Service

systemctl restart fail2ban.service
systemctl restart portsentry.service
systemctl restart apache2