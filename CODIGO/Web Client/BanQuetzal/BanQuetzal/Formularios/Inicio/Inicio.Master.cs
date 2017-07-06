using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanQuetzal.Formularios.Login
{
    public partial class Inicio : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (e.Item.Value)
            {
                case "operador":
                    Response.Redirect("LoginOperador.aspx");
                    break;
                case "cliente":
                    Response.Redirect("LoginCliente.aspx");
                    break;
            }
        }
    }
}