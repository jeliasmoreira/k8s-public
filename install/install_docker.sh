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
                echo "Executando no node $host"
                $CURL -fsSL https://get.docker.com | bash
                    $SYSTEMCTL enable docker
                    $SYSTEMCTL start docker
                } else  {
                echo "Docker ja instalado em $host"
                    $SYSTEMCTL enable docker
                    $SYSTEMCTL start docker
            } fi

        }
        done

        #Workers
        for host in $Workers; do
        {
            ssh $host rpm -qa| grep -i docker-ce >> /dev/null

            if [ $? != 0 ]; 
            then {
                echo "Executando no node $host"
                ssh $host $CURL -fsSL https://get.docker.com | bash
                    ssh $host $SYSTEMCTL enable docker
                    ssh $host $SYSTEMCTL start docker
                } else {
                echo "Docker ja instalado em $host"
                    ssh $host $SYSTEMCTL enable docker
                    ssh $host $SYSTEMCTL start docker
            } fi

        }
        done




 }