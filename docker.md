criar network docker

docker network create clusterzinho

cria imagem docker do arquivo `dockerfile` com ssh
docker build -t server-ssh .

criar os nodos

sudo docker run -d -v /home/paulina/Masters/petrobras/clusterzinho/vms/node-0:/home/gmap --name node-0 --network clusterzinho --cpus="2" server-ssh:0.8
sudo docker run -d -v /home/paulina/Masters/petrobras/clusterzinho/vms/node-1:/home/gmap --name node-1 --network clusterzinho --cpus="2" server-ssh:0.8
sudo docker run -d -v /home/paulina/Masters/petrobras/clusterzinho/vms/node-2:/home/gmap --name node-2 --network clusterzinho --cpus="2" server-ssh:0.8

acessar container:

sudo docker exec -it node-0 bash

sair do acesso
ctrl + Q + p

acesso ssh:
ssh gmap@node-1


parar container
sudo docker container stop node-0 node-1 node-2
sudo docker container rm node-0 node-1 node-2