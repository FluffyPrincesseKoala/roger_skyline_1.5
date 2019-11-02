#! bin/bash
read -r -p "what name for new sudo user ?" USR
/sbin/useradd -g sudo -s /bin/bash -m "$USR"
echo 'user created'