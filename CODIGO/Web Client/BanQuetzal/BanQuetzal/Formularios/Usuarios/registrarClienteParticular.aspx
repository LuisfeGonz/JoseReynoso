<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Usuarios/ServicioCliente.Master" AutoEventWireup="true" CodeBehind="registrarClienteParticular.aspx.cs" Inherits="BanQuetzal.Formularios.Usuarios.registrarClienteParticular" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Label ID="Label2" runat="server" Text="CUI "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtDpi" runat="server" Width="200px"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Nombre Completo"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtNombre" runat="server" Width="200px"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label4" runat="server" Text="Fecha de nacimiento"></asp:Label>
&nbsp;&nbsp;
<asp:TextBox ID="txtFechaNac" runat="server" style="margin-left: 0px" Width="200px"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label5" runat="server" Text="Direccion"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtDir" runat="server" Width="200px"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label6" runat="server" Text="Usuario"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtUsuario" runat="server" Width="201px"></asp:TextBox>
<br />
<br />
<br />
<asp:Label ID="Label7" runat="server" Text="Clave"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="mclave" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Registrar" />
</asp:Content>
