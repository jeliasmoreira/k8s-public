#!/bin/bash

#Includes
        source ./install/install.param


enable_sysctls() 


{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $host"
            echo "1" >  /proc/sys/net/bridge/bridge-nf-call-iptables
            echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.d/99-sysctl.conf
            echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.d/99-sysctl.conf
            echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.d/99-sysctl.conf
            systctl -p
            

            
    }
    done

    #Workers
    for host in $Workers; do
    {
        echo "Executando no node $host"
            ssh $host echo "1" >  /proc/sys/net/bridge/bridge-nf-call-iptables
            ssh $host echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.d/99-sysctl.conf
            ssh $host echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.d/99-sysctl.conf
            ssh $host echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.d/99-sysctl.conf
            ssh $host systctl -p
    }
    done


}