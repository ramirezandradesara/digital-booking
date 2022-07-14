-- Carga de datos Categorías
INSERT INTO categorias()
VALUES 
(DEFAULT, "Hotel",
"Establecimiento  capaz de alojar con comodidad a huéspedes o viajeros. Lugar perfecto para turistas",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Hoteles.jpg"),
(DEFAULT, "Apartamento", "Espacios amplios que pueden albergar varias personas, todas las comodidades",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Departamentos.jpg"),
(DEFAULT, "Cabaña", "Espacios acogedores en contacto con la naturaleza",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Caba%C3%B1as.jpg"),
(DEFAULT, "Resort", "Lo más parecido al paraiso, perfectos para relajarse",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Resort.jpg"),
(DEFAULT, "Villa", "Espacios amplios con arquitectura de barrios antiguos",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Villas.jpg"),
(DEFAULT, "Chalet", "Alojamiento en lugares de dificil acceso, como altas montañas o parajes nevados",
"https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+categorias/Chalet.jpg");

 INSERT INTO ubicaciones()
VALUES
(DEFAULT, "Madrid", "España", "Europa"),
(DEFAULT, "Roma", "Italia", "Europa"),
(DEFAULT, "Miami", "Estados Unidos", "América"),
(DEFAULT, "Sao Paulo", "Brasil", "América"),
(DEFAULT, "Tokio", "Japón", "Asia"),
(DEFAULT, "Maule", "Chile", "America"),
(DEFAULT, "Quebec", "Canadá", "America"),
(DEFAULT, "Thredbo", "Australia", "Oceanía");

INSERT INTO productos()
VALUES 
(DEFAULT, "Exe International Palace", "Esta parte de Roma es su favorita",
"Un hermoso edificio del siglo XIX situado frente al Teatro de la Ópera de Roma",
649.99,1,2,1,41.900060, 12.492290, "Via Nazionale, 46, Roma RM, Italia"),
(DEFAULT, "The Westin Palace", "Hotel con una hermoza cupula de cristal",
"El Westin Palace tiene sus instalaciones a sólo  metros del Museo del Prado y del Reina Sofía",
1690,1,1,1, 45.478593, 9.198967, "Plaza de las Cortes, 7, Madrid, España"),
(DEFAULT, "Riu Plaza", "Hospedate en Riu Plaza",
"El establecimiento Riu Plaza España esta muy bien situado en el centro de Madrid",
1500.00, 1, 1, 1, 8.980708, -79.521571, "Calle Gran Vía, 84, Madrid, España"),
(DEFAULT, "Livia Valeria Palace", "Grandiosa estadía cercana al coliceo",
"Este apartamento, situado a unos 350 metros del Coliseo, ofrece alojamiento con balcón",
753.99, 2, 2, 1, 41.867142, 12.454071, "Via Giacomo Folchi, 8, Roma RM, Italia"),
(DEFAULT, "Oasis Garden", "Un lugar silencioso y natural ",
"Oasis Garden en Miami, el alojamiento cuenta con terraza y espectaculares vistas",
530.50, 3, 3, 0, 26.107660, -80.136321, "870 Northeast 82nd Street, Miami, Estados Unidos"),
(DEFAULT, "Novotel Sao Paulo Morumbi", "La búsqueda del hotel para familias ideal",
"Está cerca de la mayoría de los puntos de referencia de Sao Paulo. Acceso a playa",
1233.50, 4, 4, 1, -23.612995, -46.703499, "Nelson Hungria, 577 - Vila Tramontano, São Paulo, Brasil"),
(DEFAULT, "Shinjuku", "Zona residencial Tranquila y con gran aspecto cultural de Japón",
"Casa cómoda y familiar, los niños osn bienvenidos. Cuenta con balcon con vista a la capital",
599.99, 5, 5, 1, 35.687749, 139.698145, "160-0022 Tokio, Shinjuku-ku Shijuku, Japón"),
(DEFAULT, "NITRA-CAVIAHUE", "Hermoso hotel en la cordillera montañosa",
"Hotel situado en la cordillera de los andes, nevado casi todo el año",
6699.99, 6, 6, 1, -37.864645, -71.052088, "Los Ñires, Caviahue, Acceso cordillera Chile-Neuquen"),
(DEFAULT, "Palazzo Delle Pietre", "Apartamentos de Lujo",
"Hermoso, lujoso y artístico. Ubicado en el casco histórico de Roma",
1209.99, 2, 2, 1,41.900432, 12.474513,"Via delle Coppelle 23, Panteón, 00186 Roma, Italia"),
(DEFAULT, "YADOYA", "Cabaña ideal para conocer la cultura japonesa",
"En el distrito Taito de Tokyo, cercano al templo Choju-in",
709, 3, 5, 1, 35.724770, 139.780802, "111-0055 Tokio, 1-2-10, Japón"),
(DEFAULT, "Shelborne South Beach", "Increíble resort a tan solo metros de la playa",
"El Shelborne South Beach está a 1,6 km del centro del emblemático distrito Art Déco de Miami ",
1746, 4, 3, 1, 25.793930, -80.129076, "1801 Collins Avenue, Miami Beach, FL 33139, Estados Unidos"),
(DEFAULT, "Finca Valaurea", "Vivienda de uso turístico",
"La Finca Valauria es un alojamiento con vistas al jardín situado en Madrid, a 42 KM del Museo Reina Sofía",
2.678, 5, 1, 1, 40.057374, -3.509291, "Barrio de San Miguel s/n, 28380 Madrid, España"),
(DEFAULT, "Chalets Alpins 19", "Vista magnífica hacia la naturaleza",
"El Chalets Alpins- 19 Chemin Alpin está situado en Stoneham, a solo 1,9 km del Halte O Spa",
2016, 6, 7, 1, 47.036994, -71.384255, "19 Chemin Alpin, G3C 1S3 Stoneham, Canadá"),
(DEFAULT, "The Current I Sextant", "Lo mejor de Miami Beach",
"Lujoso hotel que ofrece piscina al aire libre abierta todo el año",
999.99, 1, 3, 1, 25.851714, -80.143948, "Miami Beach, FL 33141, Estados Unidos"),
(DEFAULT, "Ez Aclimação Hotel", "La mejor parte de Sao Paulo",
"Se encuentra a 1 km del parque Aclimação y el centro comercial Patio Paulista, en São Paulo",
890.33, 1, 4, 1, 23.577180, -46.636519, "Av. Armando Ferrentini, 668 , Vila Mariana, São Paulo, CEP 04103-030, Brasil"),
(DEFAULT, "Hotel Chinzanso Tokyo", "Un increíble lugar para turistas",
"El Hotel Chinzanso Tokyo está situado en un jardín japonés histórico",
1560.45, 1, 5, 1, 35.713387, 139.725859, "112-8680 Prefectura de Tokio, Bunkyo-ku, Sekiguchi 2-10-8, Japón"),
(DEFAULT, "CHILL-OUT - Thredbo", "Perfecto para vacaciones de sky",
"Ofrece alojamiento independiente con vistas a la montaña y al río.",
639.99, 6, 8, 1, -36.505853, 148.304198, "Diggings Terrace, 2625 Thredbo, Australia"),
(DEFAULT, "Residenza Contessa Costanza", "Alójate en el corazón de Roma",
"La Residenza Contessa Costanza se encuentra en Roma, a pocos pasos de la Piazza Navona",
670.00, 5, 2, 1, 41.898562, 12.472333, "Via di Santa Maria dell'Anima 49, Navona, 00186 Roma, Italia");

/*Agregar por front
(DEFAULT, "The City Life", "Una auténtica experiencia canadiense",
"El The City Life se encuentra en el centro de Quebec y ofrece un balcón con vistas increíbles",
899.99, 2, 7, 1, 46.811373, -71.231253,"20 boulevard Charest Ouest, G1K 1X2 Quebec, Canadá"),
(DEFAULT, "Funway Academic Resort", "Increíble experiencia para estudiantes",
"El Funway Academic Resort está situado en Madrid, a 900 metros del palacio de congresos de Madrid",
469.99, 4, 1, 1, 40.458767, -3.697886, "Alonso Castrillo, 22, Tetuán, 28020 Madrid, España");
*/

INSERT INTO caracteristicas()
VALUES
(DEFAULT, "Aire-acondicionado", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/iconos+caracteristicas/aire-acondicionado.png"),
(DEFAULT, "Apto-mascotas", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/iconos+caracteristicas/Apto-mascotas.png"),
(DEFAULT, "Calefacción", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/iconos+caracteristicas/Calefacci%C3%B3n.png"),
(DEFAULT, "Bodega", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/iconos+caracteristicas/Bodega.png"),
(DEFAULT, "Cocina", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/iconos+caracteristicas/cocina.png"),
(DEFAULT, "Estacionamiento", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/iconos+caracteristicas/estacionamiento.png"),
(DEFAULT, "Gimnasio", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/iconos+caracteristicas/gimnasio2.png"),
(DEFAULT, "Televisor", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/iconos+caracteristicas/televisor.png"),
(DEFAULT, "Pileta", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/iconos+caracteristicas/pileta2.png"),
(DEFAULT, "Wifi", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/iconos+caracteristicas/wifi.png");

INSERT INTO productos_caracteristicas()
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
(8,1),(8,2),(8,5),(8,6),(8,9),(8,10),
-- prod 9
(9,1),(9,2),(9,5),(9,6),(9,9),(9,10),
-- prod 10
(10,1),(10,2),(10,5),(10,6),(10,9),(10,10),
-- prod 11
(11,1),(11,2),(11,5),(11,6),(11,9),(11,10),
-- prod 12
(12,1),(12,2),(12,5),(12,6),(12,9),(12,10),
-- prod 13
(13,1),(13,2),(13,5),(13,6),(13,9),(13,10),
-- prod 14
(14,1),(14,2),(14,5),(14,6),(14,9),(14,10),
-- prod 15
(15,1),(15,2),(15,5),(15,6),(15,9),(15,10),
-- prod 16
(16,1),(16,2),(16,5),(16,6),(16,9),(16,10),
-- prod 17
(17,1),(17,2),(17,5),(17,6),(17,9),(17,10),
-- prod 18
(18,1),(18,2),(18,5),(18,6),(18,9),(18,10);


INSERT INTO politicas()
VALUES
(1, "NORMAS", "fumar", "Se permite fumar en habitaciones asignadas"),
(2, "NORMAS", "fumar2", "No se permite fumar"),
(3, "NORMAS", "checkIn1", "Check In: 10:00 AM"),
(4, "NORMAS", "checkIn2", "Check In: 09:00 AM"),
(5, "NORMAS", "checkOut1", "Check out: 09:00 PM"),
(6, "NORMAS", "checkOut2", "Check out: 08:00 PM"),
(7, "NORMAS", "fiestas1", "No se permiten fiestas"),
(8, "NORMAS", "fiestas2", "Se permiten fiestas solo en SUMs"),
(9, "SEGURIDAD", "covid1", "Se tienen en cuenta todas las medidas de salud dispuestas por el ministerio de salud de este pais"),
(10, "SEGURIDAD", "covid2", "Se tienen en cuenta todas las medidas de salud dispuestas por la OMS"),
(11, "SEGURIDAD", "humo1", "Habitaciones con detector de humo y sistemas anti incendios"),
(12, "SEGURIDAD", "humo2", "Detector de humo en cada pasillo"),
(13, "SEGURIDAD", "cajaDeSeguridad1", "Cajas de seguridad en habitaciones asignadas"),
(14, "SEGURIDAD", "cajaDeSeguridad2", "Las habitaciones NO cuentan con cajas de seguridad"),
(15, "CANCELACION", "cancelacion1", "La cancelacion es sin costo"),
(16, "CANCELACION", "cancelacion2", "La cancelacion será siempre del 50% del valor de la reserva, sin importar los días de previo aviso.");

INSERT INTO productos_politicas()
VALUES
-- prod 1
(1, 1), (1, 3), (1, 5), (1, 7), (1, 9), (1, 11), (1, 13), (1, 15),
-- prod 2
(2, 2), (2, 4), (2, 6), (2, 8), (2, 10), (2, 12), (2, 14), (2, 16),
-- prod 3
(3, 1), (3, 3), (3, 5), (3, 7), (3, 9), (3, 11), (3, 13), (3, 15),
-- prod 4
(4, 2), (4, 4), (4, 6), (4, 8), (4, 10), (4, 12), (4, 14), (4, 16),
-- prod 5
(5, 1), (5, 3), (5, 5), (5, 7), (5, 9), (5, 11), (5, 13), (5, 15),
-- prod 6
(6, 2), (6, 4), (6, 6), (6, 8), (6, 10), (6, 12), (6, 14), (6, 16),
-- prod 7
(7, 1), (7, 3), (7, 5), (7, 7), (7, 9), (7, 11), (7, 13), (7, 15),
-- prod 8
(8, 2), (8, 4), (8, 6), (8, 8), (8, 10), (8, 12), (8, 14), (8, 16),
-- prod 9
(9, 1), (9, 3), (9, 5), (9, 7), (9, 9), (9, 11), (9, 13), (9, 15),
-- prod 10}
(10, 2), (10, 4), (10, 6), (10, 8), (10, 10), (10, 12), (10, 14), (10, 16),
-- prod 11
(11, 1), (11, 3), (11, 5), (11, 7), (11, 9), (11, 11), (11, 13), (11, 15),
-- prod 12
(12, 2), (12, 4), (12, 6), (12, 8), (12, 10), (12, 12), (12, 14), (12, 16),
-- prod 13
(13, 1), (13, 3), (13, 5), (13, 7), (13, 9), (13, 11), (13, 13), (13, 15),
-- prod 14
(14, 1), (14, 3), (14, 5), (14, 7), (14, 9), (14, 11), (14, 13), (14, 15),
-- prod 15
(15, 1), (15, 3), (15, 5), (15, 7), (15, 9), (15, 11), (15, 13), (15, 15),
-- prod 16
(16, 1), (16, 3), (16, 5), (16, 7), (16, 9), (16, 11), (16, 13), (16, 15),
-- prod 17
(17, 2), (17, 4), (17, 6), (17, 8), (17, 10), (17, 12), (17, 14), (17, 16),
-- prod 18
(18, 2), (18, 4), (18, 6), (18, 8), (18, 10), (18, 12), (18, 14), (18, 16);


-- Ingreso imagenes de cada hotel
-- template
/*
(DEFAULT, "frente1", "url", idProducto),
(DEFAULT, "frente2", "url", idProducto),
(DEFAULT, "habitacion1", "url", idProducto),
(DEFAULT, "habitacion2", "url", idProducto),
(DEFAULT, "sala1", "url", idProducto),
(DEFAULT, "sala2", "url", idProducto),
(DEFAULT, "vista1", "url", idProducto),
(DEFAULT, "vista2", "url", idProducto);
*/
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
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-1/habitacion2.jpg", 1),
-- Imagenes prod 2
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/frente1.jpg", 2),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/frente2.jpg", 2),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/vista1.jpg", 2),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/vista2.jpg", 2),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/sala1.jpg", 2),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/sala2.jpg", 2),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/habitacion1.jpg", 2),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-2/habitacion2.jpg", 2),

-- Imagenes prod 3
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/frente1.jpg", 3),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/frente2.jpg", 3),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/vista1.jpg", 3),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/vista2.jpg", 3),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/sala1.jpg", 3),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/sala2.jpg", 3),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/habitacion1.jpg", 3),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-3/habitacion2.jpg", 3),

-- Imagenes prod 4
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/frente1.jpg", 4),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/frente2.jpg", 4),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/vista1.jpg", 4),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/vista2.jpg", 4),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/sala1.jpg", 4),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/sala2.jpg", 4),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/habitacion1.jpg", 4),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-4/habitacion2.jpg", 4),

-- Imagenes prod 5
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/frente1.jpg", 5),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/frente2.jpg", 5),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/vista1.jpg", 5),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/vista2.jpg", 5),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/sala1.jpg", 5),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/sala2.jpg", 5),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/habitacion1.jpg", 5),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-5/habitacion2.jpg", 5),

