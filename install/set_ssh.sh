cp -f sshd_config /etc/ssh/sshd_config
systemctl restart ssh
echo -e "\e[93mssh set-up done !\e[0m"