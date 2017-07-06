using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.Cajero
{
    public partial class depositarEfectivo : System.Web.UI.Page
    {
        ws.wsBQ ww = new wsBQ();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (HttpContext.Current.Session["usuario"] != null) {

            }
            else {
                Response.Redirect("/Formularios/Inicio/Index.aspx");
            }*/
            Session["usuario"] = "clau";
            Session["clave"] = "clau";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            long cuenta = long.Parse(txtCuenta.Text);
            double saldoI = ww.saldoCuenta(cuenta);
            double monto = double.Parse(txtMonto.Text);
            double saldo = saldoI + monto;

            long cuiEmpleado = long.Parse(ww.nombreUsuario(Session["usuario"].ToString(), Session["clave"].ToString())[0]);
            int idAgencia = ww.getIDAgencia(cuiEmpleado);

            bool ev = ww.depositarEfectivo(cuenta, monto, saldo, cuiEmpleado, idAgencia);

            if (ev == true)
            {
                lmsg.Text = "Desosito exitoso";
            }
            else {
                lmsg.Text = "Error de transaccion";
            }
        }
    }
}