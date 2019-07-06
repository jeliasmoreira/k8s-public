#!/bin/bash

#Includes
        source ./install/install.param


 install_docker()

 {
    #MASTERS
        for host in $MASTERS; do
        {
            rpm -qa| grep -i docker-ce >> /dev/null

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
        for host in $Workers; do
        {
            $SSH $host rpm -qa| grep -i docker-ce >> /dev/null

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