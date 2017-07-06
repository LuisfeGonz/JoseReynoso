<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Usuarios/ServicioCliente.Master" AutoEventWireup="true" CodeBehind="solicitarPrestamo.aspx.cs" Inherits="BanQuetzal.Formularios.Usuarios.solicitarPrestamo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Numero de cuenta"></asp:Label>
    <asp:TextBox ID="txtCuenta" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Monto"></asp:Label>
    <asp:TextBox ID="txtMonto" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Pago"></asp:Label>
    <asp:DropDownList ID="ddPago" runat="server">
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Solicitar" />
</asp:Content>
