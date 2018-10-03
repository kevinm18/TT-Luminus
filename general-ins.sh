#!/bin/bash

# Ejecuta los scripts de instalación en el nodo maestro.
#./java-ins.sh
#./scala-ins.sh
#./openssh-ins.sh
#./spark-ins.sh

# Captura la informacion de los nodos de la red
echo 'Introduzca el nombre del primer nodo:'
read nodo1

echo 'Introduzca la ip del primer nodo:'
read host1

# echo 'Introduzca el password de administrador del primer nodo'
# read pass1

# echo 'introduzca el nombre del segundo nodo:'
# read nodo2 >> nodos

# echo 'introduzca la ip del segundo nodo:'
# read host2

# echo 'Introduzca el password de administrador del primer nodo'
# read pass2

# echo 'introduzca el nombre del tercer nodo:'
# read nodo3

# echo 'introduzca la ip del tercer nodo:'
# read host3

# echo 'Introduzca el password de administrador del primer nodo'
# read pass3

# Escribe en un archivo la informacion de los nodos capturada previamente
echo $nodo1 > nodos.txt
echo $host1 >> nodos.txt
echo $pass1 >> nodos.txt

# echo $nodo2 >> nodos.txt
# echo $host2 >> nodos.txt
# echo $pass2 >> nodos.txt

# echo $nodo3 >> nodos.txt
# echo $host3 >> nodos.txt
# echo $pass3 >> nodos.txt

# Copia los archivos de instalacion a cada nodo a la carpeta luminus
scp java-ins.sh root@$host1:/home/$nodo1
scp openssh-ins.sh root@$host1:/home/$nodo1
scp scala-ins.sh root@$host1:/home/$nodo1
scp spark-ins.sh root@$host1:/home/$nodo1

# scp java-ins.sh root@$host2:/home/nodo
# scp openssh-ins.sh root@$host2:/home/nodo
# scp scala-ins.sh root@$host2:/home/nodo
# scp spark-ins.sh root@$host2:/home/nodov

# scp java-ins.sh root@$host3:/home/nodo
# scp openssh-ins.sh root@$host3:/home/nodo
# scp scala-ins.sh root@$host3:/home/nodo
# scp spark-ins.sh root@$host3:/home/nodo

# Mueve los archivos copiados a una nueva carpeta
ssh root@$host1 rm -rf /home/$nodo1/luminus
ssh root@$host1 mkdir /home/$nodo1/luminus
ssh root@$host1 mv /home/$nodo1/java-ins.sh /home/$nodo1/luminus
ssh root@$host1 mv /home/$nodo1/openssh-ins.sh /home/$nodo1/luminus
ssh root@$host1 mv /home/$nodo1/scala-ins.sh /home/$nodo1/luminus
ssh root@$host1 mv /home/$nodo1/spark-ins.sh /home/$nodo1/luminus

# Ejecuta los instaladores


ssh root@nodo -t "/home/nodo/luminus/java-ins.sh; --login"
ssh root@nodo -t "/home/nodo/luminus/openssh-ins.sh; --login"
ssh root@nodo -t "/home/nodo/luminus/scala-ins.sh; --login"
ssh root@nodo -t "/home/nodo/luminus/spark-ins.sh; --login"