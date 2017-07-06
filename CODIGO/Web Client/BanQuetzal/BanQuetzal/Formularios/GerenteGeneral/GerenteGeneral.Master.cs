using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuetzal.Formularios.Gerente
{
    public partial class GerenteGeneral : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (e.Item.Value) {
                case "agencia":
                    Response.Redirect("crearAgencia.aspx");
                    break;
                case "personal":
                    Response.Redirect("crearEmpleado.aspx");
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