-- Carga de datos Categorías
 /* INSERT INTO categorias()
VALUES (DEFAULT, "Hoteles",
"Establecimiento  capaz de alojar con comodidad a huéspedes o viajeros. Lugar perfecto para turistas",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Hoteles.jpg"),
(DEFAULT, "Apartamentos", "Espacios amplios que pueden albergar varias personas, todas las comodidades",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Departamentos.jpg"),
(DEFAULT, "Cabañas", "Espacios acogedores en contacto con la naturaleza",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Caba%C3%B1as.jpg"),
(DEFAULT, "Resorts", "Lo más parecido al paraiso, perfectos para relajarse",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Resort.jpg"),
(DEFAULT, "Villas", "Espacios amplios con arquitectura de barrios antiguos",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Villas.jpg"),
(DEFAULT, "Chalets", "Alojamiento en lugares de dificil acceso, como altas montañas o parajes nevados",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Chalet.jpg"); */

/* INSERT INTO ubicaciones()
VALUES
(DEFAULT, "Madrid", "España", "Europa"),
(DEFAULT, "Roma", "Italia", "Europa"),
(DEFAULT, "Miami", "Estados Unidos", "América"),
(DEFAULT, "Sao Paulo", "Brasil", "América"),
(DEFAULT, "Tokio", "Japón", "Asia"),
(DEFAULT, "Maule", "Chile", "America"); */

/* INSERT INTO productos()
VALUES 
(DEFAULT, "Exe International Palace", "Esta parte de Roma es su favorita",
"Un hermoso edificio del siglo XIX situado frente al Teatro de la Ópera de Roma",
649.99,1,2,1),
(DEFAULT, "The Westin Palace", "Hotel con una hermoza cupula de cristal",
"El Westin Palace tiene sus instalaciones a sólo  metros del Museo del Prado y del Reina Sofía",
1690,1,1,1),
(DEFAULT, "Riu Plaza", "Hospedate en Riu Plaza",
"El establecimiento Riu Plaza España esta muy bien situado en el centro de Madrid",
1500.00, 1, 1, 1),
(DEFAULT, "Livia Valeria Palace", "Grandiosa estadía cercana al coliceo",
"Este apartamento, situado a unos 350 metros del Coliseo, ofrece alojamiento con balcón",
753.99, 2, 2, 1),
(DEFAULT, "Oasis Garden", "Un lugar silencioso y natural ",
"Oasis Garden en Miami, el alojamiento cuenta con terraza y espectaculares vistas",
530.50, 3, 3, 0),
(DEFAULT, "Novotel Sao Paulo Morumbi", "La búsqueda del hotel para familias ideal",
"Está cerca de la mayoría de los puntos de referencia de Sao Paulo, tiene bajada a playa",
1233.50, 4, 4, 1),
(DEFAULT, "Shinjuku", "Zona residencial Tranquila y con gran aspecto cultural de Japón",
"Casa cómoda y familiar, los niños osn bienvenidos. Cuenta con balcon con vista a la capital",
599.99, 5, 5, 1),
(DEFAULT, "NITRA-CAVIAHUE", "Hermoso hotel en la cordillera montañosa",
"Hotel situado en la cordillera de los andes, nevado casi todo el año",
6699.99, 6, 6, 1);*/

/*INSERT INTO caracteristicas()
VALUES
(DEFAULT, "Aire-acondicionado"),(DEFAULT, "Apto-mascotas"),
(DEFAULT, "Calefacción"),(DEFAULT, "Bodega"),(DEFAULT, "Cocina"),
(DEFAULT, "Estacionamiento"),(DEFAULT, "Gimnasio"),(DEFAULT, "Televisor"),
(DEFAULT, "Pileta"),(DEFAULT, "Wifi");*/

/*INSERT INTO productos_caracteristicas()
VALUES 
-- prod 1
(1,1),(1,2),(1,4),(1,6),(1,7),(1,8),(1,9),
-- prod 2
(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,9),(2,10),
-- prod 3
(3,1),(3,3),(3,4),(3,6),(3,8),(3,10),
-- prod 4
(4,3),(4,4),(4,6),(4,7),(4,8),(4,9),(4,10),
-- prod 5
(5,1),(5,2),(5,4),(5,7),(5,9),(5,10),
-- prod 6
(6,2),(6,3),(6,5),(6,6),(6,7),(6,8),
-- prod 7
(7,2),(7,3),(7,4),(7,5),(7,6),(7,9),(7,10),
-- prod 8
(8,1),(8,2),(8,5),(8,6),(8,9),(8,10);*/

