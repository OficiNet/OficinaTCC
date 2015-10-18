<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Site.Administrador.Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="ls-title-intro ls-ico-users">Perfil</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está no <strong>Perfil do Usuário</strong>, aqui você tem os dados da sua conta.
    </div>
    <div class="container-fluid">
        <asp:Panel ID="pnlDados" runat="server">
            <div class="ls-form row">
                <fieldset>
                    <div class="ls-list">
                        <header class="ls-list-header">
                            <div class="ls-list-title col-md-9">
                                <strong><label class="ls-color-success">Perfil da conta</label></strong>
                                <small>Administrador</small>
                            </div>
                            <div class="col-md-3 ls-txt-right">
                                <label class="ls-btn-primary">Atualizar Dados</label>
                            </div>
                        </header>
                        <div class="ls-list-content">
                            <label class="ls-label col-xs-12">
                                <h2 class="ls-color-success">Nome do Usuário</h2>
                                <asp:Label ID="lblNomeUsuario" runat="server" meta:resourceKey="lblNomeUsuario" Text="Douglas Leonardo" CssClass="ls-label-text"></asp:Label>
                            </label>
                            <label class="ls-label col-xs-12">
                                <h2 class="ls-color-success">E-mail</h2>
                                <asp:Label ID="lblEmail" runat="server" meta:resourceKey="lblEmail" Text="douglas.loc@hotmail.com" CssClass="ls-label-text"></asp:Label>
                            </label>
                            <label class="ls-label col-xs-12">
                                <h2 class="ls-color-success">Login</h2>
                                <asp:Label ID="lblLogin" runat="server" meta:resourceKey="lblLogin" Text="admin" CssClass="ls-label-text"></asp:Label>
                            </label>
                        </div>
                    </div>
                </fieldset>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
