<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Cad_Cliente.aspx.cs" Inherits="Site.Administrador.Cad_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">

        /* ###########################  INICIO VALIDA TELEFONE ################################################# */
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
        /* ###########################  FIM VALIDA TELEFONE ################################################# */





        /* ###########################  INICIO VALIDA CPF CNPJ ################################################# */

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
        /* ###########################  FIM VALIDA CPF CNPJ ################################################# */



        function voltar() {

            //alert('teste');
            document.getElementById('painelcadastro').style.display = 'none';
            document.getElementById('painelgrid').style.display = 'block';
            document.getElementById('paineleditar').style.display = "none";
           // document.getElementById('paineleditar').className = 'paineleditaroff';
            document.getElementById('ContentPlaceHolder1_txt_Nome').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Telefone').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Complemento').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Numero').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Bairro').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Cidade').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Estado').value = '';

            document.getElementById('ContentPlaceHolder1_txt_Nome_Editar').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Telefone_Editar').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj_Editar').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Complemento_Editar').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Numero_Editar').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Bairro_Editar').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Cidade_Editar').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Estado_Editar').value = '';
            document.getElementById('ContentPlaceHolder1_lblResp').value = ' ';

        }

        function newcliente()
        {
            // alert('novo cliente');
            document.getElementById('ContentPlaceHolder1_txt_Nome').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Telefone').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Complemento').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Numero').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Bairro').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Cidade').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Estado').value = '';
            document.getElementById('ContentPlaceHolder1_lblResp').value = ' ';
            document.getElementById('painelcadastro').style.display = 'block';
            document.getElementById('painelgrid').style.display = 'none';
            document.getElementById('paineleditar').style.display = 'none';
        }

        function exibirpainelcadastro() {
            //var t = document.getElementById('ContentPlaceHolder1_txt_Id_Cliente').value;
            //alert(t);

          //  document.getElementById('exibirpaineleditar').style.display = 'none';
            document.getElementById('painelgrid').style.display = 'none';


            document.getElementById('painelcadastro').style.display = 'block';
        }


        

        function carregarform()
        {
            document.getElementById('ContentPlaceHolder1_txt_Nome').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Telefone').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Complemento').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Numero').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Bairro').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Cidade').value = ' ';
            document.getElementById('ContentPlaceHolder1_txt_Estado').value = ' ';
            return true;
        }

       

        function excluir()
        {
            carregarform();
            return confirm ('Deseja realmente excluir ?');
        }

                                
        

       
        


    </script>
   

    <h1 class="ls-title-intro ls-ico-user-add">Cadastro de Clientes</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está na àrea de <strong>Cadastro de Clientes</strong>, aqui você pode Cadastrar, Editar e Excluir seus clientes.
    </div>
    <div class="container">


        <div id="painelgrid">
            <asp:Panel ID="painelGrid" runat="server" Visible="true">
                <%--<asp:Button ID="btnListarClientes" OnClick="ListarClientes" runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />--%>
                <br />
                <strong>
                    <asp:Label ID="lblPesqNomeCliente" runat="server" meta:resourceKey="lblPesqNomeCliente" Text="Nome do Cliente:" />
                </strong>
                <br />
               
                <asp:TextBox ID="txtPesquisa" runat="server" meta:resourceKey="txtPesquisa" CssClass="col-md-6"></asp:TextBox>&nbsp;
              <%--  <asp:Button ID="btnListarClientes"  OnClick="ListarClientes" runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />--%>

                <asp:Button ID="btnListarClientes" OnClientClick="return carregarform();" OnClick="ListarClientes" runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />
                   
                
                    

               <%-- <asp:Button ID="btnNovoCliente" runat="server" Text="Novo Cliente" CssClass="ls-btn-sucess" onclick"javascript: novocliente();" />--%>
                <button id="btnNovoCliente"  class="ls-btn-sucess" onclick="javascript: newcliente();">Novo Cliente</button>
                <asp:Label ID="lblResp" runat="server" />
                <br />

                <asp:GridView ID="gridClientes" runat="server" AllowPaging="True" EnableModelValidation="True" PageSize="7" OnPageIndexChanging="gridClientes_PageIndexChanging" CssClass="ls-table ls-table-striped" AutoGenerateColumns="false">

                    <Columns>
                        <asp:BoundField DataField="Nome" HeaderText="Nome do Cliente" />
                        <asp:BoundField DataField="Telefone" HeaderText="Telefone" />
                        <asp:BoundField DataField="Tipo_Pessoa" HeaderText="Tipo de Pessoa" />
                        <asp:BoundField DataField="CPF" HeaderText="CPF" />
                        <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                        <asp:BoundField DataField="Endereco.Bairro" HeaderText="Bairro" />
                        <asp:BoundField DataField="Endereco.Cidade" HeaderText="Cidade" />
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>


                          



                                <center>
                                    <asp:Button CssClass="ls-btn-danger ls-btn-xs" ID="btnExcuirCampo" runat="server" Text="Excluir" OnClientClick="excluir();" OnClick="Excluir_Click" />
                          
                                    <%--<asp:Button  ID="btnAtualizarCampo" OnClientClick="return exibirpaineleditar(this);"  OnClick="btnGridAtualizar_Click" runat="server" Text="Atualizar" CssClass="ls-btn-default ls-btn-xs" />--%>

                                    <asp:Button CssClass="ls-btn-default ls-btn-xs" ID="btnAtualizar" runat="server" Text="Atualizar" OnClientClick="carregarform();" OnClick="btnGridAtualizar_Click" />





