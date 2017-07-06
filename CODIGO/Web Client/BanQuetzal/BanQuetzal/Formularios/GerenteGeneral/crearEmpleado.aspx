<%@ Page Title="" Language="C#" MasterPageFile="~/Formularios/GerenteGeneral/GerenteGeneral.Master" AutoEventWireup="true" CodeBehind="crearEmpleado.aspx.cs" Inherits="BanQuetzal.Formularios.GerenteGeneral.crearEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Tipo Personal"></asp:Label>
<asp:DropDownList ID="ddTipo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddTipo_SelectedIndexChanged">
</asp:DropDownList>
<br />
<asp:Label ID="Label2" runat="server" Text="Numero CUI"></asp:Label>
<asp:TextBox ID="txtCUI" runat="server" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label3" runat="server" Text="Nombre completo"></asp:Label>
<asp:TextBox ID="txtNombre" runat="server" Width="200px"></asp:TextBox>
<br />
<asp:Label ID="label222" runat="server" Text="Direccion"></asp:Label>
<asp:TextBox ID="txtDir" runat="server" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label5" runat="server" Text="Usuario"></asp:Label>
<asp:TextBox ID="txtUsuario" runat="server" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br />
I<asp:Label ID="Label7" runat="server" Text="ID Agencia asignada"></asp:Label>
<asp:TextBox ID="txtAgencia" runat="server" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label8" runat="server" Text="No CUI Superior"></asp:Label>
<asp:TextBox ID="txtSuperior" runat="server" Width="200px"></asp:TextBox>
<br />
<br />
<asp:Label ID="Label224" runat="server" Text="Clave:       "></asp:Label>
<asp:Label ID="txtClave" runat="server"></asp:Label>
<br />
    <asp:Label ID="lmsg" runat="server"></asp:Label>
<br />
<br />
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Registra Empleado" />
<br />
<br />
<br />
<asp:Label ID="Label223" runat="server" Text="Buscar Agencia"></asp:Label>
&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="ddAgencia" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddAgencia_SelectedIndexChanged">
</asp:DropDownList>
<br />
<br />
</asp:Content>