-- Imagenes prod 6
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/frente1.jpg", 6),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/frente2.jpg", 6),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/vista1.jpg", 6),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/vista2.jpg", 6),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/sala1.jpg", 6),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/sala2.jpg", 6),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/habitacion1.jpg", 6),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-6/habitacion2.jpg", 6),

-- Imagenes prod 7
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/frente1.jpg", 7),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/frente2.jpg", 7),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/vista1.jpg", 7),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/vista2.jpg", 7),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/sala1.jpg", 7),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/sala2.jpg", 7),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/habitacion1.jpg", 7),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-7/habitacion2.jpg", 7),

-- Imagenes prod 8
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/frente1.jpg", 8),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/frente2.jpg", 8),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/vista1.jpg", 8),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/vista2.jpg", 8),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/sala1.jpg", 8),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/sala2.jpg", 8),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/habitacion1.jpg", 8),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-8/habitacion2.jpg", 8),

-- Imagenes prod 9
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-9/frente1.jpg", 9),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-9/frente2.jpg", 9),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-9/habitacion1.jpg", 9),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-9/habitacion2.jpg", 9),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-9/sala1.jpg", 9),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-9/sala2.jpg", 9),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-9/vista1.jpg", 9),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-9/vista2.jpg", 9),

-- Imagenes prod 10
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-10/frente1.jpg", 10),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-10/frente2.jpg", 10),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-10/habitacion1.jpg", 10),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-10/habitacion2.jpg", 10),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-10/sala1.jpg", 10),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-10/sala2.jpg", 10),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-10/vista1.jpg", 10),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-10/vista2.jpg", 10),

