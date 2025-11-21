FROM ubuntu:latest 

RUN apt-get update && apt-get install -y sudo

# Evita perguntas interativas
ENV DEBIAN_FRONTEND=noninteractive

# RUN echo "root:1234" | chpasswd
# instala SSH
RUN apt install -y openssh-server && \ 
    mkdir -p /var/run/sshd

# Permite login por senha (simples para desenvolvimento)
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config  \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Conserta erro comum do OpenSSH sobre sessão não interativa
RUN echo "PermitTTY yes" >> /etc/ssh/sshd_config
RUN echo "UsePAM yes" >> /etc/ssh/sshd_config

# copia arquivos para instalar os pacotes
COPY ./packages .
COPY ./setup-container.sh  .
COPY ./exec.sh  .

RUN chmod +x ./setup-container.sh

# Expõe a porta interna 
EXPOSE 22

# Inicia o SSH e mantém o container ativo
CMD ["./setup-container.sh"]
