#!/bin/bash

#Includes
        source ./install/install.param

install_kubeTools() 

{
    #MASTERS
    for host in $MASTER; do
    {
        echo "Executando no node $host"
            yum -y update
            yum install -y kubelet kubeadm kubectl
            systemctl enable kubelet.service
            systemctl start kubelet.service
            exit
    }
    done

    #Workers
    for host in $Workers; do
    {
        echo "Executando no node $host"
            ssh  $host yum-complete-transaction --cleanup-only
            ssh  $host yum history redo last
            ssh  $host yum -y update
            ssh  $host yum install -y kubelet kubeadm kubectl
            ssh  $host systemctl enable kubelet.service
            ssh  $host systemctl start kubelet.service
    }
    done
}