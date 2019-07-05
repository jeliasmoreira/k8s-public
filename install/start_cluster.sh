#!/bin/bash

#Includes
        source ./install/install.param

start_cluster()

{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $host"
            ssh  $host kubeadm init --apiserver-advertise-address $(hostname -i)
            ssh  $host mkdir -p $HOME/.kube
            ssh  $host cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
            ssh  $host chown $(id -u):$(id -g) $HOME/.kube/config
            
    }
    done
}