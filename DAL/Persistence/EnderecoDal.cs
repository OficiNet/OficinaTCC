using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Entity;
using DAL.Persistence;
using DAL.Connection;
using System.Data.SqlClient;

namespace DAL.Persistence
{
   public class EnderecoDal : Conexao
    {
       public void SalvarEndereco(Endereco e)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("INSERT INTO Tb_Endereco (Numero, Complemento, Bairro, Cidade, Estado) VALUES(@Numero, @Complemento, @Bairro, @Cidade, @Estado", Con);
               Cmd.Parameters.AddWithValue("@Numero", e.Numero);
               Cmd.Parameters.AddWithValue("@Complemento", e.Complemento);
               Cmd.Parameters.AddWithValue("@Bairro", e.Bairro);
               Cmd.Parameters.AddWithValue("@Cidade", e.Cidade);
               Cmd.Parameters.AddWithValue("@Estado", e.Estado);
               Cmd.ExecuteNonQuery();
           }
           catch (Exception ex)
           {
               throw new Exception("Erro: EnderecoDal: SalvarEndereco(Endereco e) => " + ex.Message);
           }
           finally
           {
               FecharConexao();
           }
       }

       public List<Endereco> ListarEndereco()
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("select * from Tb_Endereco ", Con);
               Dr = Cmd.ExecuteReader();
               List<Endereco> listaEndereco = new List<Endereco>();
               while (Dr.Read())
               {
                   Endereco e = new Endereco();
                   e.Id_Endereco = Convert.ToInt32(Dr["Id_Endereco"]);
                   e.Numero = Convert.ToString(Dr["Numero"]);
                   e.Complemento = Convert.ToString(Dr["Complemento"]);
                   e.Bairro = Convert.ToString(Dr["Bairro"]);
                   e.Cidade = Convert.ToString(Dr["Cidade"]);
                   e.Estado = Convert.ToString(Dr["Estado"]);
                   listaEndereco.Add(e);
               }
               return listaEndereco;
           }
           catch (Exception ex)
           {
               throw new Exception("Erro: EnderecoDal:  ListarEndereco() => " + ex.Message);
           }
           finally
           {
               FecharConexao();
           }
       }

       public void EditarEndereco(Endereco e)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("update Tb_Endereco set Numero = @Numero, Complemento = @Complemento, Bairro = @Bairro, Cidade = @Cidade, Estado = @Estado where Id_Endereco = @Id_Endereco ", Con);
               Cmd.Parameters.AddWithValue("@Numero", e.Numero);
               Cmd.Parameters.AddWithValue("@Complemento", e.Complemento);
               Cmd.Parameters.AddWithValue("@Bairro", e.Bairro);
               Cmd.Parameters.AddWithValue("@Cidade", e.Cidade);
               Cmd.Parameters.AddWithValue("@Estado", e.Estado);
               Cmd.ExecuteNonQuery();
           }
           catch (Exception ex)
           {
               throw new Exception("Erro: EnderecoDal:  EditarEndereco(Endereco e) => " + ex.Message);
           }
           finally
           {
               FecharConexao();
           }
       }

    }
}
