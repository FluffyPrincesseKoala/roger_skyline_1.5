#! /bin/bash

## update ##

printf "\33[90mupdate running\n"

apt-get update >/var/log/update_script.log

apt-get -y upgrade >>/var/log/update_script.log

## add dist-upgrade for distribution upgrade ##

printf "\33[92mupdate finish\n"

## clean ##

printf "\33[90mcleaning start\n"

apt-get autoclean >>/var/log/update_script.log

apt-get clean >>/var/log/update_script.log

apt-get -y autoremove >>/var/log/update_script.log

printf "\33[92mcleaning done.\n\33[93mYou can see the log in /var/log/update_script.log\n\33[0m"

## tail -f /var/log/update_script.log