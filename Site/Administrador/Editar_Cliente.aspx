<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Editar_Cliente.aspx.cs" Inherits="Site.Administrador.Editar_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Layout/Javascript_Paginas/JS_Editar_Cliente.js"></script>
    <div class="container">
        <div class="ls-form ls-form-horizontal row">
            <fieldset>
                <asp:TextBox ID="txt_Id_Cliente_Editar" runat="server" Visible="false" />
                <br />
                <br />
                <div class="row">
                    <label class="ls-label col-xs-12">
                        <asp:Label ID="lblNomeCliente" runat="server" meta:resourceKey="lblNomeCliente" Text="Nome do Cliente:" CssClass="ls-label-text" />
                        <asp:TextBox ID="txt_Nome_Editar" CssClass="ls-label-text" runat="server" required="required" />
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
                        <asp:TextBox ID="txt_Cpf_Cnpj_Editar" CssClass="ls-label-text" ReadOnly="true" runat="server" required="required" />
                    </label>
                </div>
                <div class="row">
                    <label class="ls-label col-xs-6">
                        <asp:Label ID="lblLogradouro" runat="server" meta:resourceKey="lblLogradouro" Text="Endereço:" CssClass="ls-label-text" />
                        <asp:TextBox ID="txt_Logradouro_Editar" CssClass="ls-label-text" runat="server" required="required" />
                    </label>
                    <label class="ls-label col-xs-4">
                        <asp:Label ID="lblComplemento" runat="server" meta:resourceKey="lblComplemento" Text="Complemento:" CssClass="ls-label-text" />
                        <asp:TextBox ID="txt_Complemento_Editar" CssClass="ls-label-text" runat="server" required="required" />
                    </label>
                    <label class="ls-label col-xs-2">
                        <asp:Label ID="lblNumero" runat="server" meta:resourceKey="lblNumero" Text="Número:" CssClass="ls-label-text" />
                        <asp:TextBox ID="txt_Numero_Editar" CssClass="ls-label-text" runat="server" required="required" />
                    </label>
                </div>
                <div class="row">
                    <label class="ls-label col-xs-3">
                        <asp:Label ID="lblBairro" runat="server" meta:resourceKey="lblBairro" Text="Bairro:" CssClass="ls-label-text" />
                        <asp:TextBox ID="txt_Bairro_Editar" CssClass="ls-label-text" runat="server" required="required" />
                    </label>
                    <label class="ls-label col-xs-3">
                        <asp:Label ID="lblCidade" runat="server" meta:resourceKey="lblCidade" Text="Cidade:" CssClass="ls-label-text" />
                        <asp:TextBox ID="txt_Cidade_Editar" CssClass="ls-label-text" runat="server" required="required" />
                    </label>
                    <label class="ls-label col-xs-3">
                        <asp:Label ID="lblEstado" runat="server" meta:resourceKey="lblEstado" Text="Estado:" CssClass="ls-label-text" />
                        <asp:TextBox ID="txt_Estado_Editar" CssClass="ls-label-text" runat="server" required="required" />
                    </label>
                    <label class="ls-label col-xs-3">
                        <asp:Label ID="lblTelefoneCliente" runat="server" meta:resourceKey="lblTelefoneCliente" Text="Telefone:" CssClass="ls-label-text" />
                        <asp:TextBox ID="txt_Telefone_Editar" CssClass="ls-label-text" runat="server" MaxLength="15" onkeyup="mascara(this, mtel);" required="required" />
                    </label>
                </div>
                <div class="ls-actions-btn">
                    <asp:Button ID="btn_Editar_Cliente" Text="Gravar" runat="server" CssClass="ls-btn-primary" OnClientClick="return validacadastro();" OnClick="btn_Editar_Cliente_Click" />
                    <asp:Button ID="btnVoltar_Editar" runat="server" Text="Voltar" required="required" CssClass="ls-btn" OnClientClick="return voltar();" OnClick="btnVoltar_Editar_Click" />
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>
