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