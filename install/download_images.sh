#!/bin/bash

#Includes
        source ./install/install.param

download_images()

{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $host"
           ssh  $host  kubeadm config images pull
    }
    done    


}