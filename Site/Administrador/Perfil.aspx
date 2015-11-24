<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Site.Administrador.Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Layout/Javascript_Paginas/JS_Perfil.js"></script>
    <h1 class="ls-title-intro ls-ico-users">Perfil</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está no <strong>Perfil do Usuário</strong>, aqui você tem os dados da sua conta.
    </div>
    <div class="container-fluid">
        <asp:Label ID="lblResp" runat="server" ></asp:Label>
        <asp:Panel ID="pnlDados" runat="server">
            <div class="ls-form row">
                <fieldset>
                    <div class="ls-list">
                        <header class="ls-list-header">
                            <div class="ls-list-title col-md-9">
                                <strong>
                                    <label class="ls-color-success">Perfil da conta</label></strong>
                                <small>Administrador</small>
                            </div>
                            <div class="col-md-3 ls-txt-right">
                                <asp:Button ID="btn_Editar" CssClass="ls-btn-primary" Text="Atualizar Dados" runat="server"  OnClick="btn_Editar_Click" />
                            </div>
                        </header>
                        <div class="ls-list-content">
                            <label class="ls-label col-xs-12">
                                <h2 class="ls-color-success">Nome do Usuário</h2>
                                <asp:Label ID="lblNomeUsuario" runat="server" meta:resourceKey="lblNomeUsuario" CssClass="ls-label-text"></asp:Label>
                            </label>
                            <label class="ls-label col-xs-12">
                                <h2 class="ls-color-success">E-mail</h2>
                                <asp:Label ID="lblEmail" runat="server" meta:resourceKey="lblEmail" CssClass="ls-label-text"></asp:Label>
                            </label>
                            <label class="ls-label col-xs-12">
                                <h2 class="ls-color-success">Login</h2>
                                <asp:Label ID="lblLogin" runat="server" meta:resourceKey="lblLogin" CssClass="ls-label-text"></asp:Label>
                            </label>
                        </div>
                    </div>
                </fieldset>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlEdicao" runat="server">
            <div class="ls-form ls-form-horizontal row">
                <fieldset>
                    <div class="row">
                        <label class="ls-label col-md-2">
                            <asp:TextBox ID="txt_Id_Veiculo" CssClass="ls-label-text" runat="server" Visible="false" />
                        </label>
                    </div>
                    <div class="row">
                        <label class="ls-label col-md-4">
                            <asp:Label ID="lblNome_Usuario_Editar" runat="server" meta:resourceKey="lblNome_Usuario_Editar" Text="Nome Usuario:" CssClass="ls-label-text" />
                            <asp:TextBox ID="txt_Nome_Usuario_Editar" CssClass="ls-label-text" runat="server" required="required" />
                        </label>
                        <label class="ls-label col-md-4">
                            <asp:Label ID="lblEmail_Editar" runat="server" meta:resourceKey="lblEmail_Editar" Text="E-mail:" CssClass="ls-label-text" />
                            <asp:TextBox ID="txt_Email_Editar" CssClass="ls-label-text" runat="server" required="required" />
                        </label>
                        <label class="ls-label col-md-4">
                            <asp:Label ID="lblLogin_Editar" runat="server" meta:resourceKey="lblLogin_Editar" Text="Login:" CssClass="ls-label-text" />
                            <asp:TextBox ID="txt_Login_Editar" CssClass="ls-label-text" runat="server" required="required" />
                        </label>
                    </div>
                    <div class="row">
                        <label class="ls-label col-md-2">
                            <asp:Label ID="lblSenha_Editar" runat="server" meta:resourceKey="lblSenha_Editar" Text="Senha:" CssClass="ls-label-text" />
                            <asp:TextBox ID="txt_Senha_Editar" Type="password" CssClass="ls-label-text" required="required" runat="server"  />
                        </label>
                        <label class="ls-label col-md-2">
                            <asp:Label ID="ConfirmarSenha" runat="server" meta:resourceKey="lblConfirmarSenha_Editar" Text="Confirmar Senha:" CssClass="ls-label-text" />
                            <asp:TextBox ID="txtConfirmarSenha" Type="password" CssClass="ls-label-text" required="required" runat="server" />
                        </label>
                    </div>
                </fieldset>
            </div>
            <div class="ls-actions-btn">
                <br />
                <asp:Button ID="btn_Gravar_Perfil" CssClass="ls-btn-primary" Text="Gravar" runat="server"  OnClick="btn_Gravar_Perfil_Click" />
                <asp:Button ID="btnVoltar_Perfil" runat="server" Text="Voltar" CssClass="ls-btn-sucess" OnClientClick="voltar();" OnClick="btnVoltar_Perfil_Click" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>
