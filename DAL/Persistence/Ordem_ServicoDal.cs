using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Entity;
using DAL.Persistence;
using DAL.Connection;
using System.Data.SqlClient;
using System.Data;

namespace DAL.Persistence
{
    public class Ordem_ServicoDal : Conexao
    {
        public void SalvarOrdem_Servico(Ordem_Servico os)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("CadOrdemServico", Con);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@Protocolo", os.Protocolo);
                Cmd.Parameters.AddWithValue("@Observacoes", os.Observacoes);
                Cmd.Parameters.AddWithValue("@Valor", os.Valor);
                Cmd.Parameters.AddWithValue("@Id_Cliente", os.Cliente.Id_Cliente);
                Cmd.Parameters.AddWithValue("@Id_Veiculo", os.Veiculo.Id_Veiculo);
                Cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Erro: Ordem_ServicoDal: SalvarOrdem_Servico(Ordem_Servico os) => " + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        public int AddProtocolo()
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("select MAX(Protocolo) as Protocolo from Tb_Ordem_Servico ", Con);
                Dr = Cmd.ExecuteReader();
                int protocolo = 0;
                while (Dr.Read())
                {
                    if (String.IsNullOrEmpty(Convert.ToString(Dr["Protocolo"])))
                    {
                        protocolo = 999;
                    }
                    else
                    {
                        protocolo = Convert.ToInt32(Dr["Protocolo"]);
                    }
                    protocolo++;
                }
                return protocolo;
            }
            catch (Exception e)
            {
                throw new Exception("Erro: Ordem_ServicoDal: AddProtocolo() => " + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        public List<Ordem_Servico> ListarTodos()
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("select * from Tb_Ordem_Servico as os inner join  Tb_Veiculo as v on os.FK_Id_Veiculo = v.Id_Veiculo inner join Tb_Cliente as c on os.FK_Id_Cliente = c.Id_Cliente", Con);
                Dr = Cmd.ExecuteReader();
                List<Ordem_Servico> listaOrdemServico = new List<Ordem_Servico>();
                while (Dr.Read())
                {
                    Ordem_Servico ordem_Servico = new Ordem_Servico();
                    ordem_Servico.Id_Ordem_Servico = Convert.ToInt32(Dr["Id_Ordem_Servico"]);
                    ordem_Servico.Protocolo = Convert.ToInt32(Dr["Protocolo"]);
                    ordem_Servico.DataCadastro = Convert.ToDateTime(Dr["DataCadastro"]);
                    ordem_Servico.Observacoes = Convert.ToString(Dr["Observacoes"]);
                    ordem_Servico.Valor = Convert.ToDecimal(Dr["Valor"]);
                    ordem_Servico.Status = Convert.ToString(Dr["_Status"]);
                    ordem_Servico.Cliente = new Cliente();
                    ordem_Servico.Cliente.Id_Cliente = Convert.ToInt32(Dr["Id_Cliente"]);
                    ordem_Servico.Cliente.Nome = Convert.ToString(Dr["Nome"]);
                    ordem_Servico.Veiculo = new Veiculo();
                    ordem_Servico.Veiculo.Placa = Convert.ToString(Dr["Placa"]);
                    ordem_Servico.Veiculo.Marca = Convert.ToString(Dr["Marca"]);
                    listaOrdemServico.Add(ordem_Servico);
                }
                return listaOrdemServico;
            }
            catch (Exception e)
            {
                throw new Exception("Erro: Ordem_ServicoDal: ListarTodos() => " + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }

        public List<Cliente> ListarClientesOrdemServico()
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("select distinct c.Id_Cliente, c.Nome from Tb_Cliente as c inner join Tb_Veiculo as v on c.Id_Cliente = v.FK_Id_Cliente", Con);
                Dr = Cmd.ExecuteReader();
                List<Cliente> lista = new List<Cliente>();
                while (Dr.Read())
                {
                    Cliente c = new Cliente();
                    c.Id_Cliente = Convert.ToInt32(Dr["Id_Cliente"]);
                    c.Nome = Convert.ToString(Dr["Nome"]);
                    lista.Add(c);
                }
                return lista;
            }
            catch (Exception e)
            {
                throw new Exception("Erro: Ordem_ServicoDal: ListarTodos() => " + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }
    }
}
