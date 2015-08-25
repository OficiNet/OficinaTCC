using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Entity;
using DAL.Persistence;

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


        private void CarregarClientes()
        {
            try
            {
                //ClienteDal d = new ClienteDal();
                //gridClientes.DataSource = d.ListarCliente("");
                //gridClientes.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
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
                if (radioCpf_Cnpj.SelectedValue.Equals("cnpj"))
                {
                    cliente.CPF = "";
                    cliente.CNPJ = txt_Cpf_Cnpj.Text;
                    cliente.Tipo_Pessoa = 'J';
                }
                else
                {
                    cliente.CNPJ = "";
                    cliente.CPF = txt_Cpf_Cnpj.Text;
                    cliente.Tipo_Pessoa = 'F';
                }
            
                cliente.Endereco = new Endereco();
                cliente.Endereco.Complemento = txt_Complemento.Text;
                cliente.Endereco.Numero = txt_Numero.Text;
                cliente.Endereco.Bairro = txt_Bairro.Text;
                cliente.Endereco.Cidade = txt_Cidade.Text;
                cliente.Endereco.Estado = txt_Estado.Text;

                d.SalvarCliente(cliente);


                lblResp.Text = "Cliente Salvo Com Sucesso";

            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}