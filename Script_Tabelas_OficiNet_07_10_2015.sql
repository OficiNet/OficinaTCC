USE [OficiNet]
GO
/****** Object:  Table [dbo].[Tb_Cliente]    Script Date: 10/07/2015 04:58:54 ******/
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
	[CPF] [varchar](20) NULL,
	[CNPJ] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tb_Cliente] ON
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (62, N'Miguel', N'(32) 3232-3323', CAST(0x0000A52600B65F80 AS DateTime), N'F', N'055.323.697.04', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (63, N'Adriana', N'(32) 3232-3323', CAST(0x0000A52600B6EC20 AS DateTime), N'F', N'055.323.697.04', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (64, N'Miguel', N'(32) 3232-3323', CAST(0x0000A52600B7BF10 AS DateTime), N'F', N'055.323.697.04', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (65, N'Miguel', N'(32) 3232-3323', CAST(0x0000A52600B84BB0 AS DateTime), N'F', N'14.586.451/0001-67', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (66, N'Miguel', N'(32) 3232-3323', CAST(0x0000A52600BA37E0 AS DateTime), N'F', N'14.586.451/0001-67', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (67, N'Miguel', N'(32) 3232-3323', CAST(0x0000A52600BCB0B0 AS DateTime), N'F', N'14.586.451/0001-67', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (68, N'Miguel', N'(32) 3232-3323', CAST(0x0000A52600BDC9F0 AS DateTime), N'F', N'14.586.451/0001-67', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (69, N'teste 23', N'(32) 3232-3323', CAST(0x0000A52600BE1040 AS DateTime), N'F', N'14.586.451/0001-67', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (70, N'adriana', N'(32) 3232-3323', CAST(0x0000A52600C99960 AS DateTime), N'F', N'14.586.451/', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (71, N'Miguel', N'(32) 3232-3323', CAST(0x0000A52600CE44B0 AS DateTime), N'F', N'055.323.697-04', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (72, N'Miguel', N'(32) 3232-3323', CAST(0x0000A52600CE44B0 AS DateTime), N'F', N'055.323.697-04', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (73, N'teste', N'3232323233', CAST(0x0000A5290006DDD0 AS DateTime), N'F', N'055.323.697-04', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (74, N'douglas', N'3232323233', CAST(0x0000A52900083D60 AS DateTime), N'F', N'055.323.697-04', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (75, N'Miguel', N'3232323233', CAST(0x0000A529000B42D0 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (76, N'Miguel', N'(32) 3232-3323', CAST(0x0000A529000C15C0 AS DateTime), N'F', N'055.323.697-04', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (77, N'douglas', N'3232323233', CAST(0x0000A529000E8E90 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (78, N'teste', N'(32) 3232-3323', CAST(0x0000A529013A3580 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (79, N'Miguel', N'3232323233', CAST(0x0000A529013A7BD0 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (80, N'Miguel', N'(32) 3232-3323', CAST(0x0000A529013AC220 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (81, N'teste', N'3232323233', CAST(0x0000A529013BDB60 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (82, N'teste', N'3232323233', CAST(0x0000A529013C21B0 AS DateTime), N'J', N'', N'055.323.697-04')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (83, N'teste', N'3232323233', CAST(0x0000A529013C6800 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (84, N'Miguel', N'3232323233', CAST(0x0000A529013D3AF0 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (85, N'teste', N'(32) 3232-3323', CAST(0x0000A529013D8140 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (86, N'teste', N'3232323233', CAST(0x0000A529013EE0D0 AS DateTime), N'F', N'055.323.697-04', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (87, N'ds', N'3232323233', CAST(0x0000A529013F6D70 AS DateTime), N'F', N'055.323.697-04', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (88, N'teste', N'(32) 3232-3323', CAST(0x0000A52901411350 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (89, N'teste', N'3232323233', CAST(0x0000A52901419FF0 AS DateTime), N'F', N'05532369704', N'')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ]) VALUES (90, N'teste', N'3232323233', CAST(0x0000A52901422C90 AS DateTime), N'F', N'055.323.697-04', N'')
SET IDENTITY_INSERT [dbo].[Tb_Cliente] OFF
/****** Object:  Table [dbo].[Tb_Veiculo]    Script Date: 10/07/2015 04:58:54 ******/
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
/****** Object:  Table [dbo].[Tb_Usuario]    Script Date: 10/07/2015 04:58:54 ******/
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
/****** Object:  Table [dbo].[Tb_Endereco]    Script Date: 10/07/2015 04:58:54 ******/
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
	[FK_Id_Cliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Endereco] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tb_Endereco] ON
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (62, N'133', N'C1', N'Campo Grande', N'rio de janeiro', N'rio de janeiro', 62)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (63, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 63)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (64, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 64)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (65, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 65)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (66, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 66)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (67, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 67)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (68, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 68)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (69, N'1', N'C1', N'sena', N'1', N'rio de janeiro', 69)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (70, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 70)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (71, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 71)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (72, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 72)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (73, N'1', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 73)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (74, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 74)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (75, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 75)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (76, N'1331', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 76)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (77, N'133', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 77)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (78, N'1', N'casas', N'sena', N'rio de janeiro', N'rio de janeiro', 78)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (79, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 79)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (80, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 80)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (81, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 81)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (82, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 82)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (83, N'133', N'casas', N'sena', N'rio de janeiro', N'rio de janeiro', 83)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (84, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 84)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (85, N'1', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 85)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (86, N'1', N'C1', N'senador camara', N'rio de janeiro', N'rio de janeiro', 86)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (87, N'133', N'ab', N'sena', N'rio de janeiro', N'rio de janeiro', 87)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (88, N'133', N'casas', N'sena', N'rio de janeiro', N'rio de janeiro', 88)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (89, N'1', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 89)
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente]) VALUES (90, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 90)
SET IDENTITY_INSERT [dbo].[Tb_Endereco] OFF
/****** Object:  StoredProcedure [dbo].[CadCliente]    Script Date: 10/07/2015 04:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CadCliente]
	@Nome nvarchar(50),
	@Telefone nvarchar(50),
	@DataCadastro nvarchar(50),
	@Tipo_Pessoa char(1),
	@CPF nvarchar(20),
	@CNPJ nvarchar(20),
	
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
/****** Object:  ForeignKey [FK_Cliente_Endereco]    Script Date: 10/07/2015 04:58:54 ******/
ALTER TABLE [dbo].[Tb_Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Endereco] FOREIGN KEY([FK_Id_Cliente])
REFERENCES [dbo].[Tb_Cliente] ([Id_Cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tb_Endereco] CHECK CONSTRAINT [FK_Cliente_Endereco]
GO
