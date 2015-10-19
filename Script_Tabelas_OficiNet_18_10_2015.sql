USE [OficiNet]
GO
/****** Object:  Table [dbo].[Tb_Cliente]    Script Date: 10/18/2015 23:36:03 ******/
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
	[Sexo] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tb_Cliente] ON
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ], [Sexo]) VALUES (167, N'Miguel', N'(32) 3232-3323', CAST(0x0000A532015798F0 AS DateTime), N'F', N'05532369704', N'', N'Mascolino')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ], [Sexo]) VALUES (168, N'Douglas', N'3232323233', CAST(0x0000A532015798F0 AS DateTime), N'F', N'05532369704', N'', N'Mascolino')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ], [Sexo]) VALUES (169, N'Bia', N'3232323233', CAST(0x0000A53201739CD0 AS DateTime), N'F', N'05532369704', N'', N'Mascolino')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ], [Sexo]) VALUES (170, N'wewee', N'(23) 23-2332', CAST(0x0000A53401735680 AS DateTime), N'F', N'05532369704', N'', N'M')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ], [Sexo]) VALUES (171, N'teste', N'3232323233', CAST(0x0000A53401742970 AS DateTime), N'F', N'05532369704', N'', N'M')
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ], [Sexo]) VALUES (172, N'Douglas Leonardo', N'(21) 97905-7068', CAST(0x0000A53501292E20 AS DateTime), N'F', N'055.323.697-04', N'', N'M')
SET IDENTITY_INSERT [dbo].[Tb_Cliente] OFF
/****** Object:  Table [dbo].[Tb_Usuario]    Script Date: 10/18/2015 23:36:03 ******/
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
/****** Object:  Table [dbo].[Tb_Veiculo]    Script Date: 10/18/2015 23:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Veiculo](
	[Id_Veiculo] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [nvarchar](50) NOT NULL,
	[Modelo] [nvarchar](50) NOT NULL,
	[Ano] [nvarchar](50) NOT NULL,
	[Marca] [nvarchar](50) NOT NULL,
	[FK_Id_Cliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Veiculo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tb_Veiculo] ON
INSERT [dbo].[Tb_Veiculo] ([Id_Veiculo], [Placa], [Modelo], [Ano], [Marca], [FK_Id_Cliente]) VALUES (6, N'KOR 0110', N'Monza GLS', N'1994', N'GM', 167)
INSERT [dbo].[Tb_Veiculo] ([Id_Veiculo], [Placa], [Modelo], [Ano], [Marca], [FK_Id_Cliente]) VALUES (7, N'KOR 0110', N'Monza Club', N'1994', N'GM', 167)
INSERT [dbo].[Tb_Veiculo] ([Id_Veiculo], [Placa], [Modelo], [Ano], [Marca], [FK_Id_Cliente]) VALUES (8, N'KOR 0110', N'Monza Classic SE', N'1993', N'GM', 172)
INSERT [dbo].[Tb_Veiculo] ([Id_Veiculo], [Placa], [Modelo], [Ano], [Marca], [FK_Id_Cliente]) VALUES (9, N'KOR 0110', N'Monza', N'1994', N'GM', 172)
INSERT [dbo].[Tb_Veiculo] ([Id_Veiculo], [Placa], [Modelo], [Ano], [Marca], [FK_Id_Cliente]) VALUES (10, N'KOR 0110', N'Monza', N'1994', N'GM', 169)
SET IDENTITY_INSERT [dbo].[Tb_Veiculo] OFF
/****** Object:  Table [dbo].[Tb_Endereco]    Script Date: 10/18/2015 23:36:03 ******/
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
	[Logradouro] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Endereco] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tb_Endereco] ON
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente], [Logradouro]) VALUES (167, N'133', N'casas', N'senador camara', N'rio', N'rio de janeiro', 167, N'aurélio de oliveira ')
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente], [Logradouro]) VALUES (168, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 168, N'aurélio de oliveira ')
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente], [Logradouro]) VALUES (169, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 169, N'aurélio de oliveira ')
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente], [Logradouro]) VALUES (170, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 170, N'aurélio de oliveira')
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente], [Logradouro]) VALUES (171, N'133', N'casas', N'senador camara', N'rio de janeiro', N'rio de janeiro', 171, N'aurélio de oliveira')
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente], [Logradouro]) VALUES (172, N'133', N'Casa 1', N'Senador Camará', N'RJ', N'Rio de Janeiro', 172, N'Rua Aurélio de oliveira 133')
SET IDENTITY_INSERT [dbo].[Tb_Endereco] OFF
/****** Object:  StoredProcedure [dbo].[EditarVeiculo]    Script Date: 10/18/2015 23:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditarVeiculo]
	@Placa nvarchar(50),
	@Modelo nvarchar(50),
	@Marca nvarchar(50),
	@Ano nvarchar(50),
	@Id_Veiculo integer
	--@FK_Id_Cliente integer


as
--declare 
	--@ChaveEstrangeira integer
	begin 
		begin try 
			begin transaction 
				
				update Tb_Veiculo set Placa=@Placa, Modelo=@Modelo, Marca=@Marca, Ano=@Ano where Id_Veiculo = @Id_Veiculo ;
				
				commit 
		end try 
		begin catch 
			rollback 
		end catch 
	end
GO
/****** Object:  StoredProcedure [dbo].[EditarCliente]    Script Date: 10/18/2015 23:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditarCliente]
	@Id_Cliente integer,
	@Nome nvarchar(50),
	@Telefone nvarchar(50),
	@DataCadastro nvarchar(50),
	@Sexo nvarchar(10),
	-- @Tipo_Pessoa char(1),
	-- @CPF nvarchar(20),
	-- @CNPJ nvarchar(20),
	
	@Numero nvarchar(50),
	@Complemento nvarchar(50),
	@Bairro nvarchar(50),
	@Cidade nvarchar(50),
	@Estado nvarchar(50),
	@Logradouro nvarchar(max)

as
--declare 
	--@ChaveEstrangeira integer
	begin 
		begin try 
			begin transaction 
				
				update Tb_Cliente set Nome = @Nome, Telefone=@Telefone, DataCadastro=@DataCadastro, Sexo = @Sexo where Id_Cliente = @Id_Cliente ;
				
				--set @ChaveEstrangeira = (select IDENT_CURRENT('Tb_Cliente'));
				
				update Tb_Endereco set Numero =@Numero, Complemento = @Complemento, Bairro = @Bairro, Cidade = @Cidade, Estado = @Estado, Logradouro = @Logradouro where FK_Id_Cliente = @Id_Cliente;
				commit 
		end try 
		begin catch 
			rollback 
		end catch 
	end
GO
/****** Object:  StoredProcedure [dbo].[CadVeiculo]    Script Date: 10/18/2015 23:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CadVeiculo]
	@Placa nvarchar(50),
	@Modelo nvarchar(50),
	@Ano nvarchar(50),
	@Marca nvarchar(500),
	@Id_Cliente integer

as
--declare 
	--@ChaveEstrangeira integer
	begin 
		begin try 
			begin transaction 
				
				insert into Tb_Veiculo(Placa, Modelo, Ano, Marca,  FK_Id_Cliente ) values(@Placa, @Modelo, @Ano, @Marca, @Id_Cliente );
				
				--set @ChaveEstrangeira = (select IDENT_CURRENT('Tb_Cliente'));
				
				--insert into Tb_Endereco(Numero, Complemento, Bairro, Cidade, Estado, Logradouro, FK_Id_Cliente) values(@Numero, @Complemento, @Bairro, @Cidade, @Estado,@Logradouro, @ChaveEstrangeira);
				commit 
		end try 
		begin catch 
			rollback 
		end catch 
	end
GO
/****** Object:  StoredProcedure [dbo].[CadCliente]    Script Date: 10/18/2015 23:36:01 ******/
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
	@Sexo nvarchar(10),
	
	@Numero nvarchar(50),
	@Complemento nvarchar(50),
	@Bairro nvarchar(50),
	@Cidade nvarchar(50),
	@Estado nvarchar(50),
	@Logradouro nvarchar(max)
	

