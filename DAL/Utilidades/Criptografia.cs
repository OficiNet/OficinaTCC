using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace DAL.Utilidades
{
   public static class Criptografia
    {
       public static string Encriptar(string senha)
       {
           try
           {
               MD5 md5 = new MD5CryptoServiceProvider();
               md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(senha));
               byte[] texto = md5.Hash;
               StringBuilder resultado = new StringBuilder();
               for (int i = 0; i < texto.Length; i++)
               {
                   //de binario para hexadecimal
                   resultado.Append(texto[i].ToString("x"));
               }
               return resultado.ToString();
           }
           catch (Exception e)
           {
               throw new Exception("Erro: Criptografia: Encriptar => "+e.Message);
           }
       }
    }
}
