#!/bin/bash

 install_docker()

 {
    #MASTERS
        for host in $1; do
        {
            rpm -qa| grep -i docker >> /dev/null

            if [ $? != 0 ];
            then  {
                echo "Executando no node $i"
                $CURL -fsSL https://get.docker.com | bash
                    $SYSTEMCTL enable docker
                    $SYSTEMCTL start docker
                } else  {
                echo "Docker ja instalado em $i"
                    $SYSTEMCTL enable docker
                    $SYSTEMCTL start docker
            } fi

        }
        done

        #Workers
        for host in $2; do
        {
            rpm -qa| grep -i docker >> /dev/null

            if [ $? != 0 ]; 
            then {
                echo "Executando no node $host"
                $SSH $host $CURL -fsSL https://get.docker.com | bash
                    $SSH $host $SYSTEMCTL enable docker
                    $SSH $host $SYSTEMCTL start docker
                } else {
                echo "Docker ja instalado em $host"
                    $SSH $host $SYSTEMCTL enable docker
                    $SSH $host $SYSTEMCTL start docker
            } fi

        }
        done




 }