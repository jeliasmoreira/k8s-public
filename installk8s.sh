#!/bin/bash 

#LogicaDoScript

#Script shell para instalacao/reinstalacao do kubernetes em cluster utilizando tres VMS/Instancias
#Este script de provisionamento requer que as VMS estejam disponiveis e acessveis entre si via keys $SSH
#Este script foi modularizado, verificadr a sessao de includes para entender cada funcao


#Includes
        source ./install/install.param
        source ./install/clean_installk8s.sh
        source ./install/adjust_yum.sh
        source ./install/disable_services.sh
        source ./install/install_repok8s.sh
        source ./install/install_docker.sh
        source ./install/install_kubeTools.sh
        source ./install/enable_sysctls.sh
        source ./install/k8s_modules.sh
        source ./install/download_images.sh
        source ./install/start_cluster.sh
        source ./install/pod_network.sh


echo "Limpando possiveis instalacoes anteriores anteriores"
    clean_installk8s 

echo "Ajustando yum e instalando pacotes bases em todos os nodes"
    adjust_yum

echo "Desabilitando SeLinux, swap, firewalld e auditd"
    disable_services

echo "Habilitando sysctls"
   enable_sysctls

echo "Criando arquivo de modulos do k8s"
   k8s_modules

echo "Instalando reposiorio do k8s"
   install_repok8s 

echo "Install kubelet kubeadm kubectl"
   install_kubeTools

echo "Instalando docker"
   install_docker 
  
echo "Baixando as imagens dos pods que compoem o k8s - Somente no master"
   download_images

echo "Instalando k8 - Somente no master"
   start_cluster

echo "Instalando k8s e o pod network - Somente no master"
   pod_network  