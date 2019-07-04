#!/bin/bash

pod_network()

{
    #MASTERS
    for host in $1; do
    {
        echo "Executando no node $host"
            kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
    }
    done
}