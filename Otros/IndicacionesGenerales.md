---Requisitos


----Para descargar Kafka desde docker
cd /Usuarios/ecarchipulla/Documents (ruta propia)
  docker-compose -f docker-compose-kafka.yml up -d
  docker-compose -f docker-compose-kafka.yml down

----Para ver logs de los contenedores en vivo
  docker logs -f kafka
  docker logs -f zookeeper

----Script: kafka-status.sh (automonitoreo básico)
  1.- Dale permisos de ejecución:
    chmod +x kafka-status.sh

  2.-Ejecutalo cada vez que quieras ver el estado:
    ./kafka-status.sh


----Ejecutar el docker-compose-devsu para generar las imagenes de lo microservicios de kafka
  docker-compose -f docker-compose-devsu.yml up --build

---Para ver logs de cada micro
  docker logs -f ms-persons
  docker logs -f ms-accounts

---Para ver las ultimas linas del log
  docker logs --tail=100 ms-persons

---Casa practico para ver las ultimas lineas del log en tiempo real
  docker logs -f --tail=100 -t ms-persons


---Para guardar los logs en un archivo
  docker logs ms-persons > logs-ms-persons.txt