-- Imganes prod 11
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-11/frente1.jpg", 11),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-11/frente2.jpg", 11),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-11/habitacion1.jpg", 11),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-11/habitacion2.jpg", 11),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-11/sala1.jpg", 11),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-11/sala2.jpg", 11),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-11/vista1.jpg", 11),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-11/vista2.jpg", 11),

-- Imagenes prod 12
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-12/frente1.jpg", 12),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-12/frente2.jpg", 12),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-12/habitacion1.jpg", 12),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-12/habitacion2.jpg", 12),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-12/sala1.jpg", 12),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-12/sala2.jpg", 12),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-12/vista1.jpg", 12),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-12/vista2.jpg", 12),

-- Imagenes prod 13
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-13/frente1.jpg", 13),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-13/frente2.jpg", 13),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-13/habitacion1.jpg", 13),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-13/habitacion2.jpg", 13),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-13/sala1.jpg", 13),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-13/sala2.jpg", 13),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-13/vista1.jpg", 13),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-13/vista2.jpg", 13),

-- Imagenes prod 14
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-14/frente1.jpg", 14),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-14/frente2.jpg", 14),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-14/habitacion1.jpg", 14),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-14/habitacion2.jpg", 14),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-14/sala1.jpg", 14),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-14/sala2.jpg", 14),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-14/vista1.jpg", 14),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-14/vista2.jpg", 14),

