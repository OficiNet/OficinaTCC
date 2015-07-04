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
   public class ClienteDal: Conexao
    {
       public void SalvarCliente(Cliente c)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("INSERT INTO Tb_Cliente (Nome, Telefone, DataCadastro, Tipo_Pessoa, CPF, CNPJ) VALUES(@Nome, @Telefone, @DataCadastro, @Tipo_Pessoa, @CPF, @CNPJ)", Con);
               Cmd.Parameters.AddWithValue("@Nome", c.Nome);
               Cmd.Parameters.AddWithValue("@Telefone", c.Telefone);
               Cmd.Parameters.AddWithValue("@DataCadastro", c.DataCadastro);
               Cmd.Parameters.AddWithValue("@Tipo_Pessoa", c.Tipo_Pessoa);
               Cmd.Parameters.AddWithValue("@CPF", c.CPF);
               Cmd.Parameters.AddWithValue("@CNPJ", c.CNPJ);
               Cmd.ExecuteNonQuery();
           }
           catch (Exception e)
           {
               throw new Exception("Erro: ClienteDal: SalvarCliente(Cliente c) => " + e.Message);
           }
           finally
           {
               FecharConexao();
           }
       }

       public List<Cliente> ListarCliente(string strWhere)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("select * from Tb_Cliente where " + strWhere, Con);
               Dr = Cmd.ExecuteReader();
               List<Cliente> listaCliente = new List<Cliente>();
               while (Dr.Read())
               {
                   Cliente c = new Cliente();
                   c.Id_Cliente = Convert.ToInt32(Dr["Id_Cliente"]);
                   c.Nome = Convert.ToString(Dr["Nome"]);
                   c.Telefone = Convert.ToString(Dr["Telefone"]);
                   c.DataCadastro = Convert.ToDateTime(Dr["DataCadastro"]);
                   c.Tipo_Pessoa = Convert.ToChar(Dr["Tipo_Pessoa"]);
                   c.CPF = Convert.ToString(Dr["CPF"]);
                   c.CNPJ = Convert.ToString(Dr["CNPJ"]);
                   listaCliente.Add(c);
               }
               return listaCliente;
           }
           catch (Exception e)
           {
               throw new Exception("Erro: ClienteDal: ListarCliente() => " + e.Message);
           }
           finally
           {
               FecharConexao();
           }
       }

       public void EditarCliente(Cliente c)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("update Tb_Cliente set Nome = @Nome, Telefone = @Telefone, DataCadastro = @DataCadastro, Tipo_Pessoa = @Tipo_Pessoa, CPF = @CPF, CNPJ = @CNPJ where Id_Cliente = @Id_Cliente ", Con);
               Cmd.Parameters.AddWithValue("@Nome", c.Nome);
               Cmd.Parameters.AddWithValue("@Telefone", c.Telefone);
               Cmd.Parameters.AddWithValue("@DataCadastro", c.DataCadastro);
               Cmd.Parameters.AddWithValue("@Tipo_Pessoa", c.Tipo_Pessoa);
               Cmd.Parameters.AddWithValue("@CPF", c.CPF);
               Cmd.Parameters.AddWithValue("@CNPJ", c.CNPJ);
               Cmd.Parameters.AddWithValue("@Id_Cliente", c.Id_Cliente);
               Cmd.ExecuteNonQuery();
           }
           catch (Exception e)
           {
               throw new Exception("Erro: VeiculoDal: EditarVeiculo(int id) => " + e.Message);
           }
           finally
           {
               FecharConexao();
           }
       }

    }
}
