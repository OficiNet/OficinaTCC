using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Site.Administrador
{
    public partial class Sistema : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            //Destruir a permissão de acesso concedida
            FormsAuthentication.SignOut(); //voltar a ser um Usuario Anônimo
            //Redicionamento de volta para a página de Login
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}