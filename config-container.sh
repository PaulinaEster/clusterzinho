#!/bin/bash
USERNAME="worker"
HOSTNAME=$(hostname)
LOGFILE="/home/$USERNAME/install.log"

#
# ATIVA SERVIÇO SSH
# 
echo "Ativando acesso SSH" > $LOGFILE
service ssh start

#
# CRIA USUARIO COM BASE NO HOSTNAME 
# DEFINIDO NA EXECUCAO DO CONTAINER
# 
mv /password.txt /home/$USERNAME/ >> $LOGFILE
echo "Criando usuário $USERNAME para SSH"  >> $LOGFILE
useradd -m -s /bin/bash $USERNAME && echo "$USERNAME:1234" | chpasswd >> $LOGFILE
mv /exec.sh /home/$USERNAME/ >> $LOGFILE
mkdir /home/$USERNAME/.ssh >> $LOGFILE
chmod 700 /home/$USERNAME/.ssh >> $LOGFILE
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh >> $LOGFILE
echo "" >> $SSH_DIR/authorized_keys
chmod 600 $SSH_DIR/authorized_keys && chown worker:worker $SSH_DIR/authorized_keys
chmod 700 /home/$USERNAME >> $LOGFILE
chown -R $USERNAME:$USERNAME /home/$USERNAME >> $LOGFILE

#
# CONFIGURA SSH
#
# if [[ "$HOSTNAME" == "mpiuser" ]]; then
#     mv /password.txt /home/$USERNAME/ >> $LOGFILE
#     echo "Configurando SSH" >> $LOGFILE
#     # su - $USERNAME >> $LOGFILE

#     # echo "Copiando key" >> $LOGFILE
#     # cd /home/$USERNAME/
#     # ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519 >> $LOGFILE
#     # sshpass -f ./password.txt ssh-copy-id node-0 >> $LOGFILE
#     # sshpass -f ./password.txt ssh-copy-id node-1 >> $LOGFILE
#     # sshpass -f ./password.txt ssh-copy-id node-2 >> $LOGFILE

#     # eval `ssh-agent`  >> $LOGFILE
#     # ssh-add /home/$USERNAME/.ssh/id_ed25519 >> $LOGFILE

# fi

#
# INSTALA BIBLIOTECAS NECESSARIAS PARA EXECUÇÃO DO CÓDIGO
#
echo "Instalando dependencias" >> $LOGFILE
cat ./packages | xargs apt-get install -y 

#
# CONFIGURA SERVIDOR NFS
#
# if ["$HOSTNAME" = "mpiuser"]; then
#     apt-get install nfs-kernel-server
#     echo "Instalando servidor NFS" >> $LOGFILE
#     mkdir /home/$USERNAME/cloud
#     cat /etc/exports

#     exportfs -a
#     service nfs-kernel-server restart
# else
#     apt-get install nfs-common
#     mkdir /home/$USERNAME/cloud
#     mount -t nfs manager:/home/mpiuser/cloud ~/cloud
# fi

#
# CLONA REPOSITORIO PARA TESTES 
#
echo "Clonando repositorio" >> $LOGFILE
cd /home/$USERNAME
git clone https://github.com/PaulinaEster/k-means-mpi.git
cd ./k-means-mpi/mpi
make WORKLOAD=A TIMER=ON

#
# MANTEM O CONTAINER DOCKER EM EXECUÇÃO
#
echo "Mantendo container em execução" >> $LOGFILE
tail -f /dev/null