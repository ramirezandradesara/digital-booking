DROP DATABASE IF EXISTS digitalBooking;
CREATE DATABASE digitalBooking;
USE digitalBooking;

CREATE TABLE categorias (
id INT AUTO_INCREMENT,
titulo VARCHAR(250) NOT NULL,
descripcion TEXT (1000) NOT NULL,
urlImagen VARCHAR(250) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE ubicaciones (
id INT AUTO_INCREMENT NOT NULL,
ciudad VARCHAR (250),
pais VARCHAR (250),
continente VARCHAR (250),
PRIMARY KEY (id)
);

CREATE TABLE productos (
id INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(250) NOT NULL,
titulo VARCHAR(250) NOT NULL,
descripcion TEXT (1000) NOT NULL,
precio DOUBLE NOT NULL,
categoria INT NOT NULL,
ciudad INT NOT NULL,
disponible BOOL NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (categoria) REFERENCES categorias (id),
FOREIGN KEY (ciudad) REFERENCES ubicaciones (id)
);

CREATE TABLE caracteristicas (
id INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR (100) NOT NULL,
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
titulo VARCHAR (250) NOT NULL,
descripcion TEXT (2000) NULL,
PRIMARY KEY (id)
);

CREATE TABLE productos_politicas(
id_producto INT NOT NULL,
id_politica INT NOT NULL,
PRIMARY KEY (id_producto, id_politica),
FOREIGN KEY (id_producto) REFERENCES productos(id),
FOREIGN KEY (id_politica) REFERENCES politicas(id)
);


/*
-- Ejemplos insert para cada tabla
INSERT INTO categorias()
VALUES (DEFAULT, "Hoteles", "Establecimiento  capaz de alojar con comodidad a huéspedes o viajeros. Lugar perfecto para turistas", "url.de.ejemplo");

INSERT INTO ubicaciones()
VALUES (DEFAULT, "Madrid", "España", "Europa");

INSERT INTO productos()
VALUES (DEFAULT, "Riu Plaza", "Hospedate en Riu Plaza", "El establecimiento Riu Plaza España esta muy bien situado en el centro de Madrid", 22999.99, 1, 1, 1);

INSERT INTO caracteristicas()
VALUES
(DEFAULT, "Aire-acondicionado"),
(DEFAULT, "Apto-mascotas"),
(DEFAULT, "Calefacción"),
(DEFAULT, "Bodeja"),
(DEFAULT, "cocina"),
(DEFAULT, "estacionamiento"),
(DEFAULT, "Gimnasio"),
(DEFAULT, "Televisor"),
(DEFAULT, "Pileta"),
(DEFAULT, "Wifi");

-- Insert en tabla intermedia: Primer valor id producto, segundo id caracteristica
INSERT INTO productos_caracteristicas()
VALUES 
(1, 1),
(1, 2),
(1, 4),
(1, 6),
(1, 7),
(1, 9);

INSERT INTO imagenes()
VALUES (DEFAULT, "Hotel 1 frente", "url.de.ejemplo", 1);

INSERT INTO politicas()
VALUES
(DEFAULT, "fumar", "Se permite fumar en habitaciones asignadas"),
(DEFAULT, "nofumar", "No se permite fumar"),
(DEFAULT, "checkIn", "10:00"),
(DEFAULT, "checkIn", "09:00"),
(DEFAULT, "fiestas", "No se permiten fiestas"),
(DEFAULT, "fiestas", "Se permiten fiestas solo en SUMs"),
(DEFAULT, "covid", "Se tienen en cuenta todas las medidas de salud dispuestas por el ministerio de salud de este pais"),
(DEFAULT, "humo", "Habitaciones con detector de humo y sistemas anti incendios"),
(DEFAULT, "cajaDeSeguridad", "Cajas de seguridad en habitaciones asignadas"),
(DEFAULT, "noCajaDeSeguridad", "Las habitaciones NO cuentan con cajas de seguridad"),
(DEFAULT, "cancelacion1", "La cancelacion es sin costo con un aviso anticipado de 7 días como minimo, si esto no se cumple tiene un costo de $1500"),
(DEFAULT, "cancelacion2", "La cancelacion será siempre del 50% del valor de la reserva, sin importar los días de previo aviso.")
;

-- Insert tabla intermedia: primero id productos- segundo id politica
INSERT INTO productos_politicas()
VALUES
(1, 1),
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(1, 9),
(1, 11);
*/