#!/bin/bash

#Includes
        source ./install/install.param

install_kubeTools() 

{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $host"
            yum -y update
            yum install -y -q  kubelet kubeadm kubectl
            systemctl enable kubelet.service
            systemctl restart kubelet.service

    }
    done

    #Workers
    for host in $Workers; do
    {
        echo "Executando no node $host"
            ssh  $host yum install -y -q  kubelet kubeadm kubectl
            ssh  $host systemctl enable kubelet.service
            ssh  $host systemctl restart kubelet.service
    }
    done
}