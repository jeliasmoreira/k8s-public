#!/bin/bash

#Includes
        source ./install/install.param

k8s_modules()

{
    #MASTERS
    for host in $MASTERS; do
   {
        echo "Executando no node $host"
            ssh $host rm -rf /etc/modules-load.d/k8s.conf
            scp ./k8s.conf root@$host:/etc/modules-load.d/k8s.conf
    }
    done

    #Workers
    for host in $Workers; do
    {
        echo "Executando no node $host"
            ssh $host rm -rf /etc/modules-load.d/k8s.conf
            scp ./k8s.conf root@$host:/etc/modules-load.d/k8s.conf
    }
    done

}