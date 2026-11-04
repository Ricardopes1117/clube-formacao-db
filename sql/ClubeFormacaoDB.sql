USE [master]
GO
/****** Object:  Database [ClubeFormacaoDB]    Script Date: 04/11/2026 17:41:05 ******/
CREATE DATABASE [ClubeFormacaoDB]
GO
ALTER DATABASE [ClubeFormacaoDB] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClubeFormacaoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClubeFormacaoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClubeFormacaoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClubeFormacaoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClubeFormacaoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClubeFormacaoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ClubeFormacaoDB] SET  MULTI_USER 
GO
ALTER DATABASE [ClubeFormacaoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClubeFormacaoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClubeFormacaoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClubeFormacaoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClubeFormacaoDB] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [ClubeFormacaoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClubeFormacaoDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ClubeFormacaoDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ClubeFormacaoDB]
GO
/****** Object:  Table [dbo].[Jogador]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jogador](
	[id_jogador] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[data_nascimento] [date] NOT NULL,
	[telefone] [int] NULL,
	[morada] [varchar](200) NULL,
	[NIF] [int] NULL,
	[menor_idade] [bit] NOT NULL,
	[email] [varchar](100) NULL,
	[id_enc_educacao] [int] NULL,
	[ativo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_jogador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Jogador] UNIQUE NONCLUSTERED 
(
	[nome] ASC,
	[data_nascimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Epoca_Desportiva]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Epoca_Desportiva](
	[id_epoca] [int] IDENTITY(1,1) NOT NULL,
	[designacao] [varchar](20) NOT NULL,
	[data_inicio] [date] NOT NULL,
	[data_fim] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_epoca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[designacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Escalao]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Escalao](
	[id_escalao] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[ano_min_nascimento] [int] NOT NULL,
	[ano_max_nascimento] [int] NOT NULL,
	[valor_quota] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_escalao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Escalao_Epoca]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Escalao_Epoca](
	[id_escalao_epoca] [int] IDENTITY(1,1) NOT NULL,
	[id_escalao] [int] NOT NULL,
	[id_epoca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_escalao_epoca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_EscalaoEpoca] UNIQUE NONCLUSTERED 
(
	[id_escalao] ASC,
	[id_epoca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscricao]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscricao](
	[id_inscricao] [int] IDENTITY(1,1) NOT NULL,
	[data_inscricao] [date] NOT NULL,
	[estado] [varchar](20) NOT NULL,
	[nr_federado] [varchar](30) NOT NULL,
	[data_validade_federacao] [date] NULL,
	[documentacao_completa] [bit] NOT NULL,
	[id_jogador] [int] NOT NULL,
	[id_escalao_epoca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_inscricao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Inscricao_Federado] UNIQUE NONCLUSTERED 
(
	[nr_federado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Inscricao_JogadorEpoca] UNIQUE NONCLUSTERED 
(
	[id_jogador] ASC,
	[id_escalao_epoca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_JogadoresInscritosEscalao]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

--  VIEWS OBRIGATÓRIAS – Gestão da Formação num Clube Desportivo
-- V01: V_JogadoresInscritosEscalao
-- Enunciado: "Consultar os jogadores inscritos em cada escalão
--             numa determinada época, com indicação do estado
--             da inscrição federativa."
-- Como usar: SELECT * FROM V_JogadoresInscritosEscalao
--            WHERE Escalao = 'Benjamins' AND Epoca = '2025/2026'
CREATE   VIEW [dbo].[V_JogadoresInscritosEscalao] AS
SELECT
    j.nome                          AS Nome_Jogador,
    j.data_nascimento               AS Data_Nascimento,
    j.email                         AS Email_Jogador,
    j.telefone                      AS Telefone_Jogador,
    e.nome                          AS Escalao,
    ep.designacao                   AS Epoca,
    insc.estado                     AS Estado_Inscricao,
    insc.nr_federado                AS Numero_Federado,
    insc.data_validade_federacao    AS Validade_Federacao,
    -- Indica o estado federativo de forma legível
    CASE
        WHEN insc.nr_federado IS NULL
            THEN 'Não Federado'
        WHEN insc.data_validade_federacao IS NULL
            THEN 'Federado (sem validade)'
        WHEN insc.data_validade_federacao < GETDATE()
            THEN 'Federação Expirada'
        WHEN insc.data_validade_federacao < DATEADD(DAY, 30, GETDATE())
            THEN 'Federação a Expirar (< 30 dias)'
        ELSE 'Federação Válida'
    END                             AS Estado_Federativo,
    insc.documentacao_completa      AS Documentacao_Completa,
    insc.data_inscricao              AS Data_Inscricao
FROM Jogador          j
JOIN Inscricao        insc ON insc.id_jogador       = j.id_jogador
JOIN Escalao_Epoca    ee   ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao          e    ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva ep   ON ep.id_epoca           = ee.id_epoca
-- Só jogadores ativos
WHERE j.ativo = 1;
GO
/****** Object:  Table [dbo].[Encarregado_Educacao]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encarregado_Educacao](
	[id_enc_educacao] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[telefone] [varchar](15) NOT NULL,
	[morada] [varchar](200) NULL,
	[email] [varchar](100) NULL,
	[relacao] [varchar](30) NOT NULL,
	[NIF] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_enc_educacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_EE_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_EE_Telefone] UNIQUE NONCLUSTERED 
(
	[telefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quota]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quota](
	[id_quota] [int] IDENTITY(1,1) NOT NULL,
	[data_vencimento] [date] NOT NULL,
	[valor] [decimal](5, 2) NOT NULL,
	[pago] [bit] NOT NULL,
	[id_inscricao] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_quota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Quota_Mensalidade] UNIQUE NONCLUSTERED 
(
	[id_inscricao] ASC,
	[data_vencimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagamento]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagamento](
	[id_pagamento] [int] IDENTITY(1,1) NOT NULL,
	[data_pagamento] [date] NOT NULL,
	[valor_pago] [decimal](5, 2) NOT NULL,
	[metodo_pagamento] [varchar](30) NOT NULL,
	[id_quota] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id_quota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_QuotasEmAtraso]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

-- V02: V_QuotasEmAtraso
-- Enunciado: "Identificar automaticamente jogadores com quotas
--             em atraso (data de vencimento ultrapassada sem
--             registo de pagamento)."
-- Como usar: SELECT * FROM V_QuotasEmAtraso
--            WHERE Nome_Jogador = 'João Silva'

CREATE   VIEW [dbo].[V_QuotasEmAtraso] AS
SELECT
    j.nome                      AS Nome_Jogador,
    j.email                     AS Email_Jogador,
    j.telefone                  AS Telefone_Jogador,
    -- Dados do encarregado de educação (se menor)
    ee_ed.nome                  AS Nome_Encarregado,
    ee_ed.telefone              AS Telefone_Encarregado,
    e.nome                      AS Escalao,
    ep.designacao               AS Epoca,
    q.data_vencimento           AS Data_Vencimento,
    q.valor                     AS Valor_Em_Divida,
    -- Calcula quantos dias está em atraso
    DATEDIFF(DAY, q.data_vencimento, GETDATE()) AS Dias_Em_Atraso
FROM Jogador                j
JOIN Inscricao              insc    ON insc.id_jogador       = j.id_jogador
JOIN Escalao_Epoca          ee      ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao                e       ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva       ep      ON ep.id_epoca           = ee.id_epoca
JOIN Quota                  q       ON q.id_inscricao        = insc.id_inscricao
-- Só quotas não pagas
LEFT JOIN Pagamento         p       ON p.id_quota            = q.id_quota
-- Dados do encarregado (pode ser NULL se não for menor)
LEFT JOIN Encarregado_Educacao ee_ed ON ee_ed.id_enc_educacao = j.id_enc_educacao
WHERE j.ativo             = 1
  -- Quota vencida sem pagamento
  AND q.data_vencimento   < CAST(GETDATE() AS DATE)
  AND p.id_pagamento      IS NULL;
GO
/****** Object:  Table [dbo].[Treino]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treino](
	[id_treino] [int] IDENTITY(1,1) NOT NULL,
	[data_hora] [datetime] NOT NULL,
	[local] [varchar](100) NOT NULL,
	[duracao_minutos] [int] NOT NULL,
	[realizado] [bit] NOT NULL,
	[id_escalao_epoca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_treino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presenca]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presenca](
	[id_presenca] [int] IDENTITY(1,1) NOT NULL,
	[presente] [bit] NOT NULL,
	[taxa_assiduidade] [decimal](5, 2) NULL,
	[justificacao] [varchar](200) NULL,
	[convocado] [bit] NOT NULL,
	[id_treino] [int] NOT NULL,
	[id_jogador] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_presenca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Presenca] UNIQUE NONCLUSTERED 
(
	[id_jogador] ASC,
	[id_treino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_AssiduididadeBaixaUltimos30Dias]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 

-- V03: V_AssiduididadeBaixaUltimos30Dias
-- Enunciado: "Gerar relatórios de jogadores com assiduidade
--             inferior a 50% nos últimos 30 dias, sinalizando
--             potenciais problemas de comprometimento."
-- Como usar: SELECT * FROM V_AssiduididadeBaixaUltimos30Dias
--            ORDER BY Taxa_Assiduidade ASC
CREATE   VIEW [dbo].[V_AssiduididadeBaixaUltimos30Dias] AS
SELECT
    j.nome                  AS Nome_Jogador,
    j.email                 AS Email_Jogador,
    j.telefone              AS Telefone_Jogador,
    e.nome                  AS Escalao,
    ep.designacao           AS Epoca,
    -- Total de treinos nos últimos 30 dias
    COUNT(p.id_presenca)    AS Total_Treinos,
    -- Total de presenças nos últimos 30 dias
    SUM(CAST(p.presente AS INT)) AS Total_Presencas,
    -- Taxa de assiduidade nos últimos 30 dias
    CAST(
        SUM(CAST(p.presente AS INT)) * 100.0
        / NULLIF(COUNT(p.id_presenca), 0)
    AS DECIMAL(5,2))        AS Taxa_Assiduidade,
    -- Sinaliza o nível de comprometimento
    CASE
        WHEN CAST(
                SUM(CAST(p.presente AS INT)) * 100.0
                / NULLIF(COUNT(p.id_presenca), 0)
             AS DECIMAL(5,2)) < 25
            THEN 'Crítico'
        WHEN CAST(
                SUM(CAST(p.presente AS INT)) * 100.0
                / NULLIF(COUNT(p.id_presenca), 0)
             AS DECIMAL(5,2)) < 50
            THEN 'Preocupante'
        ELSE 'Normal'
    END                     AS Nivel_Comprometimento
FROM Jogador          j
JOIN Inscricao        insc ON insc.id_jogador       = j.id_jogador
                          AND insc.estado           = 'Ativa'
JOIN Escalao_Epoca    ee   ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao          e    ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva ep   ON ep.id_epoca           = ee.id_epoca
JOIN Presenca         p    ON p.id_jogador          = j.id_jogador
JOIN Treino           t    ON t.id_treino           = p.id_treino
                          -- Só treinos dos últimos 30 dias
                          AND t.data_hora          >= DATEADD(DAY, -30, GETDATE())
                          AND t.realizado           = 1
WHERE j.ativo       = 1
  -- Não conta presenças como convocado
  AND p.convocado   = 0
GROUP BY
    j.nome, j.email, j.telefone,
    e.nome, ep.designacao,
    j.id_jogador
HAVING
    -- Só jogadores com taxa abaixo de 50%
    CAST(
        SUM(CAST(p.presente AS INT)) * 100.0
        / NULLIF(COUNT(p.id_presenca), 0)
    AS DECIMAL(5,2)) < 50;
GO
/****** Object:  View [dbo].[V_EscalaosMenorAssiduidade]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 

-- V04: V_EscalaosMenorAssiduidade
-- Enunciado: "Mostrar escalões com menor taxa de assiduidade
--             média nos treinos."
-- Como usar: SELECT * FROM V_EscalaosMenorAssiduidade
--            ORDER BY Taxa_Media_Assiduidade ASC
CREATE   VIEW [dbo].[V_EscalaosMenorAssiduidade] AS
SELECT
    e.nome                      AS Escalao,
    ep.designacao               AS Epoca,
    -- Total de treinos realizados
    COUNT(DISTINCT t.id_treino) AS Total_Treinos_Realizados,
    -- Total de jogadores inscritos
    COUNT(DISTINCT j.id_jogador) AS Total_Jogadores,
    -- Taxa média de assiduidade do escalão
    CAST(
        AVG(p.taxa_assiduidade)
    AS DECIMAL(5,2))            AS Taxa_Media_Assiduidade,
    -- Classifica o escalão
    CASE
        WHEN AVG(p.taxa_assiduidade) < 50
            THEN 'Assiduidade Crítica'
        WHEN AVG(p.taxa_assiduidade) < 75
            THEN 'Assiduidade Baixa'
        ELSE 'Assiduidade Normal'
    END                         AS Classificacao
FROM Escalao          e
JOIN Escalao_Epoca    ee   ON ee.id_escalao          = e.id_escalao
JOIN Epoca_Desportiva ep   ON ep.id_epoca            = ee.id_epoca
JOIN Treino           t    ON t.id_escalao_epoca      = ee.id_escalao_epoca
                          AND t.realizado             = 1
JOIN Presenca         p    ON p.id_treino             = t.id_treino
                          AND p.convocado             = 0
JOIN Jogador          j    ON j.id_jogador            = p.id_jogador
                          AND j.ativo                 = 1
GROUP BY
    e.nome,
    ep.designacao,
    e.id_escalao,
    ep.id_epoca;
GO
/****** Object:  View [dbo].[V_JogadoresMaisEmpenhados]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 

-- V05: V_JogadoresMaisEmpenhados
-- Enunciado: "Identificar os jogadores mais empenhados
--             (maior número de treinos frequentados)
--             por escalão e por época."
-- Como usar: SELECT * FROM V_JogadoresMaisEmpenhados
--            WHERE Escalao = 'Benjamins'
--            ORDER BY Total_Treinos_Presentes DESC
CREATE   VIEW [dbo].[V_JogadoresMaisEmpenhados] AS
SELECT
    j.nome                          AS Nome_Jogador,
    e.nome                          AS Escalao,
    ep.designacao                   AS Epoca,
    -- Total de treinos disponíveis para o jogador
    COUNT(p.id_presenca)            AS Total_Treinos,
    -- Total de treinos frequentados
    SUM(CAST(p.presente AS INT))    AS Total_Treinos_Presentes,
    -- Taxa de assiduidade
    CAST(
        SUM(CAST(p.presente AS INT)) * 100.0
        / NULLIF(COUNT(p.id_presenca), 0)
    AS DECIMAL(5,2))                AS Taxa_Assiduidade,
    -- Ranking dentro do escalão/época
    RANK() OVER (
        PARTITION BY e.id_escalao, ep.id_epoca
        ORDER BY SUM(CAST(p.presente AS INT)) DESC
    )                               AS Ranking_Escalao
FROM Jogador          j
JOIN Inscricao        insc ON insc.id_jogador       = j.id_jogador
                          AND insc.estado           = 'Ativa'
JOIN Escalao_Epoca    ee   ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao          e    ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva ep   ON ep.id_epoca           = ee.id_epoca
JOIN Presenca         p    ON p.id_jogador          = j.id_jogador
JOIN Treino           t    ON t.id_treino           = p.id_treino
                          AND t.realizado           = 1
WHERE j.ativo     = 1
  AND p.convocado = 0
GROUP BY
    j.nome, j.id_jogador,
    e.nome, e.id_escalao,
    ep.designacao, ep.id_epoca;
GO
/****** Object:  View [dbo].[V_FederacaoExpirada]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 

-- V06: V_FederacaoExpirada
-- Enunciado: "Listar jogadores com inscrição federativa
--             expirada ou por renovar."
-- Como usar: SELECT * FROM V_FederacaoExpirada
--            ORDER BY Dias_Para_Expirar ASC
CREATE   VIEW [dbo].[V_FederacaoExpirada] AS
SELECT
    j.nome                          AS Nome_Jogador,
    j.email                         AS Email_Jogador,
    j.telefone                      AS Telefone_Jogador,
    ee_ed.nome                      AS Nome_Encarregado,
    ee_ed.telefone                  AS Telefone_Encarregado,
    e.nome                          AS Escalao,
    ep.designacao                   AS Epoca,
    insc.nr_federado                AS Numero_Federado,
    insc.data_validade_federacao    AS Data_Validade_Federacao,
    -- Dias até expirar (negativo = já expirou)
    DATEDIFF(DAY, GETDATE(), insc.data_validade_federacao) AS Dias_Para_Expirar,
    -- Estado da federação
    CASE
        WHEN insc.nr_federado IS NULL
            THEN 'Sem Registo Federativo'
        WHEN insc.data_validade_federacao IS NULL
            THEN 'Sem Data de Validade'
        WHEN insc.data_validade_federacao < GETDATE()
            THEN 'Federação Expirada'
        ELSE 'A Expirar em Breve'
    END                             AS Estado_Federativo
FROM Jogador                j
JOIN Inscricao              insc    ON insc.id_jogador       = j.id_jogador
                                   AND insc.estado           = 'Ativa'
JOIN Escalao_Epoca          ee      ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao                e       ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva       ep      ON ep.id_epoca           = ee.id_epoca
LEFT JOIN Encarregado_Educacao ee_ed ON ee_ed.id_enc_educacao = j.id_enc_educacao
WHERE j.ativo = 1
  AND (
        -- Federação expirada
        insc.data_validade_federacao < GETDATE()
        -- Ou a expirar nos próximos 30 dias
        OR insc.data_validade_federacao < DATEADD(DAY, 30, GETDATE())
        -- Ou sem registo federativo
        OR insc.nr_federado IS NULL
  );
GO
/****** Object:  View [dbo].[V_JogadoresAtivos]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--  VIEWS ADICIONAIS 
--  TABELA JOGADOR
-- V07: V_JogadoresAtivos
-- Lista completa de todos os jogadores ativos com dados
-- do encarregado de educação quando menor.

CREATE   VIEW [dbo].[V_JogadoresAtivos] AS
SELECT
    j.id_jogador                AS ID_Jogador,
    j.nome                      AS Nome_Jogador,
    j.data_nascimento           AS Data_Nascimento,
    DATEDIFF(YEAR, j.data_nascimento, GETDATE()) AS Idade,
    j.telefone                  AS Telefone,
    j.email                     AS Email,
    j.morada                    AS Morada,
    j.NIF                       AS NIF,
    j.menor_idade               AS Menor_Idade,
    -- Dados do EE (só preenchidos quando menor)
    ee.nome                     AS Nome_Encarregado,
    ee.telefone                 AS Telefone_Encarregado,
    ee.email                    AS Email_Encarregado,
    ee.relacao                  AS Relacao_Encarregado
FROM Jogador                    j
LEFT JOIN Encarregado_Educacao  ee ON ee.id_enc_educacao = j.id_enc_educacao
WHERE j.ativo = 1;
GO
/****** Object:  View [dbo].[V_JogadoresInativos]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
-- V08: V_JogadoresInativos
-- Lista de jogadores que já saíram do clube (ativo = 0).
-- Permite consultar o histórico de atletas.
CREATE   VIEW [dbo].[V_JogadoresInativos] AS
SELECT
    j.id_jogador                AS ID_Jogador,
    j.nome                      AS Nome_Jogador,
    j.data_nascimento           AS Data_Nascimento,
    j.telefone                  AS Telefone,
    j.email                     AS Email,
    j.NIF                       AS NIF,
    -- Última inscrição que teve
    e.nome                      AS Ultimo_Escalao,
    ep.designacao               AS Ultima_Epoca,
    insc.estado                 AS Estado_Ultima_Inscricao
FROM Jogador                    j
LEFT JOIN Inscricao             insc ON insc.id_jogador     = j.id_jogador
LEFT JOIN Escalao_Epoca         ee   ON ee.id_escalao_epoca = insc.id_escalao_epoca
LEFT JOIN Escalao               e    ON e.id_escalao        = ee.id_escalao
LEFT JOIN Epoca_Desportiva      ep   ON ep.id_epoca         = ee.id_epoca
WHERE j.ativo = 0;
GO
/****** Object:  View [dbo].[V_AniversariantesProximoMes]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

-- V09: V_AniversariantesProximoMes
-- Lista jogadores que fazem anos no próximo mês.
-- Útil para o clube enviar mensagens ou gerir passagens
-- de escalão.

CREATE   VIEW [dbo].[V_AniversariantesProximoMes] AS
SELECT
    j.nome                      AS Nome_Jogador,
    j.data_nascimento           AS Data_Nascimento,
    -- Dia e mês do aniversário
    DAY(j.data_nascimento)      AS Dia_Aniversario,
    MONTH(j.data_nascimento)    AS Mes_Aniversario,
    DATEDIFF(YEAR, j.data_nascimento, GETDATE()) AS Idade_Atual,
    j.email                     AS Email,
    j.telefone                  AS Telefone,
    e.nome                      AS Escalao,
    ep.designacao               AS Epoca
FROM Jogador                    j
JOIN Inscricao                  insc ON insc.id_jogador       = j.id_jogador
                                    AND insc.estado           = 'Ativa'
JOIN Escalao_Epoca              ee   ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao                    e    ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva           ep   ON ep.id_epoca           = ee.id_epoca
WHERE j.ativo = 1
  -- Filtra jogadores cujo mês de nascimento é o próximo mês
  AND MONTH(j.data_nascimento) = MONTH(DATEADD(MONTH, 1, GETDATE()));
GO
/****** Object:  View [dbo].[V_HistoricoInscricoesPorJogador]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--TABELA INSCRIÇÃO

 

-- V10: V_HistoricoInscricoesPorJogador
-- Mostra todas as inscrições de cada jogador ao longo
-- das épocas. Permite ver a evolução do atleta no clube.
CREATE   VIEW [dbo].[V_HistoricoInscricoesPorJogador] AS
SELECT
    j.nome                          AS Nome_Jogador,
    j.data_nascimento               AS Data_Nascimento,
    ep.designacao                   AS Epoca,
    e.nome                          AS Escalao,
    insc.estado                     AS Estado_Inscricao,
    insc.data_inscricao             AS Data_Inscricao,
    insc.nr_federado                AS Numero_Federado,
    insc.data_validade_federacao    AS Validade_Federacao,
    insc.documentacao_completa      AS Documentacao_Completa,
    -- Conta o número de épocas no clube
    COUNT(insc.id_inscricao) OVER (
        PARTITION BY j.id_jogador
    )                               AS Total_Epocas_Clube
FROM Jogador                        j
JOIN Inscricao                      insc ON insc.id_jogador       = j.id_jogador
JOIN Escalao_Epoca                  ee   ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao                        e    ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva               ep   ON ep.id_epoca           = ee.id_epoca
WHERE j.ativo = 1;
GO
/****** Object:  View [dbo].[V_InscricoesPendentes]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- V11: V_InscricoesPendentes
-- Lista todas as inscrições com estado Pendente que
-- aguardam validação pela direção.
CREATE   VIEW [dbo].[V_InscricoesPendentes] AS
SELECT
    j.nome                          AS Nome_Jogador,
    j.data_nascimento               AS Data_Nascimento,
    j.email                         AS Email_Jogador,
    j.telefone                      AS Telefone_Jogador,
    e.nome                          AS Escalao,
    ep.designacao                   AS Epoca,
    insc.data_inscricao             AS Data_Inscricao,
    insc.documentacao_completa      AS Documentacao_Completa,
    insc.nr_federado                AS Numero_Federado,
    -- Dias à espera de validação
    DATEDIFF(DAY, insc.data_inscricao, GETDATE()) AS Dias_Em_Espera,
    -- Dados do EE se menor
    ee_ed.nome                      AS Nome_Encarregado,
    ee_ed.telefone                  AS Telefone_Encarregado
FROM Jogador                        j
JOIN Inscricao                      insc  ON insc.id_jogador       = j.id_jogador
                                        AND insc.estado            = 'Pendente'
JOIN Escalao_Epoca                  ee    ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao                        e     ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva               ep    ON ep.id_epoca           = ee.id_epoca
LEFT JOIN Encarregado_Educacao      ee_ed ON ee_ed.id_enc_educacao = j.id_enc_educacao
WHERE j.ativo = 1;
GO
/****** Object:  View [dbo].[V_DocumentacaoIncompleta]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
--V12: V_DocumentacaoIncompleta
-- Lista jogadores com inscrição ativa mas documentação
-- por entregar (documentacao_completa = 0).
CREATE   VIEW [dbo].[V_DocumentacaoIncompleta] AS
SELECT
    j.nome                          AS Nome_Jogador,
    j.email                         AS Email_Jogador,
    j.telefone                      AS Telefone_Jogador,
    j.menor_idade                   AS Menor_Idade,
    e.nome                          AS Escalao,
    ep.designacao                   AS Epoca,
    insc.data_inscricao             AS Data_Inscricao,
    insc.estado                     AS Estado_Inscricao,
    -- Dias desde a inscrição sem documentação
    DATEDIFF(DAY, insc.data_inscricao, GETDATE()) AS Dias_Sem_Documentacao,
    ee_ed.nome                      AS Nome_Encarregado,
    ee_ed.telefone                  AS Telefone_Encarregado
FROM Jogador                        j
JOIN Inscricao                      insc  ON insc.id_jogador       = j.id_jogador
                                        AND insc.estado            = 'Ativa'
                                        AND insc.documentacao_completa = 0
JOIN Escalao_Epoca                  ee    ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao                        e     ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva               ep    ON ep.id_epoca           = ee.id_epoca
LEFT JOIN Encarregado_Educacao      ee_ed ON ee_ed.id_enc_educacao = j.id_enc_educacao
WHERE j.ativo = 1;
GO
/****** Object:  View [dbo].[V_TotalDividaPorJogador]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
-- TABELA QUOTA E PAGAMENTO
-- V13: V_TotalDividaPorJogador
-- Mostra  acumulado em dívida por jogador.
-- Útil para a tesouraria priorizar cobranças.
CREATE   VIEW [dbo].[V_TotalDividaPorJogador] AS
SELECT
    j.nome                          AS Nome_Jogador,
    j.email                         AS Email_Jogador,
    j.telefone                      AS Telefone_Jogador,
    ee_ed.nome                      AS Nome_Encarregado,
    ee_ed.telefone                  AS Telefone_Encarregado,
    e.nome                          AS Escalao,
    ep.designacao                   AS Epoca,
    -- Número de quotas em dívida
    COUNT(q.id_quota)               AS Total_Quotas_Em_Divida,
    -- Total acumulado em dívida
    SUM(q.valor)                    AS Total_Divida,
    -- Data da quota em atraso há mais tempo
    MIN(q.data_vencimento)          AS Quota_Mais_Antiga
FROM Jogador                        j
JOIN Inscricao                      insc  ON insc.id_jogador       = j.id_jogador
JOIN Escalao_Epoca                  ee    ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao                        e     ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva               ep    ON ep.id_epoca           = ee.id_epoca
JOIN Quota                          q     ON q.id_inscricao        = insc.id_inscricao
LEFT JOIN Pagamento                 p     ON p.id_quota            = q.id_quota
LEFT JOIN Encarregado_Educacao      ee_ed ON ee_ed.id_enc_educacao = j.id_enc_educacao
WHERE j.ativo             = 1
  AND q.data_vencimento   < CAST(GETDATE() AS DATE)
  AND p.id_pagamento      IS NULL
GROUP BY
    j.nome, j.email, j.telefone, j.id_jogador,
    ee_ed.nome, ee_ed.telefone,
    e.nome, ep.designacao;
GO
/****** Object:  View [dbo].[V_HistoricoPagamentos]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- V14: V_HistoricoPagamentos
-- Lista todos os pagamentos realizados com data, valor
-- e método. Útil para relatórios financeiros.
CREATE   VIEW [dbo].[V_HistoricoPagamentos] AS
SELECT
    j.nome                      AS Nome_Jogador,
    e.nome                      AS Escalao,
    ep.designacao               AS Epoca,
    q.data_vencimento           AS Mes_Quota,
    q.valor                     AS Valor_Quota,
    p.data_pagamento            AS Data_Pagamento,
    p.valor_pago                AS Valor_Pago,
    p.metodo_pagamento          AS Metodo_Pagamento,
    -- Verifica se foi pago a tempo
    CASE
        WHEN p.data_pagamento <= q.data_vencimento
            THEN 'Pago a Tempo'
        ELSE 'Pago em Atraso'
    END                         AS Estado_Pagamento,
    -- Dias de atraso no pagamento (0 se a tempo)
    CASE
        WHEN p.data_pagamento > q.data_vencimento
            THEN DATEDIFF(DAY, q.data_vencimento, p.data_pagamento)
        ELSE 0
    END                         AS Dias_Atraso_Pagamento
FROM Jogador                    j
JOIN Inscricao                  insc ON insc.id_jogador       = j.id_jogador
JOIN Escalao_Epoca              ee   ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao                    e    ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva           ep   ON ep.id_epoca           = ee.id_epoca
JOIN Quota                      q    ON q.id_inscricao        = insc.id_inscricao
JOIN Pagamento                  p    ON p.id_quota            = q.id_quota
WHERE j.ativo = 1;
GO
/****** Object:  View [dbo].[V_QuotasDoMesCorrente]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 

-- V15: V_QuotasDoMesCorrente
-- Mostra todas as quotas do mês atual e o seu estado.
-- Útil para o controlo mensal da tesouraria.
CREATE   VIEW [dbo].[V_QuotasDoMesCorrente] AS
SELECT
    j.nome                      AS Nome_Jogador,
    j.email                     AS Email_Jogador,
    j.telefone                  AS Telefone_Jogador,
    e.nome                      AS Escalao,
    ep.designacao               AS Epoca,
    q.valor                     AS Valor_Quota,
    q.data_vencimento           AS Data_Vencimento,
    -- Estado da quota
    CASE
        WHEN p.id_pagamento IS NOT NULL THEN 'Paga'
        WHEN q.data_vencimento < GETDATE() THEN 'Em Atraso'
        ELSE 'Por Pagar'
    END                         AS Estado_Quota,
    p.data_pagamento            AS Data_Pagamento,
    p.metodo_pagamento          AS Metodo_Pagamento
FROM Jogador                    j
JOIN Inscricao                  insc ON insc.id_jogador       = j.id_jogador
                                    AND insc.estado           = 'Ativa'
JOIN Escalao_Epoca              ee   ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao                    e    ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva           ep   ON ep.id_epoca           = ee.id_epoca
JOIN Quota                      q    ON q.id_inscricao        = insc.id_inscricao
LEFT JOIN Pagamento             p    ON p.id_quota            = q.id_quota
WHERE j.ativo = 1
  -- Só quotas do mês corrente
  AND MONTH(q.data_vencimento) = MONTH(GETDATE())
  AND YEAR(q.data_vencimento)  = YEAR(GETDATE());
GO
/****** Object:  View [dbo].[V_TreinosPorEscalao]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 

--TABELA TREINO

 

-- V16: V_TreinosPorEscalao
-- Lista todos os treinos por escalão e época com duração
-- total e local.
CREATE   VIEW [dbo].[V_TreinosPorEscalao] AS
SELECT
    e.nome                          AS Escalao,
    ep.designacao                   AS Epoca,
    t.data_hora                     AS Data_Hora,
    t.local                         AS Local,
    t.duracao_minutos               AS Duracao_Minutos,
    -- Estado do treino
    CASE
        WHEN t.realizado = 1            THEN 'Realizado'
        WHEN t.data_hora < GETDATE()    THEN 'Não Marcado como Realizado'
        ELSE 'Agendado'
    END                             AS Estado_Treino,
    -- Total de jogadores convocados para o treino
    COUNT(p.id_presenca)            AS Total_Jogadores_Convocados,
    -- Total de presenças
    SUM(CAST(p.presente AS INT))    AS Total_Presentes
FROM Treino                         t
JOIN Escalao_Epoca                  ee ON ee.id_escalao_epoca = t.id_escalao_epoca
JOIN Escalao                        e  ON e.id_escalao        = ee.id_escalao
JOIN Epoca_Desportiva               ep ON ep.id_epoca         = ee.id_epoca
LEFT JOIN Presenca                  p  ON p.id_treino         = t.id_treino
GROUP BY
    e.nome, ep.designacao,
    t.data_hora, t.local,
    t.duracao_minutos, t.realizado,
    t.id_treino;
GO
/****** Object:  View [dbo].[V_TreinosNaoRealizados]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 

-- V17: V_TreinosNaoRealizados
-- Lista treinos com data passada mas realizado = 0.
-- Permite identificar treinos por marcar como realizados.
CREATE   VIEW [dbo].[V_TreinosNaoRealizados] AS
SELECT
    e.nome                          AS Escalao,
    ep.designacao                   AS Epoca,
    t.data_hora                     AS Data_Hora_Treino,
    t.local                         AS Local,
    t.duracao_minutos               AS Duracao_Minutos,
    -- Dias desde que deveria ter sido marcado
    DATEDIFF(DAY, t.data_hora, GETDATE()) AS Dias_Em_Atraso
FROM Treino                         t
JOIN Escalao_Epoca                  ee ON ee.id_escalao_epoca = t.id_escalao_epoca
JOIN Escalao                        e  ON e.id_escalao        = ee.id_escalao
JOIN Epoca_Desportiva               ep ON ep.id_epoca         = ee.id_epoca
WHERE t.realizado = 0
  -- Data já passou
  AND t.data_hora < GETDATE();
GO
/****** Object:  View [dbo].[V_AssiduididadeGeralPorJogador]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
-- TABELA PRESENÇA
-- V18: V_AssiduididadeGeralPorJogador
-- Taxa de assiduidade acumulada de cada jogador na época
-- corrente. Visão geral rápida para o treinador.
CREATE   VIEW [dbo].[V_AssiduididadeGeralPorJogador] AS
SELECT
    j.nome                          AS Nome_Jogador,
    e.nome                          AS Escalao,
    ep.designacao                   AS Epoca,
    COUNT(p.id_presenca)            AS Total_Treinos,
    SUM(CAST(p.presente AS INT))    AS Total_Presencas,
    CAST(
        SUM(CAST(p.presente AS INT)) * 100.0
        / NULLIF(COUNT(p.id_presenca), 0)
    AS DECIMAL(5,2))                AS Taxa_Assiduidade,
    -- Classifica a assiduidade
    CASE
        WHEN CAST(
                SUM(CAST(p.presente AS INT)) * 100.0
                / NULLIF(COUNT(p.id_presenca), 0)
             AS DECIMAL(5,2)) >= 90 THEN 'Excelente'
        WHEN CAST(
                SUM(CAST(p.presente AS INT)) * 100.0
                / NULLIF(COUNT(p.id_presenca), 0)
             AS DECIMAL(5,2)) >= 75 THEN 'Boa'
        WHEN CAST(
                SUM(CAST(p.presente AS INT)) * 100.0
                / NULLIF(COUNT(p.id_presenca), 0)
             AS DECIMAL(5,2)) >= 50 THEN 'Razoável'
        ELSE 'Insuficiente'
    END                             AS Classificacao_Assiduidade
FROM Jogador                        j
JOIN Inscricao                      insc ON insc.id_jogador       = j.id_jogador
                                        AND insc.estado           = 'Ativa'
JOIN Escalao_Epoca                  ee   ON ee.id_escalao_epoca   = insc.id_escalao_epoca
JOIN Escalao                        e    ON e.id_escalao          = ee.id_escalao
JOIN Epoca_Desportiva               ep   ON ep.id_epoca           = ee.id_epoca
                                        AND ep.data_fim          >= GETDATE()
JOIN Presenca                       p    ON p.id_jogador          = j.id_jogador
JOIN Treino                         t    ON t.id_treino           = p.id_treino
                                        AND t.realizado           = 1
WHERE j.ativo     = 1
  AND p.convocado = 0
GROUP BY
    j.nome, j.id_jogador,
    e.nome, ep.designacao;
GO
/****** Object:  View [dbo].[V_JogadoresConvocados]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
-- V19: V_JogadoresConvocados
-- Lista todos os registos de convocatórias — jogadores
-- que treinaram fora do seu escalão.
CREATE   VIEW [dbo].[V_JogadoresConvocados] AS
SELECT
    j.nome                          AS Nome_Jogador,
    e_base.nome                     AS Escalao_Base,
    e_conv.nome                     AS Escalao_Convocado,
    ep.designacao                   AS Epoca,
    t.data_hora                     AS Data_Treino,
    t.local                         AS Local_Treino,
    p.presente                      AS Esteve_Presente
FROM Presenca                       p
JOIN Jogador                        j       ON j.id_jogador          = p.id_jogador
                                           AND j.ativo               = 1
JOIN Treino                         t       ON t.id_treino           = p.id_treino
JOIN Escalao_Epoca                  ee_conv ON ee_conv.id_escalao_epoca = t.id_escalao_epoca
JOIN Escalao                        e_conv  ON e_conv.id_escalao     = ee_conv.id_escalao
JOIN Epoca_Desportiva               ep      ON ep.id_epoca           = ee_conv.id_epoca
-- Vai buscar o escalão base do jogador
JOIN Inscricao                      insc    ON insc.id_jogador        = j.id_jogador
                                           AND insc.estado            = 'Ativa'
JOIN Escalao_Epoca                  ee_base ON ee_base.id_escalao_epoca = insc.id_escalao_epoca
                                           AND ee_base.id_epoca       = ee_conv.id_epoca
JOIN Escalao                        e_base  ON e_base.id_escalao      = ee_base.id_escalao
WHERE p.convocado = 1;
GO
/****** Object:  Table [dbo].[Treinador]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treinador](
	[id_treinador] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[nif] [varchar](20) NOT NULL,
	[telefone] [int] NULL,
	[email] [varchar](100) NULL,
	[ativo] [bit] NOT NULL,
	[data_nascimento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_treinador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipa_Tecnica]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipa_Tecnica](
	[id_equipa_tecnica] [int] IDENTITY(1,1) NOT NULL,
	[funcao] [varchar](50) NOT NULL,
	[id_treinador] [int] NOT NULL,
	[id_escalao_epoca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_equipa_tecnica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ET_TreinadorEpoca] UNIQUE NONCLUSTERED 
(
	[id_treinador] ASC,
	[id_escalao_epoca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_EquipaTecnicaCompleta]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 -- TABELA EQUIPA TÉCNICA E TREINADOR
-- V20: V_EquipaTecnicaCompleta
-- Lista todos os treinadores por escalão e época com
-- a sua função. Visão geral da estrutura técnica.
CREATE   VIEW [dbo].[V_EquipaTecnicaCompleta] AS
SELECT
    e.nome                      AS Escalao,
    ep.designacao               AS Epoca,
    tr.nome                     AS Nome_Treinador,
    tr.email                    AS Email_Treinador,
    tr.telefone                 AS Telefone_Treinador,
    et.funcao                   AS Funcao,
    -- Conta membros da equipa técnica
    COUNT(et.id_equipa_tecnica) OVER (
        PARTITION BY et.id_escalao_epoca
    )                           AS Total_Membros_Equipa
FROM Equipa_Tecnica             et
JOIN Treinador                  tr ON tr.id_treinador      = et.id_treinador
                                  AND tr.ativo             = 1
JOIN Escalao_Epoca              ee ON ee.id_escalao_epoca  = et.id_escalao_epoca
JOIN Escalao                    e  ON e.id_escalao         = ee.id_escalao
JOIN Epoca_Desportiva           ep ON ep.id_epoca          = ee.id_epoca;
GO
/****** Object:  View [dbo].[V_TreinadoresSemEscalao]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 

-- V21: V_TreinadoresSemEscalao
-- Lista treinadores ativos não associados a nenhuma equipa
-- técnica na época atual.

CREATE   VIEW [dbo].[V_TreinadoresSemEscalao] AS
SELECT
    tr.id_treinador             AS ID_Treinador,
    tr.nome                     AS Nome_Treinador,
    tr.email                    AS Email,
    tr.telefone                 AS Telefone,
    tr.data_nascimento          AS Data_Nascimento
FROM Treinador                  tr
WHERE tr.ativo = 1
  -- Não está em nenhuma equipa técnica na época atual
  AND NOT EXISTS (
        SELECT 1
        FROM Equipa_Tecnica     et
        JOIN Escalao_Epoca      ee ON ee.id_escalao_epoca = et.id_escalao_epoca
        JOIN Epoca_Desportiva   ep ON ep.id_epoca         = ee.id_epoca
        WHERE et.id_treinador = tr.id_treinador
          -- Época atual
          AND GETDATE() BETWEEN ep.data_inicio AND ep.data_fim
  );
GO
/****** Object:  Table [dbo].[Alerta]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alerta](
	[id_alerta] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[data_alerta] [date] NOT NULL,
	[descricao] [varchar](255) NOT NULL,
	[resolvido] [bit] NOT NULL,
	[id_jogador] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_alerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_AlertasAbertos]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
-- TABELA ALERTA
-- V22: V_AlertasAbertos
-- Lista todos os alertas por resolver agrupados por tipo.
-- Permite à direção ter visão geral dos problemas ativos.

CREATE   VIEW [dbo].[V_AlertasAbertos] AS
SELECT
    a.id_alerta                 AS ID_Alerta,
    a.tipo                      AS Tipo_Alerta,
    a.data_alerta               AS Data_Alerta,
    a.descricao                 AS Descricao,
    j.nome                      AS Nome_Jogador,
    j.email                     AS Email_Jogador,
    j.telefone                  AS Telefone_Jogador,
    e.nome                      AS Escalao,
    ep.designacao               AS Epoca,
    -- Dias desde que o alerta foi criado
    DATEDIFF(DAY, a.data_alerta, GETDATE()) AS Dias_Em_Aberto
FROM Alerta                     a
JOIN Jogador                    j    ON j.id_jogador          = a.id_jogador
LEFT JOIN Inscricao             insc ON insc.id_jogador        = j.id_jogador
                                   AND insc.estado             = 'Ativa'
LEFT JOIN Escalao_Epoca         ee   ON ee.id_escalao_epoca    = insc.id_escalao_epoca
LEFT JOIN Escalao               e    ON e.id_escalao           = ee.id_escalao
LEFT JOIN Epoca_Desportiva      ep   ON ep.id_epoca            = ee.id_epoca
WHERE a.resolvido = 0;
GO
/****** Object:  View [dbo].[V_AlertasPorJogador]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
-- V23: V_AlertasPorJogador
-- Mostra o histórico completo de alertas por jogador,
-- incluindo os já resolvidos.
CREATE   VIEW [dbo].[V_AlertasPorJogador] AS
SELECT
    j.nome                          AS Nome_Jogador,
    j.email                         AS Email_Jogador,
    a.tipo                          AS Tipo_Alerta,
    a.data_alerta                   AS Data_Alerta,
    a.descricao                     AS Descricao,
    -- Estado do alerta
    CASE
        WHEN a.resolvido = 1 THEN 'Resolvido'
        ELSE 'Por Resolver'
    END                             AS Estado_Alerta,
    e.nome                          AS Escalao,
    ep.designacao                   AS Epoca,
    -- Total de alertas do jogador
    COUNT(a.id_alerta) OVER (
        PARTITION BY j.id_jogador
    )                               AS Total_Alertas,
    -- Total de alertas por resolver
    SUM(CASE WHEN a.resolvido = 0 THEN 1 ELSE 0 END) OVER (
        PARTITION BY j.id_jogador
    )                               AS Alertas_Por_Resolver
FROM Alerta                         a
JOIN Jogador                        j    ON j.id_jogador          = a.id_jogador
LEFT JOIN Inscricao                 insc ON insc.id_jogador        = j.id_jogador
                                       AND insc.estado             = 'Ativa'
LEFT JOIN Escalao_Epoca             ee   ON ee.id_escalao_epoca    = insc.id_escalao_epoca
LEFT JOIN Escalao                   e    ON e.id_escalao           = ee.id_escalao
LEFT JOIN Epoca_Desportiva          ep   ON ep.id_epoca            = ee.id_epoca;
GO
ALTER TABLE [dbo].[Alerta] ADD  DEFAULT (getdate()) FOR [data_alerta]
GO
ALTER TABLE [dbo].[Alerta] ADD  DEFAULT ((0)) FOR [resolvido]
GO
ALTER TABLE [dbo].[Escalao] ADD  DEFAULT ((35.00)) FOR [valor_quota]
GO
ALTER TABLE [dbo].[Inscricao] ADD  DEFAULT (getdate()) FOR [data_inscricao]
GO
ALTER TABLE [dbo].[Inscricao] ADD  DEFAULT ('Pendente') FOR [estado]
GO
ALTER TABLE [dbo].[Inscricao] ADD  DEFAULT ((0)) FOR [documentacao_completa]
GO
ALTER TABLE [dbo].[Jogador] ADD  DEFAULT ((0)) FOR [menor_idade]
GO
ALTER TABLE [dbo].[Jogador] ADD  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [dbo].[Presenca] ADD  DEFAULT ((0)) FOR [presente]
GO
ALTER TABLE [dbo].[Presenca] ADD  DEFAULT ((0)) FOR [taxa_assiduidade]
GO
ALTER TABLE [dbo].[Presenca] ADD  DEFAULT ((0)) FOR [convocado]
GO
ALTER TABLE [dbo].[Quota] ADD  DEFAULT ((0)) FOR [pago]
GO
ALTER TABLE [dbo].[Treinador] ADD  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [dbo].[Treino] ADD  DEFAULT ((0)) FOR [realizado]
GO
ALTER TABLE [dbo].[Alerta]  WITH CHECK ADD  CONSTRAINT [FK_Alerta_Jogador] FOREIGN KEY([id_jogador])
REFERENCES [dbo].[Jogador] ([id_jogador])
GO
ALTER TABLE [dbo].[Alerta] CHECK CONSTRAINT [FK_Alerta_Jogador]
GO
ALTER TABLE [dbo].[Equipa_Tecnica]  WITH CHECK ADD  CONSTRAINT [FK_ET_EscalaoEpoca] FOREIGN KEY([id_escalao_epoca])
REFERENCES [dbo].[Escalao_Epoca] ([id_escalao_epoca])
GO
ALTER TABLE [dbo].[Equipa_Tecnica] CHECK CONSTRAINT [FK_ET_EscalaoEpoca]
GO
ALTER TABLE [dbo].[Equipa_Tecnica]  WITH CHECK ADD  CONSTRAINT [FK_ET_Treinador] FOREIGN KEY([id_treinador])
REFERENCES [dbo].[Treinador] ([id_treinador])
GO
ALTER TABLE [dbo].[Equipa_Tecnica] CHECK CONSTRAINT [FK_ET_Treinador]
GO
ALTER TABLE [dbo].[Escalao_Epoca]  WITH CHECK ADD  CONSTRAINT [FK_EscalaoEpoca_Epoca] FOREIGN KEY([id_epoca])
REFERENCES [dbo].[Epoca_Desportiva] ([id_epoca])
GO
ALTER TABLE [dbo].[Escalao_Epoca] CHECK CONSTRAINT [FK_EscalaoEpoca_Epoca]
GO
ALTER TABLE [dbo].[Escalao_Epoca]  WITH CHECK ADD  CONSTRAINT [FK_EscalaoEpoca_Escalao] FOREIGN KEY([id_escalao])
REFERENCES [dbo].[Escalao] ([id_escalao])
GO
ALTER TABLE [dbo].[Escalao_Epoca] CHECK CONSTRAINT [FK_EscalaoEpoca_Escalao]
GO
ALTER TABLE [dbo].[Inscricao]  WITH CHECK ADD  CONSTRAINT [FK_Inscricao_EscalaoEpoca] FOREIGN KEY([id_escalao_epoca])
REFERENCES [dbo].[Escalao_Epoca] ([id_escalao_epoca])
GO
ALTER TABLE [dbo].[Inscricao] CHECK CONSTRAINT [FK_Inscricao_EscalaoEpoca]
GO
ALTER TABLE [dbo].[Inscricao]  WITH CHECK ADD  CONSTRAINT [FK_Inscricao_Jogador] FOREIGN KEY([id_jogador])
REFERENCES [dbo].[Jogador] ([id_jogador])
GO
ALTER TABLE [dbo].[Inscricao] CHECK CONSTRAINT [FK_Inscricao_Jogador]
GO
ALTER TABLE [dbo].[Jogador]  WITH CHECK ADD  CONSTRAINT [FK_Jogador_EE] FOREIGN KEY([id_enc_educacao])
REFERENCES [dbo].[Encarregado_Educacao] ([id_enc_educacao])
GO
ALTER TABLE [dbo].[Jogador] CHECK CONSTRAINT [FK_Jogador_EE]
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD  CONSTRAINT [FK_Pagamento_Quota] FOREIGN KEY([id_quota])
REFERENCES [dbo].[Quota] ([id_quota])
GO
ALTER TABLE [dbo].[Pagamento] CHECK CONSTRAINT [FK_Pagamento_Quota]
GO
ALTER TABLE [dbo].[Presenca]  WITH CHECK ADD  CONSTRAINT [FK_Presenca_Jogador] FOREIGN KEY([id_jogador])
REFERENCES [dbo].[Jogador] ([id_jogador])
GO
ALTER TABLE [dbo].[Presenca] CHECK CONSTRAINT [FK_Presenca_Jogador]
GO
ALTER TABLE [dbo].[Presenca]  WITH CHECK ADD  CONSTRAINT [FK_Presenca_Treino] FOREIGN KEY([id_treino])
REFERENCES [dbo].[Treino] ([id_treino])
GO
ALTER TABLE [dbo].[Presenca] CHECK CONSTRAINT [FK_Presenca_Treino]
GO
ALTER TABLE [dbo].[Quota]  WITH CHECK ADD  CONSTRAINT [FK_Quota_Inscricao] FOREIGN KEY([id_inscricao])
REFERENCES [dbo].[Inscricao] ([id_inscricao])
GO
ALTER TABLE [dbo].[Quota] CHECK CONSTRAINT [FK_Quota_Inscricao]
GO
ALTER TABLE [dbo].[Treino]  WITH CHECK ADD  CONSTRAINT [FK_Treino_EscalaoEpoca] FOREIGN KEY([id_escalao_epoca])
REFERENCES [dbo].[Escalao_Epoca] ([id_escalao_epoca])
GO
ALTER TABLE [dbo].[Treino] CHECK CONSTRAINT [FK_Treino_EscalaoEpoca]
GO
ALTER TABLE [dbo].[Encarregado_Educacao]  WITH CHECK ADD  CONSTRAINT [CK_EE_Email] CHECK  (([email] like '%@%.%'))
GO
ALTER TABLE [dbo].[Encarregado_Educacao] CHECK CONSTRAINT [CK_EE_Email]
GO
ALTER TABLE [dbo].[Encarregado_Educacao]  WITH CHECK ADD  CONSTRAINT [CK_EE_Relacao] CHECK  (([relacao]='Outro' OR [relacao]='Tutor Legal' OR [relacao]='Avô/Avó' OR [relacao]='Mãe' OR [relacao]='Pai'))
GO
ALTER TABLE [dbo].[Encarregado_Educacao] CHECK CONSTRAINT [CK_EE_Relacao]
GO
ALTER TABLE [dbo].[Encarregado_Educacao]  WITH CHECK ADD  CONSTRAINT [CK_EE_Telefone] CHECK  ((len([telefone])=(9) AND isnumeric([telefone])=(1)))
GO
ALTER TABLE [dbo].[Encarregado_Educacao] CHECK CONSTRAINT [CK_EE_Telefone]
GO
ALTER TABLE [dbo].[Epoca_Desportiva]  WITH CHECK ADD  CONSTRAINT [CK_Epoca_Datas] CHECK  (([data_fim]>[data_inicio]))
GO
ALTER TABLE [dbo].[Epoca_Desportiva] CHECK CONSTRAINT [CK_Epoca_Datas]
GO
ALTER TABLE [dbo].[Equipa_Tecnica]  WITH CHECK ADD  CONSTRAINT [CK_ET_Funcao] CHECK  (([funcao]='Preparador Físico' OR [funcao]='Treinador GR' OR [funcao]='Adjunto' OR [funcao]='Treinador Principal'))
GO
ALTER TABLE [dbo].[Equipa_Tecnica] CHECK CONSTRAINT [CK_ET_Funcao]
GO
ALTER TABLE [dbo].[Escalao]  WITH CHECK ADD  CONSTRAINT [CK_Escalao_Anos] CHECK  (([ano_min_nascimento]<=[ano_max_nascimento]))
GO
ALTER TABLE [dbo].[Escalao] CHECK CONSTRAINT [CK_Escalao_Anos]
GO
ALTER TABLE [dbo].[Inscricao]  WITH CHECK ADD  CONSTRAINT [CK_Inscricao_Estado] CHECK  (([estado]='Cancelada' OR [estado]='Suspensa' OR [estado]='Ativa' OR [estado]='Pendente'))
GO
ALTER TABLE [dbo].[Inscricao] CHECK CONSTRAINT [CK_Inscricao_Estado]
GO
ALTER TABLE [dbo].[Jogador]  WITH CHECK ADD  CONSTRAINT [CK_Jogador_Nome] CHECK  (([nome] like '% %' AND NOT [nome] like '%[0-9]%'))
GO
ALTER TABLE [dbo].[Jogador] CHECK CONSTRAINT [CK_Jogador_Nome]
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD  CONSTRAINT [CK_Pagamento_Data] CHECK  (([data_pagamento]<=CONVERT([date],getdate())))
GO
ALTER TABLE [dbo].[Pagamento] CHECK CONSTRAINT [CK_Pagamento_Data]
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD  CONSTRAINT [CK_Pagamento_Metodo] CHECK  (([metodo_pagamento]='Numerário' OR [metodo_pagamento]='Transferência' OR [metodo_pagamento]='Multibanco' OR [metodo_pagamento]='MB Way'))
GO
ALTER TABLE [dbo].[Pagamento] CHECK CONSTRAINT [CK_Pagamento_Metodo]
GO
ALTER TABLE [dbo].[Pagamento]  WITH CHECK ADD  CONSTRAINT [CK_Pagamento_Valor] CHECK  (([valor_pago]>(0)))
GO
ALTER TABLE [dbo].[Pagamento] CHECK CONSTRAINT [CK_Pagamento_Valor]
GO
ALTER TABLE [dbo].[Presenca]  WITH CHECK ADD  CONSTRAINT [CK_Presenca_Taxa] CHECK  (([taxa_assiduidade]>=(0) AND [taxa_assiduidade]<=(100)))
GO
ALTER TABLE [dbo].[Presenca] CHECK CONSTRAINT [CK_Presenca_Taxa]
GO
ALTER TABLE [dbo].[Quota]  WITH CHECK ADD  CONSTRAINT [CK_Quota_Valor] CHECK  (([valor]>(30) AND [valor]<=(150)))
GO
ALTER TABLE [dbo].[Quota] CHECK CONSTRAINT [CK_Quota_Valor]
GO
ALTER TABLE [dbo].[Treino]  WITH CHECK ADD  CONSTRAINT [CK_Treino_Duracao] CHECK  (([duracao_minutos]>=(30)))
GO
ALTER TABLE [dbo].[Treino] CHECK CONSTRAINT [CK_Treino_Duracao]
GO
ALTER TABLE [dbo].[Treino]  WITH CHECK ADD  CONSTRAINT [CK_Treino_Horario] CHECK  ((CONVERT([time],[data_hora])>='08:00:00' AND CONVERT([time],[data_hora])<='22:30:00'))
GO
ALTER TABLE [dbo].[Treino] CHECK CONSTRAINT [CK_Treino_Horario]
GO
/****** Object:  StoredProcedure [dbo].[sp_LiquidarMensalidade]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =========================================================
-- 3. PROCEDURE: sp_LiquidarMensalidade
-- =========================================================
CREATE   PROCEDURE [dbo].[sp_LiquidarMensalidade]
    @id_jogador INT,
    @id_escalao_epoca INT,
    @metodo_pagamento VARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id_inscricao INT;
    DECLARE @id_quota INT;
    DECLARE @valor_a_pagar DECIMAL(5,2);

    -- 1. Verificar se o jogador tem inscrição Ativa nesse escalão/época
    SELECT @id_inscricao = id_inscricao
    FROM Inscricao
    WHERE id_jogador = @id_jogador 
      AND id_escalao_epoca = @id_escalao_epoca 
      AND estado = 'Ativa';

    IF @id_inscricao IS NULL
    BEGIN
        THROW 53001, 'Erro: O jogador não possui uma inscrição ATIVA neste escalão para realizar pagamentos.', 1;
        RETURN;
    END

    -- 2. Encontrar a Quota mais antiga em atraso (pago = 0)
    SELECT TOP 1 
        @id_quota = id_quota, 
        @valor_a_pagar = valor
    FROM Quota
    WHERE id_inscricao = @id_inscricao AND pago = 0
    ORDER BY data_vencimento ASC;

    IF @id_quota IS NULL
    BEGIN
        THROW 53002, 'Erro: O jogador não tem quotas por pagar para esta inscrição.', 1;
        RETURN;
    END

    -- 3. Registar o pagamento ligando à Quota encontrada
    INSERT INTO Pagamento (data_pagamento, valor_pago, metodo_pagamento, id_quota)
    VALUES (CAST(GETDATE() AS DATE), @valor_a_pagar, @metodo_pagamento, @id_quota);

    -- 4. Atualizar o estado da Quota para paga
    UPDATE Quota
    SET pago = 1
    WHERE id_quota = @id_quota;

    PRINT 'Pagamento da quota liquidado e registado com sucesso.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistarInscricaoJogador]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =========================================================
-- 1. PROCEDURE: sp_RegistarInscricaoJogador
-- =========================================================
CREATE   PROCEDURE [dbo].[sp_RegistarInscricaoJogador]
    @id_jogador INT,
    @id_escalao_epoca INT,
    @documentacao_completa BIT = 0
AS 
BEGIN 
    SET NOCOUNT ON;

    DECLARE @ano_nascimento INT;
    DECLARE @ano_min_escalao INT;
    DECLARE @ano_max_escalao INT;
    DECLARE @nome_escalao VARCHAR(50);

    -- 1. Obter o ano de nascimento do jogador 
    SELECT @ano_nascimento = YEAR(data_nascimento)
    FROM Jogador 
    WHERE id_jogador = @id_jogador;

    IF @ano_nascimento IS NULL
    BEGIN 
        THROW 51001, 'Erro: Jogador não encontrado.', 1;
        RETURN; 
    END

    -- 2. Obter os limites de ano do escalão configurado para essa época 
    SELECT
        @ano_min_escalao = e.ano_min_nascimento,
        @ano_max_escalao = e.ano_max_nascimento,
        @nome_escalao = e.nome
    FROM Escalao_Epoca ee
    JOIN Escalao e ON ee.id_escalao = e.id_escalao
    WHERE ee.id_escalao_epoca = @id_escalao_epoca;

    IF @ano_min_escalao IS NULL
    BEGIN 
        THROW 51002, 'Erro: Escalão/Época não encontrado.', 1;
        RETURN;
    END

    -- 3. Validar a Compatibilidade Etária Obrigatória (RN04)
    IF @ano_nascimento < @ano_min_escalao OR @ano_nascimento > @ano_max_escalao
    BEGIN 
        DECLARE @msg_erro VARCHAR(250);
        SET @msg_erro = CONCAT('Erro (RN04): O ano de nascimento do jogador (', @ano_nascimento, 
                               ') não é compatível com o escalão ', @nome_escalao, 
                               ' (Permitido: ', @ano_min_escalao, ' a ', @ano_max_escalao, ').');
        THROW 51003, @msg_erro, 1;
        RETURN;
    END

    -- 4. Inserir a inscrição com estado 'Pendente' por defeito (RN02)
    INSERT INTO Inscricao (estado, data_inscricao, documentacao_completa, id_jogador, id_escalao_epoca)
    VALUES ('Pendente', GETDATE(), @documentacao_completa, @id_jogador, @id_escalao_epoca);

    PRINT 'Inscrição registada com sucesso como "Pendente" para validação da Direção.';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistarPresencaTreino]    Script Date: 04/11/2026 17:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =========================================================
-- 2. PROCEDURE: sp_RegistarPresencaTreino
-- =========================================================
CREATE   PROCEDURE [dbo].[sp_RegistarPresencaTreino]
    @id_treino INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @id_escalao_epoca INT;
    
    -- 1. Identificar o Escalão/Época associado ao treino
    SELECT @id_escalao_epoca = id_escalao_epoca
    FROM Treino
    WHERE id_treino = @id_treino;
    
    IF @id_escalao_epoca IS NULL
    BEGIN
        THROW 52001, 'Erro: Treino não encontrado.', 1;
        RETURN;
    END

    -- 2. Marcar o treino como realizado (Em BIT 1 = Sim)
    UPDATE Treino
    SET realizado = 1
    WHERE id_treino = @id_treino;

    -- 3. Gerar automaticamente linhas de presença como "Ausente" (presente = 0)
    -- apenas para os jogadores que têm inscrição 'Ativa' nesse escalão
    INSERT INTO Presenca (presente, taxa_assiduidade, convocado, id_treino, id_jogador)
    SELECT 
        0 AS presente, 
        0.00 AS taxa_assiduidade, 
        1 AS convocado, 
        @id_treino, 
        i.id_jogador
    FROM Inscricao i
    WHERE i.id_escalao_epoca = @id_escalao_epoca 
      AND i.estado = 'Ativa'
      -- Evita duplicados caso a procedure seja chamada duas vezes por erro
      AND i.id_jogador NOT IN (SELECT id_jogador FROM Presenca WHERE id_treino = @id_treino);

    PRINT 'Folha de presenças gerada com sucesso para todos os atletas ativos do escalão.';
END;
GO
USE [master]
GO
ALTER DATABASE [ClubeFormacaoDB] SET  READ_WRITE 
GO
