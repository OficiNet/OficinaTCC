<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Cad_Veiculo.aspx.cs" Inherits="Site.Administrador.Cad_Veiculo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="ls-title-intro ls-ico-book">Cadastro de Veículos</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span> Você está na àrea de <strong>Cadastro de Veículos</strong>, aqui você pode Cadastrar, Editar e Excluir os Veículos dos seus Clientes.
    </div>
    <ul class="ls-tabs-nav" id="awesome-tab">
        <li class="ls-active"><a data-ls-module="tabs" href="#track">Listar Veículos</a></li>
        <li><a data-ls-module="tabs" href="#laps">Cadastrar Veículos</a></li>
    </ul>
    <div class="ls-tabs-container" id="awesome-tab-content">
        <div id="track" class="ls-tab-content ls-active">
            <div class="ls-alert-box-info ls-alert-info ls-dismissable">
                <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
                <span class="ls-ico-info"></span>Listar nesta tela <strong>Todos os Veículos</strong>.
            </div>
        </div>
        <div id="laps" class="ls-tab-content">
            <div class="ls-alert-box-info ls-alert-info ls-dismissable">
                <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
                <span class="ls-ico-info"></span>Abrir nesta tela o formulário de <strong>Cadastro de Veículos</strong>.
            </div>
        </div>
</asp:Content>
