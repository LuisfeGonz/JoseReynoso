<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/Usuarios/ServicioCliente.Master" AutoEventWireup="true" CodeBehind="activarDesactivar.aspx.cs" Inherits="BanQuetzal.Formularios.Usuarios.activarDesactivar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Accion"></asp:Label>
    <asp:DropDownList ID="ddAccion" runat="server" >
    </asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text="No Cuenta"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtCta" runat="server" Width="230px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="CUI Cliente"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtCliente" runat="server" Width="230px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lmsg" runat="server"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Button ID="cambiar" runat="server" OnClick="cambiar_Click" Text="Cambiar Estado" />
    <br />

</asp:Content>
