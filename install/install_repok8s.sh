#!/bin/bash

#Includes
        source ./install/install.param

install_repok8s() {

     #MASTERS
    for host in $MASTERS; do
    {
       echo "Executando no node $i"
        rm -rf /etc/yum.repos.d/kubernetes.repo
        cp ./kubernetes.repo /etc/yum.repos.d/kubernetes.repo
    }
    done

    #Workers
    for host in $Workers; do
    {
        $SSH $i rm -rf /etc/yum.repos.d/kubernetes.repo
        scp ./kubernetes.repo root@$i:/etc/yum.repos.d/kubernetes.repo    
    }
    done

}