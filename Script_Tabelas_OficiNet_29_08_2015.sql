USE [OficiNet]
GO
/****** Object:  Table [dbo].[Tb_Cliente]    Script Date: 08/29/2015 14:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_Cliente](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Telefone] [nvarchar](50) NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
	[Tipo_Pessoa] [char](1) NOT NULL,
	[CPF] [nvarchar](11) NULL,
	[CNPJ] [nvarchar](14) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tb_Cliente] ON
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (13, N'Evelin', N'1212221', CAST(0x0000A32200000000 AS DateTime), N'j', N'21212', N'323223')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (14, N'Douglas', N'1212221', CAST(0x0000000000000000 AS DateTime), N'j', N'21212', N'323223')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (15, N'teste', N'3232323233', CAST(0x0000A4FE017D8010 AS DateTime), N'F', N'05532369704', N'')
SET IDENTITY_INSERT [dbo].[Tb_Cliente] OFF
/****** Object:  Table [dbo].[Tb_Veiculo]    Script Date: 08/29/2015 14:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_Veiculo](
	[Id_Veiculo] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [varchar](6) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
	[Ano] [varchar](4) NOT NULL,
	[Marca] [varchar](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Veiculo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_Usuario]    Script Date: 08/29/2015 14:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Usuario](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nome_Usuario] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[_Login] [nvarchar](50) NOT NULL,
	[Senha] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tb_Usuario] ON
INSERT [dbo].[Tb_Usuario] ([Id_Usuario], [Nome_Usuario], [Email], [_Login], [Senha]) VALUES (2, N'Douglas', N'douglas@gmail.com', N'admin', N'21232f297a57a5a743894ae4a801fc3')
SET IDENTITY_INSERT [dbo].[Tb_Usuario] OFF
/****** Object:  Table [dbo].[Tb_Endereco]    Script Date: 08/29/2015 14:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Endereco](
	[Id_Endereco] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [nvarchar](50) NOT NULL,
	[Complemento] [nvarchar](50) NOT NULL,
	[Bairro] [nvarchar](50) NOT NULL,
	[Cidade] [nvarchar](50) NOT NULL,
	[Estado] [nvarchar](50) NOT NULL,
	[FK_Id_Cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Endereco] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tb_Endereco] ON
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (1, N'133', N'casa1', N'bangu', N'rio de janeiro', N'RJ', 13)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (2, N'133', N'casa1', N'bangu', N'rio de janeiro', N'RJ', 14)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (3, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 15)
SET IDENTITY_INSERT [dbo].[Tb_Endereco] OFF
/****** Object:  StoredProcedure [dbo].[CadCliente]    Script Date: 08/29/2015 14:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CadCliente]
	@Nome nvarchar(50),
	@Telefone nvarchar(50),
	@DataCadastro nvarchar(50),
	@Tipo_Pessoa char(1),
	@CPF nvarchar(11),
	@CNPJ nvarchar(14),
	
	@Numero nvarchar(50),
	@Complemento nvarchar(50),
	@Bairro nvarchar(50),
	@Cidade nvarchar(50),
	@Estado nvarchar(50)

as
declare 
	@ChaveEstrangeira integer
	begin 
		begin try 
			begin transaction 
				
				insert into Tb_Cliente(Nome, Telefone, DataCadastro, Tipo_Pessoa, CPF, CNPJ) values(@Nome, @Telefone, @DataCadastro, @Tipo_Pessoa, @CPF, @CNPJ);
				
				set @ChaveEstrangeira = (select IDENT_CURRENT('Tb_Cliente'));
				
				insert into Tb_Endereco(Numero, Complemento, Bairro, Cidade, Estado, FK_Id_Cliente) values(@Numero, @Complemento, @Bairro, @Cidade, @Estado, @ChaveEstrangeira);
				commit 
		end try 
		begin catch 
			rollback 
		end catch 
	end
GO
/****** Object:  ForeignKey [FK_Cliente_Endereco]    Script Date: 08/29/2015 14:56:27 ******/
ALTER TABLE [dbo].[Tb_Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Endereco] FOREIGN KEY([FK_Id_Cliente])
REFERENCES [dbo].[Tb_Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Tb_Endereco] CHECK CONSTRAINT [FK_Cliente_Endereco]
GO
