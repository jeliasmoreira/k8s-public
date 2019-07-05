#!/bin/bash


#Includes
        source ./install/install.param


pod_network()

{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $host"
            ssh  $host kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
    }
    done
}