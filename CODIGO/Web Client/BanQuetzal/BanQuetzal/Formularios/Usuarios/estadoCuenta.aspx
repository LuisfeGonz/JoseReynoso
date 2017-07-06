<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Usuarios/ServicioCliente.Master" AutoEventWireup="true" CodeBehind="estadoCuenta.aspx.cs" Inherits="BanQuetzal.Formularios.Usuarios.estadoCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Numero de cuenta"></asp:Label>
<asp:TextBox ID="txtCuenta" runat="server" Width="350px"></asp:TextBox>
<br />
<asp:Label ID="Label2" runat="server" Text="Desde"></asp:Label>
&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtDesde" runat="server" TextMode="Date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label3" runat="server" Text="Hasta"></asp:Label>
&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtHasta" runat="server" TextMode="Date"></asp:TextBox>
<br />
<br />
<asp:Button ID="Mostrar" runat="server" OnClick="Mostrar_Click" Text="Mostrar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
<br />
<asp:Label ID="lmsg" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:GridView ID="tabla1" runat="server">
    </asp:GridView>
</asp:Content>
