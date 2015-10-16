using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entity
{
   public class Veiculo
    {
        public int Id_Veiculo { get; set; }
        public string Placa { get; set; }
        public string Modelo { get; set; }
        public string Ano { get; set; }
        public string Marca { get; set; }

        public Cliente Cliente { get; set; }
       
    }
}
