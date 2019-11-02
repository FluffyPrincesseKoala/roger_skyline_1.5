/sbin/ufw enable
/sbin/ufw limit 2222
/sbin/ufw allow 80
/sbin/ufw allow 443
/sbin/ufw status

cp -f iptables /etc/network/if-pre-up.d/iptables
chmod +x /etc/network/if-pre-up.d/iptables
/etc/network/if-pre-up.d/iptables