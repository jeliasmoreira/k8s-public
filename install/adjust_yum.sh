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
                yum install -y yum-plugin-fastestmirror
                yum install -y git curl bind-utils yum-utils device-mapper-persistent-data lvm2
        }
        done

        #Workers
        for host in $Workers; do
        {
            echo "Executando no node $host"
                ssh $host yum -y clean all
                ssh $host yum-complete-transaction --cleanup-only
                ssh $host yum history redo last
                ssh $host yum -y install yum-plugin-fastestmirror
                ssh $host yum -y install git curl bind-utils yum-utils device-mapper-persistent-data lvm2
            }
        done

}