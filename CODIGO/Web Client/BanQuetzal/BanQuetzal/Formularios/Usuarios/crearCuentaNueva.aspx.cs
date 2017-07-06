using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.Usuarios
{
    public partial class crearCuentaNueva : System.Web.UI.Page
    {
        ws.wsBQ ww = new wsBQ();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (HttpContext.Current.Session["usuario"] != null) {

            }
            else {
                Response.Redirect("/Formularios/Inicio/Index.aspx");
            }*/
            ws.tipoCuenta[] tipoCta = ww.getTipoCuenta();
            ListItem items;
            if (!IsPostBack)
            {
                items = new ListItem("--seleccionar--", "0");
                ddTipoCuenta.Items.Add(items);
                for (int i = 0; i < tipoCta.Length; i++)
                {
                    items = new ListItem(tipoCta[i].nombre, tipoCta[i].id.ToString());
                    ddTipoCuenta.Items.Add(items);
                }
            }
            else {
                Response.Write("No postback");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int tipo = int.Parse(ddTipoCuenta.SelectedValue.ToString());
            noCta.Text = ww.crearCuenta(Double.Parse(txtMontoInicial.Text), tipo, long.Parse(txtCUI.Text));
        }
    }
}