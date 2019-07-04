#!/bin/bash

#Includes
        source ./install/install.param


 adjust_yum ()
 {
    #MASTERS
        for host in $MASTERS; do
        {
            echo "Executando no node $host"
                $YUM clean all
                $YUM install yum-plugin-fastestmirror
                $YUM install git curl bind-utils yum-utils device-mapper-persistent-data lvm2
        }
        done

        #Workers
        for host in $Workers; do
        {
            echo "Executando no node $host"
                $SSH $host  clean all
                $SSH $host install yum-plugin-fastestmirror
                $SSH $host $YUM install git curl bind-utils yum-utils device-mapper-persistent-data lvm2
            }
        done

}