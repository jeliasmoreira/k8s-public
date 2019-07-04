#!/bin/bash

enable_sysctls() 


{
    #MASTERS
    for host in $1; do
    {
        echo "Executando no node $host"
            echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.d/99-sysctl.conf
            echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.d/99-sysctl.conf
            echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.d/99-sysctl.conf
            systctl -p
            echo "1" >  /proc/sys/net/bridge/bridge-nf-call-iptables
            
    }
    done

    #Workers
    for host in $2; do
    {
        echo "Executando no node $host"
            $SSH $host echo "1" >  /proc/sys/net/bridge/bridge-nf-call-iptables
            $SSH $host echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.d/99-sysctl.conf
            $SSH $host echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.d/99-sysctl.conf
            $SSH $host echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.d/99-sysctl.conf
            $SSH $host systctl -p
    }
    done


}