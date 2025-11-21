#!/bin/bash
USERNAME=$(hostname)
LOGFILE="/home/$USERNAME/install.log"
echo "Ativando acesso SSH" > $LOGFILE
service ssh start

echo "Criando usuário $USERNAME para SSH"  >> $LOGFILE
useradd -m -s /bin/bash $USERNAME && echo "$USERNAME:1234" | chpasswd
mv /exec.sh /home/$USERNAME/

echo "Instalando dependencias" >> $LOGFILE
cat ./packages | xargs apt-get install -y

echo "Clonando repositorio" >> $LOGFILE
cd /home/$USERNAME
git clone https://github.com/PaulinaEster/k-means-mpi.git
cd ./k-means-mpi/mpi
make WORKLOAD=A TIMER=ON

# if [ "$USERNAME" = "node-0" ]; then
#     echo "Criando hostfile" >> $LOGFILE
#     HOSTFILE="/home/$USERNAME/hostfile"
#     echo "node-1 slots=2" > $HOSTFILE
#     echo "172.18.0.3 slots=2" >> $HOSTFILE
#     mpirun -np 6 --allow-run-as-root --hostfile hostfile ./k-means.A.exe > /home/$USERNAME/resultado.log
# fi

echo "Mantendo container em execução" >> $LOGFILE
tail -f /dev/null