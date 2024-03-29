#!/bin/bash
read -p "Which user would you like to delete ?
" username
if [ $(getent passwd $username) ]; then
	id=$(cat /etc/passwd | grep $username | cut -d: -f3)
	sudo userdel -rf $username
	sudo pkill -u $id
else
	printf "user does not exist.\n"
fi