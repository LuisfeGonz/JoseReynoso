using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanQuetzal.ws;

namespace BanQuetzal.Formularios.GerenteGeneral
{
    public partial class crearEmpleado : System.Web.UI.Page
    {
        ws.wsBQ ww = new wsBQ();
        ListItem itemTipo = new ListItem("--Seleccionar", "0");
        ListItem itemAgencia = new ListItem("--Seleccionar", "0");
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (HttpContext.Current.Session["usuario"] != null) {

            }
            else {
                Response.Redirect("/Formularios/Inicio/Index.aspx");
            }*/
            ws.tipoEmpleado[] tipoEmpleado = ww.getTipoEmpleado();
            ws.agencia[] agencia = ww.getAgencia();
            if (!IsPostBack) {
                ddTipo.Items.Add(itemTipo);
                ddAgencia.Items.Add(itemAgencia);
                
                for (int i = 2; i<tipoEmpleado.Length; i++) {
                    itemTipo = new ListItem(tipoEmpleado[i].nombre,tipoEmpleado[i].id.ToString());
                    ddTipo.Items.Add(itemTipo);
                }

                for (int x = 0; x < agencia.Length; x++) {
                    itemAgencia = new ListItem(agencia[x].nombre, agencia[x].id.ToString());
                    ddAgencia.Items.Add(itemAgencia);
                }
            }
        }

        protected void ddAgencia_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtAgencia.Text = ddAgencia.SelectedValue;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (int.Parse(ddTipo.SelectedValue) == 3)
            {
                try
                {
                    txtClave.Text = ww.crearGerente(long.Parse(txtCUI.Text), txtNombre.Text, txtDir.Text, txtUsuario.Text, int.Parse(ddTipo.SelectedValue), int.Parse(txtAgencia.Text));
                    lmsg.Text = "Registro realizado";
                }
                catch (Exception ex)
                {

                    lmsg.Text = "No se pudo registrar" +ex.ToString();
                } 
            }
            else {
                try {
                    if (ww.perteneceAgencia(long.Parse(txtSuperior.Text)) == int.Parse(txtAgencia.Text)) {
                        txtClave.Text = ww.crearEmpleado(long.Parse(txtCUI.Text), txtNombre.Text, txtDir.Text, txtUsuario.Text, long.Parse(txtSuperior.Text), int.Parse(ddTipo.SelectedValue), int.Parse(txtAgencia.Text));
                        lmsg.Text = "Personal registrado";
                    }
                    else
                    {
                        lmsg.Text = "No se pudo registrar, el gerente no pertenece a la misma agencia";
                    }
                    
                }
                catch (Exception ex)
                {

                    lmsg.Text = "No se pudo registrar error: "+ex.ToString();
                }
                
            }
        }

        protected void ddTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.Parse(ddTipo.SelectedValue) == 3) {
                txtSuperior.Enabled = false;
            }else
            {
                txtSuperior.Enabled = true;
            }
        }
    }
}