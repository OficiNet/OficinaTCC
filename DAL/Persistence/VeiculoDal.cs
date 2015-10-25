using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Entity;
using DAL.Connection;
using System.Data.SqlClient;
using System.Data;

namespace DAL.Persistence
{
   public class VeiculoDal : Conexao
    {
       public void SalvarVeiculo(Veiculo v)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("CadVeiculo", Con);
               Cmd.CommandType = CommandType.StoredProcedure;
               Cmd.Parameters.AddWithValue("@Placa", v.Placa);
               Cmd.Parameters.AddWithValue("@Modelo", v.Modelo);
               Cmd.Parameters.AddWithValue("@Ano", v.Ano);
               Cmd.Parameters.AddWithValue("@Marca", v.Marca);
               Cmd.Parameters.AddWithValue("@Id_Cliente", v.Cliente.Id_Cliente);
               Cmd.ExecuteNonQuery();
           }
           catch (Exception e)
           {
               throw new Exception("Erro: VeiculoDal: SalvarVeiculo => " + e.Message);
           }
           finally
           {
               FecharConexao();
           }
       }

       public List<Veiculo> ListarVeiculos()
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("select v.Id_Veiculo, c.Nome , v.Marca, v.Modelo, v.Ano, v.Placa from Tb_Cliente as c inner join Tb_Veiculo as v on c.Id_Cliente = FK_Id_Cliente", Con);
               Dr = Cmd.ExecuteReader();
               List<Veiculo> listaVeiculo = new List<Veiculo>();
               while (Dr.Read())
               {
                   Veiculo v = new Veiculo();

                   v.Id_Veiculo = Convert.ToInt32(Dr["Id_Veiculo"]);
                   v.Cliente = new Cliente();
                   v.Cliente.Nome = Convert.ToString(Dr["Nome"]);
                   v.Placa = Convert.ToString(Dr["Placa"]);
                   v.Modelo = Convert.ToString(Dr["Modelo"]);
                   v.Ano = Convert.ToString(Dr["Ano"]);
                   v.Marca = Convert.ToString(Dr["Marca"]);
                   listaVeiculo.Add(v);
               }
               return listaVeiculo;
           }
           catch (Exception e)
           {
               throw new Exception("Erro: VeiculoDal: ListarVeiculo() => " + e.Message);
           }
           finally
           {
               FecharConexao();
           }
       }

       public void EditarVeiculo(Veiculo veiculo)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("EditarVeiculo", Con);
               Cmd.CommandType = CommandType.StoredProcedure;
               Cmd.Parameters.AddWithValue("@Placa", veiculo.Placa);
               Cmd.Parameters.AddWithValue("@Modelo", veiculo.Modelo);
               Cmd.Parameters.AddWithValue("@Marca", veiculo.Marca);
               Cmd.Parameters.AddWithValue("@Ano", veiculo.Ano);
               Cmd.Parameters.AddWithValue("@Id_Veiculo", veiculo.Id_Veiculo);
               Cmd.ExecuteNonQuery();
           }
           catch (Exception e)
           {
               throw new Exception("Erro: ClienteDal: EditarVeiculo(Veiculo veiculo) => " + e.Message);
           }
           finally
           {
               FecharConexao();
           }
       }

       public void Excluir(int id)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("delete from Tb_Veiculo where Id_Veiculo=@Id_Veiculo", Con);
               Cmd.Parameters.AddWithValue("@Id_Veiculo", id);
               Cmd.ExecuteNonQuery();
           }
           catch (Exception)
           {
               throw;
           }
           finally
           {
               FecharConexao();
           }
       }

       public Veiculo BuscarPorId(int id)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("select c.Nome , * from Tb_Veiculo v inner join Tb_Cliente c on v.FK_Id_Cliente = c.Id_Cliente  where  Id_Veiculo= @Id", Con);
               Cmd.Parameters.AddWithValue("@Id", id);
               Dr = Cmd.ExecuteReader();
               Veiculo v = new Veiculo();
               v.Cliente = new Cliente();
             
               while (Dr.Read())
               {
                   v.Cliente.Nome = Convert.ToString(Dr["Nome"]);
                   v.Id_Veiculo = Convert.ToInt32(Dr["Id_Veiculo"]);
                   v.Placa = Convert.ToString(Dr["Placa"]);
                   v.Modelo = Convert.ToString(Dr["Modelo"]);
                   v.Ano = Convert.ToString(Dr["Ano"]);
                   v.Marca = Convert.ToString(Dr["Marca"]);
                   
               }
               return v;
           }
           catch (Exception e)
           {
               throw new Exception("Erro: VeiculoDal: BuscarPorId() => " + e.Message);
           }
           finally
           {
               FecharConexao();
           }
       }




    }
}
