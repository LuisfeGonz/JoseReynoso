<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/GerenteGeneral/GerenteGeneral.Master" AutoEventWireup="true" CodeBehind="crearAgencia.aspx.cs" Inherits="BanQuetzal.Formularios.GerenteGeneral.crearAgencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="ID Agencia"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtID" runat="server" Width="230px"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Nombre Agencia"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtNombre" runat="server" Width="230px"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Direccion"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtDir" runat="server" Width="230px"></asp:TextBox>
    <br />
    <asp:Label ID="lmsg" runat="server"></asp:Label>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Crear agencia" Width="140px" />
</asp:Content>
