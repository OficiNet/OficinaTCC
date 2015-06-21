using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Entity;
using DAL.Connection;
using System.Data.SqlClient;

namespace DAL.Persistence
{
   public class VeiculoDal : Conexao
    {
       public void SalvarVeiculo(Veiculo v)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("INSERT INTO Tb_Veiculo (Placa, Modelo, Ano, Marca) VALUES(@Placa, @Modelo, @Ano, @Marca)", Con);
               Cmd.Parameters.AddWithValue("@Placa", v.Placa);
               Cmd.Parameters.AddWithValue("@Modelo", v.Modelo);
               Cmd.Parameters.AddWithValue("@Ano", v.Ano);
               Cmd.Parameters.AddWithValue("@Marca", v.Marca);
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

       public List<Veiculo> ListarVeiculo()
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("select * from Tb_Veiculo ", Con);
               Dr = Cmd.ExecuteReader();
               List<Veiculo> listaVeiculo = new List<Veiculo>();
               while (Dr.Read())
               {
                   Veiculo v = new Veiculo();
                   v.Id_Veiculo = Convert.ToInt32(Dr["Id_Veiculo"]);
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

       public void EditarVeiculo(Veiculo v)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("update Tb_Veiculo set Placa = @Placa, Modelo = @Modelo, Ano = @Ano, Marca = @Marca where Id_Veiculo = @Id_Veiculo ", Con);
               Cmd.Parameters.AddWithValue("@Placa",v.Placa);
               Cmd.Parameters.AddWithValue("@Modelo", v.Modelo);
               Cmd.Parameters.AddWithValue("@Ano", v.Ano);
               Cmd.Parameters.AddWithValue("@Marca", v.Marca);
               Cmd.Parameters.AddWithValue("@Id_Veiculo", v.Id_Veiculo);
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
