#Pasos para crear un cluster de contenedores de docker. (?)
contador=0
while read line; do   
	if [ line != '' ]
	then
		contador=$[contador + 1]
		if [ $contador -eq 1 ]
		then
			docker swarm leave --force
			docker swarm init --advertise-addr $line
			token="$(docker swarm join-token -q worker) $line:2377"
			continue
		fi
		modulo=$[contador % 2]
		if [ $modulo -ne 0 ]
		then
			ssh root@$line -n "docker swarm leave"
			ssh root@$line -n "docker swarm join --token $token"
		fi
	fi
done < nodos.txt