-- Imagenes prod 15
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-15/frente1.jpg", 15),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-15/frente2.jpg", 15),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-15/habitacion1.jpg", 15),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-15/habitacion2.jpg", 15),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-15/sala1.jpg", 15),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-15/sala2.jpg", 15),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-15/vista1.jpg", 15),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-15/vista2.jpg", 15),

-- Imagenes prod 16
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-16/frente1.jpg", 16),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-16/frente2.jpg", 16),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-16/habitacion1.jpg", 16),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-16/sala1.jpg", 16),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-16/sala2.jpg", 16),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-16/vista1.jpg", 16),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-16/vista2.jpg", 16),
(DEFAULT, "vista3", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-16/vista3.jpg", 16),

-- Imagenes prod 17
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-17/frente1.jpg", 17),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-17/frente2.jpg", 17),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-17/habitacion1.jpg", 17),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-17/habitacion2.jpg", 17),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-17/sala1.jpg", 17),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-17/sala2.jpg", 17),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-17/vista1.jpg", 17),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-17/vista2.jpg", 17),

-- Imagenes prod 18
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-18/frente1.jpg", 18),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-18/frente2.jpg", 18),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-18/habitacion1.jpg", 18),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-18/habitacion2.jpg", 18),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-18/sala1.jpg", 18),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-18/sala2.jpg", 18),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-18/vista1.jpg", 18),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-18/vista2.jpg", 18);

