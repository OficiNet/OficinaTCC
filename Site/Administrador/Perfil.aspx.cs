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
                pnlDados.Visible = true;
                pnlEdicao.Visible = false;
                carregarUsuario();
            }
        }

        private void carregarUsuario()
        {
           Usuario u = (Usuario)Session["UsuarioSessao"];
           lblNomeUsuario.Text = u.Nome_Usuario.ToString();
           lblEmail.Text = u.Email.ToString();
           lblLogin.Text = u.Login;
           txt_Nome_Usuario_Editar.Text = u.Nome_Usuario.ToString();
           txt_Email_Editar.Text = u.Email.ToString();
           txt_Login_Editar.Text = u.Login;
           txt_Senha_Editar.Text = u.Senha;
        }

        protected void btn_Gravar_Perfil_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnVoltar_Perfil_Click(object sender, EventArgs e)
        {
            pnlDados.Visible = true;
            pnlEdicao.Visible = false;
        }

        protected void btn_Editar_Click(object sender, EventArgs e)
        {
            pnlDados.Visible = false;
            pnlEdicao.Visible = true;
        }
    }
}