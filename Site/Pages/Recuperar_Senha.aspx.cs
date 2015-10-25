using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Site.Pages
{
    public partial class Recuperar_Senha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void NovaSenha()
        { 
            
        }

        protected void btn_Recuperar_Senha_Click(object sender, EventArgs e)
        {
            //Define os dados do e-mail
            string nomeRemetente = "OficiNet";
            string emailRemetente = "mmsr_luis@hotmail.com";
            string senha = "senha2014";
            string SMTP = "smtp.live.com";
            string emailDestinatario = "mmsr_luis@hotmail.com";
            string assuntoMensagem = "OficiNet - Recuperação de Senha";
            string conteudoMensagem = "<h4>OficiNet<h4> <br /> Sua nova senha de acesso ao sistema é: ******** <br /> Ao acessar o sistema faça a alteração da senha no seu Perfil de Usuário. <br /> Atenção. Este é um e-mail automático, não responda a esta mensagem. <br /> Caso não tenha solicitado a alteração da senha ignore este e-mail.";

            MailMessage objEmail = new MailMessage();

            //Define o Campo From e ReplyTo do e-mail.
            objEmail.From = new System.Net.Mail.MailAddress(nomeRemetente + "<" + emailRemetente + ">");

            //Destinatários do e-mail.
            objEmail.To.Add(emailDestinatario);

            objEmail.Priority = System.Net.Mail.MailPriority.Normal;
            objEmail.IsBodyHtml = true;

            //Título do e-mail.
            objEmail.Subject = assuntoMensagem;

            //Corpo do e-mail.
            objEmail.Body = conteudoMensagem;

            objEmail.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            objEmail.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

            System.Net.Mail.SmtpClient objSmtp = new System.Net.Mail.SmtpClient();
            objSmtp.Credentials = new System.Net.NetworkCredential(emailRemetente, senha);
            objSmtp.Host = SMTP;
            objSmtp.Port = 25;
            //Caso utilize conta de email do exchange da locaweb deve habilitar o SSL
            objSmtp.EnableSsl = true;

            try
            {
                objSmtp.Send(objEmail);
                Response.Write("E-mail enviado com sucesso !");
            }
            catch (Exception ex)
            {
                Response.Write("Ocorreram problemas no envio do e-mail. Erro = " + ex.Message);
            }
            finally
            {
                //excluímos o objeto de e-mail da memória
                objEmail.Dispose();
            }
        }
    }
}