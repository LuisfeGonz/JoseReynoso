using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuetzal.Formularios.Usuarios
{
    public partial class ServicioCliente : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (e.Item.Value) {
                case "Particular":
                    Response.Redirect("registrarClienteParticular.aspx");
                    break;
                case"Empresarial":
                    Response.Redirect("registrarClienteEmpresarial.aspx");
                    break;
                case "rClave":
                    Response.Redirect("renovarClave.aspx");
                    break;
            }
        }

        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (e.Item.Value) {
                 case "Particular":
                    Response.Redirect("crearCuentaNueva.aspx");
                    break;
                case "Nomina":
                    Response.Redirect("crearCuentaNueva.aspx");
                    break;
                case "crearCta":
                    Response.Redirect("estadoCuenta.aspx");
                    break;
                case "adCuenta":
                    Response.Redirect("activarDesactivar.aspx");
                    break;
                case "solicitarCk":
                    Response.Write("solicitarChequera");
                    break;
            }
        }

        protected void Menu3_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (e.Item.Value) {
                case "cClave":
                    Response.Redirect("/Formularios/General/cambiarClave.aspx");
                    break;
                case "cUsuario":
                    Response.Redirect("/Formularios/General/cambiarUsuario.aspx");
                    break;
            }
        }

        protected void Menu4_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (e.Item.Value) {
                case "sPrestamo":
                    Response.Redirect("solicitarPrestamo.aspx");
                    break;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/Formularios/Inicio/Index.aspx");
        }
    }
}