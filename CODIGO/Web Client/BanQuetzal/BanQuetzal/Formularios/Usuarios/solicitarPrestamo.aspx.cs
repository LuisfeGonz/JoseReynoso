using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.Usuarios
{
    public partial class solicitarPrestamo : System.Web.UI.Page
    {
        ws.wsBQ ww = new wsBQ();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (HttpContext.Current.Session["usuario"] != null) {

            }
            else {
                Response.Redirect("/Formularios/Inicio/Index.aspx");
            }*/
            ws.tipoPago[] tipoPago = ww.getTipoPago();
            if (!IsPostBack) {
                ListItem items;
                items = new ListItem("--Seleccionar--", "0");
                for (int i =0; i<tipoPago.Length; i++) {
                    items = new ListItem(tipoPago[i].nombre, tipoPago[i].id.ToString());
                    ddPago.Items.Add(items);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ww.Prestamo(double.Parse(txtMonto.Text), int.Parse(ddPago.SelectedValue), 2, long.Parse(txtCuenta.Text));
        }
    }
}