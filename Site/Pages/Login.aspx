<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Site.Pages.Login" %>

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
    <script>
        function RecuperarSenha() {
            window.open("Recuperar_Senha.aspx");
        }
    </script>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlLogin" runat="server">
            <asp:Login ID="txtLogin" runat="server" OnAuthenticate="txtLogin_Authenticate" TitleText="" UserNameLabelText="Login:" PasswordLabelText="Senha:" LoginButtonText="Entrar" FailureText="Acesso Negado!" RememberMeText="Lembrar Senha" DestinationPageUrl="~/Administrador/Principal.aspx">
                <LayoutTemplate>
                    <div class="col-md-6 col-md-offset-3">
                        <div class="text-center">
                            <h2>Acesso ao sistema</h2>
                        </div>
                        <hr />
                    </div>
                    <div class="col-md-4 col-md-offset-4">
                        <div class="input-group has-success">
                            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
                            <asp:TextBox ID="UserName" class="form-control" runat="server" placeholder="Usuário" autofocus></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="input-group has-success">
                            <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-asterisk"></span></span>
                            <asp:TextBox ID="Password" class="form-control" runat="server" TextMode="Password" placeholder="Senha"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="text-success">
                            <asp:CheckBox ID="RememberMe" runat="server" Text=" Lembrar Senha" />
                        </div>
                        <br />
                        <asp:Button ID="LoginButton" type="button" class="btn btn-md btn-success btn-block" runat="server" CommandName="Login" Text="Entrar" ValidationGroup="txtLogin" />
                        <br />
                        <br />
                        <div class="text-center text-success">
                            <a href="#" onclick="RecuperarSenha()">Recuperar Senha</a>
                        </div>
                    </div>
                </LayoutTemplate>
            </asp:Login>
        </asp:Panel>
    </form>

    <script src="../Layout/jquery-1.8.1.min.js"></script>
    <script src="../Layout/js/bootstrap.min.js"></script>
</body>
</html>
