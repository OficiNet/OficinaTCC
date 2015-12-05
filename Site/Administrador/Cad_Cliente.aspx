<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Cad_Cliente.aspx.cs" Inherits="Site.Administrador.Cad_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../content/toastr.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Layout/Javascript_Paginas/JS_Cad_Cliente.js"></script>
    <h1 class="ls-title-intro ls-ico-user-add">Cadastro de Clientes</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está na àrea de <strong>Cadastro de Clientes</strong>, aqui você pode Cadastrar, Editar e Excluir seus clientes.
    </div>
    <div class="container-fluid">
        <div id="painelgrid">
            <asp:Panel ID="painelGrid" runat="server" Visible="true">
                <div class="ls-form ls-form-inline">
                    <fieldset>
                        <label class="ls-label col-xs-6">
                            <asp:Label ID="lblPesqNomeCliente" runat="server" meta:resourceKey="lblPesqNomeCliente" Text="Nome do Cliente:" CssClass="ls-label-text" />
                            <asp:TextBox ID="txtPesquisa" runat="server" meta:resourceKey="txtPesquisa" placeholder="Digite aqui sua pesquisa..." CssClass="ls-label-text ls-no-spin"></asp:TextBox>
                        </label>
                        <div class="ls-actions-btn">
                            <asp:Button ID="btnListarClientes" OnClientClick="return carregarformpesq();" OnClick="ListarClientes" runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />
                            <button id="btnNovoCliente" class="ls-btn-sucess" onclick="javascript: newcliente();">Novo Cliente</button>
                        </div>
                    </fieldset>
                </div>
                <br />
                <asp:GridView ID="gridClientes" runat="server" AllowPaging="True" EnableModelValidation="True" PageSize="7" OnPageIndexChanging="gridClientes_PageIndexChanging" CssClass="ls-table ls-table-striped" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="Nome" HeaderText="Nome do Cliente" />
                        <asp:BoundField DataField="Telefone" HeaderText="Telefone" />
                        <asp:BoundField DataField="CPF" HeaderText="CPF" />
                        <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                        <asp:BoundField DataField="Endereco.Bairro" HeaderText="Bairro" />
                        <asp:BoundField DataField="Endereco.Cidade" HeaderText="Cidade" />
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <center>
                                    <asp:Button CssClass="ls-btn-danger ls-btn-xs" ID="btnExcuirCampo" runat="server" Text="Excluir" OnClientClick="return excluir();" OnClick="Excluir_Click" />
                                    <asp:Button CssClass="ls-btn-default ls-btn-xs" ID="btnAtualizar" runat="server" Text="Atualizar" OnClientClick="return carregarform();" OnClick="btnGridAtualizar_Click" />
                                    <asp:Label ID="lblIdCliente"  runat="server" Text='<%# Eval("Id_Cliente") %>' Visible="false" />
                                </center>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </div>
        <div id="painelcpfcnpj" style="display: none;">
            <fieldset>
                <div class="row">
                    <label class="ls-label col-xs-12">
                        <asp:Label ID="lblVerificarCpfCnpj" runat="server" meta:resourceKey="lblVerificarCpfCnpj" Text="Digite seu CPF ou CNPJ:" CssClass="ls-label-text" />
                        <input id="txtValidarCpfCnpj" name='txtValidarCpfCnpj' class="ls-label-text" runat="server" maxlength="18" onkeyup="mascaraMutuario(this,cpfCnpj);" onblur='clearTimeout();' onkeypress='' required="required" />
                        <br />
                        <div style="display: none;">
                            <asp:Label ID="lblValida_cpf_cnpj" runat="server" CssClass="ls-label-text" />
                        </div>
                        <br />
                        <asp:Button ID="btnValidar" Text="Validar" runat="server" OnClientClick="return carregarformv();" OnClick="btnValidar_Click" CssClass="ls-btn-primary" />
                        <asp:Button ID="btnVoltar" CssClass="ls-btn-logout" Text="Voltar" runat="server" OnClientClick="return voltar();" OnClick="btnVoltar_Click" />
                    </label>
                </div>
            </fieldset>
        </div>
        <div id="painelcadastro" style="display: none;">
            <%-- PAINEL DE CADASTRO --%>
            <asp:Panel ID="painelCadastro" runat="server" Visible="true">
                <div class="ls-form ls-form-horizontal row">
                    <fieldset>
                        <div class="row">
                            <label class="ls-label col-xs-12">
                                <asp:Label ID="lblNomeCliente" runat="server" meta:resourceKey="lblNomeCliente" Text="Nome do Cliente:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_Nome" CssClass="ls-label-text" runat="server" required="required" />
                            </label>
                        </div>
                        <div class="row">
                            <label class="ls-label-text col-xs-3">
                                <strong>
                                    <asp:Label ID="lblSexo" runat="server" meta:resourceKey="lblSexo" Text="Sexo:" CssClass="ls-label-text" /></strong>
                                <asp:RadioButtonList ID="radioSexo" runat="server" RepeatDirection="Horizontal" CellSpacing="15" CssClass="ls-field-radio">
                                    <asp:ListItem Text="Masculino" Value="M" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                                </asp:RadioButtonList>
                            </label>
                            <label class="ls-label-text col-xs-3">
                                <strong>
                                    <asp:Label ID="lblTipoPessoa" runat="server" meta:resourceKey="lblTipoPessoa" Text="Tipo Pessoa:" CssClass="ls-label-text" /></strong>
                                <asp:RadioButtonList ID="radioCpf_Cnpj" runat="server" RepeatDirection="Horizontal" CellSpacing="15" CssClass="ls-field-radio">
                                    <asp:ListItem Text="CPF" Value="cpf" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="CNPJ" Value="cnpj"></asp:ListItem>
                                </asp:RadioButtonList>
                            </label>
                            <label class="ls-label col-xs-3">
                                <asp:Label ID="lblCPFCNPJ" runat="server" meta:resourceKey="lblCPFCNPJ" Text="CPF/CNPJ:" CssClass="ls-label-text" />
                                <input id="txt_Cpf_Cnpj" name='txt_Cpf_Cnpj' class="ls-label-text" runat="server" readonly="false" maxlength="18" onkeyup="mascaraMutuario(this,cpfCnpj);" onblur='clearTimeout();' onkeypress='' required="required" />
                            </label>
                        </div>
                        <div class="row">
                            <label class="ls-label col-xs-6">
                                <asp:Label ID="lblLogradouro" runat="server" meta:resourceKey="lblLogradouro" Text="Endereço:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_logradouro" CssClass="ls-label-text" runat="server" required="required" />
                            </label>
                            <label class="ls-label col-xs-4">
                                <asp:Label ID="lblComplemento" runat="server" meta:resourceKey="lblComplemento" Text="Complemento:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_Complemento" CssClass="ls-label-text" runat="server" required="required" />
                            </label>
                            <label class="ls-label col-xs-2">
                                <asp:Label ID="lblNumero" runat="server" meta:resourceKey="lblNumero" Text="Número:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_Numero" CssClass="ls-label-text" runat="server" required="required" />
                            </label>
                        </div>
                        <div class="row">
                            <label class="ls-label col-xs-3">
                                <asp:Label ID="lblBairro" runat="server" meta:resourceKey="lblBairro" Text="Bairro:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_Bairro" CssClass="ls-label-text" runat="server" required="required" />
                            </label>
                            <label class="ls-label col-xs-3">
                                <asp:Label ID="lblCidade" runat="server" meta:resourceKey="lblCidade" Text="Cidade:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_Cidade" CssClass="ls-label-text" runat="server" required="required" />
                            </label>
                            <label class="ls-label col-xs-3">
                                <asp:Label ID="lblEstado" runat="server" meta:resourceKey="lblEstado" Text="Estado:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_Estado" CssClass="ls-label-text" runat="server" required="required" />
                            </label>
                            <label class="ls-label col-xs-3">
                                <asp:Label ID="lblTelefoneCliente" runat="server" meta:resourceKey="lblTelefoneCliente" Text="Telefone:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_Telefone" CssClass="ls-label-text" runat="server" MaxLength="15" onkeyup="mascara(this, mtel);" required="required" />
                            </label>
                        </div>
                        <div class="ls-actions-btn">
                            <asp:Button ID="btn_Cadastrar_Cliente" Text="Gravar" runat="server" OnClientClick="return validacadastro();" OnClick="btn_Cadastrar_Cliente_Click" CssClass="ls-btn-primary" />
                            <asp:Button ID="Button1" CssClass="ls-btn-logout" Text="Voltar" runat="server" OnClientClick="return voltar();" OnClick="btnVoltar_Click" />
                        </div>
                    </fieldset>
                </div>
            </asp:Panel>
        </div>
    </div>

    <script src="../Scripts/jquery-1.6.3.js"></script>
    <script src="../Scripts/toastr.js"></script>
</asp:Content>
