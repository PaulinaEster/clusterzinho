#!/bin/bash
USERNAME=$(hostname)
LOGFILE="/home/$USERNAME/install.log"

echo "Criando hostfile" >> $LOGFILE
cd /home/$USERNAME/k-means-mpi/mpi
HOSTFILE="/home/$USERNAME/k-means-mpi/mpi/hostfile"

echo "node-1 slots=2" > $HOSTFILE
echo "node-2 slots=2" >> $HOSTFILE
mpirun -np 6 --allow-run-as-root --hostfile hostfile ./k-means.A.exe > /home/$USERNAME/resultado.log