using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entity
{
    public class Cliente
    {
        public int Id_Cliente { get; set; }
        public string Nome { get; set; }
        public string Telefone { get; set; }
        public DateTime DataCadastro { get; set; }

        /// <summary>
        /// F => Pessoa Fisica & J => Pessoa Juridica 
        /// </summary>
        public char Tipo_Pessoa { get; set; }
        public string CPF { get; set; }
        public string CNPJ { get; set; }
        public Endereco Endereco { get; set; }
        public List<Veiculo> Veiculos { get; set; }
    }
}
