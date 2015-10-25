<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Lista_OrdemServico.aspx.cs" Inherits="Site.Administrador.Lista_OrdemServico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="ls-title-intro ls-ico-windows">Listagem de Ordem de Serviços</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está na <strong>Listagem de Ordem de Serviço</strong>, aqui você visualiza todas as Ordens de Serviço.
    </div>
    <div class="container-fluid">
        <asp:Panel ID="painelCadastro" runat="server">
            <div class="ls-form ls-form-horizontal row">
                <fieldset>
                    <div class="row">
                        <div id="divProtocolo">
                            <label class="ls-label col-xs-2">
                                <asp:Label ID="lblProtocolo" runat="server" meta:resourceKey="lblProtocolo" Text="Protocolo:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_Protocolo" CssClass="ls-label-text" runat="server" MaxLength="6" required="required" />
                            </label>
                        </div>
                        <div id="DivDataCadastro">
                            <label class="ls-label col-xs-2">
                                <asp:Label ID="lblDataCadastro" runat="server" meta:resourceKey="lblDataCadastro" Text="Data de Cadastro:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_DataCadastro" CssClass="ls-label-text" runat="server" required="required" />
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div id="divCliente">
                            <label class="ls-label col-xs-6">
                                <strong>
                                    <asp:Label ID="lblCliente" runat="server" meta:resourceKey="lblCliente" Text="Cliente:" CssClass="ls-label-text" />
                                </strong>
                                <br />
                                <div class="ls-custom-select">
                                    <asp:DropDownList ID="ddlClientes" runat="server" required="required" CssClass="ls-select"></asp:DropDownList>
                                </div>
                            </label>
                        </div>
                        <div id="divVeiculo">
                            <label class="ls-label col-xs-6">
                                <strong>
                                    <asp:Label ID="lblVeiculo" runat="server" meta:resourceKey="lblVeiculo" Text="Veículo:" CssClass="ls-label-text" />
                                </strong>
                                <br />
                                <div class="ls-custom-select">
                                    <asp:DropDownList ID="ddlVeiculo" runat="server" required="required" CssClass="ls-select"></asp:DropDownList>
                                </div>
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div id="divObservacao">
                            <label class="ls-label col-xs-12">
                                <strong>
                                    <asp:Label ID="lblObs" runat="server" meta:resourceKey="lblObs" Text="Observação:" CssClass="ls-label-text" />
                                </strong>
                                <asp:TextBox ID="txt_Obs" CssClass="ls-label-text" runat="server" MaxLength="250" required="required" TextMode="MultiLine" />
                            </label>
                        </div>
                    </div>
                </fieldset>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
