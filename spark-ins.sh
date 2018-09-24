# Instalacion de Spark
wget http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
mkdir /opt/spark
tar -xzvf spark-2.1.0-bin-hadoop2.7.tgz
mv spark-2.1.0-bin-hadoop2.7/* /opt/spark/
#nano ~/.bashrc
source ~/.bashrc

# Falta aqui agregar los hosts en el archivo /etc/hosts

# Configuracion SSH de los servidores (slaves/master)
ssh-keygen
#ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.0.0.2
#ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.0.0.3
#ssh-copy-id -i ~/.ssh/id_rsa.pub root@10.0.0.4

# Configuracion de spark en los servidores (slaves/master)
cp slaves.template slaves
#nano slaves
cp spark-env.sh.template spark-env.sh
#nano spark-env.sh

#run-example SparkPi
start-all.sh
