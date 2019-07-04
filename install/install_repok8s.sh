#!/bin/bash

install_repok8s() {

     #MASTERS
    for i in $1; do
    {
       echo "Executando no node $i"
        rm -rf /etc/yum.repos.d/kubernetes.repo
        cp ./kubernetes.repo /etc/yum.repos.d/kubernetes.repo
    }
    done

    #Workers
    for i in $2; do
    {
        $SSH $i rm -rf /etc/yum.repos.d/kubernetes.repo
        scp ./kubernetes.repo root@$i:/etc/yum.repos.d/kubernetes.repo    
    }
    done

}