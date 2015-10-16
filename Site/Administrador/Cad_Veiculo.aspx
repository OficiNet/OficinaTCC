<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Sistema.Master" AutoEventWireup="true" CodeBehind="Cad_Veiculo.aspx.cs" Inherits="Site.Administrador.Cad_Veiculo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script type="text/javascript">
        function excluir() {
           // carregarform();

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





    <h1 class="ls-title-intro ls-ico-book">Cadastro de Veículos</h1>
    <div class="ls-alert-box-success ls-alert-success ls-dismissable ls-sm-space">
        <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
        <span class="ls-ico-info"></span> Você está na àrea de <strong>Cadastro de Veículos</strong>, aqui você pode Cadastrar, Editar e Excluir os Veículos dos seus Clientes.
    </div>
    <ul class="ls-tabs-nav" id="awesome-tab">
        <li class="ls-active"><a data-ls-module="tabs" href="#track">Listar Veículos</a></li>
        <li><a data-ls-module="tabs" href="#laps">Cadastrar Veículos</a></li>
    </ul>
    <div class="ls-tabs-container" id="awesome-tab-content">
        <div id="track" class="ls-tab-content ls-active">
            <div class="ls-alert-box-info ls-alert-info ls-dismissable">
                <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
                <span class="ls-ico-info"></span>Listar nesta tela <strong>Todos os Veículos</strong>.
            </div>
        </div>
        <div id="laps" class="ls-tab-content">
            <div class="ls-alert-box-info ls-alert-info ls-dismissable">
                <span data-ls-module="dismiss" class="ls-dismiss">&times;</span>
                <span class="ls-ico-info"></span>Abrir nesta tela o formulário de <strong>Cadastro de Veículos</strong>.
            </div>
        </div>


    <h1 class="ls-title-intro ls-ico-user-add">Cadastro de Veiculos</h1>
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
            <asp:Button ID="btnListarClientes"  runat="server" Text="Pesquisar" CssClass="ls-btn-primary" />
            <asp:Button ID="btnNovoCliente" runat="server" Text="Novo Cliente" CssClass="ls-btn-sucess"   />
            <asp:Label ID="lblResp" runat="server" />
            <br />



                
            <asp:GridView ID="gridVeiculos" runat="server" AllowPaging="True" EnableModelValidation="True" PageSize="10" OnPageIndexChanging="gridVeiculos_PageIndexChanging" CssClass="ls-table ls-table-striped" AutoGenerateColumns="false">

                <Columns>
                    <asp:BoundField DataField="Cliente.Nome" HeaderText="Nome do Cliente" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" />
                    <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
                    <asp:BoundField DataField="Ano" HeaderText="Ano" />
                    <asp:BoundField DataField="Placa" HeaderText="Placa" />
                    
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
 
                            <center>
                                <asp:Button CssClass="ls-btn-danger ls-btn-xs" ID="btnExcuirCampo" runat="server" Text="Excluir" OnClientClick="return excluir();" OnClick="Excluir_Click"   />
                          
                                <asp:Button CssClass="ls-btn-default ls-btn-xs" ID="btnAtualizar" runat="server" Text="Atualizar" OnClick="btnGridAtualizar_Click"  />

                                <asp:Label ID="lblIdVeiculo"  runat="server" Text='<%# Eval("Id_Veiculo") %>' Visible="true" />
                                <asp:Label ID="lblNome" runat="server" Text='<%# Eval("Cliente.Nome") %>' Visible="false" />
                                <asp:Label ID="lblTelefone" runat="server" Text='<%# Eval("Marca") %>' Visible="false" />
                                <asp:Label ID="lblTipo_Pessoa" runat="server" Text='<%# Eval("Modelo") %>' Visible="false" />
                                <asp:Label ID="lbl_CPF" runat="server" Text='<%# Eval("Ano") %>' Visible="false" />
                                <asp:Label ID="lbl_CNPJ" runat="server" Text='<%# Eval("Placa") %>' Visible="false" />
                               
                            </center>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


        </asp:Panel>

        


        <%--########################### PAINEL DE CADASTRO ##########################################################--%>
        <asp:Panel ID="painelCadastro" runat="server" >

            <asp:Button ID="btnVoltar" runat="server" Text="Voltar" CssClass="ls-btn-sucess"  />
            <br /><br />


            <asp:DropDownList ID="ddlClientes" runat="server">            
            </asp:DropDownList>
            <br /><br />


        <%--    <a href="Lst_Cliente.aspx" type="button">Pesquisar</a>
                <br /><br />--%>

<%--                Id Veiculo:<br />--%>
                <asp:TextBox ID="txt_Id_Veiculo" runat="server" Visible="false"/>
              <%--  <br /><br />--%>

                Placa:<br />
                <asp:TextBox ID="txt_Placa" runat="server" />    
                <br /><br />

                Modelo:<br />
                <asp:TextBox ID="txt_Modelo" runat="server" />    
                <br /><br />

                
                Marca:<br />
                <asp:TextBox ID="txt_Marca" runat="server" />    
                <br /><br />

                 Ano:<br />
                <asp:TextBox ID="txt_Ano" runat="server" />    
                <br /><br />

                <asp:Button ID="btn_Cadastrar_Veiculo" Text="Cadastrar" runat="server" OnClick="btn_Cadastrar_Veiculo_Click"/>
            <br />
              <asp:Button ID="btn_Editar_Veiculo" Text="Editar" runat="server" OnClick="btn_Editar_Veiculo_Click"/>

        </asp:Panel>


        <%--############################# PAINEL EDITAR #############################################################--%>
        <asp:Panel ID="painelEditar" runat="server" Visible="false">

            <asp:Button ID="btnVoltar_Editar" runat="server" Text="Voltar" CssClass="ls-btn-sucess" />
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

                <asp:Button ID="btn_Editar_Cliente" Text="Editar" runat="server"  />
            <br />
           

        </asp:Panel>
      
    </div>

</asp:Content>
