#!/bin/bash

#Includes
        source ./install/install.param



disable_services()
{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $host"
            $SETENFORCE 0
            $SED -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
            $SWAPOFF -a
            $SYSTEMCTL disable firewalld
            $SYSTEMCTL stop firewalld
            $SYSTEMCTL disable auditd
            service auditd stop
    }
    done

    #Workers
    for host in $Workers; do
    {
        echo "Executando no node $Workers"
            $SSH $host $SETENFORCE 0
            $SSH $host $SED -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
            $SSH $host $SWAPOFF -a
            $SSH $host $SYSTEMCTL disable firewalld
            $SSH $host $SYSTEMCTL stop firewalld
            $SSH $host $SYSTEMCTL disable auditd
             $SSH $host service auditd stop
    }
    done


}