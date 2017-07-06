using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.General
{
    public partial class cambiarClaveC : System.Web.UI.Page
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
            if (Session["clave"].ToString() == txtActual.Text)
            {
                if (txtConfirmar.Text == txtNueva.Text)
                {
                    ww.cambiarClave("empleado", Session["usuario"].ToString(), txtNueva.Text, txtActual.Text);
                    Session["clave"] = txtNueva.Text;
                    lMsg.Text = "Clave cambiada exitosamente";
                }
                else
                {
                    lMsg.Text = "Las claves no coinciden";
                }
            }
            else
            {
                lMsg.Text = "Clave incorrecta";
            }
        }
    }
}