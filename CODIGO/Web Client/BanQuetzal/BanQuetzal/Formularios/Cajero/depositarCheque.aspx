<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Cajero/PGCajero.Master" AutoEventWireup="true" CodeBehind="depositarCheque.aspx.cs" Inherits="BanQuetzal.Formularios.Cajero.depositarCheque" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="No. Cuenta a la que se debita"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtCuentaE" runat="server" Width="200px"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="No. Cuenta Beneficiaria"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtCuentaR" runat="server" Width="200px"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Monto"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtMonto" runat="server" Width="190px"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Correlativo"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtCheque" runat="server" Width="190px"></asp:TextBox>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Emisor"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtEmisor" runat="server" Width="190px"></asp:TextBox>
    <br />
    <asp:Label ID="lmsg" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Cambiar" runat="server" OnClick="Button1_Click" Text="Button" />
</asp:Content>
