using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DAL.Entity;

namespace Site.Administrador
{
    public partial class Sistema : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario u = ((Usuario)Session["UsuarioSessao"]);
                if (u != null)
                {
                    lblNomeUsuario.Text = u.Nome_Usuario;    
                }  
            }
        }

        protected void Sair(object sender, EventArgs e)
        {
            //encerrar a sessão
            Session.Remove("UsuarioSessao");
            //Destruir a permissão de acesso concedida
            FormsAuthentication.SignOut(); //voltar a ser um Usuario Anônimo
            //Redicionamento de volta para a página de Login
            FormsAuthentication.RedirectToLoginPage();   
        }
    }
}