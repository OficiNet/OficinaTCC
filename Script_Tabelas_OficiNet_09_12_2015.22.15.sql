USE [OficiNet]
GO
/****** Object:  Table [dbo].[Tb_Cliente]    Script Date: 12/09/2015 22:13:20 ******/
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
INSERT [dbo].[Tb_Cliente] ([Id_Cliente], [Nome], [Telefone], [DataCadastro], [Tipo_Pessoa], [CPF], [CNPJ], [Sexo]) VALUES (1, N'Douglas', N'(21) 21212-2121', CAST(0x0000A569016813B0 AS DateTime), N'F', N'055.323.697-04', N'', N'M')
SET IDENTITY_INSERT [dbo].[Tb_Cliente] OFF
/****** Object:  Table [dbo].[Tb_Usuario]    Script Date: 12/09/2015 22:13:20 ******/
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
INSERT [dbo].[Tb_Usuario] ([Id_Usuario], [Nome_Usuario], [Email], [_Login], [Senha]) VALUES (2, N'admin', N'douglas.loc@hotmail.com', N'admin', N'21232f297a57a5a743894ae4a801fc3')
INSERT [dbo].[Tb_Usuario] ([Id_Usuario], [Nome_Usuario], [Email], [_Login], [Senha]) VALUES (5, N'admin1', N'bruno-fraga@hotmail.com', N'admin2', N'21232f297a57a5a743894ae4a801fc3')
SET IDENTITY_INSERT [dbo].[Tb_Usuario] OFF
/****** Object:  Table [dbo].[Tb_Veiculo]    Script Date: 12/09/2015 22:13:20 ******/
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
INSERT [dbo].[Tb_Veiculo] ([Id_Veiculo], [Placa], [Modelo], [Ano], [Marca], [FK_Id_Cliente]) VALUES (1, N'saq1234', N'tyt', N'1234', N'yt', 1)
SET IDENTITY_INSERT [dbo].[Tb_Veiculo] OFF
/****** Object:  Table [dbo].[Tb_Endereco]    Script Date: 12/09/2015 22:13:20 ******/
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
INSERT [dbo].[Tb_Endereco] ([Id_Endereco], [Numero], [Complemento], [Bairro], [Cidade], [Estado], [FK_Id_Cliente], [Logradouro]) VALUES (1, N'wq', N'wqw', N'wq', N'wq', N'wq', 1, N'wqw')
SET IDENTITY_INSERT [dbo].[Tb_Endereco] OFF
/****** Object:  Table [dbo].[Tb_Ordem_Servico]    Script Date: 12/09/2015 22:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Ordem_Servico](
	[Id_Ordem_Servico] [int] IDENTITY(1,1) NOT NULL,
	[Protocolo] [int] NOT NULL,
	[DataCadastro] [date] NOT NULL,
	[Observacoes] [nvarchar](max) NOT NULL,
	[Valor] [decimal](12, 2) NOT NULL,
	[_Status] [nvarchar](50) NULL,
	[FK_Id_Cliente] [int] NOT NULL,
	[FK_Id_Veiculo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Ordem_Servico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tb_Ordem_Servico] ON
INSERT [dbo].[Tb_Ordem_Servico] ([Id_Ordem_Servico], [Protocolo], [DataCadastro], [Observacoes], [Valor], [_Status], [FK_Id_Cliente], [FK_Id_Veiculo]) VALUES (2, 1002, CAST(0xC43A0B00 AS Date), N'wqwq', CAST(21212.00 AS Decimal(12, 2)), N'Aberto', 1, 1)
INSERT [dbo].[Tb_Ordem_Servico] ([Id_Ordem_Servico], [Protocolo], [DataCadastro], [Observacoes], [Valor], [_Status], [FK_Id_Cliente], [FK_Id_Veiculo]) VALUES (3, 1003, CAST(0xC43A0B00 AS Date), N'wqw', CAST(2000.00 AS Decimal(12, 2)), N'Aberto', 1, 1)
SET IDENTITY_INSERT [dbo].[Tb_Ordem_Servico] OFF
/****** Object:  StoredProcedure [dbo].[EditarVeiculo]    Script Date: 12/09/2015 22:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditarVeiculo]
	@Placa nvarchar(50),
	@Modelo nvarchar(50),
	@Marca nvarchar(50),
	@Ano nvarchar(50),
	@Id_Veiculo integer,
	@FK_Id_Cliente integer


as
--declare 
	--@ChaveEstrangeira integer
	begin 
		begin try 
			begin transaction 
				
				update Tb_Veiculo set Placa=@Placa, Modelo=@Modelo, Marca=@Marca, Ano=@Ano, FK_Id_Cliente=@FK_Id_Cliente where Id_Veiculo = @Id_Veiculo ;
				
				commit 
		end try 
		begin catch 
			rollback 
		end catch 
	end
GO
/****** Object:  StoredProcedure [dbo].[EditarCliente]    Script Date: 12/09/2015 22:13:17 ******/
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
/****** Object:  StoredProcedure [dbo].[CadCliente]    Script Date: 12/09/2015 22:13:17 ******/
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
/****** Object:  StoredProcedure [dbo].[CadVeiculo]    Script Date: 12/09/2015 22:13:17 ******/
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
/****** Object:  StoredProcedure [dbo].[CadOrdemServico]    Script Date: 12/09/2015 22:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CadOrdemServico]
	@Protocolo integer,
	--@DataCadastro date,
	@Observacoes nvarchar(max),
	@Valor decimal(12,2),
	--@Status nvarchar(50),
	@Id_Cliente integer,
	@Id_Veiculo integer
	

as
	begin 
		begin try 
			begin transaction 
				
				insert into Tb_Ordem_Servico (Protocolo, DataCadastro, Observacoes, Valor, _Status, FK_Id_Cliente, FK_Id_Veiculo  ) values(@Protocolo, GETDATE(), @Observacoes, @Valor, 'Aberto', @Id_Cliente, @Id_Veiculo);
			
				commit 
		end try 
		begin catch 
			rollback 
		end catch 
	end
GO
/****** Object:  StoredProcedure [dbo].[Deletar]    Script Date: 12/09/2015 22:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Deletar]
	@IdCliente integer

as
--declare 
	--@ChaveEstrangeira integer
	begin 
		begin try 
			begin transaction 
			    delete from Tb_Ordem_Servico where FK_Id_Cliente = @IdCliente;
				delete from Tb_Endereco where FK_Id_Cliente = @IdCliente;
				delete from Tb_Veiculo where FK_Id_Cliente = @IdCliente;				
				delete from Tb_Cliente where Id_Cliente = @IdCliente;
			commit 
		end try 
		begin catch 
			rollback 
		end catch 
	end
GO
/****** Object:  ForeignKey [FK__Tb_Endere__FK_Id__182C9B23]    Script Date: 12/09/2015 22:13:20 ******/
ALTER TABLE [dbo].[Tb_Endereco]  WITH CHECK ADD FOREIGN KEY([FK_Id_Cliente])
REFERENCES [dbo].[Tb_Cliente] ([Id_Cliente])
GO
/****** Object:  ForeignKey [FK__Tb_Ordem___FK_Id__164452B1]    Script Date: 12/09/2015 22:13:20 ******/
ALTER TABLE [dbo].[Tb_Ordem_Servico]  WITH CHECK ADD FOREIGN KEY([FK_Id_Cliente])
REFERENCES [dbo].[Tb_Cliente] ([Id_Cliente])
GO
/****** Object:  ForeignKey [FK__Tb_Ordem___FK_Id__173876EA]    Script Date: 12/09/2015 22:13:20 ******/
ALTER TABLE [dbo].[Tb_Ordem_Servico]  WITH CHECK ADD FOREIGN KEY([FK_Id_Veiculo])
REFERENCES [dbo].[Tb_Veiculo] ([Id_Veiculo])
GO
/****** Object:  ForeignKey [FK__Tb_Veicul__FK_Id__1920BF5C]    Script Date: 12/09/2015 22:13:20 ******/
ALTER TABLE [dbo].[Tb_Veiculo]  WITH CHECK ADD FOREIGN KEY([FK_Id_Cliente])
REFERENCES [dbo].[Tb_Cliente] ([Id_Cliente])
GO
