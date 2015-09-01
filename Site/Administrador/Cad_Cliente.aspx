<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Cad_Cliente.aspx.cs" Inherits="Site.Administrador.Cad_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="ls-title-intro ls-ico-user-add">Cadastro de Clientes</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span>Você está na àrea de <strong>Cadastro de Clientes</strong>, aqui você pode Cadastrar, Editar e Excluir seus clientes.
    </div>
    <div class="container">



        <asp:Panel ID="painelGrid" runat="server">
            <%--<asp:Button ID="btnListarClientes" OnClick="ListarClientes" runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />--%>
            <br />
            <strong>
                <asp:Label ID="lblPesqNomeCliente" runat="server" meta:resourceKey="lblPesqNomeCliente" Text="Nome do Cliente:" />
            </strong>
            <br />
            <asp:TextBox ID="txtPesquisa" runat="server" meta:resourceKey="txtPesquisa" CssClass="col-md-6"></asp:TextBox>&nbsp;
            <asp:Button ID="btnListarClientes" OnClick="ListarClientes" runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />
            <asp:Button ID="btnNovoCliente" runat="server" Text="Novo Cliente" CssClass="ls-btn-sucess" OnClick="btnNovoCliente_Click"  />
            <asp:Label ID="lblResp" runat="server" />
            <br />



                <asp:GridView ID="gridClientes" runat="server" AllowPaging="True" EnableModelValidation="True" PageSize="10" OnPageIndexChanging="gridClientes_PageIndexChanging" CssClass="ls-table ls-table-striped" AutoGenerateColumns="false">

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
                                <asp:Button CssClass="ls-btn-danger ls-btn-xs" ID="btnExcuirCampo" runat="server" Text="Excluir" OnClientClick="return confirm ('Deseja realmente excluir ?');" OnClick="Excluir_Click" />
                          
                                <asp:Button CssClass="ls-btn-default ls-btn-xs" ID="btnAtualizarCampo" runat="server" Text="Atualizar" OnClick="btnGridAtualizar_Click" />

                                <asp:Label ID="lblIdCliente" runat="server" Text='<%# Eval("Id_Cliente") %>' Visible="false" />
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
        


        <%--########################### PAINEL DE CADASTRO ##########################################################--%>
        <asp:Panel ID="painelCadastro" runat="server" Visible="false">

            <asp:Button ID="btnVoltar" runat="server" Text="Voltar" CssClass="ls-btn-sucess" OnClick="btnVoltar_Click" />
            <br /><br />

        <%--    <a href="Lst_Cliente.aspx" type="button">Pesquisar</a>
                <br /><br />--%>

              <%--  Id Cliente:<br />
                <asp:TextBox ID="txt_Id_Cliente" runat="server" />
                <br /><br />--%>

                Nome:<br />
                <asp:TextBox ID="txt_Nome" runat="server" />    
                <br /><br />

                 Telefone:<br />
                <asp:TextBox ID="txt_Telefone" runat="server" />    
                <br /><br />

                <asp:RadioButtonList  ID="radioCpf_Cnpj" runat="server"  RepeatDirection="Horizontal">
                    <asp:ListItem Text="CPF" Value="cpf" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="CNPJ" Value="cnpj"></asp:ListItem>
                </asp:RadioButtonList>

                <asp:TextBox ID="txt_Cpf_Cnpj" runat="server" />    
                <br /><br />

                 Complemento:<br />
                <asp:TextBox ID="txt_Complemento" runat="server" />    
                <br /><br />

                 Numero:<br />
                <asp:TextBox ID="txt_Numero" runat="server" />    
                <br /><br />
        
                 Bairro:<br />
                <asp:TextBox ID="txt_Bairro" runat="server" />    
                <br /><br />

                Cidade:<br />
                <asp:TextBox ID="txt_Cidade" runat="server" />    
                <br /><br />

                Estado:<br />
                <asp:TextBox ID="txt_Estado" runat="server" />    
                <br /><br />

                <asp:Button ID="btn_Cadastrar_Cliente" Text="Cadastrar" runat="server" OnClick="btn_Cadastrar_Cliente_Click" />

        </asp:Panel>


        <%--############################# PAINEL EDITAR #############################################################--%>
        <asp:Panel ID="painelEditar" runat="server" Visible="false">

            <asp:Button ID="btnVoltar_Editar" runat="server" Text="Voltar" CssClass="ls-btn-sucess" OnClick="btnVoltar_Click" />
            <br /><br />

                <asp:TextBox ID="txt_Id_Cliente_Editar" runat="server" Visible="false" />
                <br /><br />

                Nome:<br />
                <asp:TextBox ID="txt_Nome_Editar" runat="server" />    
                <br /><br />

                 Telefone:<br />
                <asp:TextBox ID="txt_Telefone_Editar" runat="server" />    
                <br /><br />

               <%-- <asp:RadioButtonList  ID="RadioButtonList1" runat="server"  RepeatDirection="Horizontal">
                    <asp:ListItem Text="CPF" Value="cpf" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="CNPJ" Value="cnpj"></asp:ListItem>
                </asp:RadioButtonList>--%>

                <asp:TextBox ID="txt_Cpf_Cnpj_Editar" runat="server" />    
                <br /><br />

                 Complemento:<br />
                <asp:TextBox ID="txt_Complemento_Editar" runat="server" />    
                <br /><br />

                 Numero:<br />
                <asp:TextBox ID="txt_Numero_Editar" runat="server" />    
                <br /><br />
        
                 Bairro:<br />
                <asp:TextBox ID="txt_Bairro_Editar" runat="server" />    
                <br /><br />

                Cidade:<br />
                <asp:TextBox ID="txt_Cidade_Editar" runat="server" />    
                <br /><br />

                Estado:<br />
                <asp:TextBox ID="txt_Estado_Editar" runat="server" />    
                <br /><br />

                <asp:Button ID="btn_Editar_Cliente" Text="Editar" runat="server" OnClick="Atualizar_Click" />

        </asp:Panel>




      
    </div>
</asp:Content>
