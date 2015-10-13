<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Editar_Cliente.aspx.cs" Inherits="Site.Administrador.Editar_Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        /* -----  INICIO VALIDA TELEFONE ----- */
        function mascara(o, f) {
            v_obj = o
            v_fun = f
            setTimeout("execmascara()", 1)
        }

        function execmascara() {
            v_obj.value = v_fun(v_obj.value)
        }

        function mtel(v) {
            v = v.replace(/\D/g, "");             //Remove tudo o que não é dígito
            v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
            v = v.replace(/(\d)(\d{4})$/, "$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
            return v;
        }
        /* -----  FIM VALIDA TELEFONE ----- */

        /* -----  INICIO VALIDA CPF CNPJ ----- */
        function mascaraMutuario(o, f) {
            v_obj = o
            v_fun = f
            setTimeout('execmascara()', 1)
        }

        function execmascara() {
            v_obj.value = v_fun(v_obj.value)
        }

        function cpfCnpj(v) {
            //Remove tudo o que não é dígito
            v = v.replace(/\D/g, "")

            if (v.length <= 13) { //CPF

                //Coloca um ponto entre o terceiro e o quarto dígitos
                v = v.replace(/(\d{3})(\d)/, "$1.$2")

                //Coloca um ponto entre o terceiro e o quarto dígitos
                //de novo (para o segundo bloco de números)
                v = v.replace(/(\d{3})(\d)/, "$1.$2")

                //Coloca um hífen entre o terceiro e o quarto dígitos
                v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2")

            } else { //CNPJ
                //Coloca ponto entre o segundo e o terceiro dígitos
                v = v.replace(/^(\d{2})(\d)/, "$1.$2")

                //Coloca ponto entre o quinto e o sexto dígitos
                v = v.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")

                //Coloca uma barra entre o oitavo e o nono dígitos
                v = v.replace(/\.(\d{3})(\d)/, ".$1/$2")

                //Coloca um hífen depois do bloco de quatro dígitos
                v = v.replace(/(\d{4})(\d)/, "$1-$2")
            }
            return v
        }
        /* -----  FIM VALIDA CPF CNPJ ----- */

        function voltar() {
            document.getElementById('ContentPlaceHolder1_txt_Nome_Editar').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Telefone_Editar').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj_Editar').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Complemento_Editar').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Numero_Editar').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Bairro_Editar').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Cidade_Editar').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Estado_Editar').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Logradouro_Editar').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Sexo_Editar').value = ' ';
            return true;
        }

        function carregarform() {
            document.getElementById('ContentPlaceHolder1_txt_Nome').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Telefone').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Complemento').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Numero').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Bairro').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Cidade').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Estado').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_logradouro').value = ' ';
            document.getElementById('ContentPlaceHolder1_txtSexo').value = ' ';
            return true;
        }

        function alerta() {
            var nome = document.getElementById('ContentPlaceHolder1_txt_Nome_Editar').value;
            var sexo = document.getElementById('ContentPlaceHolder1_txt_Sexo_Editar').value;
            var telefone = document.getElementById('ContentPlaceHolder1_txt_Telefone_Editar').value;
            var logradouro = document.getElementById('ContentPlaceHolder1_txt_Logradouro_Editar').value;
            var complemento = document.getElementById('ContentPlaceHolder1_txt_Complemento_Editar').value;
            var numero = document.getElementById('ContentPlaceHolder1_txt_Numero_Editar').value;
            var bairro = document.getElementById('ContentPlaceHolder1_txt_Bairro_Editar').value;
            var cidade = document.getElementById('ContentPlaceHolder1_txt_Cidade_Editar').value;
            var estado = document.getElementById('ContentPlaceHolder1_txt_Estado_Editar').value;
            // nome.style = "font-weight:bold";
            if (nome == '' || sexo == '' || telefone == '' || logradouro == '' || complemento == '' || numero == '' || bairro == '' || cidade == '' || estado == '') {
                return true;
            }
            else {
                alert('Cliente ' + nome + ' Atualizado Com Sucesso.');
                return true;
            }
        }

        
    </script>

    



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

                Sexo:<br />
                <asp:TextBox ID="txt_Sexo_Editar" runat="server" required="required" />
                <br />
                <br />

                Telefone:<br />
                <asp:TextBox ID="txt_Telefone_Editar" runat="server" required="required"  onkeyup="mascara(this, mtel);"/>
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

                <asp:Button ID="btn_Editar_Cliente" Text="Editar" runat="server" OnClientClick="return alerta();" OnClick="btn_Editar_Cliente_Click"  />

                

    </div>


</asp:Content>
