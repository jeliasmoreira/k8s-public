#!/bin/bash

#Includes
        source ./install/install.param
        

clean_installk8s() {
    #MASTERS
        for host in $MASTERS; do
    {
            echo "Executando no node $MASTER"
                $SYSTEMCTL stop kubelet.service
                kubeadm reset -f
                iptables -F  &&  iptables -t nat -F && iptables -t mangle -F && iptables -X &&
                rm -rf /etc/kubernetes/ && rm -rf /var/lib/etcd/ && rm -rf  /root/.kube/ && rm -rf /var/lib/kubelet/
                yum -y remove kubectl kubeadm kubelet
    }
        done

        #Workers
        for host in $Workers; do
        {
                ssh $host $SYSTEMCTL stop kubelet.service
                ssh $host kubeadm reset -f
                ssh $host iptables -F  &&  iptables -t nat -F && iptables -t mangle -F && iptables -X &&
                ssh $host rm -rf /etc/kubernetes/ && rm -rf /var/lib/etcd/ && rm -rf  /root/.kube/ && rm -rf /var/lib/kubelet/
                ssh $host yum -y remove kubectl kubeadm kubelet
        }
    done
}
