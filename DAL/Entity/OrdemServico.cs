using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entity
{
   public class OrdemServico
    {
        public int Id_OrdemServico { get; set; }
        public string Id_Protocolo { get; set; }
        public string Observacao { get; set; }
        public DateTime DataCadastro { get; set; }
        public char Status { get; set; }
    }
}
