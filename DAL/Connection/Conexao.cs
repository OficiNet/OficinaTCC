using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace DAL.Connection
{
    public class Conexao
    {
        protected SqlCommand Cmd;
        protected SqlConnection Con;
        protected SqlDataReader Dr;
        protected SqlTransaction transaction;


        public void AbrirConexao()
        {
            try
            {
                Con = new SqlConnection(ConfigurationManager.ConnectionStrings["OficiNet"].ConnectionString);
                Con.Open();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void FecharConexao()
        {
            try
            {
                Con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
