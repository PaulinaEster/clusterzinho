### criar network docker
```bash
docker network create clusterzinho
```

### cria imagem docker do arquivo `dockerfile` com ssh
```bash
docker build -t server-ssh .
```

### criar os nodos
```bash
sudo docker compose up -d

# sudo docker run -d -v /home/paulina/Masters/petrobras/clusterzinho/vms/node-0:/home/worker --name node-0 --hostname node-0 --network clusterzinho server-ssh
# sudo docker run -d -v /home/paulina/Masters/petrobras/clusterzinho/vms/node-1:/home/worker --name node-1 --hostname node-1 --network clusterzinho server-ssh
# sudo docker run -d -v /home/paulina/Masters/petrobras/clusterzinho/vms/node-2:/home/worker --name node-2 --hostname node-2 --network clusterzinho server-ssh

# sudo docker run -d -v /home/paulina/Masters/petrobras/clusterzinho/vms/mpiuser:/home/worker --name mpiuser --hostname mpiuser --network clusterzinho server-ssh
```

### acessar cada um dos container:
```bash
sudo docker exec -it --user worker node-0 bash
```
### adicionar chaves para ssh:
```bash
cd ~/
chmod +x exec.sh
./exec.sh
```
### verificar andamento da instalação dos pacotes
```bash
cat /home/worker/install.log
```


### sair do acesso
```bash
exit
```

### acesso ssh entre o container mpiuser e os nodes containers: 
```bash
ssh node-1
```

### testar mpi com varios nodos
```bash
cd /home/worker/k-means-mpi
chmod +x ./exec.sh
./exec.sh
```

### parar container
```bash
sudo docker container stop node-0 node-1 node-2 mpiuser
sudo docker container rm node-0 node-1 node-2 mpiuser
```