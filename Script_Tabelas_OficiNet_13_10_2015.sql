 
 -- create database OficiNet

USE [OficiNet]
GO
/****** Object:  Table [dbo].[Tb_Cliente]    Script Date: 10/13/2015 01:02:18 ******/
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
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ], [Sexo]) VALUES (166, N'Miguel', N'3232323233', CAST(0x0000A530000E4840 AS DateTime), N'F', N'05532369704', N'', N'Mascolino')
SET IDENTITY_INSERT [dbo].[Tb_Cliente] OFF
/****** Object:  Table [dbo].[Tb_Veiculo]    Script Date: 10/13/2015 01:02:18 ******/
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
/****** Object:  Table [dbo].[Tb_Usuario]    Script Date: 10/13/2015 01:02:18 ******/
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
/****** Object:  Table [dbo].[Tb_Endereco]    Script Date: 10/13/2015 01:02:18 ******/
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
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente], [Logradouro]) VALUES (166, N'133', N'casa 3', N'bangu', N'rio de janeiro', N'rj', 166, N'Rua aurélio de oliveira  133')
SET IDENTITY_INSERT [dbo].[Tb_Endereco] OFF
/****** Object:  StoredProcedure [dbo].[EditarCliente]    Script Date: 10/13/2015 01:02:15 ******/
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
/****** Object:  StoredProcedure [dbo].[CadCliente]    Script Date: 10/13/2015 01:02:15 ******/
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
/****** Object:  ForeignKey [FK_Cliente_Endereco]    Script Date: 10/13/2015 01:02:18 ******/
ALTER TABLE [dbo].[Tb_Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Endereco] FOREIGN KEY([FK_Id_Cliente])
REFERENCES [dbo].[Tb_Cliente] ([Id_Cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tb_Endereco] CHECK CONSTRAINT [FK_Cliente_Endereco]
GO
