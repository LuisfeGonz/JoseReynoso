using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.Usuarios
{
    public partial class solicitarChequera : System.Web.UI.Page
    {
        ws.wsBQ ww = new wsBQ();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (HttpContext.Current.Session["usuario"] != null) {

            }
            else {
                Response.Redirect("/Formularios/Inicio/Index.aspx");
            }*/
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool a = ww.solicitarChequera(long.Parse(txtCuenta.Text), long.Parse(txtCUI.Text), int.Parse(txtTal.Text));
            if (a == true)
            {
                lmsg.Text = "Chequera lista";
            }
            else {
                lmsg.Text = "Error";
            }
        }
    }
}