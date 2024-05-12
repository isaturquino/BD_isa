CREATE DATABASE  IF NOT EXISTS `isabely_turquino_cafeteria` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `isabely_turquino_cafeteria`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: isabely_turquino_cafeteria
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL,
  `nome_cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'operador_caixa'),(2,'gerente'),(3,'atendente'),(4,'barista'),(5,'auxiliar_cozinha'),(6,'confeiteiro'),(7,'zelador'),(8,'propietário');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `data_cadastro` date NOT NULL,
  `pessoa_cpf_pessoa` varchar(11) NOT NULL,
  `status_cliente_id_status_cliente` int NOT NULL,
  PRIMARY KEY (`pessoa_cpf_pessoa`),
  KEY `fk_cliente_status_cliente1_idx` (`status_cliente_id_status_cliente`),
  CONSTRAINT `fk_cliente_pessoa` FOREIGN KEY (`pessoa_cpf_pessoa`) REFERENCES `pessoa` (`cpf_pessoa`),
  CONSTRAINT `fk_cliente_status_cliente1` FOREIGN KEY (`status_cliente_id_status_cliente`) REFERENCES `status_cliente` (`id_status_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('2018-05-10','122',5),('2018-05-10','166',5),('2019-04-05','195',3),('2022-03-19','197',4),('2022-04-01','198',2),('2019-04-05','199',2),('2024-01-10','555',1),('2024-05-05','777',1),('2023-10-07','888',2),('2023-10-06','999',3);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comanda` (
  `id_comanda` int NOT NULL,
  `data_comanda` date NOT NULL,
  `cliente_pessoa_cpf_pessoa` varchar(11) NOT NULL,
  `funcionario_pessoa_cpf_pessoa` varchar(11) NOT NULL,
  PRIMARY KEY (`id_comanda`),
  KEY `fk_comanda_cliente1_idx` (`cliente_pessoa_cpf_pessoa`),
  KEY `fk_comanda_funcionario1_idx` (`funcionario_pessoa_cpf_pessoa`),
  CONSTRAINT `fk_comanda_cliente1` FOREIGN KEY (`cliente_pessoa_cpf_pessoa`) REFERENCES `cliente` (`pessoa_cpf_pessoa`),
  CONSTRAINT `fk_comanda_funcionario1` FOREIGN KEY (`funcionario_pessoa_cpf_pessoa`) REFERENCES `funcionario` (`pessoa_cpf_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (1,'2018-05-10','122','111'),(2,'2019-04-05','195','177'),(3,'2022-03-19','197','144'),(4,'2023-10-06','999','144'),(5,'2024-01-10','555','177'),(6,'2024-05-05','777','111'),(7,'2018-05-10','166','177'),(8,'2024-05-11','777','144'),(11,'2024-05-08','777','144');
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `estoque_,menor_15`
--

