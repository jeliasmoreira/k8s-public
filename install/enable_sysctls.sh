#!/bin/bash

#Includes
        source ./install/install.param


enable_sysctls() 


{
    #MASTERS
    for host in $MASTERS; do
    {
        echo "Executando no node $host"
             echo "net.bridge.bridge-nf-call-iptables=1" >>  /etc/sysctl.conf
             echo "net.ipv6.conf.all.disable_ipv6=1" >>  /etc/sysctl.conf
             echo "net.ipv6.conf.default.disable_ipv6=1" >>  /etc/sysctl.conf
             echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
             echo "net.ipv4.conf.all.forwarding=1" >> /etc/sysctl.conf
             sysctl -p -q
                        
    }
    done

    #Workers
    for host in $Workers; do
    {
        echo "Executando no node $host"

            scp ./install/sysctls_workers.sh root@$host:/tmp/sysctls_workers.sh
            ssh $host sh /tmp/sysctls_workers.sh
    }
    done


}