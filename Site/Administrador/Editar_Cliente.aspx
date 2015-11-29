<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Editar_Cliente.aspx.cs" Inherits="Site.Administrador.Editar_Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Layout/Javascript_Paginas/JS_Editar_Cliente.js"></script>
    <div class="container">
        <br /><br />
                <asp:Button ID="btnVoltar_Editar" runat="server" Text="Voltar" required="required" CssClass="ls-btn-sucess" OnClientClick="return voltar();" OnClick="btnVoltar_Editar_Click" />
               <%-- <button id="btnVoltar_Editar"  class="ls-btn-sucess" onclick="voltar">Voltar</button>--%>
                <br />
                <br />
                <asp:TextBox ID="txt_Id_Cliente_Editar" runat="server" Visible="false" />
                <br />
                <br />
                Nome:<br />
                <asp:TextBox ID="txt_Nome_Editar" runat="server" required="required" />
                <br />
                <br />
                <label class="ls-label-text col-xs-3">
                    <strong><asp:Label ID="lblSexo" runat="server" meta:resourceKey="lblSexo" Text="Sexo:" CssClass="ls-label-text" /></strong>
                    <asp:RadioButtonList ID="radioSexo" runat="server" RepeatDirection="Horizontal" CellSpacing="15" CssClass="ls-field-radio">
                        <asp:ListItem Text="Masculino" Value="M" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Feminino" Value="F"></asp:ListItem>
                    </asp:RadioButtonList>
                </label>
        <br /><br /><br /><br />
                Telefone:<br />
                <asp:TextBox ID="txt_Telefone_Editar" runat="server" required="required" MaxLength="15" onkeyup="mascara(this, mtel);"/>
                <br />
                <br />

                <%-- <asp:RadioButtonList  ID="RadioButtonList1" runat="server"  RepeatDirection="Horizontal">
                        <asp:ListItem Text="CPF" Value="cpf" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="CNPJ" Value="cnpj"></asp:ListItem>
                    </asp:RadioButtonList>--%>
                CPF || CNPJ<br />
                <asp:TextBox ID="txt_Cpf_Cnpj_Editar" ReadOnly="true" runat="server" required="required" />
                <br />
                <br />
                Logradouro:<br />
                <asp:TextBox ID="txt_Logradouro_Editar" runat="server" required="required" />
                <br />
                <br />
                Complemento:<br />
                <asp:TextBox ID="txt_Complemento_Editar" runat="server" required="required" />
                <br />  
                <br />
                Numero:<br />
                <asp:TextBox ID="txt_Numero_Editar" runat="server" required="required" />
                <br />
                <br />
                Bairro:<br />
                <asp:TextBox ID="txt_Bairro_Editar" runat="server" required="required" />
                <br />
                <br />
                Cidade:<br />
                <asp:TextBox ID="txt_Cidade_Editar" runat="server" required="required" />
                <br />
                <br />
                Estado:<br />
                <asp:TextBox ID="txt_Estado_Editar" runat="server" required="required" />
                <br />
                <br />
                <asp:Button ID="btn_Editar_Cliente" Text="Editar" runat="server" OnClientClick="return validacadastro();" OnClick="btn_Editar_Cliente_Click"  />
    </div>
</asp:Content>
