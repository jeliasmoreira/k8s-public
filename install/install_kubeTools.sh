#!/bin/bash

#Includes
        source ./install/install.param

install_kubeTools() 

{
    #MASTERS
    for host in $MASTER; do
    {
        echo "Executando no node $host"
            yum-complete-transaction --cleanup-only
            yum history redo last
            yum -y update
            yum install -y kubelet kubeadm kubectl
            systemctl enable kubelet.service
            systemctl start kubelet.service
    }
    done

    #Workers
    for host in $Workers; do
    {
        echo "Executando no node $host"
            yum-complete-transaction --cleanup-only
            yum history redo last
            yum -y update
            ssh  $host yum install -y kubelet kubeadm kubectl
            systemctl enable kubelet.service
            systemctl start kubelet.service
    }
    done
}