DROP TABLE IF EXISTS `estoque_,menor_15`;
/*!50001 DROP VIEW IF EXISTS `estoque_,menor_15`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `estoque_,menor_15` AS SELECT 
 1 AS `id_produto`,
 1 AS `nome_produto`,
 1 AS `quantidade_estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `forma_produto`
--

DROP TABLE IF EXISTS `forma_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_produto` (
  `id_forma_produto` int NOT NULL,
  `nome_forma_produto` varchar(45) NOT NULL,
  PRIMARY KEY (`id_forma_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_produto`
--

LOCK TABLES `forma_produto` WRITE;
/*!40000 ALTER TABLE `forma_produto` DISABLE KEYS */;
INSERT INTO `forma_produto` VALUES (1,'copo'),(2,'xícara'),(3,'fatia'),(4,'porção_10_un'),(5,'taça'),(6,'unidade');
/*!40000 ALTER TABLE `forma_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formas_pagamento`
--

DROP TABLE IF EXISTS `formas_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formas_pagamento` (
  `id_forma_pagamento` int NOT NULL,
  `nome_forma_pagamento` varchar(45) NOT NULL,
  PRIMARY KEY (`id_forma_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formas_pagamento`
--

LOCK TABLES `formas_pagamento` WRITE;
/*!40000 ALTER TABLE `formas_pagamento` DISABLE KEYS */;
INSERT INTO `formas_pagamento` VALUES (1,'Dinheiro'),(2,'PIX'),(3,'Cartão_débito'),(4,'Cartão_crédito'),(5,'TED');
/*!40000 ALTER TABLE `formas_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `data_cadastro` date NOT NULL,
  `pessoa_cpf_pessoa` varchar(11) NOT NULL,
  `cargo_id_cargo` int NOT NULL,
  `status_id_status` int NOT NULL,
  PRIMARY KEY (`pessoa_cpf_pessoa`),
  KEY `fk_funcionario_cargo1_idx` (`cargo_id_cargo`),
  KEY `fk_funcionario_status1_idx` (`status_id_status`),
  CONSTRAINT `fk_funcionario_cargo1` FOREIGN KEY (`cargo_id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `fk_funcionario_pessoa1` FOREIGN KEY (`pessoa_cpf_pessoa`) REFERENCES `pessoa` (`cpf_pessoa`),
  CONSTRAINT `fk_funcionario_status1` FOREIGN KEY (`status_id_status`) REFERENCES `status_funcionario` (`id_status_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('2018-05-09','111',1,5),('2018-05-06','133',5,6),('2024-04-28','144',3,2),('2019-03-04','177',3,1),('2020-04-03','188',2,4),('2020-05-08','194',7,1),('2018-05-10','196',6,1),('2018-05-09','222',7,1),('2018-05-10','333',4,3),('2020-02-01','444',8,1),('2023-11-23','888',6,1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento_valor`
--

DROP TABLE IF EXISTS `pagamento_valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento_valor` (
  `id_pagamentos` int NOT NULL,
  `formas_pagamento_id_forma_pagamento` int NOT NULL,
  `comanda_id_comanda` int NOT NULL,
  PRIMARY KEY (`id_pagamentos`,`comanda_id_comanda`),
  KEY `fk_pagamentos_formas_pagamento1_idx` (`formas_pagamento_id_forma_pagamento`),
  KEY `fk_pagamento_valor_comanda1_idx` (`comanda_id_comanda`),
  CONSTRAINT `fk_pagamento_valor_comanda1` FOREIGN KEY (`comanda_id_comanda`) REFERENCES `comanda` (`id_comanda`),
  CONSTRAINT `fk_pagamentos_formas_pagamento1` FOREIGN KEY (`formas_pagamento_id_forma_pagamento`) REFERENCES `formas_pagamento` (`id_forma_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_valor`
--

LOCK TABLES `pagamento_valor` WRITE;
/*!40000 ALTER TABLE `pagamento_valor` DISABLE KEYS */;
INSERT INTO `pagamento_valor` VALUES (1,1,1),(7,1,7),(2,2,2),(3,2,3),(4,3,4),(5,3,5),(6,4,6);
/*!40000 ALTER TABLE `pagamento_valor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `cpf_pessoa` varchar(11) NOT NULL,
  `nome_pessoa` varchar(60) NOT NULL,
  `telefone_pessoa` int NOT NULL,
  PRIMARY KEY (`cpf_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES ('111','Adão',449988),('113','Mateus',449821),('122','Maria',449877),('133','Jesabel',449976),('144','Esaú',449984),('155','Lia',449985),('166','Raquel',449986),('177','Jacó',449987),('188','Ester',449989),('194','Felipe',449872),('195','João',449873),('196','Pedro',449874),('197','Tiago',449875),('198','José',449876),('199','Rute',449900),('222','Eva',449977),('333','Noé',449966),('444','Abraão',449955),('555','Sara',449944),('777','Isaque',449933),('888','Rebeca',449922),('999','Boaz',449911);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pessoa_comanda`
--

DROP TABLE IF EXISTS `pessoa_comanda`;
/*!50001 DROP VIEW IF EXISTS `pessoa_comanda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pessoa_comanda` AS SELECT 
 1 AS `cpf_pessoa`,
 1 AS `nome_pessoa`,
 1 AS `id_comanda`,
 1 AS `data_comanda`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `preco_produto`
--

DROP TABLE IF EXISTS `preco_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preco_produto` (
  `data_preco_produto` date NOT NULL,
  `preco_produto` double NOT NULL,
  `produto_id_produto` int NOT NULL,
  PRIMARY KEY (`produto_id_produto`,`data_preco_produto`),
  CONSTRAINT `fk_preco_produto_produto1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preco_produto`
--

LOCK TABLES `preco_produto` WRITE;
/*!40000 ALTER TABLE `preco_produto` DISABLE KEYS */;
INSERT INTO `preco_produto` VALUES ('2024-04-05',7,1),('2019-12-13',8.5,2),('2019-12-13',8,3),('2022-04-03',15,4),('2024-04-05',16,5),('2022-04-03',10.5,6),('2024-04-05',9,7),('2024-04-05',17,8),('2024-04-05',11,9),('2023-12-01',11,10),('2024-01-10',13,11),('2024-01-10',14,12),('2023-12-01',11,13),('2023-12-01',6.5,14),('2024-01-10',10,15),('2024-01-10',9,16),('2024-01-10',3,17),('2023-12-01',12,18),('2023-12-01',12.5,19),('2024-01-10',18,20),('2020-03-04',13,21),('2024-01-10',8.5,22),('2024-01-10',16,23),('2024-05-04',15,24);
/*!40000 ALTER TABLE `preco_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL,
  `nome_produto` varchar(50) NOT NULL,
  `quantidade_estoque` varchar(45) NOT NULL,
  `status_produto_id_status_produto` int NOT NULL,
  `forma_produto_id_forma_produto` int NOT NULL,
  PRIMARY KEY (`id_produto`,`nome_produto`),
  KEY `fk_produto_status_produto1_idx` (`status_produto_id_status_produto`),
  KEY `fk_produto_forma_produto1_idx` (`forma_produto_id_forma_produto`),
  CONSTRAINT `fk_produto_forma_produto1` FOREIGN KEY (`forma_produto_id_forma_produto`) REFERENCES `forma_produto` (`id_forma_produto`),
  CONSTRAINT `fk_produto_status_produto1` FOREIGN KEY (`status_produto_id_status_produto`) REFERENCES `status_produto` (`id_status_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Café_Expresso','55',1,2),(2,'Café_Americano','64',5,2),(3,'Café_com_Leite','32',1,2),(4,'Capuccino ','17',5,5),(5,'Chocolate_Quente','23',3,5),(6,'Mocha','34',2,2),(7,'Latte','11',5,5),(8,'Frappuccino','37',1,5),(9,'Chá_de _Ervas','20',6,2),(10,'Chá_preto','21',2,2),(11,'Café_Gelado','23',1,1),(12,'Limonada','45',1,1),(13,'Suco_Laranja','23',1,1),(14,'Brownie','20',1,3),(15,'Cupcake','12',1,6),(16,'Misto_Quente','24',1,6),(17,'Pão_de_Queijo','55',5,6),(18,'Ovo_mexido','23',2,6),(19,'Coxinha','46',1,4),(20,'Croissant','27',3,6),(21,'Folhado','15',6,6),(22,'Cokiee','30',1,4),(23,'Banoffe','5',4,3),(24,'Torta_Limão','6',4,3);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_has_comanda`
--

DROP TABLE IF EXISTS `produto_has_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_has_comanda` (
  `produto_id_produto` int NOT NULL,
  `comanda_id_comanda` int NOT NULL,
  `quantidade_produto` int NOT NULL,
  `preco_unitario` double NOT NULL,
  PRIMARY KEY (`produto_id_produto`,`comanda_id_comanda`),
  KEY `fk_produto_has_comanda_comanda1_idx` (`comanda_id_comanda`),
  KEY `fk_produto_has_comanda_produto1_idx` (`produto_id_produto`),
  CONSTRAINT `fk_produto_has_comanda_comanda1` FOREIGN KEY (`comanda_id_comanda`) REFERENCES `comanda` (`id_comanda`),
  CONSTRAINT `fk_produto_has_comanda_produto1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_has_comanda`
--

LOCK TABLES `produto_has_comanda` WRITE;
/*!40000 ALTER TABLE `produto_has_comanda` DISABLE KEYS */;
INSERT INTO `produto_has_comanda` VALUES (1,3,4,7),(1,8,1,7),(2,1,1,8.5),(3,5,2,8),(7,6,1,9),(8,4,1,17),(9,2,1,11),(12,1,1,14),(13,7,1,13),(15,3,3,10),(15,4,2,10),(16,4,2,9),(17,1,2,3),(17,2,2,3),(18,6,1,12),(20,5,3,18);
/*!40000 ALTER TABLE `produto_has_comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `select_e_orderby`
--

DROP TABLE IF EXISTS `select_e_orderby`;
/*!50001 DROP VIEW IF EXISTS `select_e_orderby`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `select_e_orderby` AS SELECT 
 1 AS `id_comanda`,
 1 AS `data_comanda`,
 1 AS `cliente_pessoa_cpf_pessoa`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `status_cliente`
--

DROP TABLE IF EXISTS `status_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_cliente` (
  `id_status_cliente` int NOT NULL,
  `nome_status_cliente` varchar(45) NOT NULL,
  PRIMARY KEY (`id_status_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_cliente`
--

LOCK TABLES `status_cliente` WRITE;
/*!40000 ALTER TABLE `status_cliente` DISABLE KEYS */;
INSERT INTO `status_cliente` VALUES (1,'novo'),(2,'regular'),(3,'frequente'),(4,'cancelado'),(5,'VIP');
/*!40000 ALTER TABLE `status_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_funcionario`
--

DROP TABLE IF EXISTS `status_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_funcionario` (
  `id_status_funcionario` int NOT NULL,
  `nome_status_funcionario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_status_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_funcionario`
--

LOCK TABLES `status_funcionario` WRITE;
/*!40000 ALTER TABLE `status_funcionario` DISABLE KEYS */;
INSERT INTO `status_funcionario` VALUES (1,'ativo'),(2,'afastado'),(3,'férias'),(4,'licença_maternidade'),(5,'licença_médica'),(6,'desligado');
/*!40000 ALTER TABLE `status_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_produto`
--

DROP TABLE IF EXISTS `status_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_produto` (
  `id_status_produto` int NOT NULL,
  `nome_status_produto` varchar(45) NOT NULL,
  PRIMARY KEY (`id_status_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_produto`
--

LOCK TABLES `status_produto` WRITE;
/*!40000 ALTER TABLE `status_produto` DISABLE KEYS */;
INSERT INTO `status_produto` VALUES (1,'disponível '),(2,'indisponível'),(3,'sazonal'),(4,'sob_encomenda'),(5,'destaque'),(6,'descontinuado');
/*!40000 ALTER TABLE `status_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `todas_informacoes_funcionarios`
--

DROP TABLE IF EXISTS `todas_informacoes_funcionarios`;
/*!50001 DROP VIEW IF EXISTS `todas_informacoes_funcionarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `todas_informacoes_funcionarios` AS SELECT 
 1 AS `nome_pessoa`,
 1 AS `cpf_pessoa`,
 1 AS `nome_cargo`,
 1 AS `data_cadastro`,
 1 AS `nome_status_funcionario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `todos_cafes`
--

DROP TABLE IF EXISTS `todos_cafes`;
/*!50001 DROP VIEW IF EXISTS `todos_cafes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `todos_cafes` AS SELECT 
 1 AS `id_produto`,
 1 AS `nome_produto`,
 1 AS `quantidade_estoque`,
 1 AS `status_produto_id_status_produto`,
 1 AS `forma_produto_id_forma_produto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `update_nome`
--

DROP TABLE IF EXISTS `update_nome`;
/*!50001 DROP VIEW IF EXISTS `update_nome`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `update_nome` AS SELECT 
 1 AS `cpf_pessoa`,
 1 AS `nome_pessoa`,
 1 AS `telefone_pessoa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `valor_total_cada_comanda`
--

DROP TABLE IF EXISTS `valor_total_cada_comanda`;
/*!50001 DROP VIEW IF EXISTS `valor_total_cada_comanda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `valor_total_cada_comanda` AS SELECT 
 1 AS `comanda_id_comanda`,
 1 AS `valor_total_comanda`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `estoque_,menor_15`
--

/*!50001 DROP VIEW IF EXISTS `estoque_,menor_15`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `estoque_,menor_15` AS select `produto`.`id_produto` AS `id_produto`,`produto`.`nome_produto` AS `nome_produto`,`produto`.`quantidade_estoque` AS `quantidade_estoque` from `produto` where (`produto`.`quantidade_estoque` < 15) order by `produto`.`id_produto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pessoa_comanda`
--

/*!50001 DROP VIEW IF EXISTS `pessoa_comanda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pessoa_comanda` AS select `pessoa`.`cpf_pessoa` AS `cpf_pessoa`,`pessoa`.`nome_pessoa` AS `nome_pessoa`,`comanda`.`id_comanda` AS `id_comanda`,`comanda`.`data_comanda` AS `data_comanda` from (`pessoa` join `comanda`) where (`pessoa`.`cpf_pessoa` = `comanda`.`cliente_pessoa_cpf_pessoa`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `select_e_orderby`
--

/*!50001 DROP VIEW IF EXISTS `select_e_orderby`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `select_e_orderby` AS select `comanda`.`id_comanda` AS `id_comanda`,`comanda`.`data_comanda` AS `data_comanda`,`comanda`.`cliente_pessoa_cpf_pessoa` AS `cliente_pessoa_cpf_pessoa` from `comanda` where (`comanda`.`funcionario_pessoa_cpf_pessoa` = '177') order by `comanda`.`data_comanda` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `todas_informacoes_funcionarios`
--

/*!50001 DROP VIEW IF EXISTS `todas_informacoes_funcionarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `todas_informacoes_funcionarios` AS select `pessoa`.`nome_pessoa` AS `nome_pessoa`,`pessoa`.`cpf_pessoa` AS `cpf_pessoa`,`cargo`.`nome_cargo` AS `nome_cargo`,`funcionario`.`data_cadastro` AS `data_cadastro`,`status_funcionario`.`nome_status_funcionario` AS `nome_status_funcionario` from (((`cargo` join `funcionario`) join `pessoa`) join `status_funcionario`) where ((`funcionario`.`cargo_id_cargo` = `cargo`.`id_cargo`) and (`funcionario`.`pessoa_cpf_pessoa` = `pessoa`.`cpf_pessoa`) and (`status_funcionario`.`id_status_funcionario` = `funcionario`.`status_id_status`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `todos_cafes`
--

/*!50001 DROP VIEW IF EXISTS `todos_cafes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `todos_cafes` AS select `produto`.`id_produto` AS `id_produto`,`produto`.`nome_produto` AS `nome_produto`,`produto`.`quantidade_estoque` AS `quantidade_estoque`,`produto`.`status_produto_id_status_produto` AS `status_produto_id_status_produto`,`produto`.`forma_produto_id_forma_produto` AS `forma_produto_id_forma_produto` from `produto` where (`produto`.`nome_produto` like 'Café%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `update_nome`
--

/*!50001 DROP VIEW IF EXISTS `update_nome`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `update_nome` AS select `pessoa`.`cpf_pessoa` AS `cpf_pessoa`,`pessoa`.`nome_pessoa` AS `nome_pessoa`,`pessoa`.`telefone_pessoa` AS `telefone_pessoa` from `pessoa` order by `pessoa`.`nome_pessoa` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `valor_total_cada_comanda`
--

/*!50001 DROP VIEW IF EXISTS `valor_total_cada_comanda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `valor_total_cada_comanda` AS select `produto_has_comanda`.`comanda_id_comanda` AS `comanda_id_comanda`,sum((`produto_has_comanda`.`preco_unitario` * `produto_has_comanda`.`quantidade_produto`)) AS `valor_total_comanda` from `produto_has_comanda` group by `produto_has_comanda`.`comanda_id_comanda` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-12 17:22:39
