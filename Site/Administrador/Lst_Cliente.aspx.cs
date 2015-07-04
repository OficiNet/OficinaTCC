﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Connection;
using DAL.Entity;
using DAL.Persistence;
using DAL.Utilidades;

namespace Site.Administrador
{
    public partial class Lst_Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void ListarClientes(object sender, EventArgs e)
        {
            try
            {
                string strWhere = "Nome like '%%'";
                ClienteDal d = new ClienteDal();

                gridClientes.DataSource = d.ListarCliente(strWhere);
                gridClientes.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void gridClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Editar"))
            {
                string idProduto = e.CommandArgument.ToString();
                if (!String.IsNullOrEmpty(idProduto))
                    this.Response.Redirect("Principal.aspx");
            }
        }
    }
}