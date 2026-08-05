-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/08/2026 às 22:43
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codcliente`, `cliente`, `email`, `cpf`) VALUES
(1, 'Emilly Jaquelini', 'emmy@gmail.com', '111.222.333-44'),
(2, 'Mariane Campos', 'mari334@gmail.com', '111.222.553-44'),
(3, 'Dalila Lyra', 'dalila9090@gmail.com', '111.542.333-44'),
(4, 'Jade Picon', 'jade000@gmail.com', '141.222.393-44'),
(5, 'Liana Garcia', 'Lianaaa@gmail.com', '111.772.333-44');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hospedagem`
--

CREATE TABLE `hospedagem` (
  `idhospedagem` int(11) NOT NULL,
  `dataentrada` date NOT NULL,
  `datasaida` date DEFAULT NULL,
  `horaentrada` time NOT NULL,
  `horasaida` time DEFAULT NULL,
  `totalhospedagem` decimal(7,2) DEFAULT NULL,
  `codcli` int(11) DEFAULT NULL,
  `codquarto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `hospedagem`
--

INSERT INTO `hospedagem` (`idhospedagem`, `dataentrada`, `datasaida`, `horaentrada`, `horasaida`, `totalhospedagem`, `codcli`, `codquarto`) VALUES
(1, '2026-11-21', NULL, '16:15:30', NULL, NULL, 1, 13),
(2, '2026-11-02', NULL, '06:05:30', NULL, NULL, 2, 12),
(3, '2026-05-14', NULL, '22:05:30', NULL, NULL, 3, 16),
(4, '2027-02-19', NULL, '15:55:30', NULL, NULL, 4, 15),
(5, '2026-09-16', NULL, '16:05:30', NULL, NULL, 5, 17);

-- --------------------------------------------------------

--
-- Estrutura para tabela `quarto`
--

CREATE TABLE `quarto` (
  `codquarto` int(11) NOT NULL,
  `quarto` varchar(255) NOT NULL,
  `andar` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quarto`
--

INSERT INTO `quarto` (`codquarto`, `quarto`, `andar`, `tipo`) VALUES
(11, '17', '1ºandar', 'Familia - 4 camas'),
(12, '22', '5ºandar', 'Familia - 7 camas'),
(13, '29', '5ºandar', 'Casal - 1 cama'),
(14, '8', '2ºandar', 'Familia - 3 camas'),
(15, '2', '1ºandar', 'Casal + 1 cama solteiro - 2 camas'),
(16, '12', '5ºandar', 'Casal duplo + solteiro- 3 camas casal'),
(17, '52', '9ºandar', 'Familia - 5 camas'),
(18, '10', '4ºandar', 'Suite  - 1 cama casal'),
(19, '27', '6ºandar', 'Suite - 2 camas'),
(20, '56', '9ºandar', 'Suite - 3 camas casal');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `codservico` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`codservico`, `servico`, `qtde`, `valor`, `tipo`) VALUES
(1, 'Coca-cola Zero', 0, 6.00, 'Bebidas'),
(2, 'M&M', 0, 6.50, 'Doces'),
(3, 'Energético', 0, 10.00, 'Bebidas'),
(4, 'Salgadinho', 0, 4.00, 'Comidas'),
(5, 'Spa', 0, 89.00, 'lazer'),
(6, 'Academia', 0, 30.00, 'Lazer'),
(7, 'Torta de morango', 0, 35.50, 'Doces'),
(8, 'Àgua 2l', 0, 10.00, 'Bebidas'),
(9, 'Sauna', 0, 35.00, 'Lazer'),
(10, 'Whisky', 0, 90.00, 'Bebidas'),
(11, 'Vinho tinto', 0, 57.00, 'Bebidas'),
(12, 'Massagem casal', 0, 258.00, 'lazer');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicoshospedagem`
--

CREATE TABLE `servicoshospedagem` (
  `idhospedagem` int(11) DEFAULT NULL,
  `idservico` int(11) DEFAULT NULL,
  `dataservico` date DEFAULT NULL,
  `horaservico` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicoshospedagem`
--

INSERT INTO `servicoshospedagem` (`idhospedagem`, `idservico`, `dataservico`, `horaservico`) VALUES
(1, 6, '2026-11-19', '17:01:18'),
(1, 3, '2026-11-19', '07:00:20'),
(1, 4, '2026-11-19', '17:00:20'),
(1, 5, '2026-11-19', '16:00:20'),
(2, 1, '2026-11-13', '06:00:20'),
(2, 11, '2026-11-13', '21:00:20'),
(2, 2, '2026-11-13', '13:00:20'),
(2, 7, '2026-11-13', '11:00:20'),
(3, 3, '2026-05-05', '17:06:22'),
(3, 8, '2026-05-06', '08:22:28'),
(3, 6, '2026-05-04', '05:00:28'),
(3, 2, '2026-05-13', '148:22:28'),
(4, 4, '2026-11-21', '16:00:20'),
(4, 10, '2026-02-13', '21:00:20'),
(4, 9, '2026-01-26', '15:00:20'),
(4, 7, '2026-06-23', '14:00:20'),
(5, 4, '2026-09-05', '07:01:18'),
(5, 2, '2026-09-26', '17:00:20'),
(5, 12, '2026-09-30', '18:00:20'),
(5, 9, '2026-09-12', '15:00:20');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD PRIMARY KEY (`idhospedagem`),
  ADD KEY `codcli` (`codcli`),
  ADD KEY `codquarto` (`codquarto`);

--
-- Índices de tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`codquarto`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `andar` (`andar`);
ALTER TABLE `quarto` ADD FULLTEXT KEY `tipo` (`tipo`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`codservico`);

--
-- Índices de tabela `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD KEY `idhospedagem` (`idhospedagem`),
  ADD KEY `idservico` (`idservico`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `hospedagem`
--
ALTER TABLE `hospedagem`
  MODIFY `idhospedagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `codquarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `codservico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `hospedagem`
--
ALTER TABLE `hospedagem`
  ADD CONSTRAINT `hospedagem_ibfk_1` FOREIGN KEY (`codcli`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `hospedagem_ibfk_2` FOREIGN KEY (`codquarto`) REFERENCES `quarto` (`codquarto`);

--
-- Restrições para tabelas `servicoshospedagem`
--
ALTER TABLE `servicoshospedagem`
  ADD CONSTRAINT `servicoshospedagem_ibfk_1` FOREIGN KEY (`idhospedagem`) REFERENCES `hospedagem` (`idhospedagem`),
  ADD CONSTRAINT `servicoshospedagem_ibfk_2` FOREIGN KEY (`idservico`) REFERENCES `servico` (`codservico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
