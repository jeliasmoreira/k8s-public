#!/bin/bash

#Includes
        source ./install/install.param

pod_network()

{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $host"
            kubeadm init --apiserver-advertise-address $(hostname -i)
            mkdir -p $HOME/.kube
            cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
            chown $(id -u):$(id -g) $HOME/.kube/config
            
    }
    done
}