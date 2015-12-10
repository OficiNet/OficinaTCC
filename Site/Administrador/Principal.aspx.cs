using DAL.Persistence;
using System;

namespace Site.Administrador
{
    public partial class Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarResumo();
            }
        }

        private void CarregarResumo()
        {
            ClienteDal clienteDAL = new ClienteDal();
            VeiculoDal veiculoDAL = new VeiculoDal();
            Ordem_ServicoDal ordem_servicoDAL = new Ordem_ServicoDal();

            lblQtdClientes.Text = clienteDAL.QuantidadeClientes().ToString();
            lblQtdVeiculos.Text = veiculoDAL.QuantidadeVeiculo().ToString();
            lblQtdOS.Text = ordem_servicoDAL.QuantidadeOS().ToString();
            lblDia.Text = DateTime.Now.ToString("dd");
            lblMes.Text = DateTime.Now.ToString("MM");
            lblData.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
    }
}