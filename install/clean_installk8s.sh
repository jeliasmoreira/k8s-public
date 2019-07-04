#!/bin/bash


clean_installk8s() {
    #MASTERS
        for host in $1; do
    {
            echo "Executando no node $host"
                $SYSTEMCTL stop kubelet.service
                kubeadm reset -f
                iptables -F  &&  iptables -t nat -F && iptables -t mangle -F && iptables -X &&
                rm -rf /etc/kubernetes/ && rm -rf /var/lib/etcd/ && rm -rf  /root/.kube/ && rm -rf /var/lib/kubelet/
                yum -y remove kubectl kubeadm kubelet
    }
        done

        #Workers
        for host in $2s; do
        {
                $SSH $host $SYSTEMCTL stop kubelet.service
                $SSH $host kubeadm reset -f
                $SSH $host iptables -F  &&  iptables -t nat -F && iptables -t mangle -F && iptables -X &&
                $SSH $host rm -rf /etc/kubernetes/ && rm -rf /var/lib/etcd/ && rm -rf  /root/.kube/ && rm -rf /var/lib/kubelet/
                $SSH $host yum -y remove kubectl kubeadm kubelet
        }
    done
}