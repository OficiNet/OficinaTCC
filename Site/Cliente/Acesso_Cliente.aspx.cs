using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Persistence;
using DAL.Entity;

namespace Site.Cliente
{
    public partial class Acesso_Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void btnPesquisa_Click(object sender, EventArgs e)
        {
            string cpf_cnpj = txtCPFCNPJ.Text;
            Ordem_ServicoDal d = new Ordem_ServicoDal();
            List<Ordem_Servico> lista = new List<Ordem_Servico>();
            lista = d.ListarOrdemServicoPorCpf_Cnpj(cpf_cnpj);

            if (lista.Count != 0)
            {
                gridOrdemServico.DataSource = lista;
                gridOrdemServico.DataBind();
                painelOrdemServico.Visible = true;
                painelCPFCNPJ.Visible = false;
            }
            else
            {
                lblResp.Text = "Usuario Inválido";
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Default.aspx");
            }
            catch (Exception)
            {
                throw;
            }
        }

        
    }
}