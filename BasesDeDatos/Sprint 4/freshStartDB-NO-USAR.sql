DROP DATABASE IF EXISTS digitalbooking;
CREATE DATABASE digitalbooking;
USE digitalbooking;

CREATE TABLE categorias (
id INT AUTO_INCREMENT,
titulo VARCHAR(250) NOT NULL,
descripcion TEXT (1000) NOT NULL,
urlImagen VARCHAR(250) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE ubicaciones (
id INT AUTO_INCREMENT NOT NULL,
ciudad VARCHAR (250) NOT NULL,
pais VARCHAR (250) NOT NULL,
continente VARCHAR (250) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE productos (
id INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(250) NOT NULL,
titulo VARCHAR(250) NOT NULL,
descripcion TEXT (1000) NOT NULL,
precio DOUBLE NOT NULL,
categoria INT NOT NULL,
ubicacion INT NOT NULL,
disponible BOOL NOT NULL,
latitud DOUBLE NOT NULL,
longitud DOUBLE NOT NULL,
direccion VARCHAR (250) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (categoria) REFERENCES categorias (id),
FOREIGN KEY (ubicacion) REFERENCES ubicaciones (id)
);

CREATE TABLE caracteristicas (
id INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR (100) NOT NULL,
icono VARCHAR (250) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE productos_caracteristicas(
id_producto INT NOT NULL,
id_caracteristica INT NOT NULL,
PRIMARY KEY (id_producto, id_caracteristica),
FOREIGN KEY (id_producto) REFERENCES productos(id),
FOREIGN KEY (id_caracteristica) REFERENCES caracteristicas(id)
);



CREATE TABLE imagenes (
id INT AUTO_INCREMENT NOT NULL,
titulo VARCHAR(250) NOT NULL,
urlImg VARCHAR(250) NOT NULL,
id_producto INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_producto) REFERENCES productos(id)
);

CREATE TABLE politicas(
id INT AUTO_INCREMENT NOT NULL,
tipo VARCHAR (100) NOT NULL,
titulo VARCHAR (250) NOT NULL,
descripcion TEXT (2000) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE productos_politicas(
id_producto INT NOT NULL,
id_politica INT NOT NULL,
PRIMARY KEY (id_producto, id_politica),
FOREIGN KEY (id_producto) REFERENCES productos(id),
FOREIGN KEY (id_politica) REFERENCES politicas(id)
);

CREATE TABLE roles(
id INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(250) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE usuarios (
id INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(250) NOT NULL,
apellido VARCHAR(250) NOT NULL,
email VARCHAR(250) NOT NULL,
contraseña TEXT(1000) NOT NULL,
ciudad VARCHAR (250) NOT NULL,
rol INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (rol) REFERENCES roles(id)
);

CREATE TABLE reservas (
id INT AUTO_INCREMENT NOT NULL,
hora TIME NOT NULL,
fechaInicio DATE NOT NULL,
fechaFinal DATE NOT NULL,
id_producto INT NOT NULL,
id_usuario INT NOT NULL,
datosExtra TEXT(2000) NULL,
vacunado BOOL NOT NULL, 
PRIMARY KEY (id),
FOREIGN KEY (id_producto) REFERENCES productos(id),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE puntuaciones (
id INT AUTO_INCREMENT NOT NULL,
id_producto INT NOT NULL,
id_usuario INT NOT NULL,
valor INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_producto) REFERENCES productos(id),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);