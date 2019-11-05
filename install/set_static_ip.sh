cp -f interfaces /etc/network/interfaces
#cp -f ens33 /etc/network/interfaces.d/
/sbin/service ssh restart
echo -e "\e[93mstatic ip set-up done ! please reboot the systeme\e[0m"