/* Cargar con front
-- Imagenes prod 19
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-19/frente1.jpg", 19),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-19/frente2.jpg", 19),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-19/habitacion1.jpg", 19),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-19/habitacion2.jpg", 19),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-19/sala1.jpg", 19),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-19/sala2.jpg", 19),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-19/vista1.jpg", 19),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-19/vista2.jpg", 19),

-- Imagenes prod 20
(DEFAULT, "frente1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-20/frente1.jpg", 20),
(DEFAULT, "frente2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-20/frente2.jpg", 20),
(DEFAULT, "habitacion1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-20/habitacion1.jpg", 20),
(DEFAULT, "habitacion2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-20/habitacion2.jpg", 20),
(DEFAULT, "sala1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-20/sala1.jpg", 20),
(DEFAULT, "sala2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-20/sala2.jpg", 20),
(DEFAULT, "vista1", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-20/vista1.jpg", 20),
(DEFAULT, "vista2", "https://s3-grupo6-c1-0821.s3.eu-north-1.amazonaws.com/imagenes+productos/prod-20/vista2.jpg", 20);
*/
INSERT INTO roles()
VALUES
(DEFAULT, "Administrador"),
(DEFAULT, "Usuario-registrado");


INSERT INTO usuarios()
VALUES
(DEFAULT, "Lionel", "Messi", "messi.arg@mail.com", "messi1234", "Rosario", 1, 1);
/*
(DEFAULT, "Sara", "Ramirez", "sari.ramirez@mail.com", "sara1234", "Londres", 2),
(DEFAULT, "Jonathan", "Nieto", "jona.nieto@mail.com", "jony1234", "Quebec", 2),
(DEFAULT, "Manuel", "Mauro", "manu.mauro@mail.com", "manuel1234", "Paris", 2),
(DEFAULT, "Miguel", "Moreno", "miguel.moreno@mail.com", "migue1234", "Berlin", 2),
(DEFAULT, "Emanuel", "Rodríguez", "ema.rodriguez@mail.com", "ema1234", "Lima", 2);
*/

