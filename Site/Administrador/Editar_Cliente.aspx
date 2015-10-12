<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Editar_Cliente.aspx.cs" Inherits="Site.Administrador.Editar_Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    



    <div class="container">

        <br /><br />
                    
                <asp:Button ID="btnVoltar_Editar" runat="server" Text="Voltar" CssClass="ls-btn-sucess" OnClick="btnVoltar_Editar_Click" />
               <%-- <button id="btnVoltar_Editar"  class="ls-btn-sucess" onclick="voltar">Voltar</button>--%>
                <br />
                <br />

                <asp:TextBox ID="txt_Id_Cliente_Editar" runat="server" Visible="false" />
                <br />
                <br />

                Nome:<br />
                <asp:TextBox ID="txt_Nome_Editar" runat="server" />
                <br />
                <br />

                Telefone:<br />
                <asp:TextBox ID="txt_Telefone_Editar" runat="server" />
                <br />
                <br />

                <%-- <asp:RadioButtonList  ID="RadioButtonList1" runat="server"  RepeatDirection="Horizontal">
                        <asp:ListItem Text="CPF" Value="cpf" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="CNPJ" Value="cnpj"></asp:ListItem>
                    </asp:RadioButtonList>--%>
                CPF || CNPJ<br />
                <asp:TextBox ID="txt_Cpf_Cnpj_Editar" ReadOnly="true" runat="server" />
                <br />
                <br />

                Complemento:<br />
                <asp:TextBox ID="txt_Complemento_Editar" runat="server" />
                <br />
                <br />

                Numero:<br />
                <asp:TextBox ID="txt_Numero_Editar" runat="server" />
                <br />
                <br />

                Bairro:<br />
                <asp:TextBox ID="txt_Bairro_Editar" runat="server" />
                <br />
                <br />

                Cidade:<br />
                <asp:TextBox ID="txt_Cidade_Editar" runat="server" />
                <br />
                <br />

                Estado:<br />
                <asp:TextBox ID="txt_Estado_Editar" runat="server" />
                <br />
                <br />

                <asp:Button ID="btn_Editar_Cliente" Text="Editar" runat="server" OnClientClick="return alerta();" OnClick="btn_Editar_Cliente_Click"  />

                <script type="text/javascript">
                    function alerta() {
                            var nome = document.getElementById('ContentPlaceHolder1_txt_Nome_Editar').value;
                            alert('Cliente '+ nome+ ' Atualizado Com Sucesso.');
                            return true;
                        }

                </script>

    </div>


</asp:Content>
