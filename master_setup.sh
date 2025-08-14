#!/bin/bash

MASTER_IP="10.10.10.100"

echo ">>> Iniciando o Docker Swarm no nó master..."
docker swarm init --advertise-addr $MASTER_IP

echo ">>> Gerando e salvando o comando de join para os workers..."
docker swarm join-token worker | grep "docker swarm join" > /vagrant/worker_join_command.sh

echo ">>> Configuração do master concluída!"