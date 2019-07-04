#!/bin/bash

#Includes
        source ./install/install.param

k8s_modules()

{
    #MASTERS
    for host in $MASTERS; do
   {
        echo "Executando no node $host"
            rm -rf /etc/modules-load.d/k8s.conf
            cp ./k8s.conf /etc/modules-load.d/
    }
    done

    #Workers
    for host in $Workers; do
    {
        echo "Executando no node $host"
            $SSH $host rm -rf /etc/modules-load.d/k8s.conf
            scp ./k8s.conf root@$i:/etc/modules-load.d/k8s.conf
    }
    done

}