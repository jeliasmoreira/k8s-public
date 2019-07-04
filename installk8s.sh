#!/bin/bash 

#LogicaDoScript

#Script shell para instalacao/reinstalacao do kubernetes em cluster utilizando tres VMS/Instancias
#Este script de provisionamento requer que as VMS estejam disponiveis e acessveis entre si via keys $SSH
#Este script foi modularizado, verificadr a sessao de includes para entender cada funcao

#Vars
    #Nodes
        NODE_MASTER="192.168.0.34"
        NODE_01="192.168.185.1"
        NODE_02="192.168.185.2"
        MASTERS="192.168.185.1"
        Workers="192.168.185.2 192.168.185.3"
    #Files
        K8S_REPO="/etc/yum.repos.d/kubernetes.repo"
    #Commands
        SETENFORCE="/usr/sbin/setenforce"
        SSH="/usr/bin/ssh"
        CURL="/usr/bin/curl"
        SED="/usr/bin/sed"
        SWAPOFF="/usr/sbin/swapoff"
        SYSTEMCTL="/usr/bin/systemctl"
        YUM="/usr/bin/yum -y"
        TOUCH="/usr/bin/touch"
#Includes
       source ./install/clean_installk8s.sh
       source ./install/adjust_yum.sh
       source ./install/disable_services.sh
       source ./install/install_repok8s.sh
       source ./install/install_docker.sh
       source ./install/install_kubeTools.sh
       source ./install/enable_sysctl.sh
       source ./install/k8s_modules.sh
       source ./install/download_modules.sh
       source ./install/startcluster.sh
       source ./install/pod_network.sh


echo "Limpando possiveis instalacoes anteriores anteriores"
    clean_installk8s $MASTERS $Workers

echo "Ajustando yum e instalando pacotes bases em todos os nodes"
    adjust_yum $MASTERS $Workers

echo "Desabilitando SeLinux, swap, firewalld e auditd"
    disable_services $MASTERS $Workers

echo "Instalando reposiorio do k8s"
    install_repok8s $MASTERS $Workers

echo "Instalando docker"
    install_docker $MASTERS $Workers

echo "Install kubelet kubeadm kubectl"
    install_kubeTools $MASTERS $Workers

echo "Habilitando sysctls"
    enable_sysctl  $MASTERS $Workers

echo "Criando arquivo de modulos do k8s"
    k8s_modules  $MASTERS $Workers
  
echo "Baixando as imagens dos pods que compoem o k8s - Somente no master"
    download_modules  $MASTERS $Workers

echo "Instalando k8 - Somente no master"
    startcluster $MASTERS $Workers

echo "Instalando k8s e o pod network - Somente no master"
    pod_network  $MASTERS $Workers