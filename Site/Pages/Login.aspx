<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Site.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>     
        <asp:Login ID="txtLogin" runat="server" OnAuthenticate="txtLogin_Authenticate" TitleText="" UserNameLabelText="Login" PasswordLabelText="Senha:" LoginButtonText="Acessar" FailureText="Acesso Negado!!" RememberMeText="Lembrar Senha" DestinationPageUrl="~/Administrador/Home.aspx" />



        

    </div>
    </form>
</body>
</html>
