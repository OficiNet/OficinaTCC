using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Entity;
using DAL.Persistence;
using DAL.Utilidades;
using System.Web.Security;

namespace Site.Administrador
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCadastro_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    Usuario u = new Usuario();
            //    UsuarioDal d = new UsuarioDal();

            //    if (!d.ExisteLogin(txtLogin.Text))
            //    {
            //        u.Nome_Usuario = txtNome.Text;
            //        u.Senha = Criptografia.Encriptar(txtSenha.Text);
            //        u.Email = txtEmail.Text;
            //        u.Login = txtLogin.Text;
            //        d.SalvarUsuario(u);
            //        lblResp.Text = "Cadastrado Com Sucesso";
            //    }
            //    else
            //    {
            //        lblResp.Text = "Login Ja Existe!!";
            //        txtLogin.Text = "";
            //    }
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
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