<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Lst_Cliente.aspx.cs" Inherits="Site.Administrador.Lst_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="ls-title-intro ls-ico-user-add">Listagem de Clientes</h1>
    <div>
        <strong>
            <asp:Label ID="lblPesqNomeCliente" runat="server" meta:resourceKey="lblPesqNomeCliente" Text="Nome do Cliente:" />
        </strong>
        <br />
        <asp:TextBox ID="txtPesquisa" runat="server" meta:resourceKey="txtPesquisa" CssClass="col-md-6"></asp:TextBox>&nbsp;
        <asp:Button ID="btnListarClientes" OnClick="ListarClientes" runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />
        <br />
        <asp:GridView ID="gridClientes" runat="server" AutoGenerateColumns="false" OnRowCommand="gridClientes_RowCommand" CssClass="ls-table ls-table-striped">
            <Columns>
                <asp:BoundField DataField="Nome" HeaderText="Nome do Cliente" />
                <asp:BoundField DataField="Telefone" HeaderText="Telefone" />
                <asp:BoundField DataField="Tipo_Pessoa" HeaderText="Tipo de Pessoa" />
                <asp:BoundField DataField="CPF" HeaderText="CPF" />
                <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:Button ID="btnEditar" runat="server" CommandName="Editar" Text="Editar" CssClass="ls-btn-default ls-btn-xs" />
                        <asp:Button ID="btnExcluir" runat="server" CommandName="Excluir" Text="Excluir" CssClass="ls-btn-danger ls-btn-xs" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
