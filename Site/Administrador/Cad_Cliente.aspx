<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Cad_Cliente.aspx.cs" Inherits="Site.Administrador.Cad_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="ls-title-intro ls-ico-user-add">Cadastro de Clientes</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está na àrea de <strong>Cadastro de Clientes</strong>, aqui você pode Cadastrar, Editar e Excluir seus clientes.
    </div>
    <ul class="ls-tabs-nav" id="awesome-tab">
        <li class="ls-active"><a data-ls-module="tabs" href="#track">Listar Clientes</a></li>
        <li><a data-ls-module="tabs" href="#laps">Cadastrar Clientes</a></li>
    </ul>
    <div class="ls-tabs-container" id="awesome-tab-content">
        <!-- Primeira Aba -->
        <div id="track" class="ls-tab-content ls-active">
            <div class="ls-alert-box-info ls-alert-info ls-dismissable">
                <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
                <span class="ls-ico-info"></span>Listar nesta tela <strong>Todos os Clientes</strong>.
            </div>
        </div>
        <!-- Segunda Aba -->
        <div id="laps" class="ls-tab-content">
            <div class="ls-alert-box-info ls-alert-info ls-dismissable">
                <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
                <span class="ls-ico-info"></span>Abrir nesta tela o formulário de <strong>Cadastro Clientes</strong>.
            </div>
            <div class="ls-box ls-lg-space ls-ico-user-add ls-ico-bg">
                <h1 class="ls-title-1 ls-color-theme">Cadastre seus clientes</h1>
                <p>Comece agora: Cadastre seu primeiro cliente e você já pode abrir Orçamentos e Ordens de Serviços para ele.</p>
                <a class="ls-btn-primary" href="#">Cadastrar meu primeiro cliente</a>
            </div>
        </div>
    </div>
</asp:Content>
