#!/bin/bash

#Includes
        source ./install/install.param


 adjust_yum ()
 {
    #MASTERS
        for host in $MASTERS; do
        {
            echo "Executando no node $host"
                ssh  $host yum -y -q clean all
                #ssh  $host yum-complete-transaction --cleanup-only
                #ssh  $host yum history redo last
                ssh  $host yum install -y -q yum-plugin-fastestmirror
                ssh  $host yum install -y -q git curl bind-utils yum-utils device-mapper-persistent-data lvm2
        }
        done

        #Workers
        for host in $Workers; do
        {
            echo "Executando no node $host"
                ssh $host yum -y -q clean all
                #ssh $host yum-complete-transaction --cleanup-only
                #ssh $host yum -y -q history redo last
                ssh $host yum -y -q install yum-plugin-fastestmirror
                ssh $host yum -y -q install git curl bind-utils yum-utils device-mapper-persistent-data lvm2
            }
        done

}