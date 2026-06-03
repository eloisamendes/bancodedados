-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jun-2026 às 22:56
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `produtos`
--
CREATE DATABASE IF NOT EXISTS `produtos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `produtos`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`) VALUES
(1, 'Enlatados'),
(2, 'Laticínios'),
(3, 'Açougue'),
(4, 'Limpeza'),
(5, 'Bebidas'),
(6, 'Beleza');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `idproduto` int(11) NOT NULL,
  `produto` varchar(200) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtde` int(11) NOT NULL,
  `data` date NOT NULL,
  `ativo` bit(1) NOT NULL,
  `idcat` int(11) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`idproduto`, `produto`, `preco`, `qtde`, `data`, `ativo`, `idcat`, `observacao`, `marca`) VALUES
(1, 'Acém Peça', '39.99', 50, '2026-05-13', b'1', 3, 'Sem gordura', 'Sadia'),
(2, 'Milho', '5.99', 30, '2026-08-27', b'1', 1, 'Milho Verde', 'Quero'),
(3, 'Macarrão', '8.50', 20, '2027-01-10', b'1', 1, 'Pacote 500g', 'Adria'),
(4, 'Esmalte', '7.90', 25, '2026-10-12', b'1', 5, 'Leo Mandou Flores', 'Risqué'),
(5, 'Picanha', '79.90', 10, '2027-06-22', b'1', 3, 'Corte premium', 'Swift'),
(6, 'Detergente', '3.49', 40, '2026-05-10', b'1', 4, 'Neutro 500ml', 'Ypê'),
(7, 'Molho de Tomate', '4.75', 28, '2027-11-03', b'1', 1, 'Sachê 300g', 'Fugini'),
(8, 'Queijo Mussarela', '18.50', 12, '2025-12-27', b'1', 2, 'Fatiado 300g', 'Vigor'),
(9, 'Shampoo Hidratante', '19.90', 14, '2026-07-18', b'1', 5, 'Frasco 400ml', 'Pantene'),
(10, 'Refrigerante Cola', '11.50', 30, '2027-03-09', b'1', 6, 'Garrafa 2L', 'Coca-Cola'),
(11, 'Sabão em pó', '48.50', 22, '2026-09-19', b'1', 4, 'Pacote 4kg', 'Omo'),
(12, 'Leite', '14.00', 46, '2026-06-01', b'1', 6, 'Sem lactose', 'Italac'),
(13, 'Condicionador', '30.99', 60, '2027-11-02', b'1', 5, 'Para cachos', 'Elseve');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `idcat` (`idcat`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categoria` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
