using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.Cajero
{
    public partial class cambiarCheque : System.Web.UI.Page
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

            long cuiEmpleado = long.Parse(ww.nombreUsuario(Session["usuario"].ToString(), Session["clave"].ToString())[0]);
            int idAgencia = ww.getIDAgencia(cuiEmpleado);

            int estadoCheque = ww.getEstadoCheque(long.Parse(txtCuenta.Text), int.Parse(txtCheque.Text));
            if (estadoCheque == 1)
            {
                if (saldoI > monto)
                {
                    double saldo = saldoI - monto;
                    bool cambio = ww.cambiarCheque(saldo, idAgencia, cuiEmpleado, int.Parse(txtCheque.Text), long.Parse(txtCuenta.Text), double.Parse(txtMonto.Text), txtEmisor.Text);
                    if (cambio == true)
                    {
                        lmsg.Text = "Cambio exitoso";
                    }
                    else
                    {
                        lmsg.Text = "Cambio fallido, verifique los datos  " + saldo + " " + saldoI + " " + monto + " " + cuiEmpleado + " " + idAgencia;
                    }

                }
                else
                {
                    double saldo = saldoI - 50;
                    ww.cobrarMulta(long.Parse(txtCuenta.Text), saldo, int.Parse(txtCheque.Text), monto, cuiEmpleado, idAgencia);
                    lmsg.Text = "Fondos insuficientes, se le han debitado Q50.00";
                }
            }
            else if (estadoCheque == 2)
            {
                lmsg.Text = "El cheque ya ha sido cambiado";
            }
            else {
                lmsg.Text = "El cheque ha sido rechazado anteriormente";
            }

            
        }
    }
}