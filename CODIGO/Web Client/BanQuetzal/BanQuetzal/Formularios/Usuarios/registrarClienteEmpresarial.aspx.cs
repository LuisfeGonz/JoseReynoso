using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuetzal.Formularios.Usuarios
{
    public partial class registrarClienteEmpresarial : System.Web.UI.Page
    {
        ws.wsBQ ww = new ws.wsBQ();
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
            mclave.Text = ww.crearClienteEmpresa(long.Parse(txtDpi.Text), 
                txtNombre.Text, txtDir.Text, txtUsuario.Text, 2, int.Parse(ide1.Text), 
                nom1.Text, int.Parse(ide2.Text), nom2.Text, int.Parse(ide3.Text), nom3.Text);
        }
    }
}