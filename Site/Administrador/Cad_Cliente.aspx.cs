using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Entity;
using DAL.Persistence;
using System.Threading;

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
                string strWhere = "Nome like '%{0}%'";
                strWhere = String.Format(strWhere, txtPesquisa.Text.ToString().Trim());
                ClienteDal d = new ClienteDal();

                gridClientes.DataSource = d.ListarCliente(strWhere);
                gridClientes.DataBind();

                if (gridClientes.Rows.Count == 0)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('Cliente não encontrado.', 'OficiNet')", true);
                }
                //else
                //{
                //    gridClientes.DataBind();
                //}
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
                painel_cpf_cnpj.Visible = false;
                painel_Grid.Visible = true;
                painelCadastro.Visible = false;

            }
            catch (Exception)
            {

                throw;
            }
        }

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
                throw;
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
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.success('Cliente excluido com sucesso.', 'OficiNet')", true);
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.danger('Erro ao excluir cliente.', 'OficiNet')", true);
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



        protected void btn_Cadastrar_Cliente_Click(object sender, EventArgs e)
        {
            try
            {
                //string script;
                DAL.Entity.Cliente cliente = new DAL.Entity.Cliente();
                ClienteDal d = new ClienteDal();
                cliente.Nome = txt_Nome.Text.Trim();
                string telefone = txt_Telefone.Text.Trim();
                telefone = telefone.Replace("(", "");
                telefone = telefone.Replace(")", "");
                telefone = telefone.Replace("-", "");
                telefone = telefone.Replace(" ", "");
                if (telefone.Length == 11 || telefone.Length == 10)
                {
                    cliente.Telefone = txt_Telefone.Text.Trim();
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
                        cliente.Endereco.Complemento = txt_Complemento.Text.Trim();
                        cliente.Endereco.Numero = txt_Numero.Text.Trim();
                        cliente.Endereco.Bairro = txt_Bairro.Text.Trim();
                        cliente.Endereco.Cidade = txt_Cidade.Text.Trim();
                        cliente.Endereco.Estado = txt_Estado.Text.Trim();
                        cliente.Endereco.Logradouro = txt_logradouro.Text.Trim();

                        d.SalvarCliente(cliente);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('Cadastrado com sucesso.', 'OficiNet')", true);

                        Thread.Sleep(1000);
                        painelCadastro.Visible = false;
                        CarregarClientes();
                        painel_Grid.Visible = true;

                        txt_Numero.Text = string.Empty;
                        txt_Bairro.Text = string.Empty;
                        txt_Cidade.Text = string.Empty;
                        txt_Estado.Text = string.Empty;
                        txt_Nome.Text = string.Empty;
                        txt_Telefone.Text = string.Empty;



                        painel_cpf_cnpj.Visible = false;

                        //lblResp.Text = "return alert('teste')";
                        // Response.Redirect(Request.Url.ToString());




                    }
                    else
                    {
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.danger('CPF ou CNPJ inválido.', 'OficiNet')", true);
                        //Response.Redirect(Request.Url.ToString());
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('O CPF ou CNPJ já existe.', 'OficiNet')", true); Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('Cadastrado com sucesso.', 'OficiNet')", true);
                        Thread.Sleep(1000);
                        txt_Telefone.Focus();
                    }
                }
                else
                {
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('Telefone Inválido', 'OficiNet')", true);
                   
                    txt_Telefone.Text = string.Empty;
                    txt_Telefone.Focus();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('O CPF ou CNPJ já existe.', 'OficiNet')", true);
                    Thread.Sleep(1000);
                    
                }


                
            }
            catch (Exception)
            {
                throw;
            }
        }



        protected void btnValidar_Click(object sender, EventArgs e)
        {
            try
            {
                ClienteDal d = new ClienteDal();

                if (validaCpf(txtValidarCpfCnpj.Value) || validaCnpj(txtValidarCpfCnpj.Value))
                {

                    if (!d.Verificar_Cpf_Cnpj(txtValidarCpfCnpj.Value))
                    {
                        // lblValida_cpf_cnpj.Visible = false;
                        //  lblValida_cpf_cnpj.Text = "true";

                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.danger('O CPF ou CNPJ já existe.', 'OficiNet')", true);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('O CPF ou CNPJ já existe.', 'OficiNet')", true);
                        Thread.Sleep(1000);
                    }
                    else
                    {
                        // lblValida_cpf_cnpj.Text = "false";

                        painelCadastro.Visible = true;
                        painel_Grid.Visible = false;
                        painel_cpf_cnpj.Visible = false;
                        txt_Cpf_Cnpj.Value = txtValidarCpfCnpj.Value;
                        txt_Numero.Text = string.Empty;
                        txt_Bairro.Text = string.Empty;
                        txt_Cidade.Text = string.Empty;
                        txt_Estado.Text = string.Empty;
                        txt_Nome.Text = string.Empty;
                        txt_Telefone.Text = string.Empty;
                        txt_logradouro.Text = string.Empty;
                        txt_Complemento.Text = string.Empty;
                    }
                }
                else
                {
                    // lblValida_cpf_cnpj.Text = "invalido";
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.danger('CPF ou CNPJ inválido.', 'OficiNet')", true);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('CPF ou CNPJ inválido.', 'OficiNet')", true);
                    Thread.Sleep(1000);
                }
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
                CarregarClientes();
                painelCadastro.Visible = false;
                painel_Grid.Visible = true;
                painel_cpf_cnpj.Visible = false;
                txtValidarCpfCnpj.Value = string.Empty;
                txt_Numero.Text = string.Empty;
                txt_Bairro.Text = string.Empty;
                txt_Cidade.Text = string.Empty;
                txt_Estado.Text = string.Empty;
                txt_Nome.Text = string.Empty;
                txt_Telefone.Text = string.Empty;
                txt_logradouro.Text = string.Empty;
                txt_Complemento.Text = string.Empty;
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnNovoCliente_Click(object sender, EventArgs e)
        {
            painelCadastro.Visible = false;
            painel_Grid.Visible = false;
            painel_cpf_cnpj.Visible = true;
        }
    }
}