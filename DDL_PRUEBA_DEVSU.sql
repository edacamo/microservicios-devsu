/*Creacion de la base de datos*/
CREATE DATABASE db_prueba_devsupersonas
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

/*Creacion tabla Persona*/
CREATE TABLE persona (
	 id SERIAL PRIMARY KEY,
	 nombre VARCHAR(100) NOT NULL,
	 genero VARCHAR(10),
	 edad INTEGER,
	 identificacion VARCHAR(13) UNIQUE NOT NULL,
	 direccion VARCHAR(255),
	 telefono VARCHAR(20)
);

/*Creacion tabla Cliente*/
CREATE TABLE cliente (
	 id SERIAL PRIMARY KEY,
	 cliente_id VARCHAR(50) UNIQUE NOT NULL,
	 contrasenia VARCHAR(255) NOT NULL,
	 estado BOOLEAN,
	 persona_id INTEGER,
	 CONSTRAINT fk_cliente_persona FOREIGN KEY (persona_id) REFERENCES persona (id)
);

/*Creacion tabla Cuentas*/
CREATE TABLE cuenta (
	id SERIAL PRIMARY KEY,
	numero_cuenta VARCHAR(50) UNIQUE NOT NULL,
	tipo_cuenta VARCHAR(50),
	saldo_inicial NUMERIC,
	estado BOOLEAN,
	cliente_id INTEGER,
	CONSTRAINT fk_cuenta_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id)
);

/*Creacion tabla Movimientos*/
CREATE TABLE movimiento (
	id SERIAL PRIMARY KEY,
	fecha TIMESTAMP,
	tipo_movimiento VARCHAR(50),
	valor NUMERIC,
	saldo NUMERIC,
	cuenta_id INTEGER,
	CONSTRAINT fk_movimiento_cuenta FOREIGN KEY (cuenta_id) REFERENCES cuenta (id)
);

/*SELECTS*/
select * from persona;
select * from cliente;
select * from cuenta;
select * from movimiento;