# Cluster Docker Swarm com Vagrant

Este projeto automatiza a criação de um cluster Docker Swarm com múltiplos nós utilizando Vagrant e VirtualBox. Em poucos minutos, você pode ter um ambiente local completo com 1 nó manager e 3 nós workers, ideal para desenvolvimento, testes e estudos de orquestração de contêineres.

## 🎯 Objetivos

O ambiente provisionado por este projeto atende às seguintes definições:
* **Infraestrutura como Código:** Criação de 4 máquinas virtuais (1 `master`, 3 `workers`) definidas em um único `Vagrantfile`.
* **Rede Privada:** Cada máquina virtual possui um endereço de IP fixo para comunicação estável dentro do cluster.
* **Docker Pré-instalado:** O Docker é instalado e configurado automaticamente em todas as máquinas durante o provisionamento.
* **Cluster Swarm Automatizado:**
    * A máquina `master` é configurada como o nó *manager* do cluster.
    * As máquinas `node01`, `node02` e `node03` são automaticamente incluídas no cluster como *workers*.

## 🛠️ Pré-requisitos

Antes de começar, garanta que você tenha os seguintes softwares instalados em sua máquina:

* [Git](https://git-scm.com/)
* [Vagrant](https://www.vagrantup.com/downloads)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## 🚀 Como Executar

Siga os passos abaixo para subir o ambiente:

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/ian-cunha/cluster-swarm-vagrant.git](https://github.com/ian-cunha/cluster-swarm-vagrant.git)
    ```

2.  **Acesse o diretório do projeto:**
    ```bash
    cd seu-repositorio
    ```

3.  **Inicie o ambiente com Vagrant:**
    ```bash
    vagrant up
    ```
    *Aguarde alguns minutos.* O Vagrant irá baixar a imagem do sistema operacional (se necessário), criar as 4 máquinas virtuais, instalar o Docker e configurar o cluster Swarm automaticamente.

## ✅ Verificando o Cluster

Após a finalização do comando `vagrant up`, você pode verificar se o cluster está funcionando corretamente.

1.  **Acesse o nó master via SSH:**
    ```bash
    vagrant ssh master
    ```

2.  **Liste os nós do cluster:**
    Dentro da sessão SSH do master, execute o comando:
    ```bash
    docker node ls
    ```

    A saída deve ser semelhante a esta, mostrando o master como "Leader" e os outros três nós prontos:
    ```
    ID                            HOSTNAME   STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
    axjxxxxxxxxxxxxxxxxxx * master     Ready     Active         Leader           27.x.x
    bcyxxxxxxxxxxxxxxxxxx         node01     Ready     Active                          27.x.x
    dzzxxxxxxxxxxxxxxxxxx         node02     Ready     Active                          27.x.x
    fwqxxxxxxxxxxxxxxxxxx         node03     Ready     Active                          27.x.x
    ```

## 📂 Estrutura do Projeto

* `Vagrantfile`: Arquivo principal que define a infraestrutura, as máquinas virtuais e orquestra o provisionamento.
* `install_docker.sh`: Script executado em todas as VMs para instalar o Docker.
* `master_setup.sh`: Script executado apenas no nó `master` para inicializar o Swarm.
* `worker_setup.sh`: Script executado nos nós `nodeXX` para que eles se juntem ao cluster.
* `README.md`: Este arquivo.

## ⚙️ Comandos Úteis do Vagrant

* **Verificar o status das máquinas:**
    ```bash
    vagrant status
    ```
* **Desligar as máquinas (sem excluí-las):**
    ```bash
    vagrant halt
    ```
* **Destruir o ambiente (exclui todas as VMs criadas):**
    ```bash
    vagrant destroy -f
    ```

## 📄 Licença

Este projeto é distribuído sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
