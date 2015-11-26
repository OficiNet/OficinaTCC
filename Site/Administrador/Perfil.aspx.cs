using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Entity;
using DAL.Persistence;
using DAL.Utilidades;

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
            txt_Senha_Editar.Text = u.Senha.ToString();
            txtConfirmarSenha.Text = u.Senha.ToString();
        }



        private bool verificarSenha()
        {
            try
            {
                Usuario u = new Usuario();
                if (!String.IsNullOrEmpty(txt_Senha_Editar.Text) || !String.IsNullOrEmpty(txtConfirmarSenha.Text))
                {
                    if (txt_Senha_Editar.Text == txtConfirmarSenha.Text)
                    {
                        
                        return true;
                    }
                    else
                    {
                        lblResp.CssClass = "ls-color-danger";
                        lblResp.Text = "As senhas não correspondem!";
                        txt_Senha_Editar.Text = string.Empty;
                        txtConfirmarSenha.Text = string.Empty;
                        txt_Senha_Editar.Focus();
                        return false;
                    }
                }
                else
                {
                    lblResp.CssClass = "ls-color-warning";
                    lblResp.Text = "Campo Senha e/ou Confirmar Senha Vazio";
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        protected void btn_Gravar_Perfil_Click(object sender, EventArgs e)
        {
            try
            {
                if (verificarSenha())
                {
                    UsuarioDal d = new UsuarioDal();
                    Usuario _u = (Usuario)Session["UsuarioSessao"];
                    Usuario u = new Usuario();
                    u.Id_Usuario = Convert.ToInt32(((Usuario)Session["UsuarioSessao"]).Id_Usuario);
                    u.Nome_Usuario = txt_Nome_Usuario_Editar.Text;
                    u.Email = txt_Email_Editar.Text;
                    u.Login = txt_Login_Editar.Text;

                    if (txt_Senha_Editar.Text.ToString() != _u.Senha.ToString())
                    {
                        u.Senha = Criptografia.Encriptar(txt_Senha_Editar.Text);
                    }
                    else
                    {
                        u.Senha = _u.Senha;
                    }
                    
                    lblLogin.Text = u.Login;
                    lblEmail.Text = u.Email;
                    lblNomeUsuario.Text = u.Nome_Usuario;
                    d.Editar(u);
                    lblResp.CssClass = "ls-color-success";
                    lblResp.Text = "Usuario " + u.Nome_Usuario + " Editado Com Sucesso.";
                    Session.Add("UsuarioSessao", u); 
                    carregarUsuario();
                    pnlDados.Visible = true;
                    pnlEdicao.Visible = false;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnVoltar_Perfil_Click(object sender, EventArgs e)
        {
            pnlDados.Visible = true;
            pnlEdicao.Visible = false;
            lblResp.Text = string.Empty;
        }

        protected void btn_Editar_Click(object sender, EventArgs e)
        {
            pnlDados.Visible = false;
            pnlEdicao.Visible = true;
            lblResp.Text = string.Empty;
        }
    }
}