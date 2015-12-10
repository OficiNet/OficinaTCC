using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Persistence;
using DAL.Entity;

namespace Site.Administrador
{
    public partial class Lista_OrdemServico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostarGrid();
                ddlVeiculo.Enabled = false;
            }
        }

        private void carregarOrdemServico()
        {
            try
            {
                Ordem_ServicoDal d = new Ordem_ServicoDal();
                gridOrdemServico.DataSource = d.ListarTodos();
                gridOrdemServico.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void gridOrdemServico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gridOrdemServico.PageIndex = e.NewPageIndex;
                carregarOrdemServico();
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void carregarVeiculos()
        {
            try
            {
                if (ddlClientes.SelectedValue == "0" || ddlClientes.SelectedValue == null || ddlClientes.SelectedValue == "- Selecione -")
                {
                    painelVeiculos.Visible = false;
                }
                else
                {
                    painelVeiculos.Visible = true;
                    ddlVeiculo.Enabled = true;
                    int id = Convert.ToInt32(ddlClientes.SelectedValue);
                    VeiculoDal veiculoDal = new VeiculoDal();
                    ddlVeiculo.DataSource = veiculoDal.ListarVeiculosPorID(id);
                    ddlVeiculo.DataTextField = "Modelo";
                    ddlVeiculo.DataValueField = "Id_Veiculo";
                    ddlVeiculo.DataBind();
                    ddlVeiculo.Items.Insert(0, new ListItem("- Selecione -"));
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnGridAtualizar_Click(object sender, EventArgs e)
        {

            try
            {
                foreach (GridViewRow linha in gridOrdemServico.Rows)
                {
                    Button btnAtualizar = linha.FindControl("btnAtualizar") as Button;
                    Label lblIdCliente = linha.FindControl("lblIdCliente") as Label;
                    if (btnAtualizar.Equals(sender))
                    {
                        int id = Convert.ToInt32(lblIdCliente.Text);
                        Ordem_ServicoDal d = new Ordem_ServicoDal();
                        d.FecharOS(id);
                        carregarOrdemServico();
                       // Response.Redirect("Editar_Cliente.aspx?id=" + id.ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void carregarClientes()
        {
            try
            {
                ClienteDal d = new ClienteDal();
                ddlClientes.DataSource = d.ListarClientesOrdemServico();
                ddlClientes.DataTextField = "Nome"; //texto mostrado no campo
                ddlClientes.DataValueField = "Id_Cliente"; //valor marcado no campo
                ddlClientes.DataBind();
                ddlClientes.Items.Insert(0, new ListItem("- Selecione -"));
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                carregarVeiculos();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnCadastrarOrdemServico_Click(object sender, EventArgs e)
        {
            try
            {
                Ordem_ServicoDal ordem_ServicoDal = new Ordem_ServicoDal();
                int protocolo = ordem_ServicoDal.AddProtocolo();
                Ordem_Servico ordem_Servico = new Ordem_Servico();
                ordem_Servico.Protocolo = protocolo;
                ordem_Servico.Observacoes = txt_Obs.Text;
                ordem_Servico.Valor = Convert.ToDecimal(txtValor.Text);
                ordem_Servico.Cliente = new DAL.Entity.Cliente();
                ordem_Servico.Veiculo = new Veiculo();
                if (ddlClientes.SelectedValue == "- Selecione -" || ddlVeiculo.SelectedValue == "- Selecione -")
                {
                    protocolo = ordem_ServicoDal.AddProtocolo();
                    txt_Protocolo.Text = protocolo.ToString();
                    txt_DataCadastro.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    MostarPainelCadastro();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.info('Selecione o Cliente e o Veiculo.', 'OficiNet')", true);
                }
                else
                {
                    ordem_Servico.Cliente.Id_Cliente = Convert.ToInt32(ddlClientes.SelectedValue);
                    ordem_Servico.Veiculo.Id_Veiculo = Convert.ToInt32(ddlVeiculo.SelectedValue);
                    ordem_ServicoDal.SalvarOrdem_Servico(ordem_Servico);
                    carregarOrdemServico();
                    MostarGrid();
                    painelVeiculos.Visible = false;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "toastr_message", "toastr.success('Ordem de Serviço cadastrada com sucesso.', 'OficiNet')", true);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void NovaOrdemServico_Click(object sender, EventArgs e)
        {
            try
            {
                Ordem_ServicoDal ordem_ServicoDal = new Ordem_ServicoDal();
                int protocolo = ordem_ServicoDal.AddProtocolo();
                txt_Protocolo.Text = protocolo.ToString();
                txt_DataCadastro.Text = DateTime.Now.ToString("dd/MM/yyyy");
                MostarPainelCadastro();
                txtValor.Text = String.Empty;
                txt_Obs.Text = String.Empty;
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void MostarGrid()
        {
            carregarClientes();
            carregarOrdemServico();
            painelCadastro.Visible = false;
            painelGrid.Visible = true;
            btnNovaOrdemServico.Visible = true;
            ddlVeiculo.Enabled = false;
        }

        private void MostarPainelCadastro()
        {
            carregarClientes();
            painelCadastro.Visible = true;
            painelGrid.Visible = false;
            btnNovaOrdemServico.Visible = false;
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            try
            {
                painelGrid.Visible = true;
                painelCadastro.Visible = false;
                btnNovaOrdemServico.Visible = true;
                ddlVeiculo.Enabled = false;
                painelVeiculos.Visible = false;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}