as
declare 
	@ChaveEstrangeira integer
	begin 
		begin try 
			begin transaction 
				
				insert into Tb_Cliente(Nome, Telefone, DataCadastro, Tipo_Pessoa, CPF, CNPJ, Sexo) values(@Nome, @Telefone, @DataCadastro, @Tipo_Pessoa, @CPF, @CNPJ,@Sexo);
				
				set @ChaveEstrangeira = (select IDENT_CURRENT('Tb_Cliente'));
				
				insert into Tb_Endereco(Numero, Complemento, Bairro, Cidade, Estado, Logradouro, FK_Id_Cliente) values(@Numero, @Complemento, @Bairro, @Cidade, @Estado,@Logradouro, @ChaveEstrangeira);
				commit 
		end try 
		begin catch 
			rollback 
		end catch 
	end
GO
/****** Object:  ForeignKey [FK_Cliente_Endereco]    Script Date: 10/18/2015 23:36:03 ******/
ALTER TABLE [dbo].[Tb_Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Endereco] FOREIGN KEY([FK_Id_Cliente])
REFERENCES [dbo].[Tb_Cliente] ([Id_Cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tb_Endereco] CHECK CONSTRAINT [FK_Cliente_Endereco]
GO
/****** Object:  ForeignKey [FK__Tb_Veicul__FK_Id__1920BF5C]    Script Date: 10/18/2015 23:36:03 ******/
ALTER TABLE [dbo].[Tb_Veiculo]  WITH CHECK ADD FOREIGN KEY([FK_Id_Cliente])
REFERENCES [dbo].[Tb_Cliente] ([Id_Cliente])
GO
