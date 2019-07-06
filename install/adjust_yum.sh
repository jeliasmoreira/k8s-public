#!/bin/bash

#Includes
        source ./install/install.param


 adjust_yum ()
 {
    #MASTERS
        for host in $MASTERS; do
        {
            echo "Executando no node $host"
                
                yum -y clean all
                yum-complete-transaction --cleanup-only
                yum history redo last
                yum -y install deltarpm
                yum install -y  yum-plugin-fastestmirror
                rm -rf /etc/yum.repos.d/kubernetes.repo
                cp ./kubernetes.repo /etc/yum.repos.d/kubernetes.repo
                yum install -y   epel-release git curl bind-utils yum-utils device-mapper-persistent-data lvm2 yum install  bind-utils tcpdump net-tools mlocate mail
        }
        done

        #Workers
        for host in $Workers; do
        {
            echo "Executando no node $host"
                ssh $host yum -y  clean all
                ssh $host yum-complete-transaction --cleanup-only
                ssh $host yum -y  history redo last
                ssh $host yum -y  install deltarpm
                ssh $host yum -y  install yum-plugin-fastestmirror
                ssh $host rm -rf /etc/yum.repos.d/kubernetes.repo
                scp ./kubernetes.repo root@$host:/etc/yum.repos.d/kubernetes.repo
                ssh $host yum -y  epel-release git curl bind-utils yum-utils device-mapper-persistent-data lvm2 yum install  bind-utils tcpdump net-tools mlocate mail
            }
        done

}