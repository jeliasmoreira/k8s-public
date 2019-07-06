#!/bin/bash

            rpm -qa| grep -i docker-ce >> /dev/null

            if [ $? != 0 ];
            then  {
                echo "Executando no node $(hostname -i)"
                curl -fsSL https://get.docker.com | bash
                    systemctl enable docker
                    systemctl start docker
                } else  {
                echo "Docker ja instalado em $(hostname -i)"
                    systemctl enable docker
                    systemctl start docker
            } fi