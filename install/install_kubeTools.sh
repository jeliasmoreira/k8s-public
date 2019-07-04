#!/bin/bash

install_kubeTools() 

{
    #MASTERS
    for host in $1; do
    {
        echo "Executando no node $host"
            $SSH $host yum install -y kubelet kubeadm kubectl
            systemctl enable kubelet.service
            systemctl start kubelet.service
    }
    done

    #Workers
    for host in $2; do
    {
        echo "Executando no node $host"
            $SSH $host yum install -y kubelet kubeadm kubectl
            systemctl enable kubelet.service
            systemctl start kubelet.service
    }
    done
}