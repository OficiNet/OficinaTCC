﻿using System;
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
                Cmd = new SqlCommand("select Id_Ordem_Servico, Protocolo from Tb_Ordem_Servico", Con);
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
                        protocolo =+ Convert.ToInt32(Dr["Id_Ordem_Servico"]) + 1000;
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
                Cmd = new SqlCommand("select *,os._Status as Status from Tb_Ordem_Servico as os inner join  Tb_Veiculo as v on os.FK_Id_Veiculo = v.Id_Veiculo inner join Tb_Cliente as c on os.FK_Id_Cliente = c.Id_Cliente", Con);
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
                    ordem_Servico.Veiculo.Modelo = Convert.ToString(Dr["Modelo"]);
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

        public List<Ordem_Servico> ListarOrdemServicoPorCpf_Cnpj(string cpf_cnpj)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("select os.Protocolo, c.Nome, os.Observacoes, os.Valor, v.Modelo, v.Placa, os._Status as Status  from Tb_Ordem_Servico as os inner join Tb_Cliente as c on c.Id_Cliente = os.FK_Id_Cliente inner join Tb_Veiculo as v on os.FK_Id_Veiculo = v.Id_Veiculo where c.CPF =@cpf_cnpj or c.CNPJ=@cpf_cnpj", Con);
                Cmd.Parameters.AddWithValue("@cpf_cnpj", cpf_cnpj);
                Dr = Cmd.ExecuteReader();
                List<Ordem_Servico> listaOrdemServico = new List<Ordem_Servico>();
                while (Dr.Read())
                {
                    Ordem_Servico ordem_Servico = new Ordem_Servico();
                    ordem_Servico.Protocolo = Convert.ToInt32(Dr["Protocolo"]);
                    ordem_Servico.Cliente = new Cliente();
                    ordem_Servico.Cliente.Nome = Convert.ToString(Dr["Nome"]);
                    ordem_Servico.Observacoes = Convert.ToString(Dr["Observacoes"]);
                    ordem_Servico.Valor = Convert.ToDecimal(Dr["Valor"]);
                    ordem_Servico.Veiculo = new Veiculo();
                    ordem_Servico.Veiculo.Modelo = Convert.ToString(Dr["Modelo"]);
                    ordem_Servico.Veiculo.Placa = Convert.ToString(Dr["Placa"]);
                    ordem_Servico.Status = Convert.ToString(Dr["Status"]);
                    ordem_Servico.Veiculo.Placa = Convert.ToString(Dr["Placa"]);
                   
                    listaOrdemServico.Add(ordem_Servico);
                }
                return listaOrdemServico;
            }
            catch (Exception e)
            {
                throw new Exception("Erro: Ordem_ServicoDal: ListarOrdemServicoPorCpf_Cnpj(string cpf, string cnpj) => " + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }


        public bool ExisteOrdemServico(int idVeiculo)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("select os.Protocolo from Tb_Ordem_Servico as os inner join Tb_Veiculo as v on os.FK_Id_Veiculo = v.Id_Veiculo where v.Id_Veiculo = @idVeiculo", Con);
                Cmd.Parameters.AddWithValue("@idVeiculo", idVeiculo);
                Dr = Cmd.ExecuteReader();
                List<Ordem_Servico> listaOrdemServico = new List<Ordem_Servico>();
                while (Dr.Read())
                {
                    Ordem_Servico ordem_Servico = new Ordem_Servico();
                    ordem_Servico.Protocolo = Convert.ToInt32(Dr["Protocolo"]);
                    listaOrdemServico.Add(ordem_Servico);
                }
                if (listaOrdemServico.Count == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                
            }
            catch (Exception e)
            {
                throw new Exception("Erro: Ordem_ServicoDal: ListarOrdemServicoPorCpf_Cnpj(string cpf, string cnpj) => " + e.Message);
            }
            finally
            {
                FecharConexao();
            }
        }


    }
}
