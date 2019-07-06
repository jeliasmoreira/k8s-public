#!/bin/bash



    #MASTERS
             #echo "Executando no node $host"
             echo "net.bridge.bridge-nf-call-iptables=1" >>  /etc/sysctl.conf
             echo "net.ipv6.conf.all.disable_ipv6=1" >>  /etc/sysctl.conf
             echo "net.ipv6.conf.default.disable_ipv6=1" >>  /etc/sysctl.conf
             echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
             echo "net.ipv4.conf.all.forwarding=1" >> /etc/sysctl.conf
             sysctl -p -q
