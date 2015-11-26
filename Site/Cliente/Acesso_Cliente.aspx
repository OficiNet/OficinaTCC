<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/Cliente.Master" AutoEventWireup="true" CodeBehind="Acesso_Cliente.aspx.cs" Inherits="Site.Cliente.Acesso_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
    <link href="../Layout/css/default.css" rel="stylesheet" />
    <link href="../Layout/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../Layout/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Área do Cliente</h1>
    <hr />
    <div class="col-md-4">
        <div class="input-group has-success">
            <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
            <asp:TextBox ID="CPFCNPJ" class="form-control" runat="server" placeholder="Digite o CPF ou o CNPJ (Somente Números)" autofocus required></asp:TextBox>
            <span class="input-group-btn">
                <button id="btnPesquisar" type="button" class="btn btn-md btn-success" runat="server" text="Pesquisar">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </span>
            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="CPFCNPJ"></asp:RequiredFieldValidator>
        </div>
    </div>
    <%--<asp:Button ID="btnPesquisar" type="button" class="btn btn-md btn-success" runat="server" Text="Pesquisar" />--%>
</asp:Content>
