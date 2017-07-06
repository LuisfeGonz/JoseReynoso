using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.Inicio
{
    public partial class Login : System.Web.UI.Page
    {
        ws.wsBQ ww = new wsBQ();
        ListItem it;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                it = new ListItem("--Seleccionar--", "0");
                ddTipoIngreso.Items.Add(it);
                ws.tipoCliente[] tipoCliente = ww.getTipoCliente();
                for (int i = 0; i < tipoCliente.Length; i++)
                {
                    it = new ListItem(tipoCliente[i].nombre, tipoCliente[i].id.ToString());
                    ddTipoIngreso.Items.Add(it);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string usuario, clave;
            usuario = usuariotxt.Text;
            clave = clavetxt.Text;
            int rol = int.Parse(ddTipoIngreso.SelectedValue);

            if (ww.loginCliente(usuario, clave, rol) == true)
            {
                Session["usuario"] = usuario;
                Session["clave"] = clave;
                switch (rol)
                {
                    case 1:
                        Response.Redirect("/Formularios/Usuarios/clienteParticular.aspx");
                        break;
                    case 2:
                        Response.Redirect("/Formularios/Usuarios/clienteEmpresarial.aspx");
                        break;
                }
            }
            else {
                msg.Text = "Usuario o calve incorrecta";
            }

        }

        public bool entrar() {
            if (HttpContext.Current.Session["clave"] != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


    }
}