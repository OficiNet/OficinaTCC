
--Script das Tabelas
go
create table Tb_Usuario(
	Id_Usuario integer identity(1,1),
	Nome_Usuario nvarchar(50) not null,
	Email nvarchar(50) not null,
	_Login nvarchar(50) not null,
	Senha nvarchar(250) not null,
	primary key(Id_Usuario))
	 
--inserir Usuario : admin && Senha : admin (criptrografada) Default	 
insert into Tb_Usuario (Nome_Usuario, Email, _Login, Senha) values('Douglas','douglas@gmail.com','admin','21232f297a57a5a743894ae4a801fc3')
	 
	