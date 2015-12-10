<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="Site.Administrador.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="ls-title-intro ls-ico-home">Página Inicial</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está no <strong>Painel Administrativo</strong>, abaixo você tem um resumo das principais atividades que pode fazer.
    </div>
    <div class="ls-box ls-board-box">
        <header class="ls-info-header">
            <h2 class="ls-title-3">Resumo</h2>
            <p class="ls-float-right ls-float-none-xs ls-small-info">Quantidade válida até <strong><asp:label id="lblData" runat="server" Text=""></asp:label></strong></p>
        </header>
        <div id="sending-stats" class="row">
            <div class="col-sm-6 col-md-3">
                <div class="ls-box">
                    <div class="ls-box-head">
                        <h6 class="ls-title-4">CLIENTES CADASTRADOS</h6>
                    </div>
                    <div class="ls-box-body">
                        <strong><asp:label id="lblQtdClientes" runat="server" Text=""></asp:label></strong>
                    </div>
                    <div class="ls-box-footer">
                        <a href="Cad_Cliente.aspx" aria-label="Cadastro de Clientes" class="ls-btn ls-btn-sm" title="Abrir Cadastro de Clientes">Cadastro de Clientes</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="ls-box">
                    <div class="ls-box-head">
                        <h6 class="ls-title-4">VEÍCULOS CADASTRADOS</h6>
                    </div>
                    <div class="ls-box-body">
                        <strong><asp:label id="lblQtdVeiculos" runat="server" Text=""></asp:label></strong>
                    </div>
                    <div class="ls-box-footer">
                        <a href="Cad_Veiculo.aspx" aria-label="Cadastro de Veículos" class="ls-btn ls-btn-sm" title="Abrir Cadastro de Veículos">Cadastro de Veículos</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="ls-box">
                    <div class="ls-box-head">
                        <h6 class="ls-title-4">ORDENS DE SERVIÇO</h6>
                    </div>
                    <div class="ls-box-body">
                        <strong><asp:label id="lblQtdOS" runat="server" Text=""></asp:label></strong>
                    </div>
                    <div class="ls-box-footer">
                        <a href="Lista_OrdemServico.aspx" aria-label="Listagem de O.S" class="ls-btn ls-btn-sm" title="Abrir Listagem de O.S">Ordem de Serviço</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="ls-box">
                    <div class="ls-box-head">
                        <h6 class="ls-title-4">DATA</h6>
                    </div>
                    <div class="ls-box-body">
                        <div class="col-xs-6">
                            <strong><asp:label id="lblDia" runat="server" Text=""></asp:label></strong>
                            <small>dia</small>
                        </div>
                        <div class="col-xs-6">
                            <strong><asp:label id="lblMes" runat="server" Text=""></asp:label></strong>
                            <small>mês</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
