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
    public class ClienteDal : Conexao
    {
        public void SalvarCliente(Cliente c)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("CadCliente", Con);
                Cmd.CommandType = CommandType.StoredProcedure;
                //indico que será executado uma procedure
                Cmd.Parameters.AddWithValue("@Nome", c.Nome);
                Cmd.Parameters.AddWithValue("@Telefone", c.Telefone);
                Cmd.Parameters.AddWithValue("@DataCadastro", c.DataCadastro);
                Cmd.Parameters.AddWithValue("@Tipo_Pessoa", c.Tipo_Pessoa);
                Cmd.Parameters.AddWithValue("@CPF", c.CPF);
                Cmd.Parameters.AddWithValue("@CNPJ", c.CNPJ);
                Cmd.Parameters.AddWithValue("@Sexo", c.Sexo);
                Cmd.Parameters.AddWithValue("@Numero", c.Endereco.Numero);
                Cmd.Parameters.AddWithValue("@Complemento", c.Endereco.Complemento);
                Cmd.Parameters.AddWithValue("@Bairro", c.Endereco.Bairro);
                Cmd.Parameters.AddWithValue("@Cidade", c.Endereco.Cidade);
                Cmd.Parameters.AddWithValue("@Estado", c.Endereco.Estado);
                Cmd.Parameters.AddWithValue("@Logradouro", c.Endereco.Logradouro);
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

        public void EditarCliente(Cliente c)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("EditarCliente", Con);
                Cmd.CommandType = CommandType.StoredProcedure;
                //indico que será executado uma procedure
                Cmd.Parameters.AddWithValue("@Nome", c.Nome);
                Cmd.Parameters.AddWithValue("@Telefone", c.Telefone);
                Cmd.Parameters.AddWithValue("@DataCadastro", c.DataCadastro);
                Cmd.Parameters.AddWithValue("@Sexo", c.Sexo);
                //Cmd.Parameters.AddWithValue("@Tipo_Pessoa", c.Tipo_Pessoa);
                //Cmd.Parameters.AddWithValue("@CPF", c.CPF);
                //Cmd.Parameters.AddWithValue("@CNPJ", c.CNPJ);
                Cmd.Parameters.AddWithValue("@Numero", c.Endereco.Numero);
                Cmd.Parameters.AddWithValue("@Complemento", c.Endereco.Complemento);
                Cmd.Parameters.AddWithValue("@Bairro", c.Endereco.Bairro);
                Cmd.Parameters.AddWithValue("@Cidade", c.Endereco.Cidade);
                Cmd.Parameters.AddWithValue("@Estado", c.Endereco.Estado);
                Cmd.Parameters.AddWithValue("@Logradouro", c.Endereco.Logradouro);
                Cmd.Parameters.AddWithValue("@Id_Cliente", c.Id_Cliente);
                Cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Erro: ClienteDal: EditarCliente(Cliente c) => " + e.Message);
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
                Cmd = new SqlCommand("select * from Tb_Cliente as c inner join Tb_Endereco as e on c.Id_Cliente = e.FK_Id_Cliente  where " + strWhere, Con);
                //Cmd = new SqlCommand("select * from Tb_Cliente where ", Con);
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
                    c.Endereco = new Endereco();
                    c.Endereco.Bairro = Convert.ToString(Dr["Bairro"]);
                    c.Endereco.Cidade = Convert.ToString(Dr["Cidade"]);
                    c.Endereco.Estado = Convert.ToString(Dr["Estado"]);
                    c.Endereco.Complemento = Convert.ToString(Dr["Complemento"]);
                    c.Endereco.Numero = Convert.ToString(Dr["Numero"]);
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

       public List<Cliente> ListarTodos()
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("select * from Tb_Cliente as c inner join Tb_Endereco as e on c.Id_Cliente = e.FK_Id_Cliente order by DataCadastro desc", Con);
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
                   c.Endereco = new Endereco();
                   c.Endereco.Bairro = Convert.ToString(Dr["Bairro"]);
                   c.Endereco.Cidade = Convert.ToString(Dr["Cidade"]);
                   c.Endereco.Estado = Convert.ToString(Dr["Estado"]);
                   c.Endereco.Complemento = Convert.ToString(Dr["Complemento"]);
                   c.Endereco.Numero = Convert.ToString(Dr["Numero"]);
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

       public List<Cliente> ListarClientesPossueVeiculo( string nome)
       {
           try
           {
               AbrirConexao();
               Cmd = new SqlCommand("SELECT c.Id_Cliente , c.Nome  FROM Tb_Cliente c  order by  Case When @Nome <> c.Nome Then  c.Nome Else '' End", Con);
               Cmd.Parameters.AddWithValue("@Nome", nome);
               Dr = Cmd.ExecuteReader();
               List<Cliente> listaCliente = new List<Cliente>();
               while (Dr.Read())
               {
                   Cliente c = new Cliente();
                   c.Id_Cliente = Convert.ToInt32(Dr["Id_Cliente"]);
                   c.Nome = Convert.ToString(Dr["Nome"]);
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

        public Cliente BuscarPorId(int id)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("select * from Tb_Cliente c inner join Tb_Endereco e on e.FK_Id_Cliente = c.Id_Cliente where  Id_Cliente= @Id", Con);
                Cmd.Parameters.AddWithValue("@Id",id);
                Dr = Cmd.ExecuteReader();
                Cliente c = new Cliente();
                c.Endereco = new Endereco();
                while (Dr.Read())
                {
                    c.Id_Cliente = Convert.ToInt32(Dr["Id_Cliente"]);
                    c.Nome = Convert.ToString(Dr["Nome"]);
                    c.Sexo = Convert.ToString(Dr["Sexo"]);
                    c.Telefone = Convert.ToString(Dr["Telefone"]);
                    c.DataCadastro = Convert.ToDateTime(Dr["DataCadastro"]);
                    c.Tipo_Pessoa = Convert.ToChar(Dr["Tipo_Pessoa"]);
                    c.CPF = Convert.ToString(Dr["CPF"]);
                    c.CNPJ = Convert.ToString(Dr["CNPJ"]);
                    c.Endereco.Complemento = Convert.ToString(Dr["Complemento"]);
                    c.Endereco.Numero = Convert.ToString(Dr["Numero"]);
                    c.Endereco.Complemento = Convert.ToString(Dr["Complemento"]);
                    c.Endereco.Bairro = Convert.ToString(Dr["Bairro"]);
                    c.Endereco.Cidade = Convert.ToString(Dr["Cidade"]);
                    c.Endereco.Estado = Convert.ToString(Dr["Estado"]);
                    c.Endereco.Logradouro = Convert.ToString(Dr["Logradouro"]);
                }
                return c;
            }
            catch (Exception e)
            {
                throw new Exception("Erro: ClienteDal: BuscarPorId() => " + e.Message);
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
                Cmd = new SqlCommand("Deletar", Con);
                Cmd.CommandType = CommandType.StoredProcedure;
                //indico que será executado uma procedure
                Cmd.Parameters.AddWithValue("@IdCliente", id);
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

        public bool Verificar_Cpf_Cnpj(string cpf_cnpj)
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("select c.CNPJ, c.CPF from Tb_Cliente c where c.CNPJ = @cpf_cnpj or c.CPF = @cpf_cnpj", Con);
                //Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@cpf_cnpj", cpf_cnpj);
                Dr = Cmd.ExecuteReader();
                List<Cliente> lista = new List<Cliente>();
                 while (Dr.Read())
                 {
                     Cliente c = new Cliente();
                     c.CPF = Convert.ToString(Dr["CPF"]);
                     c.CNPJ = Convert.ToString(Dr["CNPJ"]);
                     lista.Add(c);
                 }
                 if (lista.Count == 0)
                 {
                     return true;
                 }
                else
                 {
                     return false;
                 }
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

        public int QuantidadeClientes()
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("SELECT COUNT(c.Id_Cliente) AS qtd FROM Tb_Cliente AS c", Con);
                int qtdClientes = 0;
                Dr = Cmd.ExecuteReader();
                while (Dr.Read())
                {
                    qtdClientes = Convert.ToInt32(Dr["qtd"]);
                }
                return qtdClientes;

            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
