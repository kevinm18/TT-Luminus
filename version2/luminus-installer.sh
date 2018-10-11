#!/bin/bash

# Ejecuta los scripts de instalación en el nodo maestro.
#./java-ins.sh
#./scala-ins.sh
#./openssh-ins.sh
#./spark-ins.sh

# Inicializacion de variables.
siguienteNodo='S'
echo '' > nodos.txt

# Ciclo para configurar n nodos.
while [ $siguienteNodo='S' ]
do
	# Lee el nombre del nodo.
	echo 'Introduzca el nombre del primer nodo:'
	read nodo

	# Lee la ip del nodo.
	echo 'Introduzca la ip del primer nodo:'
	read host

	# Guarda la informacion del nodo en un archivo.
	echo $nodo >> nodos.txt
	echo $host >> nodos.txt

	# Modificacion del archivo /etc/hosts
	echo '$host $nodo $nodo' >> /etc/hosts

	# Crea el directorio luminus en el nodo.
	ssh root@$host -t "rm -rf /home/$nodo/luminus"
	ssh root@$host -t "mkdir /home/$nodo/luminus"

	# Copia los instaladores a la carpeta luminus
	scp java-ins.sh root@$host:/home/$nodo/luminus
	scp openssh-ins.sh root@$host:/home/$nodo/luminus
	scp scala-ins.sh root@$host:/home/$nodo/luminus
	scp docker.sh root@$host:/home/$nodo/luminus

	# Ejecuta remotamente cada instalador.
	# ssh root@$host -t "/home/$nodo/luminus/java-ins.sh"
	# ssh root@$host -t "/home/$nodo/luminus/openssh-ins.sh"
	# ssh root@$host -t "/home/$nodo/luminus/scala-ins.sh"
	# ssh root@$host -t "/home/$nodo/luminus/spark-ins.sh"
	# ssh root@$host -t "/home/$nodo/luminus/docker.sh"

	# Pregunta si hay otro nodo a instalar
	python modificaBashRC.py
	echo 'Desea configurar otro nodo?'
	echo 'S/N:'
	read confirmacion
	$siguienteNodo=$confirmacion
done

# Configuracion de Spark en el nodo maestro.

# Configuracion de spark en los servidores (slaves/master)
cp slaves.template slaves
#nano slaves
cp spark-env.sh.template spark-env.sh
#nano spark-env.sh

#run-example SparkPi
start-all.sh
