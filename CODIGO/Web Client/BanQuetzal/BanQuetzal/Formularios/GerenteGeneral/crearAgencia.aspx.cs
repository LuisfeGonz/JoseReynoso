using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.GerenteGeneral
{
    public partial class crearAgencia : System.Web.UI.Page
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
                bool a = ww.crearAgencia(int.Parse(txtID.Text), txtNombre.Text, txtDir.Text);
                if (a == true)
                {
                    lmsg.Text = "Agencia registrada exitosamente >D";
                }
            }
            catch (Exception ex)
            {
                lmsg.Text = "Error al registra agencia, verifique los datos  " + ex.ToString();
            }
        }
    }
}