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
sudo docker run -d -v /clusterzinho/vms/node-0:/home/node-0 --name node-0 --hostname node-0 --network clusterzinho --cpus="2" server-ssh:0.9
sudo docker run -d -v /clusterzinho/vms/node-1:/home/node-1 --name node-1 --hostname node-1 --network clusterzinho --cpus="2" server-ssh:0.9
sudo docker run -d -v /clusterzinho/vms/node-2:/home/node-2 --name node-2 --hostname node-2 --network clusterzinho --cpus="2" server-ssh:0.9
```

### acessar container:
```bash
sudo docker exec -it node-0 bash
```

### verificar andamento da instalação dos pacotes
```bash
cat /home/node-0/install.log
```

### testar mpi com varios nodos
```bash
cd /home/node-0/k-means-mpi
chmod +x ./exec.sh
./exec.sh
```


### sair do acesso
```bash
exit
```

### acesso ssh entre containers: 
```bash
ssh gmap@node-1
```

### parar container
```bash
sudo docker container stop node-0 node-1 node-2
sudo docker container rm node-0 node-1 node-2
```