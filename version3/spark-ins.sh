# Instalacion de Spark
wget http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
mkdir /opt/spark
tar -xzvf spark-2.1.0-bin-hadoop2.7.tgz
mv spark-2.1.0-bin-hadoop2.7/* /opt/spark/
echo 'export SPARK_HOME=/opt/spark/' >> ~/.bashrc
echo 'export PATH="/opt/spark/bin/:/opt/spark/sbin/:$PATH"' >> ~/.bashrc
source ~/.bashrc