<%--                                   <button runat="server" id="btninput" onclick="return exibirpaineleditar();" onserverclick="btnGridAtualizar_Click" >Atualizar Input</button>--%>
                                    

                                    <asp:Label ID="lblIdCliente"  runat="server" Text='<%# Eval("Id_Cliente") %>' Visible="false" />
                                    <asp:Label ID="lblNome" runat="server" Text='<%# Eval("Nome") %>' Visible="false" />
                                    <asp:Label ID="lblTelefone" runat="server" Text='<%# Eval("Telefone") %>' Visible="false" />
                                    <asp:Label ID="lblTipo_Pessoa" runat="server" Text='<%# Eval("Tipo_Pessoa") %>' Visible="false" />
                                    <asp:Label ID="lbl_CPF" runat="server" Text='<%# Eval("CPF") %>' Visible="false" />
                                    <asp:Label ID="lbl_CNPJ" runat="server" Text='<%# Eval("CNPJ") %>' Visible="false" />
                                    <asp:Label ID="lblNumero" runat="server" Text='<%# Eval("Endereco.Numero") %>' Visible="false" />
                                    <asp:Label ID="lblComplemento" runat="server" Text='<%# Eval("Endereco.Complemento") %>' Visible="false" />
                                    <asp:Label ID="lblBairro" runat="server" Text='<%# Eval("Endereco.Bairro") %>' Visible="false" />
                                    <asp:Label ID="lblCidade" runat="server" Text='<%# Eval("Endereco.Cidade") %>' Visible="false" />
                                    <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("Endereco.Estado") %>' Visible="false" />
                                </center>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </div>


        <div id="painelcadastro" style="display:none;" >
            <%--########################### PAINEL DE CADASTRO ##########################################################--%>
            <asp:Panel ID="painelCadastro" runat="server" Visible="true">

                <%-- <asp:Button ID="btnVoltar" runat="server" Text="Voltar" CssClass="ls-btn-sucess" OnClick="btnVoltar_Click" /> --%>


                 <button id="btnvoltar"  class="ls-btn-sucess" onclick="javascript: voltar();">Voltar</button>



                <br />
                <br />

                <%--    <a href="Lst_Cliente.aspx" type="button">Pesquisar</a>
                    <br /><br />--%>

               <%--   Id Cliente:<br />
                    <asp:TextBox ID="txt_Id_Cliente" Text="douglasteste" runat="server" />
                    <br /><br />--%>

                    Nome:<br />
                <asp:TextBox ID="txt_Nome" runat="server" required="required" />
                <br />
                <br />

                Telefone:<br />
                <asp:TextBox ID="txt_Telefone" runat="server" MaxLength="15" onkeyup="mascara(this, mtel);" required="required" />
                <br />
                <br />

                <asp:RadioButtonList ID="radioCpf_Cnpj" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="CPF" Value="cpf" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="CNPJ" Value="cnpj"></asp:ListItem>
                </asp:RadioButtonList>


            
                <input class='input' type='text' id='txt_Cpf_Cnpj' name='txt_Cpf_Cnpj' maxlength="18" runat="server" required="required" onkeypress='mascaraMutuario(this,cpfCnpj);' onblur='clearTimeout();' />

                <br />
                <br />

                Complemento:<br />
                <asp:TextBox ID="txt_Complemento" runat="server" required="required" />
                <br />
                <br />

                Numero:<br />
                <asp:TextBox ID="txt_Numero" runat="server" required="required" />
                <br />
                <br />

                Bairro:<br />
                <asp:TextBox ID="txt_Bairro" runat="server" required="required" />
                <br />
                <br />

                Cidade:<br />
                <asp:TextBox ID="txt_Cidade" runat="server" required="required" />
                <br />
                <br />

                Estado:<br />
                <asp:TextBox ID="txt_Estado" runat="server" required="required" />
                <br />
                <br />

                <%--<asp:Button ID="btn_Cadastrar_Cliente" Text="Cadastrar" runat="server"  OnClientClick="return alerta();" OnClick="btn_Cadastrar_Cliente_Click" />--%>

                <asp:Button ID="btn_Cadastrar_Cliente" Text="Cadastrar" runat="server" OnClick="btn_Cadastrar_Cliente_Click" />


                <%--<script type="text/javascript">
                    function alerta() {


                        var nome = document.getElementById('ContentPlaceHolder1_txt_Nome').value;
                        var telefone = document.getElementById('ContentPlaceHolder1_txt_Telefone').value;
                        var cpf_cnpj = document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value;
                        var complemento = document.getElementById('ContentPlaceHolder1_txt_Complemento').value;
                        var numero = document.getElementById('ContentPlaceHolder1_txt_Numero').value;
                        var bairro = document.getElementById('ContentPlaceHolder1_txt_Bairro').value;
                        var cidade = document.getElementById('ContentPlaceHolder1_txt_Cidade').value;
                        var estado = document.getElementById('ContentPlaceHolder1_txt_Estado').value;
                      //  alert(nome);
                        if (nome == '' || telefone == '' || cpf_cnpj == '' || complemento == '' || numero == '' || bairro == '' || cidade == '' || cpf_cnpj == '') {
                            return true;
                        }
                        else {
                            alert('Cliente ' + nome + ' Atualizado Com Sucesso.');
                            return true;
                        }
                    }

                </script>--%>
            


            </asp:Panel>

        </div>
        


                    
    </div>


</asp:Content>
