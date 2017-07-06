<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Cajero/PGCajero.Master" AutoEventWireup="true" CodeBehind="cambiarCheque.aspx.cs" Inherits="BanQuetzal.Formularios.Cajero.cambiarCheque" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="No. Cuenta"></asp:Label>
&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtCuenta" runat="server" Width="200px"></asp:TextBox>
<br />
<asp:Label ID="Label2" runat="server" Text="ID Cheque"></asp:Label>
&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtCheque" runat="server" Width="200px"></asp:TextBox>
<br />
<asp:Label ID="Label3" runat="server" Text="Monto"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtMonto" runat="server" Width="200px"></asp:TextBox>
<br />
<asp:Label ID="Label4" runat="server" Text="Emisor"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="txtEmisor" runat="server" Width="200px"></asp:TextBox>
<br />
<br />
<asp:Label ID="lmsg" runat="server"></asp:Label>
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cambiar" Width="88px" />

</asp:Content>
