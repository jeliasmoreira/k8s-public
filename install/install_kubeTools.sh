#!/bin/bash

#Includes
        source ./install/install.param

install_kubeTools() 

{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $host"
            ssh  $host yum -y update
            ssh  $host yum install -y -q  kubelet kubeadm kubectl
            ssh  $host systemctl enable kubelet.service
            ssh  $host systemctl start kubelet.service
    }
    done

    #Workers
    for host in $Workers; do
    {
        echo "Executando no node $host"
            ssh  $host yum -y -q update
            ssh  $host yum install -q -y kubelet kubeadm kubectl
            ssh  $host systemctl enable kubelet.service
            ssh  $host systemctl start kubelet.service
    }
    done
}