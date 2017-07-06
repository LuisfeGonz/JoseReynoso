<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Inicio/Inicio.Master" AutoEventWireup="true" CodeBehind="LoginCliente.aspx.cs" Inherits="BanQuetzal.Formularios.Inicio.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Bienvenido a BanQuetzal
    </h2>  
    <div>
        <asp:Label ID="msg" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <h4 style="width: 150px; margin-left: 40px">Tipo&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddTipoIngreso" runat="server" AutoPostBack="True">
                <asp:ListItem Value="0">-- Seleccionar --</asp:ListItem>
                <asp:ListItem Value="1">Cliente</asp:ListItem>
                <asp:ListItem Value="2">Empleado</asp:ListItem>
            </asp:DropDownList>
        </h4>
        <h4 style="width: 150px; margin-left: 40px">Usuario<asp:TextBox ID="usuariotxt" runat="server"></asp:TextBox>
        </h4>
        <h4 style="width: 150px; margin-left: 40px">Contraseña<asp:TextBox ID="clavetxt" runat="server" TextMode="Password"></asp:TextBox>
        </h4>
        <p style="width: 150px; margin-left: 40px">
            <asp:Button ID="Button1" runat="server" BorderColor="#99FFCC" Height="26px" Text="INGRESAR" Width="88px" OnClick="Button1_Click" />
        </p>
    </div>
</asp:Content>
