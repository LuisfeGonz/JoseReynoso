using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuetzal.Formularios.Usuarios
{
    public partial class registrarClienteParticular : System.Web.UI.Page
    {
        ws.wsBQ ww = new ws.wsBQ();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (HttpContext.Current.Session["usuario"] != null) {

            }
            else {
                Response.Redirect("/Formularios/Inicio/Index.aspx");
            }*/
            /*ws.tipoCliente[] tipoCta = ww.getTipoCliente();
            ListItem items;
            if (!IsPostBack)
            {
                items = new ListItem("--seleccionar--", "0");
                ddTipoCliente.Items.Add(items);
                for (int i = 0; i < tipoCta.Length; i++)
                {
                    items = new ListItem(tipoCta[i].nombre, tipoCta[i].id.ToString());
                    ddTipoCliente.Items.Add(items);
                }
            }*/
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            mclave.Text = ww.crearClienteParticular(long.Parse(txtDpi.Text), txtNombre.Text, 
                txtFechaNac.Text, txtDir.Text, txtUsuario.Text, 1);
            

        }
    }
}