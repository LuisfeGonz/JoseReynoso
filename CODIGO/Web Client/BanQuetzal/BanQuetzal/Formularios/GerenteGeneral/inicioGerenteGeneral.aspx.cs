using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.GerenteGeneral
{
    public partial class inicioGerenteGeneral : System.Web.UI.Page
    {
        ws.wsBQ ww = new wsBQ();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (HttpContext.Current.Session["usuario"] != null) {

            }
            else {
                Response.Redirect("/Formularios/Inicio/Index.aspx");
            }*/
            string usuario, contra;
            usuario = Session["usuario"].ToString();
            contra = Session["clave"].ToString();
            string[] datos = ww.nombreUsuario(usuario, contra);
            if (datos[0] != null)
            {

                txtusuario.Text = datos[0];
                txtdpi.Text = datos[1];
            }
            else
            {
                txtusuario.Text = "devuelve null";
            }
        }
    }
}