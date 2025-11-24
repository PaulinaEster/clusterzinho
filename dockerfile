FROM ubuntu:latest 

RUN apt-get update && apt-get install -y sudo

# Evita perguntas interativas
ENV DEBIAN_FRONTEND=noninteractive

# RUN echo "root:1234" | chpasswd
# instala SSH
RUN apt install -y openssh-server && \ 
    mkdir -p /var/run/sshd
RUN apt-get install sshpass -y

# ENV HOME=/home/worker
# ENV SSH_DIR=$HOME/.ssh

# RUN useradd -m -s /bin/bash worker && echo "worker:1234" | chpasswd 

# RUN mkdir -p $SSH_DIR && chmod 700 $SSH_DIR && chown worker:worker $SSH_DIR
# RUN echo "" >> $SSH_DIR/authorized_keys

# copia chave privada e pública
# COPY ./chaves/key $SSH_DIR/
# COPY ./chaves/key.pub $SSH_DIR/key.pub

# define permissões corretas
# RUN chown worker:worker $SSH_DIR/key $SSH_DIR/key.pub && \
#     chmod 600 $SSH_DIR/key && \
#     chmod 644 $SSH_DIR/key.pub

# cria authorized_keys com a chave pública
# RUN chmod 600 $SSH_DIR/authorized_keys && \
#     chown worker:worker $SSH_DIR/authorized_keys

# copia arquivos para instalar os pacotes
COPY ./packages .
COPY ./config-container.sh  .
COPY ./password.txt  .
COPY ./exec.sh  .

RUN chmod +x ./config-container.sh

# Expõe a porta interna 
EXPOSE 22

# Inicia o SSH e mantém o container ativo
CMD ["./config-container.sh"]
