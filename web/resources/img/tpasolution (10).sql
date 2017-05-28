-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2017 a las 23:56:02
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpasolution`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` varchar(50) NOT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `estado` bit(1) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `apellido`, `cedula`, `contrasena`, `correo`, `direccion`, `estado`, `img`, `nombre`, `telefono`, `usuario`, `tienda_idtienda`) VALUES
(1, 'Batty Linero', '16547748', '12345', 'juanlinero@hotmail.com', 'Los laureles', b'0', '1.jpg', 'Juan Manuel', '67894983', 'juan', 1),
(2, 'p', 'pp', NULL, 'ppp', 'ppp', b'0', NULL, 'p', 'ppp', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigosesion`
--

CREATE TABLE `codigosesion` (
  `id` bigint(20) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `texto` varchar(255) NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE `credito` (
  `id` bigint(20) NOT NULL,
  `valor` double DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `debito`
--

CREATE TABLE `debito` (
  `id` bigint(20) NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `fechacredito` datetime DEFAULT NULL,
  `fechapago` date DEFAULT NULL,
  `total` double NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL,
  `venta_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `debito`
--

INSERT INTO `debito` (`id`, `estado`, `fechacredito`, `fechapago`, `total`, `cliente_id`, `tienda_idtienda`, `venta_id`) VALUES
(1, 'Pendiente', '2017-05-06 13:14:58', '2017-05-31', 3000, 1, 1, 1),
(2, 'Pendiente', '2017-05-06 13:35:08', '2017-05-30', 1500, 2, 1, 2),
(3, 'Reportado', '2017-05-06 14:38:26', '2017-05-25', 3000, 1, 1, 3),
(4, 'Reportado', '2017-05-06 14:39:08', '2017-05-06', 1500, 1, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepreventa`
--

CREATE TABLE `detallepreventa` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `preventa_id` bigint(20) DEFAULT NULL,
  `producto_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `producto_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL,
  `venta_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`id`, `cantidad`, `subtotal`, `cliente_id`, `producto_id`, `tienda_idtienda`, `venta_id`) VALUES
(1, 2, 3000, 1, 1, 1, 1),
(2, 1, 1500, 2, 1, 1, 2),
(3, 2, 3000, 1, 1, 1, 3),
(4, 1, 1500, 1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` bigint(20) NOT NULL,
  `total` double NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mora`
--

CREATE TABLE `mora` (
  `id` bigint(20) NOT NULL,
  `descripción` varchar(255) DEFAULT NULL,
  `total` double NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mora`
--

INSERT INTO `mora` (`id`, `descripción`, `total`, `cliente_id`, `tienda_idtienda`) VALUES
(1, 'Inserio linero', 1500, 1, 1),
(2, 'Mas moroso nojoda', 3000, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE `noticia` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `producto_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `noticia`
--

INSERT INTO `noticia` (`id`, `descripcion`, `fecha`, `titulo`, `cliente_id`, `producto_id`, `tienda_idtienda`) VALUES
(1, 'llego la prestorbarba, mas afilada, ven por ella...', '2017-05-06 14:27:02', 'Nuevo producto! La cumbre paisa!', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preventa`
--

CREATE TABLE `preventa` (
  `id` bigint(20) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `total` double NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `nombreproducto` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `cantidad`, `categoria`, `descripcion`, `img`, `nombreproducto`, `precio`, `tienda_idtienda`) VALUES
(1, 72, 'Aseo', 'Gillete azul', '1/103.jpg', 'Prestobarba ', 1500, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestanoticia`
--

CREATE TABLE `respuestanoticia` (
  `id` bigint(20) NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesionescliente`
--

CREATE TABLE `sesionescliente` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesionestienda`
--

CREATE TABLE `sesionestienda` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `idtienda` bigint(20) NOT NULL,
  `cedulapropietario` varchar(20) NOT NULL,
  `contrasena` varchar(254) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado` bit(1) NOT NULL,
  `nombretienda` varchar(100) NOT NULL,
  `propietario` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`idtienda`, `cedulapropietario`, `contrasena`, `direccion`, `estado`, `nombretienda`, `propietario`, `telefono`, `usuario`) VALUES
(1, '1143403269', 'sgjupLLztmk=', 'carrera 80 #14, cartagena', b'0', 'La cumbre paisa', 'Daniel Castillo Ardila', '6785988', 'cumbrepaisa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciongps`
--

CREATE TABLE `ubicaciongps` (
  `id` bigint(20) NOT NULL,
  `latitud` varchar(255) DEFAULT NULL,
  `longuitud` varchar(255) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ubicaciongps`
--

INSERT INTO `ubicaciongps` (`id`, `latitud`, `longuitud`, `tienda_idtienda`) VALUES
(1, '10.3787604', '-75.4799184', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `id` bigint(20) NOT NULL,
  `apellidovendedor` varchar(255) DEFAULT NULL,
  `cedulavendedor` varchar(255) DEFAULT NULL,
  `contrasenavendedor` varchar(255) DEFAULT NULL,
  `nombrevendedor` varchar(255) DEFAULT NULL,
  `telvendedor` varchar(255) DEFAULT NULL,
  `usuariovendedor` varchar(255) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `total` double NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `tienda_idtienda` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `fecha`, `tipo`, `total`, `cliente_id`, `tienda_idtienda`) VALUES
(1, '2017-05-06 13:14:58', 'Credito', 3000, 1, 1),
(2, '2017-05-06 13:35:08', 'Credito', 1500, 2, 1),
(3, '2017-05-06 14:38:26', 'Credito', 3000, 1, 1),
(4, '2017-05-06 14:39:08', 'Credito', 1500, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_8osyr6g0wuyhovfh52ub85h50` (`tienda_idtienda`);

--
-- Indices de la tabla `codigosesion`
--
ALTER TABLE `codigosesion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_jyu2n98smqpl1duuhnesqbol8` (`cliente_id`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_k0pmqt38giqm4p7cqgf12hwks` (`cliente_id`),
  ADD KEY `FK_oqkycrm6r0bu7ut6mxvcccnr3` (`tienda_idtienda`);

--
-- Indices de la tabla `credito`
--
ALTER TABLE `credito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_bt4fmnhjohmtw108ntvebj2x9` (`cliente_id`),
  ADD KEY `FK_53cyskmiot03ub67dqbn0gspy` (`tienda_idtienda`);

--
-- Indices de la tabla `debito`
--
ALTER TABLE `debito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_e7jb5fsp0vvncln2yht5rmqma` (`cliente_id`),
  ADD KEY `FK_5lahss4n1rsu3e6c57ggnp5ve` (`tienda_idtienda`),
  ADD KEY `FK_qwxpfd5146gwmd5057ejbf66o` (`venta_id`);

--
-- Indices de la tabla `detallepreventa`
--
ALTER TABLE `detallepreventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_3sk85w3tq7ftbd5rim6q9qrjm` (`cliente_id`),
  ADD KEY `FK_2rmdrpfeeiiyaatdvh4ov2p42` (`preventa_id`),
  ADD KEY `FK_9fs4dyucg1bncaiosv541uj4k` (`producto_id`),
  ADD KEY `FK_f032ek9dvd464em08y0joasbk` (`tienda_idtienda`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t18ymg6uf4opo60vj0f551jdv` (`cliente_id`),
  ADD KEY `FK_8lbv77r5tw1vc03axpq4ly5rn` (`producto_id`),
  ADD KEY `FK_cdy2w6f3lcnp3gorf4e3iyjwy` (`tienda_idtienda`),
  ADD KEY `FK_i440v0jiv8hp0yakoj0t1axel` (`venta_id`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_4y2cx5ddx22sc99ocmgc4k9k5` (`cliente_id`),
  ADD KEY `FK_6lo6fbltrem07w30vo0ah0txg` (`tienda_idtienda`);

--
-- Indices de la tabla `mora`
--
ALTER TABLE `mora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_f7ejt4xsypok810lqahn0198j` (`cliente_id`),
  ADD KEY `FK_195uunujtlwkf114ev6dxl6bk` (`tienda_idtienda`);

--
-- Indices de la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cgbu8jg10o1ep0v5gb5j7u40w` (`cliente_id`),
  ADD KEY `FK_s5o6j3x7atuijp97ipmodiqm1` (`producto_id`),
  ADD KEY `FK_s6iyqanyb3gwdqfhmttlhyphl` (`tienda_idtienda`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5j101vkfl56dn2mjmsw48po0l` (`cliente_id`),
  ADD KEY `FK_swf69aespu6rhwv1p9wjn3e3` (`tienda_idtienda`);

--
-- Indices de la tabla `preventa`
--
ALTER TABLE `preventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_jnb8ap8pkhhjecyiu3k0ihr3f` (`cliente_id`),
  ADD KEY `FK_34gtbouecug1von2eml295wcx` (`tienda_idtienda`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cigd36nictqiyrknhsi10xnw9` (`tienda_idtienda`);

--
-- Indices de la tabla `respuestanoticia`
--
ALTER TABLE `respuestanoticia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_psojp700tgyxyeii6dfugjvge` (`tienda_idtienda`);

--
-- Indices de la tabla `sesionescliente`
--
ALTER TABLE `sesionescliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5ccege762at2hi0qv4cxbu2o1` (`cliente_id`),
  ADD KEY `FK_mpordwwteqnyf31k9j5k9559b` (`tienda_idtienda`);

--
-- Indices de la tabla `sesionestienda`
--
ALTER TABLE `sesionestienda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_nfvmffea6mly6j9ywinr662wr` (`tienda_idtienda`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`idtienda`);

--
-- Indices de la tabla `ubicaciongps`
--
ALTER TABLE `ubicaciongps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_moeyelkpjgx7g8h5q6dqe6mm6` (`tienda_idtienda`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_h9yvurt1dgs8fisedmkayfj0a` (`tienda_idtienda`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_qetrxusf8e38uuwa47jk8w9xw` (`cliente_id`),
  ADD KEY `FK_higuv4nt8nmt3fsi83eelxax3` (`tienda_idtienda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `codigosesion`
--
ALTER TABLE `codigosesion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `credito`
--
ALTER TABLE `credito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `debito`
--
ALTER TABLE `debito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `detallepreventa`
--
ALTER TABLE `detallepreventa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mora`
--
ALTER TABLE `mora`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `preventa`
--
ALTER TABLE `preventa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `respuestanoticia`
--
ALTER TABLE `respuestanoticia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sesionescliente`
--
ALTER TABLE `sesionescliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sesionestienda`
--
ALTER TABLE `sesionestienda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `idtienda` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ubicaciongps`
--
ALTER TABLE `ubicaciongps`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_8osyr6g0wuyhovfh52ub85h50` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `codigosesion`
--
ALTER TABLE `codigosesion`
  ADD CONSTRAINT `FK_jyu2n98smqpl1duuhnesqbol8` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `FK_k0pmqt38giqm4p7cqgf12hwks` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FK_oqkycrm6r0bu7ut6mxvcccnr3` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `credito`
--
ALTER TABLE `credito`
  ADD CONSTRAINT `FK_53cyskmiot03ub67dqbn0gspy` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`),
  ADD CONSTRAINT `FK_bt4fmnhjohmtw108ntvebj2x9` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `debito`
--
ALTER TABLE `debito`
  ADD CONSTRAINT `FK_5lahss4n1rsu3e6c57ggnp5ve` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`),
  ADD CONSTRAINT `FK_e7jb5fsp0vvncln2yht5rmqma` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FK_qwxpfd5146gwmd5057ejbf66o` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `detallepreventa`
--
ALTER TABLE `detallepreventa`
  ADD CONSTRAINT `FK_2rmdrpfeeiiyaatdvh4ov2p42` FOREIGN KEY (`preventa_id`) REFERENCES `preventa` (`id`),
  ADD CONSTRAINT `FK_3sk85w3tq7ftbd5rim6q9qrjm` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FK_9fs4dyucg1bncaiosv541uj4k` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `FK_f032ek9dvd464em08y0joasbk` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `FK_8lbv77r5tw1vc03axpq4ly5rn` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `FK_cdy2w6f3lcnp3gorf4e3iyjwy` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`),
  ADD CONSTRAINT `FK_i440v0jiv8hp0yakoj0t1axel` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`),
  ADD CONSTRAINT `FK_t18ymg6uf4opo60vj0f551jdv` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `FK_4y2cx5ddx22sc99ocmgc4k9k5` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FK_6lo6fbltrem07w30vo0ah0txg` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `mora`
--
ALTER TABLE `mora`
  ADD CONSTRAINT `FK_195uunujtlwkf114ev6dxl6bk` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`),
  ADD CONSTRAINT `FK_f7ejt4xsypok810lqahn0198j` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD CONSTRAINT `FK_cgbu8jg10o1ep0v5gb5j7u40w` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FK_s5o6j3x7atuijp97ipmodiqm1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  ADD CONSTRAINT `FK_s6iyqanyb3gwdqfhmttlhyphl` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `FK_5j101vkfl56dn2mjmsw48po0l` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FK_swf69aespu6rhwv1p9wjn3e3` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `preventa`
--
ALTER TABLE `preventa`
  ADD CONSTRAINT `FK_34gtbouecug1von2eml295wcx` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`),
  ADD CONSTRAINT `FK_jnb8ap8pkhhjecyiu3k0ihr3f` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_cigd36nictqiyrknhsi10xnw9` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `respuestanoticia`
--
ALTER TABLE `respuestanoticia`
  ADD CONSTRAINT `FK_psojp700tgyxyeii6dfugjvge` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `sesionescliente`
--
ALTER TABLE `sesionescliente`
  ADD CONSTRAINT `FK_5ccege762at2hi0qv4cxbu2o1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `FK_mpordwwteqnyf31k9j5k9559b` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `sesionestienda`
--
ALTER TABLE `sesionestienda`
  ADD CONSTRAINT `FK_nfvmffea6mly6j9ywinr662wr` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `ubicaciongps`
--
ALTER TABLE `ubicaciongps`
  ADD CONSTRAINT `FK_moeyelkpjgx7g8h5q6dqe6mm6` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `FK_h9yvurt1dgs8fisedmkayfj0a` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_higuv4nt8nmt3fsi83eelxax3` FOREIGN KEY (`tienda_idtienda`) REFERENCES `tienda` (`idtienda`),
  ADD CONSTRAINT `FK_qetrxusf8e38uuwa47jk8w9xw` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
