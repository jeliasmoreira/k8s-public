#!/bin/bash

download_modules()

{
    #MASTERS
    for host in $1; do
    {
        echo "Executando no node $host"
            kubeadm config images pull
    }
    done    


}