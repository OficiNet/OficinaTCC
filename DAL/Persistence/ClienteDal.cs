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

                Cmd.Parameters.AddWithValue("@Numero", c.Endereco.Numero);
                Cmd.Parameters.AddWithValue("@Complemento", c.Endereco.Complemento);
                Cmd.Parameters.AddWithValue("@Bairro", c.Endereco.Bairro);
                Cmd.Parameters.AddWithValue("@Cidade", c.Endereco.Cidade);
                Cmd.Parameters.AddWithValue("@Estado", c.Endereco.Estado);
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
                //Cmd.Parameters.AddWithValue("@Tipo_Pessoa", c.Tipo_Pessoa);
                //Cmd.Parameters.AddWithValue("@CPF", c.CPF);
                //Cmd.Parameters.AddWithValue("@CNPJ", c.CNPJ);
                
                Cmd.Parameters.AddWithValue("@Numero", c.Endereco.Numero);
                Cmd.Parameters.AddWithValue("@Complemento", c.Endereco.Complemento);
                Cmd.Parameters.AddWithValue("@Bairro", c.Endereco.Bairro);
                Cmd.Parameters.AddWithValue("@Cidade", c.Endereco.Cidade);
                Cmd.Parameters.AddWithValue("@Estado", c.Endereco.Estado);
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
        //public List<Cliente> ListarCliente()
        {
            try
            {
                AbrirConexao();
                Cmd = new SqlCommand("select * from Tb_Cliente where " + strWhere, Con);
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



        //public void EditarCliente(Cliente c )
        //{
        //    try
        //    {
        //        AbrirConexao();
        //        Cmd = new SqlCommand("update Tb_Cliente set Nome = @Nome, Telefone= @Telefone, from Tb_Cliente c inner join  Tb_Endereco e on e.FK_Id_Cliente = c.Id_Cliente where  c.Id_Cliente=@Id_Cliente ",Con );
        //        Cmd = new SqlCommand("update Tb_Endereco set Numero='douglas leonardo', Complemento=@Complemento, Bairro=@Bairro, Cidade=@Cidade, Estado=@Estado, Numero = @Numero where FK_Id_Cliente = Id_Cliente", Con);
        //        Cmd.Parameters.AddWithValue("@Nome", c.Nome);
        //        Cmd.Parameters.AddWithValue("@Telefone", c.Telefone);
        //        Cmd.Parameters.AddWithValue("@DataCadastro", c.DataCadastro);
        //        Cmd.Parameters.AddWithValue("@Tipo_Pessoa", c.Tipo_Pessoa);
        //        Cmd.Parameters.AddWithValue("@CPF", c.CPF);
        //        Cmd.Parameters.AddWithValue("@CNPJ", c.CNPJ);
        //        Cmd.Parameters.AddWithValue("@Id_Cliente", c.Id_Cliente);

        //        Cmd.Parameters.AddWithValue("@Complemento", c.Endereco.Complemento);
        //        Cmd.Parameters.AddWithValue("@Bairro", c.Endereco.Bairro);
        //        Cmd.Parameters.AddWithValue("@Cidade", c.Endereco.Cidade);
        //        Cmd.Parameters.AddWithValue("@Estado", c.Endereco.Estado);
        //        Cmd.Parameters.AddWithValue("@Numero", c.Endereco.Numero);


        //        Cmd.ExecuteNonQuery();
        //    }
        //    catch (Exception e)
        //    {
        //        throw new Exception("Erro: ClienteDal: EditarVeiculo(int id) => " + e.Message);
        //    }
        //    finally
        //    {
        //        FecharConexao();
        //    }
        //}


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
                Cmd = new SqlCommand("delete from Tb_Cliente where Id_Cliente=@Id_Cliente", Con);
                Cmd.Parameters.AddWithValue("@Id_Cliente", id);
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
    }
}
