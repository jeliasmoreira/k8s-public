# k8s-public

Repositório público para compartilhamento de scripts relacionados a kubernetes, o S.O em questão é por padrão o CentOS 7.x.

A arquitetura inicial é um cluster composto por três nodos, um master e dois workers, conectados localmente e com autenticação via chaves SSH com usuario root. 

**A seguir, o diagrama do cluster**

![alt text](https://github.com/jeliasmoreira/k8s-public/blob/master/arquiteturaClusterK8sLab.png)


**Existem três ações manuais** que precisam ser realizadas antes do inicio da instalação, são:

1. Configuração do arquivo /etc/host (ou DNS server) com os nomes dos nodos;

**Exemplo do hosts** 

[root@master ~]# cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

192.168.0.32   master  master.local.lab
192.168.0.33   node1   node1.local.lab
192.168.0.34   node2   node2.local.lab


2. Troca de chaves SSH entre os nodos;

Comando para geração das chaves SSH (execute em todos os nodos)
 #ssh-keygen (confirme todas as perguntas)
 
3. Desligar o swap (caso exista)
 
 Comando para desligar o swap (execute em todos os nodos) 
  #swapoff -a
  Edite o arquivo /etc/fstab e comente a linha que referencia a partição de swap
  
Quando estes preparativos estiverem feitos, clone o este repositorio. Edite o arquivo install/install.param da seguinte forma.

As variaveis MASTERS e Workers devem refletir o que foi mapeado no seu /etc/hosts (do passo 1 logo acima)
 MASTERS="192.168.0.32"
 Workers="192.168.0.33 192.168.0.34"

Após estes ajustes, execute o *sh installk8s.sh* que se encontra na raiz do repositorio clonado.

Ao final do processo, será exebida uma linha do **kubeadm** que deve ser executada no console de cada nodo worker.

**Pod network**

O pod network, aquele responsavel por implantar a rede entre os pods, já faz parte dos scripts de instalação, ele é o weave-net.

**E os próximos passos**

Mais a frente, iremos instalar o metallb e traefik. Mas por hora você já pode subir seus deployments, atribuir um nodeport e seguir com seus labs.

**AVISO!**

Seja em ambiente on-premises ou em cloud, os scripts aqui disponiveis são para estudos e não recomendados para ambiente produtivo. 

Apesar de usarem as mesmas tecnicas, itens como capacida, disponibilidade, confiabilidade e mais fortemente segurança da informação colocados nos scripts deste repositório não são adequados a produção.
