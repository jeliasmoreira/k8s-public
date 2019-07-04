#!/bin/bash

#Includes
        source ./install/install.param

install_kubeTools() 

{
    #MASTERS
    for host in $MASTER; do
    {
        echo "Executando no node $host"
            yum install -y kubelet kubeadm kubectl
            systemctl enable kubelet.service
            systemctl start kubelet.service
    }
    done

    #Workers
    for host in $2; do
    {
        echo "Executando no node $Workers"
            $SSH $host yum install -y kubelet kubeadm kubectl
            systemctl enable kubelet.service
            systemctl start kubelet.service
    }
    done
}