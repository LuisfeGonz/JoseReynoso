using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.Cajero
{
    public partial class depositarCheque : System.Web.UI.Page
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
            long cuenta = long.Parse(txtCuentaE.Text);
            double saldoI = ww.saldoCuenta(cuenta);
            double monto = double.Parse(txtMonto.Text);

            long cuiEmpleado = long.Parse(ww.nombreUsuario(Session["usuario"].ToString(), Session["clave"].ToString())[0]);
            int idAgencia = ww.getIDAgencia(cuiEmpleado);

            int estadoCheque = ww.getEstadoCheque(long.Parse(txtCuentaE.Text), int.Parse(txtCheque.Text));
            if (estadoCheque == 1)
            {
                if (saldoI > monto)
                {
                    double saldo = saldoI - monto;
                    bool cambio = ww.depositarCambioCheque(saldo, idAgencia, cuiEmpleado, int.Parse(txtCheque.Text), long.Parse(txtCuentaE.Text), double.Parse(txtMonto.Text), txtEmisor.Text);
                    if (cambio == true)
                    {
                        long cuentaR = long.Parse(txtCuentaR.Text);
                        double saldoIR = ww.saldoCuenta(cuentaR);
                        double saldoR = saldoIR + monto;

                        bool ev = ww.depositarCheque(cuentaR, monto, saldoR, cuiEmpleado, idAgencia);

                        if (ev == true)
                        {
                            lmsg.Text = "Desosito exitoso";
                        }
                        else
                        {
                            lmsg.Text = "Error de transaccion";
                        }
                    }
                    else
                    {
                        lmsg.Text = "Cambio fallido, verifique los datos  " + saldo + " " + saldoI + " " + monto + " " + cuiEmpleado + " " + idAgencia;
                    }

                }
                else
                {
                    double saldo = saldoI - 50;
                    ww.cobrarMulta(long.Parse(txtCuentaE.Text), saldo, int.Parse(txtCheque.Text), monto, cuiEmpleado, idAgencia);
                    lmsg.Text = "Fondos insuficientes, se le han debitado Q50.00";
                }
            }
            else if (estadoCheque == 2)
            {
                lmsg.Text = "El cheque ya ha sido cambiado";
            }
            else
            {
                lmsg.Text = "El cheque ha sido rechazado anteriormente";
            }
        }
    }
}