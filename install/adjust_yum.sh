#!/bin/bash

 adjust_yum ()
 {

  param1=("${!1}")
  param2=("${!2}")

exit()


    #MASTERS
        for host in $param1; do
        {
            echo "Executando no node $host"
                $YUM clean all
                $YUM install yum-plugin-fastestmirror
                $YUM install git curl bind-utils yum-utils device-mapper-persistent-data lvm2
        }
        done

        #Workers
        for host in $param2; do
        {
            echo "Executando no node $host"
                $SSH $host  clean all
                $SSH $host install yum-plugin-fastestmirror
                $SSH $host $YUM install git curl bind-utils yum-utils device-mapper-persistent-data lvm2
            }
        done

}