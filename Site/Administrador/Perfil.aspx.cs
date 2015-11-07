using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Entity;

namespace Site.Administrador
{
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carregarUsuario();
            }
        }

        private void carregarUsuario()
        {
           Usuario u = (Usuario)Session["UsuarioSessao"];
           lblNomeUsuario.Text = u.Nome_Usuario.ToString();
           lblEmail.Text = u.Email.ToString();
           lblLogin.Text = u.Login;
        }
    }
}