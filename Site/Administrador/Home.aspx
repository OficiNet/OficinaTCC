<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Site.Administrador.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

       <%-- Informe seu Login: <br />
        <asp:TextBox ID="txtLogin" runat="server" />
        <asp:RequiredFieldValidator
            ID="requiredLogin"
            runat="server"
            ControlToValidate="txtLogin"
            ErrorMessage="Por favor, informe seu login de acesso."
            ForeColor="Red"
        />
        <br /><br />

        Informe seu Nome: <br />
        <asp:TextBox ID="txtNome" runat="server" />
        <asp:RequiredFieldValidator
            ID="requiredNome"
            runat="server"
            ControlToValidate="txtNome"
            ErrorMessage="Por favor, informe seu Nome de acesso."
            ForeColor="Red"
        />
        <br /><br />

        Informe seu Email: <br />
        <asp:TextBox ID="txtEmail" runat="server" />
        <asp:RequiredFieldValidator
            ID="RequiredEmail"
            runat="server"
            ControlToValidate="txtNome"
            ErrorMessage="Por favor, informe seu Email de acesso."
            ForeColor="Red"
        />
        <br /><br />

        Informe sua Senha: <br />
        <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" />
        <asp:RequiredFieldValidator
            ID="requiredSenha"
            runat="server"
            ControlToValidate="txtSenha"
            ErrorMessage="Por favor, informe sua senha de acesso."
            ForeColor="Red"
        />
        <br /><br />
        Confirme a Senha: <br />
        <asp:TextBox ID="txtSenhaConfirm" runat="server" TextMode="Password" />
        <asp:RequiredFieldValidator
            ID="requiredSenhaConfirm"
            runat="server"
            ControlToValidate="txtSenhaConfirm"
            ErrorMessage="Por favor, confirme sua senha de acesso."
            ForeColor="Red"
        />
        <br /><br />
        <asp:Button ID="btnCadastro" runat="server" Text="Cadastrar Usuário" OnClick="btnCadastro_Click" />
        <p>
        <asp:Label ID="lblResp" runat="server" />
        </p>

        <!-- Validação para comparar os campos de senha -->
        <asp:CompareValidator
            ID="compareSenha"
            runat="server"
            ControlToValidate="txtSenhaConfirm"
            ControlToCompare="txtSenha"
            ErrorMessage="Por favor, confirme sua senha corretamente."
        />--%>
                <asp:Button ID="btnSair" runat="server" Text="Sair"  OnClick="btnSair_Click" />
    
    </div>
    </form>
</body>
</html>
