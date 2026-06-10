-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/06/2026 às 03:06
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `produto`
--
CREATE DATABASE IF NOT EXISTS `produto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `produto`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `categoria`) VALUES
(1, 'Enlatados'),
(2, 'Laticínios'),
(3, 'Açougue'),
(4, 'Limpeza'),
(5, 'Bebidas'),
(6, 'Beleza'),
(7, 'Padaria'),
(8, 'Hortifruti');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
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
  `marca` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`idproduto`, `produto`, `preco`, `qtde`, `data`, `ativo`, `idcat`, `observacao`, `marca`) VALUES
(1, 'Acém Peça', 39.99, 50, '2026-05-13', b'1', 3, 'Sem gordura', 'Friboi'),
(2, 'Milho', 5.99, 30, '2026-08-27', b'1', 1, 'Milho Verde', 'Quero'),
(3, 'Leite Integral', 6.49, 40, '2026-06-01', b'1', 2, 'Caixa 1L', 'Piracanjuba'),
(4, 'Queijo Mussarela', 34.90, 20, '2026-06-02', b'1', 2, 'Peça fatiada', 'Tirolez'),
(5, 'Refrigerante Cola', 8.99, 60, '2026-06-03', b'1', 5, 'Garrafa 2L', 'Coca-Cola'),
(6, 'Água Mineral', 2.50, 100, '2026-06-03', b'1', 5, 'Sem gás', 'Crystal'),
(7, 'Shampoo', 15.99, 25, '2026-06-04', b'1', 6, 'Cabelos normais', 'Pantene'),
(8, 'Condicionador', 17.99, 20, '2026-06-04', b'1', 6, 'Hidratação', 'Pantene'),
(9, 'Sabão em Pó', 22.50, 30, '2026-06-05', b'1', 4, 'Pacote 2kg', 'OMO'),
(10, 'Detergente', 3.29, 80, '2026-06-05', b'1', 4, 'Neutro', 'Ypê'),
(11, 'Pão Francês', 14.99, 15, '2026-06-06', b'1', 7, 'Preço por kg', 'Pullman'),
(12, 'Bolo de Chocolate', 24.90, 10, '2026-06-06', b'1', 7, 'Produção própria', 'Bauducco'),
(13, 'Maçã Gala', 8.99, 50, '2026-06-07', b'1', 8, 'Preço por kg', 'Turma da Mônica'),
(14, 'Banana Nanica', 5.49, 70, '2026-06-07', b'1', 8, 'Preço por kg', 'Sítio Boa Vista'),
(15, 'Ervilha', 4.99, 35, '2026-06-08', b'1', 1, 'Lata 200g', 'Quero'),
(16, 'Atum', 9.90, 25, '2026-06-08', b'1', 1, 'Lata em óleo', 'Gomes da Costa');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `idcat` (`idcat`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categoria` (`idcategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
