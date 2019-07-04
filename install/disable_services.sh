#!/bin/bash

#Includes
        source ./install/install.param



disable_service()
{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $i"
            $SETENFORCE 0
            $SED -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
            $SWAPOFF -a
            $SYSTEMCTL disable firewalld
            $SYSTEMCTL disable auditd
    }
    done

    #Workers
    for host in $2; do
    {
        echo "Executando no node $Workers"
            $SSH $host $SETENFORCE 0
            $SSH $host $SED -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
            $SSH $host $SWAPOFF -a
            $SSH $host $SYSTEMCTL disable firewalld
            $SSH $host $SYSTEMCTL disable auditd
    }
    done


}