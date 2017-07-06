<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Cajero/PGCajero.Master" AutoEventWireup="true" CodeBehind="depositarEfectivo.aspx.cs" Inherits="BanQuetzal.Formularios.Cajero.depositarEfectivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="No. Cuenta"></asp:Label>
<asp:TextBox ID="txtCuenta" runat="server" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label2" runat="server" Text="Monto"></asp:Label>
<asp:TextBox ID="txtMonto" runat="server" Width="200px"></asp:TextBox>
<br />
<asp:Label ID="lmsg" runat="server"></asp:Label>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Depositar" />

</asp:Content>
