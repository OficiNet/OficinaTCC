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
    public partial class Editar_Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carregarCliente();
            }
        }

        private void carregarCliente()
        {
            ClienteDal d = new ClienteDal();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            DAL.Entity.Cliente c = d.BuscarPorId(id);
            txt_Nome_Editar.Text = c.Nome.ToString();
            txt_Telefone_Editar.Text = c.Telefone.ToString();
            if (c.Sexo == "M")
            {
                radioSexo.SelectedIndex = 0;
            }
            else {
                radioSexo.SelectedIndex = 1;
            
            }
            txt_Sexo_Editar.Text = c.Sexo;

            if (c.CPF == null)
            {
                txt_Cpf_Cnpj_Editar.Text = c.CNPJ;
            }
            else
            {
                txt_Cpf_Cnpj_Editar.Text = c.CPF ;
            }
            txt_Numero_Editar.Text = c.Endereco.Numero ;
            txt_Complemento_Editar.Text = c.Endereco.Complemento;
            txt_Bairro_Editar.Text = c.Endereco.Bairro; 
            txt_Cidade_Editar.Text = c.Endereco.Cidade;
            txt_Estado_Editar.Text = c.Endereco.Estado;
            txt_Logradouro_Editar.Text = c.Endereco.Logradouro;
        }

        protected void btn_Editar_Cliente_Click(object sender, EventArgs e)
        {
            try
            {
                DAL.Entity.Cliente cliente = new DAL.Entity.Cliente();
                ClienteDal d = new ClienteDal();
                int id = Convert.ToInt32(Request.QueryString["id"]);
                cliente.Id_Cliente = id;
                cliente.Nome = txt_Nome_Editar.Text.Trim();
                cliente.Telefone = txt_Telefone_Editar.Text.Trim();
                cliente.Sexo = radioSexo.SelectedValue.ToString();
                cliente.DataCadastro = DateTime.Now;
                cliente.Endereco = new Endereco();
                cliente.Endereco.Complemento = txt_Complemento_Editar.Text.Trim();
                cliente.Endereco.Bairro = txt_Bairro_Editar.Text.Trim();
                cliente.Endereco.Cidade = txt_Cidade_Editar.Text.Trim();
                cliente.Endereco.Numero = txt_Numero_Editar.Text.Trim();
                cliente.Endereco.Estado = txt_Estado_Editar.Text.Trim();
                cliente.Endereco.Logradouro = txt_Logradouro_Editar.Text.Trim();
                d.EditarCliente(cliente);
                Response.Redirect("Cad_Cliente.aspx");
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnVoltar_Editar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Cad_Cliente.aspx");
            }
            catch (Exception)
            {   
                throw;
            }
        }
    }
}