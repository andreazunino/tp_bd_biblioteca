CREATE TABLE `Libros` (
  `id` int PRIMARY KEY,
  `titulo` varchar(255),
  `autor` varchar(255),
  `categoria` varchar(255),
  `estado` varchar(255)
);

CREATE TABLE `Bibliotecarios` (
  `id` int PRIMARY KEY,
  `id_usuario` int
);

CREATE TABLE `socios` (
  `id` int PRIMARY KEY,
  `id_usuario` int
);

CREATE TABLE `prestamos` (
  `id` int PRIMARY KEY,
  `id_libro` int,
  `id_usuario` int,
  `fecha_prestamo` datetime,
  `fecha_devolucion` datetime
);

CREATE TABLE `usuarios` (
  `id` int PRIMARY KEY,
  `nombre` varchar(255),
  `direccion` varchar(255),
  `telefono` int,
  `dni` int
);

CREATE TABLE `auditoriaPrestamos` (
  `id` int PRIMARY KEY,
  `id_prestamo` int,
  `accion` varchar(255),
  `fecha` datetime
);

ALTER TABLE `Bibliotecarios` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

ALTER TABLE `prestamos` ADD FOREIGN KEY (`id`) REFERENCES `auditoriaPrestamos` (`id_prestamo`);

ALTER TABLE `socios` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

ALTER TABLE `prestamos` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

ALTER TABLE `prestamos` ADD FOREIGN KEY (`id_libro`) REFERENCES `Libros` (`id`);
