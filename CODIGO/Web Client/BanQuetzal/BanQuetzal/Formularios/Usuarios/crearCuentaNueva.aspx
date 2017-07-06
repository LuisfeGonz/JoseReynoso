<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Usuarios/ServicioCliente.Master" AutoEventWireup="true" CodeBehind="crearCuentaNueva.aspx.cs" Inherits="BanQuetzal.Formularios.Usuarios.crearCuentaNueva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Tipo Cuenta"></asp:Label>
        <asp:DropDownList ID="ddTipoCuenta" runat="server" AutoPostBack="True">
        </asp:DropDownList>

        <asp:Label ID="Label2" runat="server" Text="CUI Cliente"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:TextBox ID="txtCUI" runat="server" ForeColor="Black" Width="180px"></asp:TextBox>

        <br />

        <br />
        <asp:Label ID="Label3" runat="server" Text="Saldo Inicial"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtMontoInicial" runat="server" Width="180px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Numero de Cuenta"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="noCta" runat="server"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Crear Cuenta" />

    </div>
</asp:Content>
