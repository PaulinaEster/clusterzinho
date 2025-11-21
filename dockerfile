FROM ubuntu:latest

# Evita perguntas interativas
ENV DEBIAN_FRONTEND=noninteractive

# Atualiza pacotes e instala SSH
RUN apt update && apt install -y openssh-server && \
mkdir -p /var/run/sshd

RUN apt install -y htop 


# instala os pacotes
COPY ./packages .
COPY ./setup-container.sh  .

RUN chmod +x ./setup-container.sh

# Permite login por senha (simples para desenvolvimento)
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config


# Conserta erro comum do OpenSSH sobre sessão não interativa
RUN echo "PermitTTY yes" >> /etc/ssh/sshd_config
RUN echo "UsePAM yes" >> /etc/ssh/sshd_config

# Expõe a porta interna 
EXPOSE 22

# Inicia o SSH e mantém o container ativo
CMD ["./setup-container.sh"]
