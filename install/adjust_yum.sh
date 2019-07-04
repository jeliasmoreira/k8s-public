#!/bin/bash

 adjust_yum ()
 {

echo $1
echo $2

exit()


    MASTERS
        for host in $1; do
        {
            echo "Executando no node $host"
                $YUM clean all
                $YUM install yum-plugin-fastestmirror
                $YUM install git curl bind-utils yum-utils device-mapper-persistent-data lvm2
        }
        done

        #Workers
        for host in $2; do
        {
            echo "Executando no node $host"
                $SSH $host  clean all
                $SSH $host install yum-plugin-fastestmirror
                $SSH $host $YUM install git curl bind-utils yum-utils device-mapper-persistent-data lvm2
            }
        done

}