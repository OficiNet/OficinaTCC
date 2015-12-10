using System;
using System.Web.UI;
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
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('As senhas não correspondem.', 'OficiNet')", true);
                        txt_Senha_Editar.Text = string.Empty;
                        txtConfirmarSenha.Text = string.Empty;
                        txt_Senha_Editar.Focus();
                        return false;
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('Campo Senha ou Confirmar Senha vazio, preencha e tente novamente.', 'OficiNet')", true);
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
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.success('Usuário atualizado com sucesso.', 'OficiNet')", true);
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
        }

        protected void btn_Editar_Click(object sender, EventArgs e)
        {
            pnlDados.Visible = false;
            pnlEdicao.Visible = true;
        }
    }
}