#!/bin/bash
USERNAME=$(hostname)

echo "Ativando acesso SSH" > /home/$USERNAME/install.log
service ssh start

echo "Criando usuário $USERNAME para SSH"
useradd -m -s /bin/bash $USERNAME && echo "$USERNAME:1234" | chpasswd

echo "Instalando dependencias" >> /home/$USERNAME/install.log
cat ./packages | xargs apt-get install -y

echo "Clonando repositorio" >> /home/$USERNAME/install.log
cd /home/$USERNAME
git clone https://github.com/PaulinaEster/k-means-mpi.git
cd ./k-means-mpi/mpi
make WORKLOAD=A TIMER=ON
mpirun -np 2 ./k-means.A.exe > /home/$USERNAME/resultado.log

echo "Mantendo container em execução" >> /home/$USERNAME/install.log
tail -f /dev/null