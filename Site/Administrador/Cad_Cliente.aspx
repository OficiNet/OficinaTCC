<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Cad_Cliente.aspx.cs" Inherits="Site.Administrador.Cad_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="ls-title-intro ls-ico-user-add">Cadastro de Clientes</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está na àrea de <strong>Cadastro de Clientes</strong>, aqui você pode Cadastrar, Editar e Excluir seus clientes.
    </div>
    <div class="container">



        <asp:GridView ID="gridClientes" runat="server" ></asp:GridView>



        <a href="Lst_Cliente.aspx" type="button">Pesquisar</a>
        <br /><br />

      <%--  Id Cliente:<br />
        <asp:TextBox ID="txt_Id_Cliente" runat="server" />
        <br /><br />--%>

        Nome:<br />
        <asp:TextBox ID="txt_Nome" runat="server" />    
        <br /><br />

         Telefone:<br />
        <asp:TextBox ID="txt_Telefone" runat="server" />    
        <br /><br />

        <asp:RadioButtonList  ID="radioCpf_Cnpj" runat="server"  RepeatDirection="Horizontal">
            <asp:ListItem Text="CPF" Value="cpf" Selected="True"></asp:ListItem>
            <asp:ListItem Text="CNPJ" Value="cnpj"></asp:ListItem>
        </asp:RadioButtonList>

        <asp:TextBox ID="txt_Cpf_Cnpj" runat="server" />    
        <br /><br />

         Complemento:<br />
        <asp:TextBox ID="txt_Complemento" runat="server" />    
        <br /><br />

         Numero:<br />
        <asp:TextBox ID="txt_Numero" runat="server" />    
        <br /><br />
        
         Bairro:<br />
        <asp:TextBox ID="txt_Bairro" runat="server" />    
        <br /><br />

        Cidade:<br />
        <asp:TextBox ID="txt_Cidade" runat="server" />    
        <br /><br />

        Estado:<br />
        <asp:TextBox ID="txt_Estado" runat="server" />    
        <br /><br />

        <asp:Button ID="btn_Cadastrar_Cliente" Text="Cadastrar" runat="server" OnClick="btn_Cadastrar_Cliente_Click" />

        <p>
            <asp:Label ID="lblResp" runat="server" />
        </p>

      
    </div>
</asp:Content>
