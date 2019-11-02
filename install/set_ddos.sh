#! /bin/bash
cp -f jail.local /etc/fail2ban/jail.local
cp -f http-get-dos.conf /etc/fail2ban/filter.d/http-get-dos.conf
systemctl restart fail2ban.service
