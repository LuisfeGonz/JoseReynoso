<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Usuarios/ServicioCliente.Master" AutoEventWireup="true" CodeBehind="solicitarChequera.aspx.cs" Inherits="BanQuetzal.Formularios.Usuarios.solicitarChequera" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="No. Cuenta"></asp:Label>
<asp:TextBox ID="txtCuenta" runat="server"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label2" runat="server" Text="CUI Cliente"></asp:Label>
<asp:TextBox ID="txtCUI" runat="server"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label3" runat="server" Text="Talonario"></asp:Label>
<asp:TextBox ID="txtTal" runat="server"></asp:TextBox>
<br />
<br />
<asp:Label ID="lmsg" runat="server"></asp:Label>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Solicitar" />
</asp:Content>
