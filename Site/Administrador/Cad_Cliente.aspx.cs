using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Entity;
using DAL.Persistence;
using System.Text.RegularExpressions;

namespace Site.Administrador
{
    public partial class Cad_Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarClientes();
            }
        }

        public void ListarClientes(object sender, EventArgs e)
        {
            try
            {
                lblResp.Text = string.Empty;
                string strWhere = "Nome like '%{0}%'";
                strWhere = String.Format(strWhere, txtPesquisa.Text.ToString().Trim());
                ClienteDal d = new ClienteDal();

                gridClientes.DataSource = d.ListarCliente(strWhere);

                if (gridClientes.Rows.Count == 0)
                {
                    lblResp.Text = "Não Possui Cliente Cadastrado.";

                }
                else
                {
                    gridClientes.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void CarregarClientes()
        {
            try
            {
                ClienteDal d = new ClienteDal();
                gridClientes.DataSource = d.ListarTodos();
                gridClientes.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        //protected void gridClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName.Equals("Editar"))
        //    {
        //        string idCliente = e.CommandArgument.ToString();
        //        if (!String.IsNullOrEmpty(idCliente))
        //            this.Response.Redirect("Principal.aspx");
        //    }
        //}




        protected void gridClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gridClientes.PageIndex = e.NewPageIndex;
                CarregarClientes();
            }
            catch (Exception)
            {

                throw;
            }
        }





        protected void btnGridAtualizar_Click(object sender, EventArgs e)
        {

            try
            {
                painelEditar.Visible = true;
                painelGrid.Visible = false;
                painelCadastro.Visible = false;

                foreach (GridViewRow linha in gridClientes.Rows)
                {

                    Button btnAtualizarCampo = linha.FindControl("btnAtualizarCampo") as Button;

                    if (btnAtualizarCampo.Equals(sender))
                    {
                        Label lblIdCliente = linha.FindControl("lblIdCliente") as Label;
                        Label lblNome = linha.FindControl("lblNome") as Label;
                        Label lblTelefone = linha.FindControl("lblTelefone") as Label;
                        Label lblTipo_Pessoa = linha.FindControl("lblTipo_Pessoa") as Label;
                        Label lbl_CPF = linha.FindControl("lbl_CPF") as Label;
                        Label lbl_CNPJ = linha.FindControl("lbl_CNPJ") as Label;
                        Label lblNumero = linha.FindControl("lblNumero") as Label;
                        Label lblComplemento = linha.FindControl("lblComplemento") as Label;
                        Label lblBairro = linha.FindControl("lblBairro") as Label;
                        Label lblCidade = linha.FindControl("lblCidade") as Label;
                        Label lblEstado = linha.FindControl("lblEstado") as Label;

                        txt_Id_Cliente_Editar.Text = lblIdCliente.Text;
                        txt_Nome_Editar.Text = lblNome.Text;
                        txt_Telefone_Editar.Text = lblTelefone.Text;
                        //txt_tipoPessoa.Text = lblDataEntrega.Text;
                        //txt_Cpf_Cnpj.Text = lblDescricao.Text;
                        txt_Numero_Editar.Text = lblNumero.Text;
                        txt_Complemento_Editar.Text = lblComplemento.Text;
                        txt_Bairro_Editar.Text = lblBairro.Text;
                        txt_Cidade_Editar.Text = lblCidade.Text;
                        txt_Estado_Editar.Text = lblEstado.Text;


                        CarregarClientes();
                    }
                }

            }
            catch (Exception ex)
            {

                lblResp.Text = " Erro ao carregar tela de atualizar" + ex.Message;
            }
        }



        protected void Excluir_Click(object sender, EventArgs e)
        {

            try
            {
                foreach (GridViewRow linha in gridClientes.Rows)
                {

                    Button btnExcluirCampo = linha.FindControl("btnExcuirCampo") as Button;
                    Label lblIdTarefa = linha.FindControl("lblIdCliente") as Label;
                    if (btnExcluirCampo.Equals(sender))
                    {
                        int id = Convert.ToInt32(lblIdTarefa.Text);
                        ClienteDal d = new ClienteDal();
                        d.Excluir(id);
                    }

                }
                CarregarClientes();
                lblResp.Text = " Excluido Com Sucesso ";
            }
            catch (Exception ex)
            {

                lblResp.Text = " Erro ao Excluir Tarefa " + ex.Message;
            }
        }

        protected void Atualizar_Click(object sender, EventArgs e)
        {
            try
            {
                DAL.Entity.Cliente cliente = new DAL.Entity.Cliente();
                ClienteDal d = new ClienteDal();

                int id = Convert.ToInt32(txt_Id_Cliente_Editar.Text);
                cliente.Id_Cliente = id;
                cliente.Nome = txt_Nome_Editar.Text;
                cliente.DataCadastro = DateTime.Now;

                d.EditarCliente(cliente);
                CarregarClientes();
                painelGrid.Visible = true;
                painelEditar.Visible = false;
                painelCadastro.Visible = false;
                lblResp.Text = "Cliente " + cliente.Nome + " Atualizado Com Sucesso.";
            }
            catch (Exception ex)
            {

                lblResp.Text = ex.Message;
            }
        }

        //validar cpf
        public static bool validaCpf(string CPF)
        {
            int[] mt1 = new int[9] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] mt2 = new int[10] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            string TempCPF;
            string Digito;
            int soma;
            int resto;

            CPF = CPF.Trim();
            CPF = CPF.Replace(".", "").Replace("-", "");

            if (CPF.Length != 11)
                return false;

            TempCPF = CPF.Substring(0, 9);
            soma = 0;
            for (int i = 0; i < 9; i++)
                soma += int.Parse(TempCPF[i].ToString()) * mt1[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            Digito = resto.ToString();
            TempCPF = TempCPF + Digito;
            soma = 0;

            for (int i = 0; i < 10; i++)
                soma += int.Parse(TempCPF[i].ToString()) * mt2[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            Digito = Digito + resto.ToString();

            return CPF.EndsWith(Digito);
        }

        //valida cnpj     
        public static bool validaCnpj(string cnpj)
        {
            int[] multiplicador1 = new int[12] { 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[13] { 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
            int soma;
            int resto;
            string digito;
            string tempCnpj;
            cnpj = cnpj.Trim();
            cnpj = cnpj.Replace(".", "").Replace("-", "").Replace("/", "");
            if (cnpj.Length != 14)
                return false;
            tempCnpj = cnpj.Substring(0, 12);
            soma = 0;
            for (int i = 0; i < 12; i++)
                soma += int.Parse(tempCnpj[i].ToString()) * multiplicador1[i];
            resto = (soma % 11);
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;
            digito = resto.ToString();
            tempCnpj = tempCnpj + digito;
            soma = 0;
            for (int i = 0; i < 13; i++)
                soma += int.Parse(tempCnpj[i].ToString()) * multiplicador2[i];
            resto = (soma % 11);
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;
            digito = digito + resto.ToString();
            return cnpj.EndsWith(digito);
        }



        protected void btn_Cadastrar_Cliente_Click(object sender, EventArgs e)
        {
            try
            {

                DAL.Entity.Cliente cliente = new DAL.Entity.Cliente();
                ClienteDal d = new ClienteDal();

                cliente.Nome = txt_Nome.Text;
                cliente.Telefone = txt_Telefone.Text;
                cliente.DataCadastro = DateTime.Now;

                //validar cnpj ou cpf
                if (validaCpf(txt_Cpf_Cnpj.Value) || validaCnpj(txt_Cpf_Cnpj.Value))
                {
                    //verificar se e pessoa fisica ou juridica
                    if (radioCpf_Cnpj.SelectedValue.Equals("cnpj"))
                    {
                        cliente.CPF = "";
                        cliente.CNPJ = txt_Cpf_Cnpj.Value;
                        cliente.Tipo_Pessoa = 'J';
                    }
                    else
                    {
                        cliente.CNPJ = "";
                        cliente.CPF = txt_Cpf_Cnpj.Value;
                        cliente.Tipo_Pessoa = 'F';
                    }

                    cliente.Endereco = new Endereco();
                    cliente.Endereco.Complemento = txt_Complemento.Text;
                    cliente.Endereco.Numero = txt_Numero.Text;
                    cliente.Endereco.Bairro = txt_Bairro.Text;
                    cliente.Endereco.Cidade = txt_Cidade.Text;
                    cliente.Endereco.Estado = txt_Estado.Text;

                    d.SalvarCliente(cliente);
                    painelCadastro.Visible = false;
                    CarregarClientes();
                    painelGrid.Visible = true;

                    //lblResp.Text = "Cliente " + cliente.Nome + " Salvo Com Sucesso";
                   
                    


                    txt_Numero.Text = string.Empty;
                    txt_Bairro.Text = string.Empty;
                    txt_Cidade.Text = string.Empty;
                    txt_Estado.Text = string.Empty;
                    txt_Nome.Text = string.Empty;
                    txt_Telefone.Text = string.Empty;
                    string message = "Cliente " + cliente.Nome + " Salvo Com Sucesso";
                    Refresh(message);
                    message = "Cliente " + cliente.Nome + " Salvo Com Sucesso";
                    
                }
                else
                {
                    string message = "CPF || CNPJ Inválido!";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>" +
                                    "window.onload=function(){" +
                                        "document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = '';" +
                                        "exibirpainelcadastro();" +
                                         "document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').focus();" +
                                        "alert('" + message + "')" +
                                    "}" +
                               "</script>" +
                               "<style>" +
                                   ".input:focus {" +
                                       "color: white;" +
                                       "border-color: red;" +
                                       "background-color: #e91d1d;" +
                                   "};" +
                               "</style>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    txt_Cpf_Cnpj.Focus();
                }
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void Refresh(string msg)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>" +
                                    "window.onload=function(){" +
                                        "alert('teste');" +
                                    "}" +
                               "</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        
            Response.Redirect(Request.Url.ToString());
            lblResp.Text = msg;
        }

        protected void btnNovoCliente_Click(object sender, EventArgs e)
        {
            try
            {
                painelCadastro.Visible = true;
                painelGrid.Visible = false;
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            try
            {
                painelGrid.Visible = true;
                painelCadastro.Visible = false;
                painelEditar.Visible = false;
                painelCadastro.Visible = false;

                txt_Nome.Text = string.Empty;
                txt_Telefone.Text = string.Empty;
                txt_Complemento.Text = string.Empty;
                txt_Numero.Text = string.Empty;
                txt_Bairro.Text = string.Empty;
                txt_Cidade.Text = string.Empty;
                txt_Estado.Text = string.Empty;

                txt_Nome_Editar.Text = string.Empty;
                txt_Telefone_Editar.Text = string.Empty;
                //txt_tipoPessoa.Text = string.Empty;
                //txt_Cpf_Cnpj.Text = string.Empty;
                txt_Numero_Editar.Text = string.Empty;
                txt_Complemento_Editar.Text = string.Empty;
                txt_Bairro_Editar.Text = string.Empty;
                txt_Cidade_Editar.Text = string.Empty;
                txt_Estado_Editar.Text = string.Empty;

            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}