using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL.Entity
{
   public class Ordem_Servico
    {
        public int Id_Ordem_Servico { get; set; }
        public int Protocolo { get; set; }
        public DateTime DataCadastro { get; set; }
        public string Observacoes { get; set; }
        public decimal Valor { get; set; }
        public string Status { get; set; }
        public Cliente  Cliente { get; set; }
        public Veiculo Veiculo { get; set; }
    }
}
