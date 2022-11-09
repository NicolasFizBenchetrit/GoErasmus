-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: goerasmus
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivo` (
  `idArchivo` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `urlArchivo` varchar(255) NOT NULL,
  `usuario_idUsuario` int DEFAULT NULL,
  `asignatura_idAsignatura` int NOT NULL,
  PRIMARY KEY (`idArchivo`),
  UNIQUE KEY `url_archivo_UNIQUE` (`urlArchivo`),
  KEY `fk_archivos_usuario1_idx` (`usuario_idUsuario`),
  KEY `fk_Archivo_Asignatura1_idx` (`asignatura_idAsignatura`),
  CONSTRAINT `fk_Archivo_Asignatura1` FOREIGN KEY (`asignatura_idAsignatura`) REFERENCES `asignatura` (`idAsignatura`) ON DELETE CASCADE,
  CONSTRAINT `fk_archivos_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `idArticulo` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `descripcion` longtext NOT NULL,
  `urlCabecera` varchar(255) NOT NULL,
  `esBorrador` tinyint NOT NULL DEFAULT '0',
  `fechaUltimaModificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaPublicacion` datetime DEFAULT NULL,
  `ciudad_idCiudad` int NOT NULL,
  `usuario_idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idArticulo`),
  KEY `fk_Articulo_Ciudad1_idx` (`ciudad_idCiudad`),
  KEY `fk_articulo_usuario1_idx` (`usuario_idUsuario`),
  CONSTRAINT `fk_Articulo_Ciudad1` FOREIGN KEY (`ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE CASCADE,
  CONSTRAINT `fk_articulo_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignatura` (
  `idAsignatura` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `facultad_idFacultad` int NOT NULL,
  PRIMARY KEY (`idAsignatura`),
  KEY `fk_Asignatura_Facultad1_idx` (`facultad_idFacultad`),
  CONSTRAINT `fk_Asignatura_Facultad1` FOREIGN KEY (`facultad_idFacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `idCiudad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `informacion` longtext NOT NULL,
  `urlCabecera` varchar(255) NOT NULL,
  `pais_idPais` int NOT NULL,
  PRIMARY KEY (`idCiudad`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_ciudad_pais1_idx` (`pais_idPais`),
  CONSTRAINT `fk_ciudad_pais1` FOREIGN KEY (`pais_idPais`) REFERENCES `pais` (`idPais`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Varsovia','','',1),(2,'Bolonia','','',2);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `idComentario` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(180) NOT NULL,
  `articulo_idArticulo` int DEFAULT NULL,
  `usuario_idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `fk_comentario_articulo1_idx` (`articulo_idArticulo`),
  KEY `fk_comentario_usuario1_idx` (`usuario_idUsuario`),
  CONSTRAINT `fk_comentario_articulo1` FOREIGN KEY (`articulo_idArticulo`) REFERENCES `articulo` (`idArticulo`) ON DELETE CASCADE,
  CONSTRAINT `fk_comentario_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultad` (
  `idfacultad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `universidad_idUniversidad` int NOT NULL,
  PRIMARY KEY (`idfacultad`),
  KEY `fk_facultad_universidad1_idx` (`universidad_idUniversidad`),
  CONSTRAINT `fk_facultad_universidad1` FOREIGN KEY (`universidad_idUniversidad`) REFERENCES `universidad` (`idUniversidad`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'Facultad de electrónica',1),(2,'Facultad de arte',2);
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeriaimagenesarticulo`
--

DROP TABLE IF EXISTS `galeriaimagenesarticulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galeriaimagenesarticulo` (
  `idGaleriaImagenesArticulo` int NOT NULL AUTO_INCREMENT,
  `urlImagen` varchar(255) NOT NULL,
  `articulo_idArticulo` int NOT NULL,
  PRIMARY KEY (`idGaleriaImagenesArticulo`),
  KEY `fk_galeriaImagenesArticulo_articulo1_idx` (`articulo_idArticulo`),
  CONSTRAINT `fk_galeriaImagenesArticulo_articulo1` FOREIGN KEY (`articulo_idArticulo`) REFERENCES `articulo` (`idArticulo`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeriaimagenesarticulo`
--

LOCK TABLES `galeriaimagenesarticulo` WRITE;
/*!40000 ALTER TABLE `galeriaimagenesarticulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `galeriaimagenesarticulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeriaimagenesciudad`
--

DROP TABLE IF EXISTS `galeriaimagenesciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galeriaimagenesciudad` (
  `idGaleriaImagenesCiudad` int NOT NULL AUTO_INCREMENT,
  `urlImagen` varchar(255) NOT NULL,
  `ciudad_idCiudad` int NOT NULL,
  PRIMARY KEY (`idGaleriaImagenesCiudad`),
  KEY `fk_galeriaImagenesCiudad_ciudad1_idx` (`ciudad_idCiudad`),
  CONSTRAINT `fk_galeriaImagenesCiudad_ciudad1` FOREIGN KEY (`ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeriaimagenesciudad`
--

LOCK TABLES `galeriaimagenesciudad` WRITE;
/*!40000 ALTER TABLE `galeriaimagenesciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `galeriaimagenesciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `programers` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (7,'python',21);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logro`
--

DROP TABLE IF EXISTS `logro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logro` (
  `idLogro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `cantidadPuntos` int NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `rol_idRol` int DEFAULT NULL,
  PRIMARY KEY (`idLogro`),
  KEY `fk_logro_rol1_idx` (`rol_idRol`),
  CONSTRAINT `fk_logro_rol1` FOREIGN KEY (`rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logro`
--

LOCK TABLES `logro` WRITE;
/*!40000 ALTER TABLE `logro` DISABLE KEYS */;
INSERT INTO `logro` VALUES (1,'email','Confirmar email',5,'a',1),(2,'perfil','Caracteristicas de perfil seleccionadas',5,'a',1),(3,'foto','Foto perfil seleccionada',5,'a',1),(4,'1 aportaciones','Realizar al menos una aportación',15,'a',2),(5,'1 votos','Recibir menos un voto positivo',20,'a',2),(6,'concurso','Ganar concurso',30,'a',4),(7,'3 aportaciones','Realizar al menos tres aportaciones',25,'a',3),(8,'3 votos','Recibir al menos tres votos positivos',25,'a',3);
/*!40000 ALTER TABLE `logro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacion` (
  `idNotificacion` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `fechaEnvio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idNotificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacionusuario`
--

DROP TABLE IF EXISTS `notificacionusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacionusuario` (
  `notificacion_idNotificacion` int NOT NULL,
  `usuario_idUsuario` int NOT NULL,
  PRIMARY KEY (`notificacion_idNotificacion`,`usuario_idUsuario`),
  KEY `fk_Notificacion_has_Usuario_Usuario1_idx` (`usuario_idUsuario`),
  KEY `fk_Notificacion_has_Usuario_Notificacion1_idx` (`notificacion_idNotificacion`),
  CONSTRAINT `fk_Notificacion_has_Usuario_Notificacion1` FOREIGN KEY (`notificacion_idNotificacion`) REFERENCES `notificacion` (`idNotificacion`) ON DELETE CASCADE,
  CONSTRAINT `fk_Notificacion_has_Usuario_Usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacionusuario`
--

LOCK TABLES `notificacionusuario` WRITE;
/*!40000 ALTER TABLE `notificacionusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacionusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `idPais` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(85) NOT NULL,
  `urlBandera` varchar(255) NOT NULL,
  PRIMARY KEY (`idPais`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Polonia',''),(2,'Italia','');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `idPermiso` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`idPermiso`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisorol`
--

DROP TABLE IF EXISTS `permisorol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisorol` (
  `rol_idRol` int NOT NULL,
  `permiso_idPermiso` int NOT NULL,
  PRIMARY KEY (`rol_idRol`,`permiso_idPermiso`),
  KEY `fk_permisorol_rol1_idx` (`rol_idRol`),
  KEY `fk_permisorol_permiso1_idx` (`permiso_idPermiso`),
  CONSTRAINT `fk_permisorol_permiso1` FOREIGN KEY (`permiso_idPermiso`) REFERENCES `permiso` (`idPermiso`) ON DELETE CASCADE,
  CONSTRAINT `fk_permisorol_rol1` FOREIGN KEY (`rol_idRol`) REFERENCES `rol` (`idRol`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisorol`
--

LOCK TABLES `permisorol` WRITE;
/*!40000 ALTER TABLE `permisorol` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisorol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `usuario_idUsuario` int NOT NULL,
  `tiporeporte_idTipoReporte` int NOT NULL,
  `fechaEnvio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuario_idUsuario`,`tiporeporte_idTipoReporte`),
  KEY `fk_Reporte_Usuario1_idx` (`usuario_idUsuario`),
  KEY `fk_Reporte_TipoReporte1_idx` (`tiporeporte_idTipoReporte`),
  CONSTRAINT `fk_Reporte_TipoReporte1` FOREIGN KEY (`tiporeporte_idTipoReporte`) REFERENCES `tiporeporte` (`idTipoReporte`) ON DELETE CASCADE,
  CONSTRAINT `fk_Reporte_Usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idRol`),
  UNIQUE KEY `nombre_rol_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (6,'Administrador'),(3,'Aventurero'),(2,'Mochilero'),(1,'Novato'),(5,'Trotamundos'),(4,'Viajero Experto');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiporeporte`
--

DROP TABLE IF EXISTS `tiporeporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiporeporte` (
  `idTipoReporte` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idTipoReporte`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiporeporte`
--

LOCK TABLES `tiporeporte` WRITE;
/*!40000 ALTER TABLE `tiporeporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiporeporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universidad`
--

DROP TABLE IF EXISTS `universidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `universidad` (
  `idUniversidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `urlLogo` varchar(255) NOT NULL,
  `ciudad_idCiudad` int NOT NULL,
  PRIMARY KEY (`idUniversidad`),
  KEY `fk_universidad_ciudad1_idx` (`ciudad_idCiudad`),
  CONSTRAINT `fk_universidad_ciudad1` FOREIGN KEY (`ciudad_idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universidad`
--

LOCK TABLES `universidad` WRITE;
/*!40000 ALTER TABLE `universidad` DISABLE KEYS */;
INSERT INTO `universidad` VALUES (1,'Universidad Tecnológica de Varsovia','',1),(2,'Universidad de Bolonia','',2);
/*!40000 ALTER TABLE `universidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `apellido1` varchar(150) NOT NULL,
  `apellido2` varchar(150) DEFAULT NULL,
  `nombreUsuario` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `urlFotoPerfil` varchar(255) DEFAULT NULL,
  `cantidadPuntos` int NOT NULL,
  `cuentaActivada` tinyint NOT NULL DEFAULT '0',
  `fechaCreacionCuenta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Rol_idRol` int DEFAULT NULL,
  `facultad_idFacultad` int DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nombre_usuario_UNIQUE` (`nombreUsuario`),
  KEY `fk_Usuario_Rol1_idx` (`Rol_idRol`),
  KEY `fk_usuario_facultad1_idx` (`facultad_idFacultad`),
  CONSTRAINT `fk_usuario_facultad1` FOREIGN KEY (`facultad_idFacultad`) REFERENCES `facultad` (`idfacultad`),
  CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'nicolasmartin','',NULL,'nfiz','nicolasfiz@outlook.com','1234','http://res.cloudinary.com/dbi1wsnuq/image/upload/v1666799074/p4lt1ix1f54dexdhi4cq.jpg',0,0,'2022-11-01 14:09:20',3,1),(2,'Nico2','',NULL,'nfiz2','nicolasfiz@topdigital.com','1234',NULL,0,0,'2022-11-01 14:09:20',1,2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariologro`
--

DROP TABLE IF EXISTS `usuariologro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariologro` (
  `usuario_idUsuario` int NOT NULL,
  `logro_idLogro` int NOT NULL,
  PRIMARY KEY (`usuario_idUsuario`,`logro_idLogro`),
  KEY `fk_usuario_has_logro_logro1_idx` (`logro_idLogro`),
  KEY `fk_usuario_has_logro_usuario1_idx` (`usuario_idUsuario`),
  CONSTRAINT `fk_usuario_has_logro_logro1` FOREIGN KEY (`logro_idLogro`) REFERENCES `logro` (`idLogro`) ON DELETE CASCADE,
  CONSTRAINT `fk_usuario_has_logro_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariologro`
--

LOCK TABLES `usuariologro` WRITE;
/*!40000 ALTER TABLE `usuariologro` DISABLE KEYS */;
INSERT INTO `usuariologro` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7);
/*!40000 ALTER TABLE `usuariologro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votacion`
--

DROP TABLE IF EXISTS `votacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votacion` (
  `idVotacion` int NOT NULL AUTO_INCREMENT,
  `numeroMeGusta` int NOT NULL DEFAULT '0',
  `numeroNoMeGusta` int NOT NULL DEFAULT '0',
  `archivo_idArchivo` int DEFAULT NULL,
  `comentario_idComentario` int DEFAULT NULL,
  `usuario_idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idVotacion`),
  KEY `fk_votacion_archivo1_idx` (`archivo_idArchivo`),
  KEY `fk_votacion_comentario1_idx` (`comentario_idComentario`),
  KEY `fk_votacion_usuario1_idx` (`usuario_idUsuario`),
  CONSTRAINT `fk_votacion_archivo1` FOREIGN KEY (`archivo_idArchivo`) REFERENCES `archivo` (`idArchivo`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_votacion_comentario1` FOREIGN KEY (`comentario_idComentario`) REFERENCES `comentario` (`idComentario`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_votacion_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votacion`
--

LOCK TABLES `votacion` WRITE;
/*!40000 ALTER TABLE `votacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `votacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votacionarticulo`
--

DROP TABLE IF EXISTS `votacionarticulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votacionarticulo` (
  `usuario_idUsuario` int NOT NULL,
  `articulo_idArticulo` int NOT NULL,
  `numeroVotos` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`usuario_idUsuario`,`articulo_idArticulo`),
  KEY `fk_votacionArticulo_usuario1_idx` (`usuario_idUsuario`),
  KEY `fk_votacionArticulo_articulo1_idx` (`articulo_idArticulo`),
  CONSTRAINT `fk_votacionArticulo_articulo1` FOREIGN KEY (`articulo_idArticulo`) REFERENCES `articulo` (`idArticulo`),
  CONSTRAINT `fk_votacionArticulo_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votacionarticulo`
--

LOCK TABLES `votacionarticulo` WRITE;
/*!40000 ALTER TABLE `votacionarticulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `votacionarticulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votacionasignatura`
--

DROP TABLE IF EXISTS `votacionasignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votacionasignatura` (
  `comentario_idComentario` int NOT NULL,
  `asignatura_idAsignatura` int NOT NULL,
  `nota` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`comentario_idComentario`,`asignatura_idAsignatura`),
  KEY `fk_votacionPonderada_comentario1_idx` (`comentario_idComentario`),
  KEY `fk_votacionPonderada_asignatura1_idx` (`asignatura_idAsignatura`),
  CONSTRAINT `fk_votacionPonderada_asignatura1` FOREIGN KEY (`asignatura_idAsignatura`) REFERENCES `asignatura` (`idAsignatura`) ON DELETE CASCADE,
  CONSTRAINT `fk_votacionPonderada_comentario1` FOREIGN KEY (`comentario_idComentario`) REFERENCES `comentario` (`idComentario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votacionasignatura`
--

LOCK TABLES `votacionasignatura` WRITE;
/*!40000 ALTER TABLE `votacionasignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `votacionasignatura` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-01 15:28:50