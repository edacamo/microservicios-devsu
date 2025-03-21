--INDICACIONES GENERALES
  El proyecto compilado y probado en un sistema Operativo Mac os con JDK 17.

---REQUISITOS
    1. Descargar e instalar Docker Desktop (Mac/Windows)
    2. Instalar JDK 17
    3. Microservicios creados con la version 3.4.3 de Spring Boot
    4. Instalar y configurar Maven

---CLONAR REPOSITORIOS
  1.-https://github.com/edacamo/ms-persons.git
  2.-https://github.com/edacamo/ms-accounts.git

  
---PRUEBAS UNITARIAS E INTEGRALES
--Para ver la prueba unitaria, se agrego en ms-persons
    Ubicarse en el proyecto descargado y ejecutar "mvn clean install"
  
--Para ver la prueba integral, en el microservicio ms-accounts
    1.- Abrir el proyecto y ubicarse en el package com.edacamo.msaccounts.infrastructure.config
    2.- Modificar la clase "KafkaConsumerConfig.java", en la linea 26 cambiar de "kafka:9092" a "localhost:9092"
    3.- Por ultimo  ejecutar "mvn clean install" 

---EJECUTAR DOCKER-COMPOSE PARA DESPLEGAR LOS CONTENEDORES EN DOCKER  
Antes de ejecutar el docker-compose la clase de "ms-accounts" com.edacamo.msaccounts.infrastructure.config revertir el cambio "localhost:9092" a "kafka:9092"

Ejecutar el docker-compose-devsu.yml. Esto genera las imagenes de los microservicios, ademas se agrega kafka y zookeeper, para la comunicacion entre microservicios.
  docker-compose -f docker-compose-devsu.yml up --build

---LOGS EN CONTENEDORES
  docker logs -f kafka
  docker logs -f zookeeper
  docker logs -f ms-persons
  docker logs -f ms-accounts

----PRUEBA DE API REST
  Importar a POSTMAN: PRUEBA-DEVSU.postman_collection.json