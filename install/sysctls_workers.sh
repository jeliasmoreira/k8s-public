#!/bin/bash



    #MASTERS
             #echo "Executando no node $host"
             echo "1" >> /proc/sys/net/ipv4/ip_forward
             echo "1" >>  /proc/sys/net/bridge/bridge-nf-call-iptables
             echo "net.bridge.bridge-nf-call-iptables=1" >>  /etc/sysctl.conf
             echo "net.ipv6.conf.all.disable_ipv6=1" >>  /etc/sysctl.conf
             echo "net.ipv6.conf.default.disable_ipv6=1" >>  /etc/sysctl.conf
             echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
             echo "net.ipv4.conf.all.forwarding=1"
             sysctl -p -q
