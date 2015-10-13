USE [OficiNet]
GO

/****** Object:  StoredProcedure [dbo].[CadCliente]    Script Date: 10/11/2015 15:42:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


alter procedure [dbo].[EditarCliente]
	@Id_Cliente integer,
	@Nome nvarchar(50),
	@Telefone nvarchar(50),
	@DataCadastro nvarchar(50),
	-- @Tipo_Pessoa char(1),
	-- @CPF nvarchar(20),
	-- @CNPJ nvarchar(20),
	
	@Numero nvarchar(50),
	@Complemento nvarchar(50),
	@Bairro nvarchar(50),
	@Cidade nvarchar(50),
	@Estado nvarchar(50)

as
--declare 
	--@ChaveEstrangeira integer
	begin 
		begin try 
			begin transaction 
				
				update Tb_Cliente set Nome = @Nome, Telefone=@Telefone, DataCadastro=@DataCadastro where Id_Cliente = @Id_Cliente ;
				
				--set @ChaveEstrangeira = (select IDENT_CURRENT('Tb_Cliente'));
				
				update Tb_Endereco set Numero =@Numero, Complemento = @Complemento, Bairro = @Bairro, Cidade = @Cidade, Estado = @Estado where FK_Id_Cliente = @Id_Cliente;
				commit 
		end try 
		begin catch 
			rollback 
		end catch 
	end


GO

-- exec EditarCliente 125,'ediatr','ediatr', '2015-10-08 22:35:00.000','ediatr','ediatr','ediatr','ediatr','ediatr'


--delete from Tb_Cliente

--delete from Tb_Endereco


