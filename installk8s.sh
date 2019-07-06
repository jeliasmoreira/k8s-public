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


echo -e "\e[1;31mLimpando possiveis instalacoes anteriores anteriores\e[0m"
    clean_installk8s 

echo -e "\e[1;31mAjustando yum e instalando pacotes bases em todos os nodes\e[0m"
     adjust_yum

echo -e "\e[1;31mDesabilitando SeLinux, swap, firewalld e auditd\e[0m"
    disable_services

echo -e "\e[1;31mHabilitando sysctls\e[0m"
   enable_sysctls

echo -e "\e[1;31m Criando arquivo de modulos do k8s\e[0m"
    k8s_modules

echo -e "\e[1;31m Instalando reposiorio do k8s\e[0m"
     install_repok8s 

echo -e "\e[1;31m Install kubelet kubeadm kubectl\e[0m"
    install_kubeTools
   
echo -e "\e[1;31m Instalando docker\e[0m"
    install_docker 
  
echo -e "\e[1;31m Baixando as imagens dos pods que compoem o k8s - Somente no master\e[0m"
      download_images

echo -e "\e[1;31m Instalando k8 - Somente no master\e[0m"
      start_cluster

echo -e "\e[1;31m Instalando k8s e o pod network - Somente no master\e[0m"
      pod_network  