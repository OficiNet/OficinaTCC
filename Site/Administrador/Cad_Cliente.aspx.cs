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
                //painelEditar.Visible = true;
                //painelGrid.Visible = false;
                //painelCadastro.Visible = false;

                ////if (btnAtualizar.Equals(sender))
                ////{
                ////    int id = Convert.ToInt32(lblIdTarefa.Text);
                ////    ClienteDal d = new ClienteDal();
                ////    d.Excluir(id);
                ////}

                foreach (GridViewRow linha in gridClientes.Rows)
                {
                    Button btnAtualizar = linha.FindControl("btnAtualizar") as Button;
                    Label lblIdCliente = linha.FindControl("lblIdCliente") as Label;
                    if (btnAtualizar.Equals(sender))
                    {
                        int id = Convert.ToInt32(lblIdCliente.Text);
                        Response.Redirect("Editar_Cliente.aspx?id=" + id.ToString());
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
                    Label lblIdCliente = linha.FindControl("lblIdCliente") as Label;
                    if (btnExcluirCampo.Equals(sender))
                    {
                        int id = Convert.ToInt32(lblIdCliente.Text);
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

        //valida cpf
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

        protected void valida_Click(object sender, EventArgs e)
        { Response.Redirect(Request.Url.ToString()); }

        protected void btn_Cadastrar_Cliente_Click(object sender, EventArgs e)
        {
            try
            {
                //string script;
                DAL.Entity.Cliente cliente = new DAL.Entity.Cliente();
                ClienteDal d = new ClienteDal();
                cliente.Nome = txt_Nome.Text;
                cliente.Telefone = txt_Telefone.Text;
                cliente.DataCadastro = DateTime.Now;
                cliente.Sexo = radioSexo.SelectedValue;

                //validar cnpj ou cpf
                if (validaCpf(txt_Cpf_Cnpj.Value) || validaCnpj(txt_Cpf_Cnpj.Value))
                {
                    //verificar se e pessoa fisica ou juridica
                    if (radioCpf_Cnpj.SelectedValue.Equals("cnpj"))
                    {
                        cliente.CPF = "";
                        string cnpj = txt_Cpf_Cnpj.Value;
                        cliente.CNPJ = cnpj; ;
                        cliente.Tipo_Pessoa = 'J';
                    }
                    else
                    {
                        cliente.CNPJ = "";
                        string cpf = txt_Cpf_Cnpj.Value;
                        cliente.CPF = cpf;
                        cliente.Tipo_Pessoa = 'F';
                    }

                    cliente.Endereco = new Endereco();
                    cliente.Endereco.Complemento = txt_Complemento.Text;
                    cliente.Endereco.Numero = txt_Numero.Text;
                    cliente.Endereco.Bairro = txt_Bairro.Text;
                    cliente.Endereco.Cidade = txt_Cidade.Text;
                    cliente.Endereco.Estado = txt_Estado.Text;
                    cliente.Endereco.Logradouro = txt_logradouro.Text;

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
                    message = "Cliente " + cliente.Nome + " Salvo Com Sucesso";
                    Response.Redirect(Request.Url.ToString());
                }
                else
                {
                    string message = "CPF || CNPJ Inválido!";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>" +
                                    "window.onload=function(){" +
                                        "document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = '';" +
                                        "exibirpainelcadastro();" +
                        //"document.getElementById('exibirpaineleditar').style.display = 'none';"+
                        // "document.getElementById('painelgrid').style.display = 'none';"+
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

        public void Refresh(string msg, string script)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>" +
                            "window.onload=function(){" +
                                "alert('teste');" +
                //  "window.location.reload();"+

                            "}" +
                       "</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());


            lblResp.Text = msg;
        }

        protected void btnNovoCliente_Click(object sender, EventArgs e)
        {
            try
            {
                lblResp.Text = string.Empty;
                painelCadastro.Visible = true;
                painelGrid.Visible = false;
            }
            catch (Exception)
            {
                throw;
            }
        }

        //protected void btnVoltar_Click(object sender, EventArgs e)
        // {
        //     try
        //     {
        // lblResp.Text = string.Empty;
        // painelGrid.Visible = true;
        // painelCadastro.Visible = false;
        //// painelEditar.Visible = false;
        // painelCadastro.Visible = false;

        // txt_Nome.Text = string.Empty;
        // txt_Telefone.Text = string.Empty;
        // txt_Complemento.Text = string.Empty;
        // txt_Numero.Text = string.Empty;
        // txt_Bairro.Text = string.Empty;
        // txt_Cidade.Text = string.Empty;
        // txt_Estado.Text = string.Empty;
        // txt_logradouro.Text = string.Empty;

        // //txt_Nome_Editar.Text = string.Empty;
        // //txt_Telefone_Editar.Text = string.Empty;
        // //txt_tipoPessoa.Text = string.Empty;
        // //txt_Cpf_Cnpj.Text = string.Empty;
        // //txt_Numero_Editar.Text = string.Empty;
        // //txt_Complemento_Editar.Text = string.Empty;
        // //txt_Bairro_Editar.Text = string.Empty;
        // //txt_Cidade_Editar.Text = string.Empty;
        // //txt_Estado_Editar.Text = string.Empty;

        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}

        protected void btnValidar_Click(object sender, EventArgs e)
        {
            try
            {
                ClienteDal d = new ClienteDal();


                if (validaCpf(txtValidarCpfCnpj.Value) || validaCnpj(txtValidarCpfCnpj.Value))
                {

                    if (!d.Verificar_Cpf_Cnpj(txtValidarCpfCnpj.Value))
                    {
                        lblValida_cpf_cnpj.Text = "true";
                    }
                    else
                    {
                        lblValida_cpf_cnpj.Text = "false";
                    }
                }
                else
                {
                    lblValida_cpf_cnpj.Text = "invalido";
                }
            }
            catch (Exception ex)
            {
                lblResp.Text = ex.InnerException.ToString();
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            try
            {
                lblVerificarCpfCnpj.Text = "";
                Response.Redirect(Request.Url.ToString());
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}