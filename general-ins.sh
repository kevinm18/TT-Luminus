# Habilita la ejecución de los demás shell scripts.
chmod a+rx java-ins.sh
chmod a+rx scala-ins.sh
chmod a+rx openssh-ins.sh
chmod a+rx spark-ins.sh

# Ejecuta los scripts de instalación.
./java-ins.sh
./scala-ins.sh
./openssh-ins.sh
#./spark-ins.sh