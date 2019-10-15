-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Out-2019 às 19:58
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `teste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ativo`
--

CREATE TABLE `ativo` (
  `id` int(11) NOT NULL,
  `data_cad` datetime NOT NULL,
  `data_exc` datetime DEFAULT NULL,
  `cnpj` varchar(50) DEFAULT NULL,
  `conv_cota_aplic` int(11) DEFAULT NULL,
  `conv_cota_aplic_util` tinyint(1) DEFAULT NULL,
  `conv_cota_aplic_desc` varchar(255) DEFAULT NULL,
  `conv_cota_resg` int(11) DEFAULT NULL,
  `conv_cota_resg_util` tinyint(1) DEFAULT NULL,
  `conv_cota_resg_desc` varchar(255) DEFAULT NULL,
  `objetivo` varchar(255) DEFAULT NULL,
  `prazo_pag` int(11) DEFAULT NULL,
  `prazo_pag_util` tinyint(1) DEFAULT NULL,
  `prazo_pag_desc` varchar(255) DEFAULT NULL,
  `politica_invest` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ativo`
--

INSERT INTO `ativo` (`id`, `data_cad`, `data_exc`, `cnpj`, `conv_cota_aplic`, `conv_cota_aplic_util`, `conv_cota_aplic_desc`, `conv_cota_resg`, `conv_cota_resg_util`, `conv_cota_resg_desc`, `objetivo`, `prazo_pag`, `prazo_pag_util`, `prazo_pag_desc`, `politica_invest`) VALUES
(1, '2019-10-15 13:04:30', NULL, '13.555.918/0001-49', NULL, NULL, 'Não se aplica', NULL, NULL, 'Não se aplica', 'Aquisição de terrenos e imóveis comerciais e residenciais, ou direitos reais a eles relativos, objetivando auferir ganhos por meio da locação, arrendamento ou alienação dos imóveis ou por meios de ganhos de capital dos ativos financeiros da carteira.', NULL, NULL, NULL, 'Investir em imóveis, CRI, cotas de outros FIIs, ações ou cotas de sociedades, podendo ainda investir em títulos de renda fixa para necessidades de liquidez. É permitido operações com derivativos apenas para proteção patrimonial.'),
(2, '2019-10-15 13:07:59', NULL, '12.312.767/0001-35', NULL, NULL, 'Não se aplica', NULL, NULL, 'Não se aplica', 'Proporcionar valorização de capital no longo prazo.', NULL, NULL, NULL, 'Investe em ações ou Títulos e Valores Mobiliários, conversíveis ou permutáveis em ações da Tree Florestal Empreendimentos e Participações S.A., inscrito no CNPJ sob o nº 15.305.977/0001-94.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ativo_log`
--

CREATE TABLE `ativo_log` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `ativo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_adm_ges_dis`
--

CREATE TABLE `at_adm_ges_dis` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_cad` datetime NOT NULL,
  `data_exc` datetime DEFAULT NULL,
  `cnpj` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_adm_ges_dis_log`
--

CREATE TABLE `at_adm_ges_dis_log` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `at_adm_ges_dis_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_benchmark`
--

CREATE TABLE `at_benchmark` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `data_cad` datetime NOT NULL,
  `data_exc` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_benchmark_log`
--

CREATE TABLE `at_benchmark_log` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `at_benchmark_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_conta_contabil`
--

CREATE TABLE `at_conta_contabil` (
  `id` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `data_cad` datetime NOT NULL,
  `data_exc` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_conta_contabil_log`
--

CREATE TABLE `at_conta_contabil_log` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `at_conta_contabil_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_hist_adm_ges_dis`
--

CREATE TABLE `at_hist_adm_ges_dis` (
  `id` int(11) NOT NULL,
  `data_ini` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `ativo_id` int(11) NOT NULL,
  `at_tipo_relac_id` int(11) NOT NULL,
  `at_adm_ges_dis_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_hist_benchmark`
--

CREATE TABLE `at_hist_benchmark` (
  `id` int(11) NOT NULL,
  `data_ini` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `ativo_id` int(11) NOT NULL,
  `at_benchmark_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_hist_conta_contabil`
--

CREATE TABLE `at_hist_conta_contabil` (
  `id` int(11) NOT NULL,
  `data_ini` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `ativo_id` int(11) NOT NULL,
  `at_conta_contabil_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_hist_lim`
--

CREATE TABLE `at_hist_lim` (
  `id` int(11) NOT NULL,
  `ativo_id` int(11) NOT NULL,
  `mod_enq_lim_hist_dec_id` int(11) NOT NULL,
  `mod_enq_lim_hist_perc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_hist_nome`
--

CREATE TABLE `at_hist_nome` (
  `id` int(11) NOT NULL,
  `data_ini` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `ativo_id` int(11) NOT NULL,
  `at_nome_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `at_hist_nome`
--

INSERT INTO `at_hist_nome` (`id`, `data_ini`, `data_fim`, `ativo_id`, `at_nome_id`) VALUES
(1, '2019-10-15 13:47:15', NULL, 1, 1),
(2, '2019-10-15 13:47:15', NULL, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_nome`
--

CREATE TABLE `at_nome` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_cad` datetime NOT NULL,
  `data_exc` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `at_nome`
--

INSERT INTO `at_nome` (`id`, `nome`, `data_cad`, `data_exc`) VALUES
(1, 'ÁQUILLA FII - AQLL11', '2019-10-15 13:46:20', NULL),
(2, 'ÁTICO FLORESTAL MULTIESTRATÉGIA FIP', '2019-10-15 13:46:38', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_nome_log`
--

CREATE TABLE `at_nome_log` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `at_nome_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `at_tipo_relac`
--

CREATE TABLE `at_tipo_relac` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id` int(11) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `cep` varchar(9) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `uf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos_log`
--

CREATE TABLE `enderecos_log` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `endereco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `limite_mod_enq`
--

CREATE TABLE `limite_mod_enq` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `limite_mod_enq`
--

INSERT INTO `limite_mod_enq` (`id`, `descricao`) VALUES
(1, 'Limite Resolução Máximo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mod_enq`
--

CREATE TABLE `mod_enq` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `abrev` varchar(255) NOT NULL,
  `nivel_mod_enq_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mod_enq_lim_hist_dec`
--

CREATE TABLE `mod_enq_lim_hist_dec` (
  `id` int(11) NOT NULL,
  `valor_dec` decimal(20,5) NOT NULL,
  `data_ini` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `limite_mod_enq_id` int(11) NOT NULL,
  `mod_enq_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mod_enq_lim_hist_perc`
--

CREATE TABLE `mod_enq_lim_hist_perc` (
  `id` int(11) NOT NULL,
  `valor_perc` decimal(20,2) NOT NULL,
  `data_ini` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `limite_mod_enq_id` int(11) NOT NULL,
  `mod_enq_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivel_mod_enq`
--

CREATE TABLE `nivel_mod_enq` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_fisica`
--

CREATE TABLE `pessoa_fisica` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `rg` varchar(50) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `naturalidade` varchar(100) DEFAULT NULL,
  `uf` int(11) DEFAULT NULL,
  `sexo` tinyint(1) DEFAULT NULL,
  `reponsavel_legal` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_fisica_log`
--

CREATE TABLE `pessoa_fisica_log` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `pessoa_fisica_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relac_enderecos`
--

CREATE TABLE `relac_enderecos` (
  `id` int(11) NOT NULL,
  `data_ini` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `pessoa_fisica_id` int(11) NOT NULL,
  `endereco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relac_mod_enq`
--

CREATE TABLE `relac_mod_enq` (
  `id` int(11) NOT NULL,
  `data_ini` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `subordinados` varchar(255) NOT NULL,
  `mod_enq_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relac_pessoafis_admgesdis`
--

CREATE TABLE `relac_pessoafis_admgesdis` (
  `id` int(11) NOT NULL,
  `data_ini` datetime NOT NULL,
  `data_fim` datetime DEFAULT NULL,
  `pessoa_fisica_id` int(11) NOT NULL,
  `at_adm_ges_dis_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uf`
--

CREATE TABLE `uf` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sigla` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `ativo`
--
ALTER TABLE `ativo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ativo_log`
--
ALTER TABLE `ativo_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ativo_id` (`ativo_id`);

--
-- Índices para tabela `at_adm_ges_dis`
--
ALTER TABLE `at_adm_ges_dis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `at_adm_ges_dis_log`
--
ALTER TABLE `at_adm_ges_dis_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `at_adm_ges_dis_id` (`at_adm_ges_dis_id`);

--
-- Índices para tabela `at_benchmark`
--
ALTER TABLE `at_benchmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `at_benchmark_log`
--
ALTER TABLE `at_benchmark_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `at_benchmark_id` (`at_benchmark_id`);

--
-- Índices para tabela `at_conta_contabil`
--
ALTER TABLE `at_conta_contabil`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `at_conta_contabil_log`
--
ALTER TABLE `at_conta_contabil_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `at_conta_contabil_id` (`at_conta_contabil_id`);

--
-- Índices para tabela `at_hist_adm_ges_dis`
--
ALTER TABLE `at_hist_adm_ges_dis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ativo_id` (`ativo_id`,`at_tipo_relac_id`,`at_adm_ges_dis_id`),
  ADD KEY `at_hist_adm_ges_dis_ibfk_1` (`at_adm_ges_dis_id`),
  ADD KEY `at_hist_adm_ges_dis_ibfk_3` (`at_tipo_relac_id`);

--
-- Índices para tabela `at_hist_benchmark`
--
ALTER TABLE `at_hist_benchmark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ativo_id` (`ativo_id`),
  ADD KEY `at_benchmark_id` (`at_benchmark_id`);

--
-- Índices para tabela `at_hist_conta_contabil`
--
ALTER TABLE `at_hist_conta_contabil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ativo_id` (`ativo_id`),
  ADD KEY `at_conta_contabil_id` (`at_conta_contabil_id`);

--
-- Índices para tabela `at_hist_lim`
--
ALTER TABLE `at_hist_lim`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ativo_id` (`ativo_id`),
  ADD KEY `mod_enq_lim_hist_dec_id` (`mod_enq_lim_hist_dec_id`),
  ADD KEY `mod_enq_lim_hist_perc_id` (`mod_enq_lim_hist_perc_id`);

--
-- Índices para tabela `at_hist_nome`
--
ALTER TABLE `at_hist_nome`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ativo_id` (`ativo_id`),
  ADD KEY `at_nome_id` (`at_nome_id`);

--
-- Índices para tabela `at_nome`
--
ALTER TABLE `at_nome`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `at_nome_log`
--
ALTER TABLE `at_nome_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `at_nome_id` (`at_nome_id`);

--
-- Índices para tabela `at_tipo_relac`
--
ALTER TABLE `at_tipo_relac`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uf` (`uf`);

--
-- Índices para tabela `enderecos_log`
--
ALTER TABLE `enderecos_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `endereco_id` (`endereco_id`);

--
-- Índices para tabela `limite_mod_enq`
--
ALTER TABLE `limite_mod_enq`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `mod_enq`
--
ALTER TABLE `mod_enq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nivel_mod_enq_id` (`nivel_mod_enq_id`);

--
-- Índices para tabela `mod_enq_lim_hist_dec`
--
ALTER TABLE `mod_enq_lim_hist_dec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `limite_mod_enq_id` (`limite_mod_enq_id`),
  ADD KEY `mod_enq_id` (`mod_enq_id`);

--
-- Índices para tabela `mod_enq_lim_hist_perc`
--
ALTER TABLE `mod_enq_lim_hist_perc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `limite_mod_enq_id` (`limite_mod_enq_id`),
  ADD KEY `mod_enq_id` (`mod_enq_id`);

--
-- Índices para tabela `nivel_mod_enq`
--
ALTER TABLE `nivel_mod_enq`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uf` (`uf`);

--
-- Índices para tabela `pessoa_fisica_log`
--
ALTER TABLE `pessoa_fisica_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pessoa_fisica_id` (`pessoa_fisica_id`);

--
-- Índices para tabela `relac_enderecos`
--
ALTER TABLE `relac_enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pessoa_fisica_id` (`pessoa_fisica_id`),
  ADD KEY `endereco_id` (`endereco_id`);

--
-- Índices para tabela `relac_mod_enq`
--
ALTER TABLE `relac_mod_enq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mod_enq_id` (`mod_enq_id`);

--
-- Índices para tabela `relac_pessoafis_admgesdis`
--
ALTER TABLE `relac_pessoafis_admgesdis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pessoa_fisica_id` (`pessoa_fisica_id`),
  ADD KEY `at_adm_ges_dis_id` (`at_adm_ges_dis_id`);

--
-- Índices para tabela `uf`
--
ALTER TABLE `uf`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ativo`
--
ALTER TABLE `ativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `ativo_log`
--
ALTER TABLE `ativo_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_adm_ges_dis`
--
ALTER TABLE `at_adm_ges_dis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_adm_ges_dis_log`
--
ALTER TABLE `at_adm_ges_dis_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_benchmark`
--
ALTER TABLE `at_benchmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_benchmark_log`
--
ALTER TABLE `at_benchmark_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_conta_contabil`
--
ALTER TABLE `at_conta_contabil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_conta_contabil_log`
--
ALTER TABLE `at_conta_contabil_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_hist_adm_ges_dis`
--
ALTER TABLE `at_hist_adm_ges_dis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_hist_benchmark`
--
ALTER TABLE `at_hist_benchmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_hist_conta_contabil`
--
ALTER TABLE `at_hist_conta_contabil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_hist_lim`
--
ALTER TABLE `at_hist_lim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_hist_nome`
--
ALTER TABLE `at_hist_nome`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `at_nome`
--
ALTER TABLE `at_nome`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `at_nome_log`
--
ALTER TABLE `at_nome_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `at_tipo_relac`
--
ALTER TABLE `at_tipo_relac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `enderecos_log`
--
ALTER TABLE `enderecos_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `limite_mod_enq`
--
ALTER TABLE `limite_mod_enq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `mod_enq`
--
ALTER TABLE `mod_enq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mod_enq_lim_hist_dec`
--
ALTER TABLE `mod_enq_lim_hist_dec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mod_enq_lim_hist_perc`
--
ALTER TABLE `mod_enq_lim_hist_perc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nivel_mod_enq`
--
ALTER TABLE `nivel_mod_enq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pessoa_fisica_log`
--
ALTER TABLE `pessoa_fisica_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relac_enderecos`
--
ALTER TABLE `relac_enderecos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relac_mod_enq`
--
ALTER TABLE `relac_mod_enq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `relac_pessoafis_admgesdis`
--
ALTER TABLE `relac_pessoafis_admgesdis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `uf`
--
ALTER TABLE `uf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ativo_log`
--
ALTER TABLE `ativo_log`
  ADD CONSTRAINT `ativo_log_ibfk_1` FOREIGN KEY (`ativo_id`) REFERENCES `ativo` (`id`);

--
-- Limitadores para a tabela `at_adm_ges_dis_log`
--
ALTER TABLE `at_adm_ges_dis_log`
  ADD CONSTRAINT `at_adm_ges_dis_log_ibfk_1` FOREIGN KEY (`at_adm_ges_dis_id`) REFERENCES `at_adm_ges_dis` (`id`);

--
-- Limitadores para a tabela `at_benchmark_log`
--
ALTER TABLE `at_benchmark_log`
  ADD CONSTRAINT `at_benchmark_log_ibfk_1` FOREIGN KEY (`at_benchmark_id`) REFERENCES `at_benchmark` (`id`);

--
-- Limitadores para a tabela `at_conta_contabil_log`
--
ALTER TABLE `at_conta_contabil_log`
  ADD CONSTRAINT `at_conta_contabil_log_ibfk_1` FOREIGN KEY (`at_conta_contabil_id`) REFERENCES `at_conta_contabil` (`id`);

--
-- Limitadores para a tabela `at_hist_adm_ges_dis`
--
ALTER TABLE `at_hist_adm_ges_dis`
  ADD CONSTRAINT `at_hist_adm_ges_dis_ibfk_1` FOREIGN KEY (`at_adm_ges_dis_id`) REFERENCES `at_adm_ges_dis` (`id`),
  ADD CONSTRAINT `at_hist_adm_ges_dis_ibfk_2` FOREIGN KEY (`ativo_id`) REFERENCES `ativo` (`id`),
  ADD CONSTRAINT `at_hist_adm_ges_dis_ibfk_3` FOREIGN KEY (`at_tipo_relac_id`) REFERENCES `at_tipo_relac` (`id`);

--
-- Limitadores para a tabela `at_hist_benchmark`
--
ALTER TABLE `at_hist_benchmark`
  ADD CONSTRAINT `at_hist_benchmark_ibfk_1` FOREIGN KEY (`ativo_id`) REFERENCES `ativo` (`id`),
  ADD CONSTRAINT `at_hist_benchmark_ibfk_2` FOREIGN KEY (`at_benchmark_id`) REFERENCES `at_benchmark` (`id`);

--
-- Limitadores para a tabela `at_hist_conta_contabil`
--
ALTER TABLE `at_hist_conta_contabil`
  ADD CONSTRAINT `at_hist_conta_contabil_ibfk_1` FOREIGN KEY (`ativo_id`) REFERENCES `ativo` (`id`),
  ADD CONSTRAINT `at_hist_conta_contabil_ibfk_2` FOREIGN KEY (`at_conta_contabil_id`) REFERENCES `at_conta_contabil` (`id`);

--
-- Limitadores para a tabela `at_hist_lim`
--
ALTER TABLE `at_hist_lim`
  ADD CONSTRAINT `at_hist_lim_ibfk_1` FOREIGN KEY (`ativo_id`) REFERENCES `ativo` (`id`),
  ADD CONSTRAINT `at_hist_lim_ibfk_2` FOREIGN KEY (`mod_enq_lim_hist_dec_id`) REFERENCES `mod_enq_lim_hist_dec` (`id`),
  ADD CONSTRAINT `at_hist_lim_ibfk_3` FOREIGN KEY (`mod_enq_lim_hist_perc_id`) REFERENCES `mod_enq_lim_hist_perc` (`id`);

--
-- Limitadores para a tabela `at_hist_nome`
--
ALTER TABLE `at_hist_nome`
  ADD CONSTRAINT `at_hist_nome_ibfk_1` FOREIGN KEY (`at_nome_id`) REFERENCES `at_nome` (`id`),
  ADD CONSTRAINT `at_hist_nome_ibfk_2` FOREIGN KEY (`ativo_id`) REFERENCES `ativo` (`id`);

--
-- Limitadores para a tabela `at_nome_log`
--
ALTER TABLE `at_nome_log`
  ADD CONSTRAINT `at_nome_log_ibfk_1` FOREIGN KEY (`at_nome_id`) REFERENCES `at_nome` (`id`);

--
-- Limitadores para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`uf`) REFERENCES `uf` (`id`);

--
-- Limitadores para a tabela `enderecos_log`
--
ALTER TABLE `enderecos_log`
  ADD CONSTRAINT `enderecos_log_ibfk_1` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`);

--
-- Limitadores para a tabela `mod_enq`
--
ALTER TABLE `mod_enq`
  ADD CONSTRAINT `mod_enq_ibfk_1` FOREIGN KEY (`nivel_mod_enq_id`) REFERENCES `nivel_mod_enq` (`id`);

--
-- Limitadores para a tabela `mod_enq_lim_hist_dec`
--
ALTER TABLE `mod_enq_lim_hist_dec`
  ADD CONSTRAINT `mod_enq_lim_hist_dec_ibfk_1` FOREIGN KEY (`limite_mod_enq_id`) REFERENCES `limite_mod_enq` (`id`),
  ADD CONSTRAINT `mod_enq_lim_hist_dec_ibfk_2` FOREIGN KEY (`mod_enq_id`) REFERENCES `mod_enq` (`id`);

--
-- Limitadores para a tabela `mod_enq_lim_hist_perc`
--
ALTER TABLE `mod_enq_lim_hist_perc`
  ADD CONSTRAINT `mod_enq_lim_hist_perc_ibfk_1` FOREIGN KEY (`limite_mod_enq_id`) REFERENCES `limite_mod_enq` (`id`),
  ADD CONSTRAINT `mod_enq_lim_hist_perc_ibfk_2` FOREIGN KEY (`mod_enq_id`) REFERENCES `mod_enq` (`id`);

--
-- Limitadores para a tabela `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
  ADD CONSTRAINT `pessoa_fisica_ibfk_1` FOREIGN KEY (`uf`) REFERENCES `uf` (`id`);

--
-- Limitadores para a tabela `pessoa_fisica_log`
--
ALTER TABLE `pessoa_fisica_log`
  ADD CONSTRAINT `pessoa_fisica_log_ibfk_1` FOREIGN KEY (`pessoa_fisica_id`) REFERENCES `pessoa_fisica` (`id`);

--
-- Limitadores para a tabela `relac_enderecos`
--
ALTER TABLE `relac_enderecos`
  ADD CONSTRAINT `relac_enderecos_ibfk_1` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`),
  ADD CONSTRAINT `relac_enderecos_ibfk_2` FOREIGN KEY (`pessoa_fisica_id`) REFERENCES `pessoa_fisica` (`id`);

--
-- Limitadores para a tabela `relac_mod_enq`
--
ALTER TABLE `relac_mod_enq`
  ADD CONSTRAINT `relac_mod_enq_ibfk_1` FOREIGN KEY (`mod_enq_id`) REFERENCES `mod_enq` (`id`);

--
-- Limitadores para a tabela `relac_pessoafis_admgesdis`
--
ALTER TABLE `relac_pessoafis_admgesdis`
  ADD CONSTRAINT `relac_pessoafis_admgesdis_ibfk_1` FOREIGN KEY (`at_adm_ges_dis_id`) REFERENCES `at_adm_ges_dis` (`id`),
  ADD CONSTRAINT `relac_pessoafis_admgesdis_ibfk_2` FOREIGN KEY (`pessoa_fisica_id`) REFERENCES `pessoa_fisica` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
