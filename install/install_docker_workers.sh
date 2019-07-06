#!/bin/bash

#Includes
        source ./install/install.param


  
            rpm -qa| grep -i docker-ce >> /dev/null

            if [ $? != 0 ];
            then  {
                echo "Executando no node $(hostname -i)"
                $CURL -fsSL https://get.docker.com | bash
                    $SYSTEMCTL enable docker
                    $SYSTEMCTL start docker
                } else  {
                echo "Docker ja instalado em $(hostname -i)"
                    $SYSTEMCTL enable docker
                    $SYSTEMCTL start docker
            } fi