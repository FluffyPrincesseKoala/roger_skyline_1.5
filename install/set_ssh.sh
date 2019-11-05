mkdir /home/koala/.ssh
chmod 700 /home/koala/.ssh
touch /home/koala/.ssh/authorized_keys
chmod 600 /home/koala/.ssh/authorized_keys

cp -f sshd_config /etc/ssh/sshd_config
systemctl restart ssh
echo -e "\e[93mssh set-up done !\e[0m"