INSERT INTO reservas()
VALUES
(DEFAULT, "10:00:00", "2022-07-1", "2022-07-15", 1, 1, "No tengo covid", 1),
(DEFAULT, "10:00:00", "2022-07-05", "2022-07-19", 9, 1, "No tengo covid", 1),
(DEFAULT, "21:30:00", "2022-12-23", "2023-07-03", 2, 1, "Necesito que mi estadia no se filtre", 0),
(DEFAULT, "00:45:00", "2022-07-3", "2022-07-9", 3, 1, "Llevo medicamentos que necesitan refrigeración", 1),
(DEFAULT, "06:00:00", "2022-07-11", "2022-07-20", 4, 1, "No tengo covid", 0),
(DEFAULT, "09:00:00", "2022-07-07", "2022-07-23", 5, 1, "No tengo covid", 1),
(DEFAULT, "08:00:00", "2022-07-06", "2022-07-16", 6, 1, "No tengo covid", 1),
(DEFAULT, "07:00:00", "2022-07-15", "2022-07-19", 7, 1, "No tengo covid", 0),
(DEFAULT, "10:00:00", "2022-07-22", "2022-07-30", 8, 1, "No tengo covid", 1),
(DEFAULT, "10:00:00", "2022-07-05", "2022-08-19", 9, 1, "No tengo covid", 1),
(DEFAULT, "11:00:00", "2022-07-10", "2022-07-22", 10, 1, "No tengo covid", 1),
(DEFAULT, "13:00:00", "2022-07-03", "2022-08-10", 11, 1, "No tengo covid", 1),
(DEFAULT, "13:00:00", "2022-07-02", "2022-07-19", 12, 1, "No tengo covid", 0),
(DEFAULT, "10:00:00", "2022-07-29", "2022-07-05", 13, 1, "No tengo covid", 1),
(DEFAULT, "09:00:00", "2022-07-16", "2022-07-26", 1, 1, "No tengo covid", 1);


