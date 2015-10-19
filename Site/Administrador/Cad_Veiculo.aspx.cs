using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Entity;
using DAL.Persistence;

namespace Site.Administrador
{
    public partial class Cad_Veiculo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carregarClientes();
                carregarVeiculos();
                painelCadastro.Visible = false;
            }
        }

        private void carregarVeiculos()
        {
            try
            {
                VeiculoDal d = new VeiculoDal();
                gridVeiculos.DataSource = d.ListarVeiculos();
                gridVeiculos.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }
        private void carregarClientes()
        {
            try
            {
                ClienteDal d = new ClienteDal();
                ddlClientes.DataSource =  d.ListarTodos();
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

        protected void gridVeiculos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gridVeiculos.PageIndex = e.NewPageIndex;
                carregarVeiculos();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void Excluir_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow linha in gridVeiculos.Rows)
                {
                    Button btnExcluirCampo = linha.FindControl("btnExcuirCampo") as Button;
                    Label lblIdVeiculo = linha.FindControl("lblIdVeiculo") as Label;
                    if (btnExcluirCampo.Equals(sender))
                    {
                        int id = Convert.ToInt32(lblIdVeiculo.Text);
                        VeiculoDal d = new VeiculoDal();
                        d.Excluir(id);
                    }
                }
                carregarVeiculos();
                lblResp.Text = " Excluido Com Sucesso ";
            }
            catch (Exception ex)
            {
                lblResp.Text = " Erro ao Excluir Veiculo " + ex.InnerException;
            }
        }

        protected void btn_Cadastrar_Veiculo_Click(object sender, EventArgs e)
        {
            try
            {
                DAL.Entity.Veiculo v = new DAL.Entity.Veiculo();
                v.Marca = txt_Marca.Text;
                v.Modelo = txt_Modelo.Text;
                v.Placa = txt_Placa.Text;
                v.Ano = txt_Ano.Text;
                v.Cliente = new DAL.Entity.Cliente();
                v.Cliente.Id_Cliente = Convert.ToInt32(ddlClientes.SelectedValue);

                VeiculoDal d = new VeiculoDal();
                d.SalvarVeiculo(v);

                carregarVeiculos();


                painelCadastro.Visible = false;
                painelGrid.Visible = true;
                

                lblResp.Text = "Veiculo cadastrado com sucesso.";
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btn_Editar_Veiculo_Click(object sender, EventArgs e)
        {
            try
            {
                VeiculoDal d = new VeiculoDal();
                Veiculo v = new Veiculo();
                v.Id_Veiculo = Convert.ToInt32(txt_Id_Veiculo.Text);
                v.Marca = txt_Marca.Text;
                v.Modelo = txt_Modelo.Text;
                v.Placa = txt_Placa.Text;
                v.Ano = txt_Ano.Text;
                d.EditarVeiculo(v);
                lblResp.Text = "Editado com sucesso";

                painelCadastro.Visible = false;
                painelGrid.Visible = true;
                carregarVeiculos();
            }
            catch (Exception ex)
            {
                lblResp.Text = " Erro ao carregar tela de atualizar" + ex.Message;
            }
        }

        protected void btnGridAtualizar_Click(object sender, EventArgs e)
        {
            try
            {
                painelCadastro.Visible = true;
                painelGrid.Visible = false;
                btn_Cadastrar_Veiculo.Visible = false;
                btn_Editar_Veiculo.Visible = true;

                int id = 0;
                foreach (GridViewRow linha in gridVeiculos.Rows)
                {
                    Button btnAtualizar = linha.FindControl("btnAtualizar") as Button;
                    Label lblIdVeiculo = linha.FindControl("lblIdVeiculo") as Label;
                    if (btnAtualizar.Equals(sender))
                    {
                        id = Convert.ToInt32(lblIdVeiculo.Text);
                    }
                }

                VeiculoDal d = new VeiculoDal();
                Veiculo v = d.BuscarPorId(id);
                txt_Marca.Text = v.Marca;
                txt_Modelo.Text = v.Modelo;
                txt_Placa.Text = v.Placa  ;
                txt_Ano.Text = v.Ano;
                txt_Id_Veiculo.Text = Convert.ToString(id);
            }
            catch (Exception ex)
            {

                lblResp.Text = " Erro ao carregar tela de atualizar" + ex.Message;
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            try
            {
                lblResp.Text = string.Empty;
                painelGrid.Visible = true;
                painelCadastro.Visible = false;
            }
            catch (Exception)
            { 
                throw;
            }
        }

        protected void btnNovoVeiculo_Click(object sender, EventArgs e)
        {
            try
            {
                lblResp.Text = string.Empty;
                txt_Ano.Text = string.Empty;
                txt_Marca.Text = string.Empty;
                txt_Placa.Text = string.Empty;
                txt_Placa.Text = string.Empty;
                txt_Modelo.Text = string.Empty;
                btn_Cadastrar_Veiculo.Visible = true;
                btn_Editar_Veiculo.Visible = false;

                painelGrid.Visible = false;
                painelCadastro.Visible = true;
            }
            catch (Exception ex)
            {

                lblResp.Text = ex.InnerException.ToString();
            }
        }

    }
}