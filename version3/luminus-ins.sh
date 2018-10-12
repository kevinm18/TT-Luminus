#!/bin/bash
# Instalador general de luminus version 3.

# El instalador pide al usuario introducir las ips de los nodos incluida la del master.
# Las ips son almacenadas en un archivo de texto.

echo "*************** Bienvenido a Luminus ***************"

echo "Introduce la ip del nodo maestro:"
read ipMaestro
echo $ipMaestro > nodos.txt
confirmacion=1
contador=1
while [ $confirmacion -eq 1 ]
do
	echo "Introduce la ip del nodo $contador:"
	read ipNodo
	counterPing=0
	ping -c1 -qq $ipNodo
	if [ $? -ne 0 ]
	then
		echo "Host no encontrado."
	else
		echo "Host encontrado!"
		contador=$((contador + 1))
		echo $ipNodo >> nodos.txt
	fi
	echo "Si desea agregar otro nodo escriba 1. Si no, escriba 0. (1/0)"
	read confirmacion
done

# Instalacion de Java en cada nodo.
contador=1
while read line
do
	if [ $contador -eq 1 ]
	then
		echo "Instalando Java en nodo maestro $line..."
		apt-get -qq -y update
		add-apt-repository ppa:webupd8team/java
		apt-get -qq --force-yes install oracle-java8-installer
		apt-get -qq --force-yes install openjdk-8-jdk openjdk-8-jre
	else
		echo "Instalando Java en nodo $line..."
		ssh root@$line "add-apt-repository ppa:webupd8team/java"
		ssh root@$line -tt "apt-get -qq -y install oracle-java8-installer"
		ssh root@$line "apt-get -qq update"
		ssh root@$line "apt-get -q -y install openjdk-8-jdk openjdk-8-jre"

	fi
	contador=$((contador + 1))
done < nodos.txt