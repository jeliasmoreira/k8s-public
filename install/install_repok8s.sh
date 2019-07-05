#!/bin/bash

#Includes
        source ./install/install.param

install_repok8s() {

     #MASTERS
    for host in $MASTERS; do
    {
       echo "Executando no node $host"
        rm -rf /etc/yum.repos.d/kubernetes.repo
        cp ./kubernetes.repo /etc/yum.repos.d/kubernetes.repo
        yum -y -q update
    }
    done

    #Workers
    for host in $Workers; do
    {
        ssh $host rm -rf /etc/yum.repos.d/kubernetes.repo
        scp ./kubernetes.repo root@$host:/etc/yum.repos.d/kubernetes.repo
        yum -y -q update  
    }
    done

}