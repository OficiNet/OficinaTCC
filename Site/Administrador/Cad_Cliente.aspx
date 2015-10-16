<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Cad_Cliente.aspx.cs" Inherits="Site.Administrador.Cad_Cliente" %>

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
            //alert('teste');
            document.getElementById('painelcadastro').style.display = 'none';
            document.getElementById('painelgrid').style.display = 'block';
         //  document.getElementById('paineleditar').style.display = "none";
            // document.getElementById('paineleditar').className = 'paineleditaroff';
            document.getElementById('ContentPlaceHolder1_txt_Nome').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Telefone').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Complemento').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Numero').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Bairro').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Cidade').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Estado').value = '';
            document.getElementById('ContentPlaceHolder1_txt_logradouro').value = '';
            document.getElementById('ContentPlaceHolder1_txtSexo').value = '';

            //document.getElementById('ContentPlaceHolder1_txt_Nome_Editar').value = '';
            //document.getElementById('ContentPlaceHolder1_txt_Telefone_Editar').value = '';
            //document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj_Editar').value = '';
            //document.getElementById('ContentPlaceHolder1_txt_Complemento_Editar').value = '';
            //document.getElementById('ContentPlaceHolder1_txt_Numero_Editar').value = '';
            //document.getElementById('ContentPlaceHolder1_txt_Bairro_Editar').value = '';
            //document.getElementById('ContentPlaceHolder1_txt_Cidade_Editar').value = '';
            //document.getElementById('ContentPlaceHolder1_txt_Estado_Editar').value = '';
            document.getElementById('ContentPlaceHolder1_lblResp').value = ' ';
        }

        function newcliente() {
            // alert('novo cliente');
            document.getElementById('ContentPlaceHolder1_txt_Nome').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Telefone').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Complemento').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Numero').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Bairro').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Cidade').value = '';
            document.getElementById('ContentPlaceHolder1_txt_Estado').value = '';
            document.getElementById('ContentPlaceHolder1_txt_logradouro').value = '';
            document.getElementById('ContentPlaceHolder1_txtSexo').value = '';
           // document.getElementById('ContentPlaceHolder1_lblResp').value = ' ';
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

        function excluir() {
            carregarform();

            var r = confirm('Deseja realmente excluir ?');
            if (r == true) {
                //alert('true');
                return true;
            } else {
                //alert('false');
                return false;
            }
        }
    </script>

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
                            <asp:Button ID="btnListarClientes" OnClientClick="return carregarform();" OnClick="ListarClientes" runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />
                            <button id="btnNovoCliente" class="ls-btn-sucess" onclick="javascript: newcliente();">Novo Cliente</button>
                        </div>
                    </fieldset>
                </div>
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
                                    <asp:Button CssClass="ls-btn-danger ls-btn-xs" ID="btnExcuirCampo" runat="server" Text="Excluir" OnClientClick="return excluir();" OnClick="Excluir_Click" />
                                    <asp:Button CssClass="ls-btn-default ls-btn-xs" ID="btnAtualizar" runat="server" Text="Atualizar" OnClientClick="return carregarform();" OnClick="btnGridAtualizar_Click" />
                                    <asp:Label ID="lblIdCliente"  runat="server" Text='<%# Eval("Id_Cliente") %>' Visible="false" />
                             <%--       <asp:Label ID="lblNome" runat="server" Text='<%# Eval("Nome") %>' Visible="false" />
                                    <asp:Label ID="lblTelefone" runat="server" Text='<%# Eval("Telefone") %>' Visible="false" />
                                    <asp:Label ID="lblTipo_Pessoa" runat="server" Text='<%# Eval("Tipo_Pessoa") %>' Visible="false" />
                                    <asp:Label ID="lbl_CPF" runat="server" Text='<%# Eval("CPF") %>' Visible="false" />
                                    <asp:Label ID="lbl_CNPJ" runat="server" Text='<%# Eval("CNPJ") %>' Visible="false" />
                                    <asp:Label ID="lblNumero" runat="server" Text='<%# Eval("Endereco.Numero") %>' Visible="false" />
                                    <asp:Label ID="lblComplemento" runat="server" Text='<%# Eval("Endereco.Complemento") %>' Visible="false" />
                                    <asp:Label ID="lblBairro" runat="server" Text='<%# Eval("Endereco.Bairro") %>' Visible="false" />
                                    <asp:Label ID="lblCidade" runat="server" Text='<%# Eval("Endereco.Cidade") %>' Visible="false" />
                                    <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("Endereco.Estado") %>' Visible="false" />--%>
                                </center>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </div>
        <div id="painelcadastro" style="display: none;">
            <%-- PAINEL DE CADASTRO --%>
            <asp:Panel ID="painelCadastro" runat="server" Visible="true">
                <div class="ls-form ls-form-horizontal row">
                    <fieldset>
                        <div class="row">
                            <label class="ls-label col-xs-6">
                                <asp:Label ID="lblNomeCliente" runat="server" meta:resourceKey="lblNomeCliente" Text="Nome do Cliente:" CssClass="ls-label-text" />
                                <asp:TextBox ID="txt_Nome" CssClass="ls-label-text" runat="server" required="required" />
                            </label>
                            <label class="ls-label col-xs-2">
                                <asp:Label ID="lblTipoPessoa" runat="server" meta:resourceKey="lblTipoPessoa" Text="Tipo Pessoa:" CssClass="ls-label-text" />
                                <asp:RadioButtonList ID="radioCpf_Cnpj" runat="server" RepeatDirection="Horizontal" CssClass="ls-field-radio">
                                    <asp:ListItem Text="CPF" Value="cpf" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="CNPJ" Value="cnpj"></asp:ListItem>
                                </asp:RadioButtonList>
                            </label>
                            <label class="ls-label col-xs-4">
                                <asp:Label ID="lblCPFCNPJ" runat="server" meta:resourceKey="lblCPFCNPJ" Text="CPF/CNPJ:" CssClass="ls-label-text" />
                                <input id="txt_Cpf_Cnpj" name='txt_Cpf_Cnpj' class="ls-label-text" runat="server" maxlength="18" onkeyup="mascaraMutuario(this,cpfCnpj);" onblur='clearTimeout();' onkeypress='' required="required" />
                            </label>
                            <label class="ls-label col-xs-4">
                                <asp:Label ID="lblSexo" runat="server" meta:resourceKey="lblSexo" Text="Sexo" CssClass="ls-label-text" />
                                <input id="txtSexo" name='txtSexo' class="ls-label-text"  runat="server" maxlength="18" required="required" />
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
                            <asp:Button ID="btn_Cadastrar_Cliente" Text="Cadastrar" runat="server" OnClick="btn_Cadastrar_Cliente_Click" CssClass="ls-btn-primary" />
                            <button id="btnvoltar" class="ls-btn-sucess" onclick="javascript: voltar();">Voltar</button>
                        </div>
                        <div class="ls-actions-btn">
                            <br />
                           
                           
                        </div>
                    </fieldset>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
