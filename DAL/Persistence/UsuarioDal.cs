using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Connection;
using DAL.Entity;
using System.Data.SqlClient;

namespace DAL.Persistence
{
    public class UsuarioDal : Conexao
    {
        public void SalvarUsuario(Usuario u)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("INSERT INTO Tb_Usuario (Nome_Usuario, Email, _Login, Senha) VALUES(@Nome_Usuario, @Email, @_Login, @Senha)", Con);
                Cmd.Parameters.AddWithValue("@Nome_Usuario", u.Nome_Usuario);
                Cmd.Parameters.AddWithValue("@Email", u.Email);
                Cmd.Parameters.AddWithValue("@_Login", u.Login);
                Cmd.Parameters.AddWithValue("@Senha", u.Senha);
                Cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Erro: UsuarioDal: SalvarUsuario => " + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        public Usuario BuscarPeloLogin(string login)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("SELECT Id_Usuario, Nome_Usuario, Email, _Login, Senha FROM Tb_Usuario WHERE _Login=@Login", Con);
                Cmd.Parameters.AddWithValue("@Login", login);
                Dr = Cmd.ExecuteReader();
                Usuario u = new Usuario();
                if (Dr.Read())
                {
                    u.Id_Usuario = Convert.ToInt32(Dr["Id_Usuario"]);
                    u.Nome_Usuario = Convert.ToString(Dr["Nome_Usuario"]);
                    u.Email = Convert.ToString(Dr["Email"]);
                    u.Login = Convert.ToString(Dr["_Login"]);
                    u.Senha = Convert.ToString(Dr["Senha"]);
                }
                return u;
            }
            catch (Exception e)
            {
                throw new Exception("Erro: UsuarioDal: BuscarPorId =>" + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        public Usuario BuscarPeloEmail(string email)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("select * from Tb_Usuario where Email = @Email", Con);
                Cmd.Parameters.AddWithValue("@Email", email);
                Dr = Cmd.ExecuteReader();
                Usuario u = new Usuario();
                if (Dr.Read())
                {
                    u.Id_Usuario = Convert.ToInt32(Dr["Id_Usuario"]);
                    u.Nome_Usuario = Convert.ToString(Dr["Nome_Usuario"]);
                    u.Email = Convert.ToString(Dr["Email"]);
                    u.Login = Convert.ToString(Dr["_Login"]);
                    u.Senha = Convert.ToString(Dr["Senha"]);
                }
                return u;
            }
            catch (Exception e)
            {
                throw new Exception("Erro: UsuarioDal: BuscarPeloEmail =>" + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        public void Editar(Usuario usuario)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("update Tb_Usuario set Nome_Usuario = @Nome, Email = @Email, _Login = @Login, Senha = @Senha  where Id_Usuario = @Id", Con);
                Cmd.Parameters.AddWithValue("@Id", usuario.Id_Usuario);
                Cmd.Parameters.AddWithValue("@Nome", usuario.Nome_Usuario);
                Cmd.Parameters.AddWithValue("@Email", usuario.Email);
                Cmd.Parameters.AddWithValue("@Login", usuario.Login);
                Cmd.Parameters.AddWithValue("@Senha", usuario.Senha);
                Cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Erro: UsuarioDal: Editar =>" + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        public bool ExisteLogin(string login)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand(" SELECT COUNT(*) as qtd FROM tb_Usuario  WHERE _Login = @Login", Con);
                Cmd.Parameters.AddWithValue("@Login" , login);
                Dr = Cmd.ExecuteReader();
                string qtdLogin ="";
                bool decisao = true;
                if (Dr.Read())
                {
                    qtdLogin = Convert.ToString(Dr["qtd"]);
                }
                if (qtdLogin.Equals("1"))
                {
                    decisao = true;
                }
                else
                {
                    decisao = false;
                }
                return decisao;
            }
            catch (Exception e)
            {
                throw new Exception("Erro: UsuarioDal: ExisteLogin => " + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        public bool Autenticar(Usuario u)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("select COUNT(*) as qtd from Tb_Usuario where _Login = @Login and Senha=@Senha", Con);
                Cmd.Parameters.AddWithValue("@Login", u.Login);
                Cmd.Parameters.AddWithValue("@Senha", u.Senha);
                Dr = Cmd.ExecuteReader();
                string qtdLogin = "";
                bool decisao = true;
                if (Dr.Read())
                {
                    qtdLogin = Convert.ToString(Dr["qtd"]);
                }
                if (qtdLogin.Equals("1"))
                {
                    decisao = true;
                }
                else
                {
                    decisao = false;
                }
                return decisao;
            }
            catch (Exception e)
            {
                throw new Exception("Erro: UsuarioDal: ExisteLogin => " + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

    }
}
