<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Lista_OrdemServico.aspx.cs" Inherits="Site.Administrador.Lista_OrdemServico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../content/toastr.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="ls-title-intro ls-ico-windows">Listagem de Ordem de Serviços</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está na <strong>Listagem de Ordem de Serviço</strong>, aqui você visualiza todas as Ordens de Serviço.
    </div>
    <div class="container-fluid">
        <div class="ls-actions-btn">
            <asp:Button ID="btnNovaOrdemServico" CssClass="ls-btn-primary" runat="server" Text="Criar Ordem de Serviço" OnClick="NovaOrdemServico_Click" />
        </div>
        <asp:Panel ID="painelGrid" runat="server">
            <asp:GridView ID="gridOrdemServico" runat="server" AllowPaging="True" EnableModelValidation="True" PageSize="7" OnPageIndexChanging="gridOrdemServico_PageIndexChanging" CssClass="ls-table ls-table-striped" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" />
                        <asp:TemplateField HeaderText="Data do Cadastro">
                            <ItemTemplate>
                                <%# Eval("DataCadastro", "{0:dd/MM/yyyy}") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Cliente.Nome" HeaderText="Nome" />
                        <asp:BoundField DataField="Veiculo.Placa" HeaderText="Placa" />
                        <asp:BoundField DataField="Veiculo.Modelo" HeaderText="Modelo" />
                        <asp:TemplateField HeaderText="Valor">
                            <ItemTemplate>
                                <%# Eval("Valor","{0:C}") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Situação">
                            <ItemTemplate>
                                <center>
                                    <%--<asp:Button CssClass="ls-btn-danger ls-btn-xs" ID="btnExcuirCampo" runat="server" Text="Excluir" OnClientClick="return excluir();" OnClick="Excluir_Click" />--%>
                                    <asp:Button CssClass="ls-btn-danger ls-btn-xs" ID="btnAtualizar" runat="server" Text="Fechar" OnClick="btnGridAtualizar_Click" />
                                    <asp:Label ID="lblIdCliente"  runat="server" Text='<%# Eval("Id_Ordem_Servico") %>' Visible="false" />
                                </center>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="painelCadastro" runat="server">
            <div class="ls-form ls-form-horizontal row">
                <fieldset>
                    <div class="row">
                        <div id="divProtocolo">
                            <label class="ls-label col-xs-2">
                                <asp:Label ID="lblProtocolo" runat="server" meta:resourceKey="lblProtocolo" Text="Protocolo:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_Protocolo" disabled="false" CssClass="ls-label-text" runat="server" MaxLength="6" required="required" />
                            </label>
                        </div>
                        <div id="DivDataCadastro">
                            <label class="ls-label col-xs-2">
                                <asp:Label ID="lblDataCadastro" ReadOnly="false" runat="server" meta:resourceKey="lblDataCadastro" Text="Data de Cadastro:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_DataCadastro" disabled="false" CssClass="ls-label-text" runat="server" required="required" />
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="updateClientes" runat="server">
                            <ContentTemplate>
                                <div id="divCliente">
                                    <label class="ls-label col-xs-6">
                                        <strong>
                                            <asp:Label ID="lblCliente" runat="server" meta:resourceKey="lblCliente" Text="Cliente:" CssClass="ls-label-text" />
                                        </strong>
                                        <br />
                                        <div class="ls-custom-select">
                                            <asp:DropDownList ID="ddlClientes" runat="server" AutoPostBack="true" required="required" OnSelectedIndexChanged="ddlClientes_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </label>
                                </div>
                                <asp:Panel ID="painelVeiculos" runat="server">
                                    <div id="divVeiculo">
                                        <label class="ls-label col-xs-6">
                                            <strong>
                                                <asp:Label ID="lblVeiculo" runat="server" meta:resourceKey="lblVeiculo" Text="Veículo:" CssClass="ls-label-text" />
                                            </strong>
                                            <br />
                                            <div class="ls-custom-select">
                                                <asp:DropDownList ID="ddlVeiculo" runat="server" CssClass="ls-select"></asp:DropDownList>
                                            </div>
                                        </label>
                                    </div>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
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
                    <div class="row">
                        <div id="divValor">
                            <label class="ls-label col-xs-2">
                                <strong>
                                    <asp:Label ID="lblValor" runat="server" meta:resourceKey="lblValor" Text="Valor:" CssClass="ls-label-text" /></strong>
                                <asp:TextBox ID="txtValor" CssClass="ls-label-text" onkeyup="mascara(this, mtel);" MaxLength="5" runat="server" required="required" />
                            </label>
                        </div>
                    </div>
                    <div class="ls-actions-btn">
                        <asp:Button runat="server" ID="btnCadastrarOrdemServico" Text="Gravar" CssClass="ls-btn-primary" OnClick="btnCadastrarOrdemServico_Click" />
                        <asp:Button ID="Button1" runat="server" Text="Voltar" CssClass="ls-btn" OnClientClick="voltar();" OnClick="btnVoltar_Click" />
                    </div>
                    <br />
                </fieldset>
            </div>
        </asp:Panel>
    </div>

    <script src="../Scripts/jquery-1.6.3.js"></script>
    <script src="../Scripts/toastr.js"></script>
    <script src="../Layout/Javascript_Paginas/JS_Lista_OrdemServico.js"></script>
</asp:Content>
