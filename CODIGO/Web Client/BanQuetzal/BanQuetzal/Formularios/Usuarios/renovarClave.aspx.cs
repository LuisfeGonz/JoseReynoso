using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.Usuarios
{
    public partial class renovarClave : System.Web.UI.Page
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
            try
            {
                string c = ww.recuperarClave("cliente","Cliente", txtUsuario.Text, long.Parse(txtCUI.Text));
                if (c != null || c != ""|| c!=" ")
                {
                    clave.Text = c;
                }
                else {
                    lmsg.Text = "Los datos no coinciden";
                }
                    
            }
            catch (Exception)
            {
                lmsg.Text = "Los datos no coinciden";
            }
        }
    }
}