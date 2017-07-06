<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/General/General1.Master" AutoEventWireup="true" CodeBehind="cambiarClaveGG.aspx.cs" Inherits="BanQuetzal.Formularios.General.cambiarClaveGG" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="font-family: Algerian; font-size: 40px; color: #003366; text-align: center">
        <a href="../GerenteGeneral/inicioGerenteGeneral.aspx">
        INICIO
        </a>
    </h1>
    <br />
    <br />
    <br />
    <asp:Label ID="a" runat="server" Text="Clave Actual"></asp:Label>
    <asp:TextBox ID="txtActual" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Clave nueva"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtNueva" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Confirmar clave"></asp:Label>
    <asp:TextBox ID="txtConfirmar" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lMsg" runat="server"></asp:Label>
    <asp:Label ID="lMsg2" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cambiar" />
</asp:Content>
