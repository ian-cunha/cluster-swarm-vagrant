#!/bin/bash

echo ">>> Atualizando pacotes..."
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

echo ">>> Adicionando chave GPG do Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo ">>> Adicionando repositório do Docker..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

echo ">>> Instalando Docker..."
sudo apt-get install -y docker-ce

echo ">>> Adicionando usuário vagrant ao grupo docker..."
sudo usermod -aG docker vagrant

echo ">>> Instalação do Docker concluída!"