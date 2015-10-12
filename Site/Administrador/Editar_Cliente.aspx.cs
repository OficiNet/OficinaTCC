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

            
            


        }


        //protected void btn_Editar_Cliente_Click(object sender, EventArgs e)
        //{
        //    string id = Request.QueryString["id"];
        //}


        protected void btn_Editar_Cliente_Click(object sender, EventArgs e)
        {
            try
            {
                DAL.Entity.Cliente cliente = new DAL.Entity.Cliente();
                ClienteDal d = new ClienteDal();

                int id = Convert.ToInt32(Request.QueryString["id"]);
                cliente.Id_Cliente = id;
                cliente.Nome = txt_Nome_Editar.Text;
                cliente.Telefone = txt_Telefone_Editar.Text; 
                cliente.DataCadastro = DateTime.Now;

                cliente.Endereco = new Endereco();

                cliente.Endereco.Complemento = txt_Complemento_Editar.Text;
                cliente.Endereco.Bairro = txt_Bairro_Editar.Text;
                cliente.Endereco.Cidade = txt_Cidade_Editar.Text;
                cliente.Endereco.Numero = txt_Numero_Editar.Text;
                cliente.Endereco.Estado = txt_Estado_Editar.Text;


                d.EditarCliente(cliente);



                //string message = "CPF || CNPJ Inválido!";
                //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                //sb.Append("<script type = 'text/javascript'>" +
                //                "window.onload=function(){" +
                //                   // "document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').value = '';" +
                //                   // "exibirpainelcadastro();" +
                //                   //  "document.getElementById('ContentPlaceHolder1_txt_Cpf_Cnpj').focus();" +
                //                    "alert('" + message + "')" +
                //                   // "location.href='Cad_Cliente.aspx'"+
                //                    "window.location.assign('Cad_Cliente.aspx');"+
                //                "}" +
                //           "</script>" +
                //           "<style>" +
                //               ".input:focus {" +
                //                   "color: white;" +
                //                   "border-color: red;" +
                //                   "background-color: #e91d1d;" +
                //               "};" +
                //           "</style>");
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

                Response.Redirect("Cad_Cliente.aspx");


            }
            catch (Exception ex)
            {
                throw;
               // lblResp.Text = ex.Message;
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