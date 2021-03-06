USE [master]
GO
/****** Object:  Database [professordrausio]    Script Date: 08/03/2017 00:51:49 ******/
CREATE DATABASE [professordrausio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'professordrausio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\professordrausio.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'professordrausio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\professordrausio_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [professordrausio] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [professordrausio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [professordrausio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [professordrausio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [professordrausio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [professordrausio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [professordrausio] SET ARITHABORT OFF 
GO
ALTER DATABASE [professordrausio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [professordrausio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [professordrausio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [professordrausio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [professordrausio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [professordrausio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [professordrausio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [professordrausio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [professordrausio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [professordrausio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [professordrausio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [professordrausio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [professordrausio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [professordrausio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [professordrausio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [professordrausio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [professordrausio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [professordrausio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [professordrausio] SET  MULTI_USER 
GO
ALTER DATABASE [professordrausio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [professordrausio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [professordrausio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [professordrausio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [professordrausio] SET DELAYED_DURABILITY = DISABLED 
GO
USE [professordrausio]
GO
/****** Object:  Table [dbo].[tblCliente]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCliente](
	[IDPessoaCliente] [int] NOT NULL,
 CONSTRAINT [PK_tblCliente] PRIMARY KEY CLUSTERED 
(
	[IDPessoaCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEstoque]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstoque](
	[IDPessoaFilial] [int] NOT NULL,
	[IDProduto] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
 CONSTRAINT [PK_tblEstoque] PRIMARY KEY CLUSTERED 
(
	[IDPessoaFilial] ASC,
	[IDProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEstoqueMovimentado]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblEstoqueMovimentado](
	[IDEstoqueMovimentado] [int] IDENTITY(1,1) NOT NULL,
	[IDPessoaFilial] [int] NOT NULL,
	[IDProduto] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[DataHora] [datetime] NOT NULL,
	[EntrouSaiu] [char](1) NOT NULL,
 CONSTRAINT [PK_tblEstoqueMovimentado] PRIMARY KEY CLUSTERED 
(
	[IDEstoqueMovimentado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblEstoqueReservado]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstoqueReservado](
	[IDPessoaFilial] [int] NOT NULL,
	[IDProduto] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
 CONSTRAINT [PK_tblEstoqueReservado] PRIMARY KEY CLUSTERED 
(
	[IDPessoaFilial] ASC,
	[IDProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFilial]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFilial](
	[IDPessoaFilial] [int] NOT NULL,
 CONSTRAINT [PK_tblFilial] PRIMARY KEY CLUSTERED 
(
	[IDPessoaFilial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFornecedor]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFornecedor](
	[IDPessoaFornecedor] [int] NOT NULL,
 CONSTRAINT [PK_tblFornecedor] PRIMARY KEY CLUSTERED 
(
	[IDPessoaFornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOperacao]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOperacao](
	[IDOperacao] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblOperacao] PRIMARY KEY CLUSTERED 
(
	[IDOperacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPedido]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedido](
	[IDPedido] [int] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NOT NULL CONSTRAINT [DF_tblPedido_DataHora]  DEFAULT (getdate()),
	[IDOperacao] [int] NOT NULL,
	[IDSituacao] [int] NOT NULL,
	[IDPessoaEmitente] [int] NOT NULL,
	[IDPessoaDestinatario] [int] NOT NULL,
 CONSTRAINT [PK_tblPedido] PRIMARY KEY CLUSTERED 
(
	[IDPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPedidoItem]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedidoItem](
	[IDPedido] [int] NOT NULL,
	[IDProduto] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
	[ValorUnitario] [decimal](18, 2) NOT NULL,
	[PercentualDesconto] [decimal](5, 2) NOT NULL,
	[ValorDesconto] [decimal](18, 2) NOT NULL,
	[ValorTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tblPedidoItem] PRIMARY KEY CLUSTERED 
(
	[IDPedido] ASC,
	[IDProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPessoa]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPessoa](
	[IDPessoa] [int] IDENTITY(1,1) NOT NULL,
	[IDPessoaTipo] [int] NOT NULL,
 CONSTRAINT [PK_tblPessoa] PRIMARY KEY CLUSTERED 
(
	[IDPessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPessoaFisica]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPessoaFisica](
	[IDPessoaFisica] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[CPF] [varchar](11) NOT NULL,
	[RG] [varchar](20) NULL,
	[DataNascimento] [date] NOT NULL,
 CONSTRAINT [PK_tblPessoaFisica] PRIMARY KEY CLUSTERED 
(
	[IDPessoaFisica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPessoaJuridica]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPessoaJuridica](
	[IDPessoaJuridica] [int] NOT NULL,
	[NomeFantasia] [varchar](50) NOT NULL,
	[RazaoSocial] [varchar](50) NOT NULL,
	[CNPJ] [varchar](14) NOT NULL,
	[InscricaoEstadual] [varchar](20) NULL,
	[DataFundacao] [date] NOT NULL,
 CONSTRAINT [PK_tblPessoaJuridica] PRIMARY KEY CLUSTERED 
(
	[IDPessoaJuridica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPessoaTipo]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPessoaTipo](
	[IDPessoaTipo] [int] NOT NULL,
	[DescricaoTipo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblPessoaTipo] PRIMARY KEY CLUSTERED 
(
	[IDPessoaTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPreco]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPreco](
	[IDProduto] [int] NOT NULL,
	[Preco] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tblPreco] PRIMARY KEY CLUSTERED 
(
	[IDProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduto]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProduto](
	[IDProduto] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblProduto] PRIMARY KEY CLUSTERED 
(
	[IDProduto] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 1) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSituacao]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSituacao](
	[IDSituacao] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblSituacao] PRIMARY KEY CLUSTERED 
(
	[IDSituacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[uvwPessoaFisicaJuridica]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[uvwPessoaFisicaJuridica]
AS
SELECT        dbo.tblPessoa.IDPessoa, dbo.tblPessoa.IDPessoaTipo, dbo.tblPessoaTipo.DescricaoTipo, CASE WHEN tblPessoa.IDPessoaTipo = 1 THEN tblPessoaFisica.CPF ELSE tblPessoaJuridica.CNPJ END AS [CPF / CNPJ],
                          CASE WHEN tblPessoa.IDPessoaTipo = 1 THEN tblPessoaFisica.Nome ELSE tblPessoaJuridica.NomeFantasia END AS Nome
FROM            dbo.tblPessoa INNER JOIN
                         dbo.tblPessoaTipo ON dbo.tblPessoa.IDPessoaTipo = dbo.tblPessoaTipo.IDPessoaTipo LEFT OUTER JOIN
                         dbo.tblPessoaFisica ON dbo.tblPessoaFisica.IDPessoaFisica = dbo.tblPessoa.IDPessoa LEFT OUTER JOIN
                         dbo.tblPessoaJuridica ON dbo.tblPessoaJuridica.IDPessoaJuridica = dbo.tblPessoa.IDPessoa

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblPessoaJuridicaCNPJ]    Script Date: 08/03/2017 00:51:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblPessoaJuridicaCNPJ] ON [dbo].[tblPessoaJuridica]
(
	[CNPJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCliente]  WITH CHECK ADD  CONSTRAINT [FK_tblCliente_tblPessoa] FOREIGN KEY([IDPessoaCliente])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblCliente] CHECK CONSTRAINT [FK_tblCliente_tblPessoa]
GO
ALTER TABLE [dbo].[tblEstoque]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoque_tblFilial] FOREIGN KEY([IDPessoaFilial])
REFERENCES [dbo].[tblFilial] ([IDPessoaFilial])
GO
ALTER TABLE [dbo].[tblEstoque] CHECK CONSTRAINT [FK_tblEstoque_tblFilial]
GO
ALTER TABLE [dbo].[tblEstoque]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoque_tblProduto] FOREIGN KEY([IDProduto])
REFERENCES [dbo].[tblProduto] ([IDProduto])
GO
ALTER TABLE [dbo].[tblEstoque] CHECK CONSTRAINT [FK_tblEstoque_tblProduto]
GO
ALTER TABLE [dbo].[tblEstoqueMovimentado]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoqueMovimentado_tblFilial] FOREIGN KEY([IDPessoaFilial])
REFERENCES [dbo].[tblFilial] ([IDPessoaFilial])
GO
ALTER TABLE [dbo].[tblEstoqueMovimentado] CHECK CONSTRAINT [FK_tblEstoqueMovimentado_tblFilial]
GO
ALTER TABLE [dbo].[tblEstoqueMovimentado]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoqueMovimentado_tblProduto] FOREIGN KEY([IDProduto])
REFERENCES [dbo].[tblProduto] ([IDProduto])
GO
ALTER TABLE [dbo].[tblEstoqueMovimentado] CHECK CONSTRAINT [FK_tblEstoqueMovimentado_tblProduto]
GO
ALTER TABLE [dbo].[tblEstoqueReservado]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoqueReservado_tblEstoque] FOREIGN KEY([IDPessoaFilial], [IDProduto])
REFERENCES [dbo].[tblEstoque] ([IDPessoaFilial], [IDProduto])
GO
ALTER TABLE [dbo].[tblEstoqueReservado] CHECK CONSTRAINT [FK_tblEstoqueReservado_tblEstoque]
GO
ALTER TABLE [dbo].[tblEstoqueReservado]  WITH CHECK ADD  CONSTRAINT [FK_tblEstoqueReservado_tblProduto] FOREIGN KEY([IDProduto])
REFERENCES [dbo].[tblProduto] ([IDProduto])
GO
ALTER TABLE [dbo].[tblEstoqueReservado] CHECK CONSTRAINT [FK_tblEstoqueReservado_tblProduto]
GO
ALTER TABLE [dbo].[tblFilial]  WITH CHECK ADD  CONSTRAINT [FK_tblFilial_tblPessoa] FOREIGN KEY([IDPessoaFilial])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblFilial] CHECK CONSTRAINT [FK_tblFilial_tblPessoa]
GO
ALTER TABLE [dbo].[tblFornecedor]  WITH CHECK ADD  CONSTRAINT [FK_tblFornecedor_tblPessoa] FOREIGN KEY([IDPessoaFornecedor])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblFornecedor] CHECK CONSTRAINT [FK_tblFornecedor_tblPessoa]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblOperacao] FOREIGN KEY([IDOperacao])
REFERENCES [dbo].[tblOperacao] ([IDOperacao])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblOperacao]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblPessoa_Destinatario] FOREIGN KEY([IDPessoaDestinatario])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblPessoa_Destinatario]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblPessoa_Emitente] FOREIGN KEY([IDPessoaEmitente])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblPessoa_Emitente]
GO
ALTER TABLE [dbo].[tblPedido]  WITH CHECK ADD  CONSTRAINT [FK_tblPedido_tblSituacao] FOREIGN KEY([IDOperacao])
REFERENCES [dbo].[tblSituacao] ([IDSituacao])
GO
ALTER TABLE [dbo].[tblPedido] CHECK CONSTRAINT [FK_tblPedido_tblSituacao]
GO
ALTER TABLE [dbo].[tblPedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_tblPedidoItem_tblPedido] FOREIGN KEY([IDPedido])
REFERENCES [dbo].[tblPedido] ([IDPedido])
GO
ALTER TABLE [dbo].[tblPedidoItem] CHECK CONSTRAINT [FK_tblPedidoItem_tblPedido]
GO
ALTER TABLE [dbo].[tblPedidoItem]  WITH CHECK ADD  CONSTRAINT [FK_tblPedidoItem_tblProduto] FOREIGN KEY([IDProduto])
REFERENCES [dbo].[tblProduto] ([IDProduto])
GO
ALTER TABLE [dbo].[tblPedidoItem] CHECK CONSTRAINT [FK_tblPedidoItem_tblProduto]
GO
ALTER TABLE [dbo].[tblPessoa]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoa_tblPessoaTipo] FOREIGN KEY([IDPessoaTipo])
REFERENCES [dbo].[tblPessoaTipo] ([IDPessoaTipo])
GO
ALTER TABLE [dbo].[tblPessoa] CHECK CONSTRAINT [FK_tblPessoa_tblPessoaTipo]
GO
ALTER TABLE [dbo].[tblPessoaFisica]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoaFisica_tblPessoa] FOREIGN KEY([IDPessoaFisica])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblPessoaFisica] CHECK CONSTRAINT [FK_tblPessoaFisica_tblPessoa]
GO
ALTER TABLE [dbo].[tblPessoaJuridica]  WITH CHECK ADD  CONSTRAINT [FK_tblPessoaJuridica_tblPessoa] FOREIGN KEY([IDPessoaJuridica])
REFERENCES [dbo].[tblPessoa] ([IDPessoa])
GO
ALTER TABLE [dbo].[tblPessoaJuridica] CHECK CONSTRAINT [FK_tblPessoaJuridica_tblPessoa]
GO
ALTER TABLE [dbo].[tblPreco]  WITH CHECK ADD  CONSTRAINT [FK_tblPreco_tblProduto] FOREIGN KEY([IDProduto])
REFERENCES [dbo].[tblProduto] ([IDProduto])
GO
ALTER TABLE [dbo].[tblPreco] CHECK CONSTRAINT [FK_tblPreco_tblProduto]
GO
/****** Object:  StoredProcedure [dbo].[uspClienteExcluir]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteExcluir]
	@IDPessoaCliente AS INT
AS
BEGIN
	
	DELETE FROM tblCliente WHERE IDPessoaCliente = @IDPessoaCliente;

END
GO
/****** Object:  StoredProcedure [dbo].[uspClienteInserir]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteInserir]
	@IDPessoaCliente AS INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			-- Verifica se existe cliente
			IF(EXISTS(SELECT  IDPessoaCliente FROM tblCliente WHERE IDPessoaCliente = @IDPessoaCliente))
				RAISERROR('Cliente já existe!', 14, 1);

			-- Insere cliente
			INSERT INTO tblCliente ( IDPessoaCliente) 
			VALUES ( @IDPessoaCliente );


			-- Retorna ID
			SELECT @IDPessoaCliente AS Retorno;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspConsultarClientePorCodigoNome]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspConsultarClientePorCodigoNome]
	@IDPessoaCliente INT = NULL,
	@Nome VARCHAR(50) = NULL
AS
BEGIN
	
	SELECT
		cli.IDPessoaCliente,
		pes.[CPF / CNPJ],
		pes.Nome,
		pes.IDPessoaTipo,
		pes.DescricaoTipo
	FROM
		tblCliente AS cli
	JOIN
		uvwPessoaFisicaJuridica AS pes ON
			cli.IDPessoaCliente = pes.IDPessoa		
	WHERE
	(@IDPessoaCliente IS NULL OR cli.IDPessoaCliente = @IDPessoaCliente) AND
	(@Nome IS NULL OR pes.Nome LIKE '%' + @Nome + '%')

END

GO
/****** Object:  StoredProcedure [dbo].[uspConsultarProdutoPorCodigoNome]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspConsultarProdutoPorCodigoNome]
	@IDProduto AS INT = NULL,
	@Descricao AS VARCHAR(100) = NULL
AS
BEGIN
	
	SELECT
		*
	FROM
		tblProduto
	WHERE
		(@IDProduto IS NULL OR IDProduto = @IDProduto) AND
		(@Descricao IS NULL OR Descricao = @Descricao)

END
GO
/****** Object:  StoredProcedure [dbo].[uspEstoqueConsultar]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEstoqueConsultar]
	@IDPessoaFilial INT,
	@IDProduto INT
AS
BEGIN
	
	SELECT 
		est.IDPessoaFilial,
		fil.Nome AS NomeFilial,
		fil.[CPF / CNPJ] AS CpfCnpjFilial,
		fil.DescricaoTipo AS TipoFilial,
		est.IDProduto,
		pro.Descricao As DescricaoProduto,
		est.Quantidade

	FROM
		tblEstoque as est
	JOIN
		uvwPessoaFisicaJuridica AS fil ON
			est.IDPessoaFilial = fil.IDPessoa
	JOIN
		tblProduto AS pro ON
			est.IDProduto = pro.IDProduto
	WHERE
		est.IDPessoaFilial = @IDPessoaFilial AND
		EST.IDProduto = @IDProduto 
END
GO
/****** Object:  StoredProcedure [dbo].[uspEstoqueDisponivelConsultar]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEstoqueDisponivelConsultar]
	@IDPessoaFilial INT,
	@IDProduto INT
AS
BEGIN
	
	DECLARE
		@NomeFilial VARCHAR(50),
		@CpfCnpjFilial VARCHAR(14),
		@TipoFilial VARCHAR(50),
		@DescricaoProduto VARCHAR(100),
		@Estoque INT,
		@EstoqueReservado INT,
		@EstoqueDisponivel INT;


	SET @NomeFilial = (SELECT Nome FROM uvwPessoaFisicaJuridica WHERE IDPessoa = @IDPessoaFilial);
	
	SET @CpfCnpjFilial = (SELECT [CPF / CNPJ] FROM uvwPessoaFisicaJuridica WHERE IDPessoa = @IDPessoaFilial);
	
	SET @TipoFilial = (SELECT DescricaoTipo FROM uvwPessoaFisicaJuridica WHERE IDPessoa = @IDPessoaFilial);
	
	SET @DescricaoProduto = (SELECT Descricao FROM tblProduto WHERE IDProduto = @IDProduto);
	
	SET @Estoque = (SELECT Quantidade FROM tblEstoque WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto);
	
	SET @EstoqueReservado = (SELECT Quantidade FROM tblEstoqueReservado WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto);
	
	SET @EstoqueDisponivel = COALESCE(@Estoque, 0) - COALESCE(@EstoqueReservado, 0);


	SELECT 
		@IDPessoaFilial AS IDPessoaFilial,
		@NomeFilial AS NomeFilial,
		@CpfCnpjFilial AS CpfCnpjFilial,
		@TipoFilial AS TipoFilial,
		@IDProduto AS IDProduto,
		@DescricaoProduto AS DescricaoProduto,
		@Estoque AS Estoque,
		@EstoqueReservado AS EstoqueReservado,
		@EstoqueDisponivel AS EstoqueDisponivel;
		
END
GO
/****** Object:  StoredProcedure [dbo].[uspEstoqueManter]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEstoqueManter]
	@IDPessoaFilial AS INT,
	@IDProduto AS INT,
	@Quantidade AS INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			
			-- Se existir, altera, senão insere
			IF(EXISTS(
				SELECT IDProduto
				FROM tblEstoque
				WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto)
			)
			BEGIN
				
				-- ALTERAR
				UPDATE tblEstoque
				SET Quantidade = Quantidade + @Quantidade
				WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto

			END
			ELSE
			BEGIN
				
				-- INSERIR
				INSERT INTO tblEstoque ( IDPessoaFilial, IDProduto, Quantidade )
				VALUES ( @IDPessoaFilial, @IDProduto, @Quantidade )

			END

			-- MOVIMENTAÇÃO DE ESTOQUE
			DECLARE @EntrouSaiu CHAR(1);

			IF(@Quantidade < 0)
				SET @EntrouSaiu = 'S';
			ELSE
				SET @EntrouSaiu = 'E';

			INSERT INTO tblEstoqueMovimentado
			(IDPessoaFilial, IDProduto, Quantidade, DataHora, EntrouSaiu)
			VALUES
			(@IDPessoaFilial, @IDProduto, @Quantidade, GETDATE(), @EntrouSaiu)
			-- FIM DA MOVIMENTAÇÃO

			SELECT @IDProduto AS Retorno;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspEstoqueReservadoConsultar]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEstoqueReservadoConsultar]
	@IDPessoaFilial INT,
	@IDProduto INT
AS
BEGIN
	
	SELECT 
		estres.IDPessoaFilial,
		fil.Nome AS NomeFilial,
		fil.[CPF / CNPJ] AS CpfCnpjFilial,
		fil.DescricaoTipo AS TipoFilial,
		estres.IDProduto,
		pro.Descricao As DescricaoProduto,
		estRes.Quantidade

	FROM
		tblEstoqueReservado as estRes
	JOIN
		uvwPessoaFisicaJuridica AS fil ON
			estRes.IDPessoaFilial = fil.IDPessoa
	JOIN
		tblProduto AS pro ON
			estRes.IDProduto = pro.IDProduto
	WHERE
		estRes.IDPessoaFilial = @IDPessoaFilial AND
		estRes.IDProduto = @IDProduto 
END
GO
/****** Object:  StoredProcedure [dbo].[uspEstoqueReservadoManter]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspEstoqueReservadoManter]
	@IDPessoaFilial INT,
	@IDProduto INT,
	@Quantidade INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN

			IF(EXISTS(SELECT IDProduto FROM tblEstoqueReservado 
				WHERE IDPessoaFilial = @IDPessoaFilial AND IDProduto = @IDProduto))
			BEGIN
			
				--Alterar
				UPDATE tblEstoqueReservado
				SET Quantidade = Quantidade + @Quantidade
				WHERE IDProduto = @IDProduto AND IDProduto = @IDProduto;

			END
			ELSE
			BEGIN

				--Inserir
				INSERT INTO tblEstoqueReservado
				( IDPessoaFilial, IDProduto, Quantidade )
				VALUES
				( @IDPessoaFilial, @IDProduto, @Quantidade );
			
			END

			SELECT @IDProduto AS Retorno;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspFilialConsultarPorCodigo]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspFilialConsultarPorCodigo]
	@IDPessoaFilial INT
AS
BEGIN
	
	SELECT 
		tblFilial.IDPessoaFilial,
		pes.[CPF / CNPJ],
		pes.Nome,
		pes.IDPessoaTipo,
		pes.Descricao
	FROM tblFilial
	JOIN
		uvwPessoaFisicaJuridica AS pes 
		ON  pes.IDPessoa = tblFilial.IDPessoaFilial
	WHERE
		tblFilial.IDPessoaFilial = @IDPessoaFilial

END
GO
/****** Object:  StoredProcedure [dbo].[uspFilialConsultarPorNome]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspFilialConsultarPorNome]
	@Nome AS VARCHAR(50)
AS
BEGIN
	
	SELECT 
		tblFilial.IDPessoaFilial,
		pes.[CPF / CNPJ],
		pes.Nome,
		pes.IDPessoaTipo,
		pes.Descricao
	FROM tblFilial
	JOIN
		uvwPessoaFisicaJuridica AS pes 
		ON  pes.IDPessoa = tblFilial.IDPessoaFilial
	WHERE
		pes.Nome LIKE '%' + @Nome + '%'

END
GO
/****** Object:  StoredProcedure [dbo].[uspFilialInserir]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspFilialInserir]
	@IDPessoaFilial AS INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			
			-- Verifica se já existe filial
			IF(EXISTS(SELECT IDPessoaFilial FROM tblFilial WHERE IDPessoaFilial = @IDPessoaFilial))
				BEGIN
					RAISERROR('Filial já existe!', 14, 1);
				END

			-- Insere Filial
			INSERT INTO tblFilial ( IDPessoaFilial ) 
			VALUES ( @IDPessoaFilial );
			
			
			-- Retorna resposta
			SELECT @IDPessoaFilial AS Retorno;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[uspFornecedorConsultarPorCodigoNome]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspFornecedorConsultarPorCodigoNome]
	@IDPessoaFornecedor AS INT = NULL,
	@Nome AS VARCHAR(50) = NULL
AS
BEGIN
	
	IF(@IDPessoaFornecedor IS NOT NULL)
	BEGIN
		
		--Consulta por código

		SELECT 
			tblFornecedor.IDPessoaFornecedor,
			pes.[CPF / CNPJ],
			pes.Nome,
			pes.IDPessoaTipo,
			pes.Descricao

		FROM tblFornecedor
		JOIN 
			uvwPessoaFisicaJuridica AS pes ON pes.IDPessoa = tblFornecedor.IDPessoaFornecedor
		
		WHERE
			tblFornecedor.IDPessoaFornecedor = @IDPessoaFornecedor
	
	END
	ELSE IF(@Nome IS NOT NULL)
	BEGIN
		
		--Consulta por nome

		SELECT 
			tblFornecedor.IDPessoaFornecedor,
			pes.[CPF / CNPJ],
			pes.Nome,
			pes.IDPessoaTipo,
			pes.Descricao

		FROM tblFornecedor
		JOIN 
			uvwPessoaFisicaJuridica AS pes ON pes.IDPessoa = tblFornecedor.IDPessoaFornecedor
		
		WHERE
			pes.Nome LIKE '%' + @Nome + '%'
	
	END

END
GO
/****** Object:  StoredProcedure [dbo].[uspFornecedorInserir]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspFornecedorInserir]
	@IDPessoaFornecedor AS INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
		
			IF(EXISTS(SELECT IDPessoaFornecedor FROM tblFornecedor WHERE IDPessoaFornecedor = @IDPessoaFornecedor))
				RAISERROR('Fornecedor já existe!', 14, 1);

			
			INSERT INTO tblFornecedor ( IDPessoaFornecedor )
			VALUES ( @IDPessoaFornecedor );


			SELECT @IDPessoaFornecedor AS Retorno;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspPedidoConsultarPorData]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPedidoConsultarPorData]
	@DataInicial DATE,
	@DataFinal DATE
AS
BEGIN

	SELECT
		ped.IDPedido,
		ped.DataHora,
		ped.IDOperacao,
		ope.Descricao AS DescOperacao,
		ped.IDSituacao,
		sit.Descricao AS DescSituacao,
		ped.IDPessoaEmitente,
		emit.Nome AS NomeEmitente,
		ped.IDPessoaDestinatario,
		dest.Nome AS NomeDestinatario
	FROM 
		tblPedido AS ped
	JOIN
		tblOperacao AS ope ON
			ped.IDOperacao = ope.IDOperacao
	JOIN
		tblSituacao AS sit ON
			ped.IDSituacao = sit.IDSituacao
	JOIN
		uvwPessoaFisicaJuridica AS emit ON
			ped.IDPessoaEmitente = emit.IDPessoa
	JOIN
		uvwPessoaFisicaJuridica AS dest ON
			ped.IDPessoaDestinatario = dest.IDPessoa
	WHERE
		CAST(ped.DataHora AS DATE) BETWEEN @DataInicial AND @DataFinal

END

GO
/****** Object:  StoredProcedure [dbo].[uspPedidoInserir]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPedidoInserir]
	@IDOperacao AS INT,
	@IDSituacao AS INT,
	@IDPessoaEmitente AS INT,
	@IDPessoaDestinatario AS INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			
			INSERT INTO tblPedido
			( DataHora, IDOperacao, IDSituacao, IDPessoaEmitente, IDPessoaDestinatario )
			VALUES
			( GETDATE(), @IDOperacao, @IDSituacao, @IDPessoaEmitente, @IDPessoaDestinatario )

			SELECT @@IDENTITY AS Retorno;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspPedidoItemConsultar]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPedidoItemConsultar]
	@IDPedido INT
AS
BEGIN

	SELECT
		pedIte.IDPedido,
		pedIte.IDProduto,
		pro.Descricao AS DescProduto,
		pedIte.Quantidade,
		pedIte.ValorUnitario,
		pedIte.PercentualDesconto,
		pedIte.ValorDesconto,
		pedIte.ValorTotal
	FROM
		tblPedidoItem AS pedIte
	JOIN
		tblProduto AS pro ON
			pedIte.IDProduto = pro.IDProduto
	WHERE
		pedIte.IDPedido = @IDPedido

END
GO
/****** Object:  StoredProcedure [dbo].[uspPedidoItemInserir]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPedidoItemInserir]
	@IDPedido AS INT,
	@IDProduto AS INT,
	@Quantidade AS INT,
	@ValorUnitario AS DECIMAL(18,2),
	@PercentualDesconto AS DECIMAL(5,2),
	@ValorDesconto AS DECIMAL(18,2),
	@ValorTotal AS DECIMAL(18,2)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			
			IF(EXISTS(SELECT IDProduto FROM tblPedidoItem 
					  WHERE IDPedido = @IDPedido AND IDProduto = @IDProduto))
			BEGIN
				RAISERROR('Este Produto já existe no pedido.', 14, 1);
			END

			INSERT INTO tblPedidoItem 
			( IDPedido, IDProduto, Quantidade, ValorUnitario, PercentualDesconto, ValorDesconto, ValorTotal)
			VALUES
			( @IDPedido, @IDProduto, @Quantidade, @ValorUnitario, @PercentualDesconto, @ValorDesconto, @ValorTotal)

			SELECT @IDProduto AS Retorno;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspPessoaFisicaInserir]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPessoaFisicaInserir]
	@Nome AS VARCHAR(50),
	@CPF AS VARCHAR(11),
	@RG AS VARCHAR(20),
	@DataNascimento AS DATE
AS
BEGIN
--Exceção (TRY/CATCH)
--Transação
	
		BEGIN TRY
			BEGIN TRAN
				
				--Não deixa inserir CPF igual no banco
				IF(EXISTS(SELECT IDPessoaFisica FROM tblPessoaFisica WHERE CPF = @CPF))
					BEGIN
						RAISERROR('CPF já Existe!', 14, 1);
					END

				DECLARE @IDPessoa AS INT;

				--1º Inserir na tabela Pessoa
				INSERT INTO tblPessoa ( IDPessoaTipo )
				VALUES ( 1 );

				SET @IDPessoa = @@IDENTITY; --retorna ultimo ID salvo


				--2º Inserir na tabela tblPessoaFisica
				INSERT INTO tblPessoaFisica ( IDPessoaFisica, Nome, CPF, RG, DataNascimento )
				VALUES ( @IDPessoa, @Nome, @CPF, @RG, @DataNascimento )

				SELECT @IDPessoa AS Retorno;

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE() AS Retorno;
		END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[uspPessoaJuridicaInserir]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPessoaJuridicaInserir]
	@NomeFantasia AS VARCHAR(50),
	@RazaoSocial AS VARCHAR(50),
	@CNPJ AS VARCHAR(14),
	@IscricaoEstadual AS VARCHAR(20),
	@DataFundacao AS DATE
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			-- Verifica se já existe
			IF(EXISTS(SELECT CNPJ FROM tblPessoaJuridica WHERE CNPJ = @CNPJ))
			BEGIN
				RAISERROR('CNPJ já existe!', 14, 1);
			END

			

			-- Insere nova pessoa em tabela Pessoa
			INSERT INTO tblPessoa ( IDPessoaTipo )
			VALUES ( 2 );

			-- atribui id na variavel
			DECLARE @IDPessoa AS INT;
			SET @IDPessoa = @@IDENTITY;



			--Insere nova pessoa juridica em tabela pessoa juridica
			INSERT INTO tblPessoaJuridica 
			( 
				IDPessoaJuridica, 
				NomeFantasia, 
				RazaoSocial, 
				CNPJ, 
				InscricaoEstadual, 
				DataFundacao 
			)
			VALUES
			( 
				@IDPessoa, 
				@NomeFantasia, 
				@RazaoSocial, 
				@CNPJ, 
				@IscricaoEstadual, 
				@DataFundacao 
			)

			SELECT @IDPessoa AS Retorno;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS Retorno;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[uspProdutoInserir]    Script Date: 08/03/2017 00:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspProdutoInserir]
	@Descricao AS VARCHAR(100)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			
			IF(EXISTS(SELECT IDProduto FROM tblProduto WHERE Descricao = @Descricao))
				RAISERROR('Já existe um produto com esta descrição!', 14 , 1)


			INSERT INTO tblProduto ( Descricao ) VALUES ( @Descricao );
	
			SELECT @@IDENTITY AS Retorno;

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		Select ERROR_MESSAGE() AS Retorno;
	END CATCH
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblPessoa"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblPessoaTipo"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 102
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblPessoaFisica"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 232
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblPessoaJuridica"
            Begin Extent = 
               Top = 102
               Left = 273
               Bottom = 232
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2550
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'uvwPessoaFisicaJuridica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'uvwPessoaFisicaJuridica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'uvwPessoaFisicaJuridica'
GO
USE [master]
GO
ALTER DATABASE [professordrausio] SET  READ_WRITE 
GO
