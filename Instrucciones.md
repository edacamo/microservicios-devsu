Persona
    Implementar la clase persona con los siguientes datos: nombre, género, edad,  identificación, dirección, teléfono
    Debe manera su clave primaria (PK)  

Cliente
    Cliente debe manejar una entidad, que herede de la clase persona. 
    Un cliente tiene: clienteid, contraseña, estado. 
    El cliente debe tener una clave única. (PK) 




Aplique todas las buenas prácticas de programación (como Clean Code, Clean Architecture), patrones de diseño (ejemplo: Repository), etc. que considere necesario (se tomará en cuenta este punto para la calificación).


ms-persons
Controllers
    ClientController.java
dto
    ReponseGeneric.java
entities
    Client.java
    Person.java
exceptions
    GlobalExceptionHandler.java
    ResponseCode.java
repositories
    ClientRepository.java
services
    ClientService.java
    ClientServiceImpl.java
utils
    Helpers.java


spring:
  datasource:
    url: jdbc:postgresql://teca-pproval.ct82qi64ohu8.us-east-2.rds.amazonaws.com:5432/postgres
    username: postgres
    password: desarrollo
    driver-class-name: org.postgresql.Driver
  jpa:
    hibernate:
      ddl-auto: update
    properties:
      hibernate:
        dialect: org.hibernate.dialect.PostgreSQLDialect

spring:
  datasource:
    url: jdbc:postgresql://dpg-cmir9mv109ks739ob63g-a.oregon-postgres.render.com/vaccinationdb
    username: vaccinationdb_user
    password: 5deTgqH85mkNovouK4yLroazigl5a9V2
    driver-class-name: org.postgresql.Driver
  jpa:
    hibernate:
      ddl-auto: update
    show-sql: true
    properties:
      hibernate:
        dialect: org.hibernate.dialect.PostgreSQLDialect
        show_sql: true

DockerFile
# Etapa de construcción
FROM maven:3.8.1-openjdk-17-slim AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn package -DskipTests

# Etapa de ejecución
FROM openjdk:17-alpine

EXPOSE 9000

COPY --from=build /app/target/justification*.jar app.jar

ENTRYPOINT ["java","-jar","/app.jar"]

simon ahi el cambias el nombre no mas 
COPY --from=build /app/target/justification*.jar app.jar

en ves de justifiacion le cambias por el nombre del artifactId que este en el pom

ecuador2025


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
