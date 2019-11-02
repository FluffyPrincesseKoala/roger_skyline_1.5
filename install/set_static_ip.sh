cp -f interfaces /etc/network/interfaces
/sbin/service ssh restart
echo -e "\e[93mstatic ip set-up done ! please reboot the systeme\e[0m"