using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Entity;
using DAL.Utilidades;
using DAL.Persistence;

namespace Site.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            try
            {
                Usuario u = new Usuario();
                u.Login = txtLogin.UserName;
                u.Senha = Criptografia.Encriptar(txtLogin.Password);
                UsuarioDal d = new UsuarioDal();
                if (d.Autenticar(u))
                {
                    Usuario usuario = d.BuscarPeloLogin(u.Login);
                    Session.Add("UsuarioSessao", usuario);  
                }
                e.Authenticated = d.Autenticar(u);
                
                if (!d.Autenticar(u))
                {
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.danger('Login ou Senha incorretos', 'OficiNet')", true);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "alert('Login ou Senha incorretos, verifique e tente novamente.')", true);
                }
            }
            catch (Exception ex)
            {
                e.Authenticated = false; //Acesso Negado!
                //imprimir o erro na página sem label
                Response.Write(ex.Message);
            }
        }
    }

}