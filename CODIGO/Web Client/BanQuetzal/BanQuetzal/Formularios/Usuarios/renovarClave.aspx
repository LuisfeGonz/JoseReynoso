<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Usuarios/ServicioCliente.Master" AutoEventWireup="true" CodeBehind="renovarClave.aspx.cs" Inherits="BanQuetzal.Formularios.Usuarios.renovarClave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtUsuario" runat="server" Width="230px"></asp:TextBox>
<br />
<asp:Label ID="Label2" runat="server" Text="CUI Cliente"></asp:Label>
&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtCUI" runat="server" Width="230px"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Clave"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="clave" runat="server"></asp:Label>
    <br />
<br />
    <asp:Label ID="lmsg" runat="server"></asp:Label>
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button1" runat="server" Text="Recuperar" Width="119px" OnClick="Button1_Click" />
<br />

</asp:Content>
