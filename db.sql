CREATE DATABASE techzone
use techzone

create table if not exists proveedores(
id SERIAL primary KEY,
nombre varchar(20),
apellidos varchar(40),
email varchar(80),
telefono varchar(15)
);

drop table proveedores 

create table if not exists vendedores(
id SERIAL primary KEY,
nombre varchar(20),
apellidos varchar(40),
email varchar(80),
telefono varchar(15),
fecha_contratacion DATE
);

create table if not exists clientes(
id SERIAL primary KEY,
nombre varchar(20),
apellidos varchar(40),
email varchar(80),
telefono varchar(15),
fecha_nacimiento DATE
);

create table if not exists categorias(
id SERIAL primary key,
nombre varchar(20)
);

CREATE TABLE IF NOT EXISTS productos (
id SERIAL PRIMARY KEY,
nombre VARCHAR(40),
categoria_id INT,
FOREIGN KEY (categoria_id) REFERENCES categorias(id),
precio DECIMAL(10,2),
stock_disponible INT
);


CREATE TABLE IF NOT EXISTS ProductosProveedores (
    proveedor_id INT,
    producto_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    PRIMARY KEY (proveedor_id, producto_id)
);

CREATE TABLE IF NOT EXISTS ventas (
	id SERIAL primary key,
	cantidad int,	
	cliente_id int,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id),
	vendedor_id int,
	FOREIGN KEY (vendedor_id) REFERENCES vendedores(id),
	fecha DATE
);
drop  table ventas

create table if not exists ventasProductos(
venta_id int,
producto_id int,
foreign key (venta_id) references ventas(id),
foreign key (producto_id) references productos(id),
primary key (venta_id,producto_id)
);
