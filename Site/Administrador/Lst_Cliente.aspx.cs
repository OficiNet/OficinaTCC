using System;
using System.Web.UI.WebControls;
using DAL.Persistence;

namespace Site.Administrador
{
    public partial class Lst_Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void gridClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Editar"))
            {
                string idProduto = e.CommandArgument.ToString();
                if (!String.IsNullOrEmpty(idProduto))
                    this.Response.Redirect("Principal.aspx");
            }
        }
    }
}