INSERT INTO puntuaciones()
VALUES
/*Prod 1*/(DEFAULT, 1, 1, 5), (DEFAULT, 1, 1, 4), (DEFAULT, 1, 1, 5), (DEFAULT, 1, 1, 4), (DEFAULT, 1, 1, 5),
/*Prod 2*/(DEFAULT, 2, 1, 4), (DEFAULT, 2, 1, 3), (DEFAULT, 2, 1, 5), (DEFAULT, 2, 1, 4), (DEFAULT, 2, 1, 4),
/*Prod 3*/(DEFAULT, 3, 1, 3), (DEFAULT, 3, 1, 4), (DEFAULT, 3, 1, 5), (DEFAULT, 3, 1, 2), (DEFAULT, 3, 1, 5),
/*Prod 4*/(DEFAULT, 4, 1, 2), (DEFAULT, 4, 1, 3), (DEFAULT, 4, 1, 4), (DEFAULT, 4, 1, 5), (DEFAULT, 4, 1, 5),
/*Prod 5*/(DEFAULT, 5, 1, 1), (DEFAULT, 5, 1, 2), (DEFAULT, 5, 1, 4), (DEFAULT, 5, 1, 4), (DEFAULT, 5, 1, 3),
/*Prod 6*/(DEFAULT, 6, 1, 4), (DEFAULT, 6, 1, 3), (DEFAULT, 6, 1, 4), (DEFAULT, 6, 1, 3), (DEFAULT, 6, 1, 4),
/*Prod 7*/(DEFAULT, 7, 1, 5), (DEFAULT, 7, 1, 4), (DEFAULT, 7, 1, 4), (DEFAULT, 7, 1, 3), (DEFAULT, 7, 1, 4),
/*Prod 8*/(DEFAULT, 8, 1, 3), (DEFAULT, 8, 1, 4), (DEFAULT, 8, 1, 4), (DEFAULT, 8, 1, 4), (DEFAULT, 8, 1, 5),
/*Prod 9*/(DEFAULT, 9, 1, 2), (DEFAULT, 9, 1, 1), (DEFAULT, 9, 1, 3), (DEFAULT, 9, 1, 3), (DEFAULT, 9, 1, 4),
/*Prod 10*/(DEFAULT, 10, 1, 2), (DEFAULT, 10, 1, 5), (DEFAULT, 10, 1, 4), (DEFAULT, 10, 1, 3), (DEFAULT, 10, 1, 3),
/*Prod 11*/(DEFAULT, 11, 1, 4), (DEFAULT, 11, 1, 4), (DEFAULT, 11, 1, 5), (DEFAULT, 11, 1, 2), (DEFAULT, 11, 1, 2),
/*Prod 12*/(DEFAULT, 12, 1, 3), (DEFAULT, 12, 1, 5), (DEFAULT, 12, 1, 3), (DEFAULT, 12, 1, 2), (DEFAULT, 12, 1, 5),
/*Prod 13*/(DEFAULT, 13, 1, 5), (DEFAULT, 13, 1, 4), (DEFAULT, 13, 1, 5), (DEFAULT, 13, 1, 4), (DEFAULT, 13, 1, 3),
/*Prod 14*/(DEFAULT, 14, 1, 4), (DEFAULT, 14, 1, 5), (DEFAULT, 14, 1, 5), (DEFAULT, 14, 1, 5), (DEFAULT, 14, 1, 5),
/*Prod 15*/(DEFAULT, 15, 1, 3), (DEFAULT, 15, 1, 3), (DEFAULT, 15, 1, 4), (DEFAULT, 15, 1, 3), (DEFAULT, 15, 1, 4),
/*Prod 16*/(DEFAULT, 16, 1, 2), (DEFAULT, 16, 1, 5), (DEFAULT, 16, 1, 3), (DEFAULT, 16, 1, 4), (DEFAULT, 16, 1, 5),
/*Prod 17*/(DEFAULT, 17, 1, 4), (DEFAULT, 17, 1, 2), (DEFAULT, 17, 1, 2), (DEFAULT, 17, 1, 5), (DEFAULT, 17, 1, 4),
/*Prod 18*/(DEFAULT, 18, 1, 4), (DEFAULT, 18, 1, 1), (DEFAULT, 18, 1, 4), (DEFAULT, 18, 1, 4), (DEFAULT, 18, 1, 2);

/*Prod 19(DEFAULT, 19, 1, 5), (DEFAULT, 19, 1, 4), (DEFAULT, 19, 1, 5), (DEFAULT, 19, 1, 4), (DEFAULT, 19, 1, 3),
/*Prod 20(DEFAULT, 20, 1, 5), (DEFAULT, 20, 1, 4), (DEFAULT, 20, 1, 5), (DEFAULT, 20, 1, 4), (DEFAULT, 120, 1, 3);



