#!/bin/bash
USERNAME=$(hostname)
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
echo "Criando usuário $USERNAME para SSH"  >> $LOGFILE
sudo useradd -m -s /bin/bash $USERNAME && echo "$USERNAME:1234" | chpasswd
mv /exec.sh /home/$USERNAME/
mkdir /home/$USERNAME/.ssh

#
# CONFIGURA SSH
#
echo "Configurando SSH" >> $LOGFILE
# su - $USERNAME
ssh-keygen -t dsa

echo "Copiando key" >> $LOGFILE

if ["$USERNAME" = "node-0"]; then
    ssh-copy-id node-1
    # ssh-copy-id node-2
elif ["$USERNAME" = "node-1"]; then
    ssh-copy-id node-0
    # ssh-copy-id node-2
elif ["$USERNAME" = "node-2"]; then
    ssh-copy-id node-0
    ssh-copy-id node-1
fi
eval `ssh-agent`
echo "" > /home/$USERNAME/.ssh/id_dsa
ssh-add /home/$USERNAME/.ssh/id_dsa

#
# INSTALA BIBLIOTECAS NECESSARIAS PARA EXECUÇÃO DO CÓDIGO
#
echo "Instalando dependencias" >> $LOGFILE
cat ./packages | xargs apt-get install -y

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