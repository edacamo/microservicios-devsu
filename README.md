# INSTRUCCIONES DE CONFIGURACIÓN Y EJECUCIÓN

## INDICACIONES GENERALES
El proyecto ha sido compilado y probado en un sistema operativo macOS con JDK 17.
### La base datos que se usa es PostgreSQL, una imagen de RENDER.

## REQUISITOS
1. Descargar e instalar Docker Desktop (para Mac/Windows).
2. Instalar JDK 17.
3. Microservicios creados con Spring Boot versión 3.4.3.
4. Instalar y configurar Maven.

## CLONAR REPOSITORIOS
```bash
git clone https://github.com/edacamo/ms-persons.git
git clone https://github.com/edacamo/ms-accounts.git
git clone https://github.com/edacamo/microservicios-devsu-docs.git
```

#### Del repositorio "microservicios-devsu-docs.git", considerar los siguientes archivos.
1. BaseDatos.sql
2. docker-compose-devsu.yml
3. PRUEBA-DEVSU.postman_collection.json
4. CredencialesBaseDatos.txt: Para revisar la información de la Base Datos.
5. Carpeta -> Capturas.

## PRUEBAS UNITARIAS E INTEGRALES

## Para revisar la prueba unitaria (en `ms-persons`):
```bash
cd ms-persons
mvn clean install
```

##  Para revisarla prueba integral (en `ms-accounts`):
```bash
cd ms-accounts
```

### Modificar la línea 26 de "kafka:9092" a "localhost:9092" en la clase KafkaConsumerConfig.java
### Después, ejecutar el siguiente comando:
```bash
mvn clean install
```

## EJECUTAR DOCKER-COMPOSE PARA DESPLEGAR LOS CONTENEDORES EN DOCKER

Antes de ejecutar `docker-compose`, revertir el cambio de "localhost:9092" a "kafka:9092" en la clase KafkaConsumerConfig.java de `ms-accounts`.
 Luego, ejecutar el siguiente comando para construir y desplegar los contenedores:
```bash
docker-compose -f docker-compose-devsu.yml up --build
```

## LOGS EN CONTENEDORES
### Para monitorear los logs de los contenedores, ejecutar los siguientes comandos:
```bash
docker logs -f kafka
docker logs -f zookeeper
docker logs -f ms-persons
docker logs -f ms-accounts
```

## PRUEBA DE API REST
### Importar la colección de pruebas a POSTMAN desde:
### PRUEBA-DEVSU.postman_collection.json
