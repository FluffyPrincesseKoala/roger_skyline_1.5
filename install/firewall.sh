ufw allow 2222/tcp
ufw allow 80/tcp
ufw allow 443

cp -f iptables /etc/network/if-pre-up.d/iptables
chmod +x /etc/network/if-pre-up.d/iptables
/etc/network/if-pre-up.d/iptables