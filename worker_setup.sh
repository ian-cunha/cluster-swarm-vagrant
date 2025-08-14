#!/bin/bash

while [ ! -f /vagrant/worker_join_command.sh ]; do
  echo ">>> Aguardando o comando de join do master..."
  sleep 2
done

echo ">>> Entrando no cluster Swarm como worker..."
bash /vagrant/worker_join_command.sh

echo ">>> Nó worker configurado com sucesso!"