/*INSERT INTO politicas()
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
; */

/*INSERT INTO productos_politicas()
VALUES
-- prod x
(1, 1),(1, 4),(1, 5),(1, 7),(1, 8),(1, 9),(1, 11),
-- prod x
(2, 2),(2, 4),(2, 5),(2, 7),(2, 8),(2, 9),(2, 11),
-- prod x
(3, 1),(3, 3),(3, 5),(3, 7),(3, 8),(3, 9),(3, 11),
-- prod x
(4, 1),(4, 4),(4, 5),(4, 7),(4, 8),(4, 9),(4, 11),
-- prod x
(5, 2),(5, 3),(5, 5),(5, 7),(5, 8),(5, 9),(5, 11),
-- prod x
(6, 1),(6, 4),(6, 5),(6, 7),(6, 8),(6, 9),(6, 11),
-- prod x
(7, 2),(7, 3),(7, 5),(7, 7),(7, 8),(7, 9),(7, 11),
-- prod x
(8, 1),(8, 4),(8, 5),(8, 7),(8, 8),(8, 9),(8, 11);*/


/*Ingreso imagenes de cada hotel*/
-- Imagenes prod 1
INSERT INTO imagenes()
VALUES
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-1/frente1.jpg", 1),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-1/frente2.jpg", 1),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-1/vista1.jpg", 1),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-1/vista2.jpg", 1),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-1/sala1.jpg", 1),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-1/sala2.jpg", 1),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-1/habitacion1.jpg", 1),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-1/habitacion2.jpg", 1);
-- Imagenes prod 2
INSERT INTO imagenes()
VALUES
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/frente1.jpg", 2),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/frente2.jpg", 2),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/vista1.jpg", 2),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/vista2.jpg", 2),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/sala1.jpg", 2),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/sala2.jpg", 2),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/habitacion1.jpg", 2),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/habitacion2.jpg", 2);
-- Imagenes prod 3
INSERT INTO imagenes()
VALUES
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/frente1.jpg", 3),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/frente2.jpg", 3),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/vista1.jpg", 3),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/vista2.jpg", 3),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/sala1.jpg", 3),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/sala2.jpg", 3),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/habitacion1.jpg", 3),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/habitacion2.jpg", 3);
-- Imagenes prod 4
INSERT INTO imagenes()
VALUES
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/frente1.jpg", 4),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/frente2.jpg", 4),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/vista1.jpg", 4),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/vista2.jpg", 4),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/sala1.jpg", 4),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/sala2.jpg", 4),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/habitacion1.jpg", 4),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/habitacion2.jpg", 4);
-- Imagenes prod 5
INSERT INTO imagenes()
VALUES
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/frente1.jpg", 5),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/frente2.jpg", 5),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/vista1.jpg", 5),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/vista2.jpg", 5),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/sala1.jpg", 5),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/sala2.jpg", 5),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/habitacion1.jpg", 5),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/habitacion2.jpg", 5);
-- Imagenes prod 6
INSERT INTO imagenes()
VALUES
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/frente1.jpg", 6),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/frente2.jpg", 6),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/vista1.jpg", 6),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/vista2.jpg", 6),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/sala1.jpg", 6),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/sala2.jpg", 6),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/habitacion1.jpg", 6),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/habitacion2.jpg", 6);
-- Imagenes prod 7
INSERT INTO imagenes()
VALUES
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/frente1.jpg", 7),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/frente2.jpg", 7),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/vista1.jpg", 7),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/vista2.jpg", 7),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/sala1.jpg", 7),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/sala2.jpg", 7),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/habitacion1.jpg", 7),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/habitacion2.jpg", 7);
-- Imagenes prod 8
INSERT INTO imagenes()
VALUES
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/frente1.jpg", 8),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/frente2.jpg", 8),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/vista1.jpg", 8),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/vista2.jpg", 8),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/sala1.jpg", 8),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/sala2.jpg", 8),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/habitacion1.jpg", 8),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/habitacion2.jpg", 8);