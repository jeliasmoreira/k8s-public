#!/bin/bash

#Includes
        source ./install/install.param

download_images()

{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $host"
            kubeadm config images pull
    }
    done    


}