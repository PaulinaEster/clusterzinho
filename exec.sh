#!/bin/bash
USERNAME="worker"
LOGFILE="/home/$USERNAME/install.log"

echo "Copiando key" >> $LOGFILE
cd /home/$USERNAME/
if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519 >> $LOGFILE
fi
sshpass -f ./password.txt ssh-copy-id -o StrictHostKeyChecking=no node-0 >> $LOGFILE
sshpass -f ./password.txt ssh-copy-id -o StrictHostKeyChecking=no node-1 >> $LOGFILE
sshpass -f ./password.txt ssh-copy-id -o StrictHostKeyChecking=no node-2 >> $LOGFILE
sshpass -f ./password.txt ssh-copy-id -o StrictHostKeyChecking=no mpiuser >> $LOGFILE 
eval `ssh-agent`  >> $LOGFILE
ssh-add /home/$USERNAME/.ssh/id_ed25519 >> $LOGFILE
