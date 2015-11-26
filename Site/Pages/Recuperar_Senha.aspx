<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recuperar_Senha.aspx.cs" Inherits="Site.Pages.Recuperar_Senha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OficiNet</title>

    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
    <link href="../Layout/css/default.css" rel="stylesheet" />
    <link href="../Layout/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../Layout/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-md-6 col-md-offset-3">
                <div class="text-center">
                    <h2>Recuperar Senha</h2>
                </div>
                <hr />
            </div>
            <div class="col-md-6 col-md-offset-3">
                <div class="text-center">
                    <p class="text-success">Digite seu usuário para recuperar sua senha.</p>
                    <p class="text-success">Será enviado para seu e-mail de cadastro uma nova senha, ao acessar o sistema faça a alteração da senha no seu perfil de usuário.</p>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                        <input id="txtEmail" name="txtEmail" runat="server" type="text" class="form-control" placeholder="Digite seu e-mail de Usuário" aria-describedby="basic-addon1" autofocus />
                    </div>
                </div>
                <div>
                    <asp:Button ID="btn_Recuperar_Senha" class="btn btn-success btn-block" runat="server" OnClick="btn_Recuperar_Senha_Click" Text="Continuar" />
                    <br />
                    <br />
                    <asp:label id="lblMensagem" runat="server" Text=""></asp:label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
