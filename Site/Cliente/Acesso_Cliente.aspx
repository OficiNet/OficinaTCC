<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/Cliente.Master" AutoEventWireup="true" CodeBehind="Acesso_Cliente.aspx.cs" Inherits="Site.Cliente.Acesso_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
    <link href="../Layout/css/default.css" rel="stylesheet" />
    <link href="../Layout/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../Layout/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Área do Cliente</h1>
    <hr />

    <asp:Panel ID="painelCPFCNPJ" runat="server">
        <div class="col-md-4">
            <div class="input-group has-success">
                <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user"></span></span>
                <asp:TextBox ID="txtCPFCNPJ" class="form-control" runat="server" placeholder="Digite o CPF ou o CNPJ (Somente Números)" autofocus onkeyup="mascaraMutuario(this,cpfCnpj);" onblur='clearTimeout();' onkeypress=''></asp:TextBox>
                <span class="input-group-btn">
                    <button id="btnPesquisar" type="button" class="btn btn-md btn-success" runat="server" text="Pesquisar" onserverclick="btnPesquisa_Click">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                </span>
            </div>
        </div>
    </asp:Panel>
    <asp:Button ID="btnVoltar" OnClick="btnVoltar_Click" runat="server" Text="sair" />
    <asp:Panel ID="painelOrdemServico" runat="server" Visible="false">


        <asp:Label ID="lblResp" runat="server" />



        <asp:GridView ID="gridOrdemServico" runat="server" CssClass="ls-table ls-table-striped" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Protocolo" HeaderText="Protocolo" />
                <asp:BoundField DataField="Cliente.Nome" HeaderText="Nome" />
                <asp:BoundField DataField="Observacoes" HeaderText="Observações" />
                <asp:BoundField DataField="Valor" HeaderText="Valor" />
                <asp:BoundField DataField="Veiculo.Modelo" HeaderText="Modelo" />
                <asp:BoundField DataField="Veiculo.Placa" HeaderText="Placa" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>




    </asp:Panel>



    <script type="text/javascript">

        //function add() {
        //    alert('teste');
        //    document.getElementById('ContentPlaceHolder1_txtCPFCNPJ') = ' ';
        //    return true;
        //}


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


    </script>
</asp:Content>
