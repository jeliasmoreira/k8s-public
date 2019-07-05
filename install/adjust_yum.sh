#!/bin/bash

#Includes
        source ./install/install.param


 adjust_yum ()
 {
    #MASTERS
        for host in $MASTERS; do
        {
            echo "Executando no node $host"
                yum-complete-transaction --cleanup-only
                yum history redo last
                yum clean all
                yum install yum-plugin-fastestmirror
                yum install git curl bind-utils yum-utils device-mapper-persistent-data lvm2
        }
        done

        #Workers
        for host in $Workers; do
        {
            echo "Executando no node $host"
                ssh $host  clean all
                ssh $host install yum-plugin-fastestmirror
                ssh $host yum install git curl bind-utils yum-utils device-mapper-persistent-data lvm2
            }
        done

}