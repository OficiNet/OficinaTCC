﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Cad_Veiculo.aspx.cs" Inherits="Site.Administrador.Cad_Veiculo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function excluir() {
            // carregarform();

            var r = confirm('Deseja realmente excluir ?');
            if (r == true) {
                //alert('true');
                return true;
            } else {
                //alert('false');
                return false;
            }
        }
    </script>

    <h1 class="ls-title-intro ls-ico-user-add">Cadastro de Veiculos</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está na àrea de <strong>Cadastro de Clientes</strong>, aqui você pode Cadastrar, Editar e Excluir seus clientes.
    </div>
    <div class="container">
        <asp:Panel ID="painelGrid" runat="server">
            <%--<asp:Button ID="btnListarClientes" OnClick="ListarClientes" runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />--%>
            <br />
            <strong>
                <asp:Label ID="lblPesqNomeCliente" runat="server" meta:resourceKey="lblPesqNomeCliente" Text="Nome do Cliente:" />
            </strong>
            <br />
            <asp:TextBox ID="txtPesquisa" runat="server" meta:resourceKey="txtPesquisa" CssClass="col-md-6"></asp:TextBox>&nbsp;
            <asp:Button ID="btnListarClientes" runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />
            <asp:Button ID="btnNovoCliente" runat="server" Text="Novo Cliente" CssClass="ls-btn-sucess" />
            <asp:Label ID="lblResp" runat="server" />
            <br />
            <asp:GridView ID="gridVeiculos" runat="server" AllowPaging="True" EnableModelValidation="True" PageSize="10" OnPageIndexChanging="gridVeiculos_PageIndexChanging" CssClass="ls-table ls-table-striped" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Cliente.Nome" HeaderText="Nome do Cliente" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" />
                    <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
                    <asp:BoundField DataField="Ano" HeaderText="Ano" />
                    <asp:BoundField DataField="Placa" HeaderText="Placa" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <center>
                                <asp:Button CssClass="ls-btn-danger ls-btn-xs" ID="btnExcuirCampo" runat="server" Text="Excluir" OnClientClick="return excluir();" OnClick="Excluir_Click"   />
                                <asp:Button CssClass="ls-btn-default ls-btn-xs" ID="btnAtualizar" runat="server" Text="Atualizar" OnClick="btnGridAtualizar_Click"  />
                                <asp:Label ID="lblIdVeiculo"  runat="server" Text='<%# Eval("Id_Veiculo") %>' Visible="true" />
                                <asp:Label ID="lblNome" runat="server" Text='<%# Eval("Cliente.Nome") %>' Visible="false" />
                                <asp:Label ID="lblTelefone" runat="server" Text='<%# Eval("Marca") %>' Visible="false" />
                                <asp:Label ID="lblTipo_Pessoa" runat="server" Text='<%# Eval("Modelo") %>' Visible="false" />
                                <asp:Label ID="lbl_CPF" runat="server" Text='<%# Eval("Ano") %>' Visible="false" />
                                <asp:Label ID="lbl_CNPJ" runat="server" Text='<%# Eval("Placa") %>' Visible="false" />
                            </center>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <%-- PAINEL DE CADASTRO --%>
        <asp:Panel ID="painelCadastro" runat="server">
            <div class="ls-form ls-form-horizontal row">
                <fieldset>
                    <div class="row">
                        <label class="ls-label col-xs-2">
                            <asp:TextBox ID="txt_Id_Veiculo" CssClass="ls-label-text" runat="server" Visible="false" />
                        </label>
                    </div>
                    <div class="row">
                        <label class="ls-label col-xs-4">
                            <asp:Label ID="lblPlaca" runat="server" meta:resourceKey="lblPlaca" Text="Placa:" CssClass="ls-label-text" />
                            <asp:TextBox ID="txt_Placa" CssClass="ls-label-text" runat="server" required="required" />
                        </label>
                        <label class="ls-label col-xs-4">
                            <asp:Label ID="lblModelo" runat="server" meta:resourceKey="lblModelo" Text="Modelo:" CssClass="ls-label-text" />
                            <asp:TextBox ID="txt_Modelo" CssClass="ls-label-text" runat="server" required="required" />
                        </label>
                        <label class="ls-label col-xs-4">
                            <asp:Label ID="lblMarca" runat="server" meta:resourceKey="lblMarca" Text="Marca:" CssClass="ls-label-text" />
                            <asp:TextBox ID="txt_Marca" CssClass="ls-label-text" runat="server" required="required" />
                        </label>
                    </div>
                    <div class="row">
                        <label class="ls-label col-xs-2">
                            <asp:Label ID="lblAno" runat="server" meta:resourceKey="lblAno" Text="Ano:" CssClass="ls-label-text" />
                            <asp:TextBox ID="txt_Ano" CssClass="ls-label-text" runat="server" required="required" />
                        </label>
                        <label class="ls-field-sm col-xs-6">
                            <strong><asp:Label ID="lblCliente" runat="server" meta:resourceKey="lblCliente" Text="Cliente:" CssClass="ls-label-text" /></strong>
                            <br />
                            <div class="ls-custom-select">
                                <asp:DropDownList ID="ddlClientes" runat="server" CssClass="ls-select"></asp:DropDownList>
                            </div>
                        </label>
                    </div>
                </fieldset>
            </div>
            <div class="ls-actions-btn">
                <br />
                <asp:Button ID="btn_Cadastrar_Veiculo" CssClass="ls-btn-primary" Text="Cadastrar" runat="server" OnClick="btn_Cadastrar_Veiculo_Click" />
                <asp:Button ID="btn_Editar_Veiculo" CssClass="ls-btn-primary" Text="Gravar" runat="server" OnClick="btn_Editar_Veiculo_Click" />
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" CssClass="ls-btn-sucess" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>
