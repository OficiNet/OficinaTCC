USE [OficiNet]
GO

/****** Object:  StoredProcedure [dbo].[CadCliente]    Script Date: 08/24/2015 20:52:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[CadCliente]
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



-- exec CadCliente  'Douglas','1212221','', 'j', '21212','323223','133','casa1','bangu', 'rio de janeiro', 'RJ'

-- select * from Tb_Cliente c inner join Tb_Endereco e on c.Id_Cliente = e.FK_Id_Cliente


