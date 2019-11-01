#!/bin/bash
username=koala
new=$(cat /etc/crontab)
DIFF=$(diff /etc/crontab /home/$username/tmp)
if [ "$DIFF" != "" ]; then
	sendmail root < /home/$username/email.txt
	rm -rf /home/$username/tmp
	cat /etc/crontab > /home/$username/tmp
fi