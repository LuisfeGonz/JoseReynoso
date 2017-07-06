using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.Inicio
{
    public partial class LoginOperador : System.Web.UI.Page
    {
        ws.wsBQ ww = new wsBQ();
        ListItem it;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ws.tipoEmpleado[] tipoEmpleado = ww.getTipoEmpleado();

                it = new ListItem("--Seleccionar--", "0");
                ddTipoIngreso.Items.Add(it);
                for (int i = 0; i < tipoEmpleado.Length; i++)
                {
                    it = new ListItem(tipoEmpleado[i].nombre, tipoEmpleado[i].id.ToString());
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

            if (ww.loginEmpleado(usuario, clave, rol) == true)
            {
                Session["usuario"] = usuario;
                Session["clave"] = clave;
                switch (rol)
                {
                    case 1:
                        Response.Redirect("/Formularios/Usuarios/InicioDirectivos.aspx");
                        break;
                    case 2:
                        Response.Redirect("/Formularios/GerenteGeneral/inicioGerenteGeneral.aspx");
                        break;
                    case 3:
                        Response.Redirect("/Formularios/Gerente/inicioGerenteAgencia.aspx");
                        break;
                    case 4:
                        Response.Redirect("/Formularios/Usuarios/InicioServicio.aspx");
                        break;
                    case 5:
                        Response.Redirect("/Formularios/Cajero/inicioCajero.aspx");
                        break;
                }
            }
            else
            {
                msg.Text = "Usuario o calve incorrecta";
            }
        }
    }
}