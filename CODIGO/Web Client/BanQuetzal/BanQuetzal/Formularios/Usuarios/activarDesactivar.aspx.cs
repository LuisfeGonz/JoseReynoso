using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.Usuarios
{
    public partial class activarDesactivar : System.Web.UI.Page
    {
        ws.wsBQ ww = new wsBQ();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (HttpContext.Current.Session["usuario"] != null) {

            }
            else {
                Response.Redirect("/Formularios/Inicio/Index.aspx");
            }*/
            ws.estadosCuenta[] tipoEstado = ww.getEstadoCtaAR();
            if (!IsPostBack) {
                ListItem itemsEstado = new ListItem("--Seleccionar--", "0");
                ddAccion.Items.Add(itemsEstado);

                for (int i=0;i<tipoEstado.Length;i++) {
                    itemsEstado = new ListItem(tipoEstado[i].nombre, tipoEstado[i].id.ToString());
                    ddAccion.Items.Add(itemsEstado);
                }
            }
        }

        protected void cambiar_Click(object sender, EventArgs e)
        {
            try
            {
                bool ms = ww.activarDesactivar(long.Parse(txtCta.Text), long.Parse(txtCliente.Text), int.Parse(ddAccion.SelectedValue));
                if (ms == true)
                {
                    lmsg.Text = "Estado cambiado";
                }
                else {
                    lmsg.Text = "Verifique los datos";
                }
            }
            catch (Exception)
            {
                lmsg.Text = "Verifique los datos";
            }
        }
    }
}