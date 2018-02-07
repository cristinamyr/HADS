<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FormularioWeb.aspx.vb" Inherits="Lab2.FormularioWeb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="height: 899px">
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" style="top: 77px; left: 589px; position: absolute; height: 27px; width: 523px" Text="Formulario de Inicio de sesión"></asp:Label>
        <asp:Label ID="Label3" runat="server" style="top: 175px; left: 705px; position: absolute; height: 27px; width: 69px" Text="e-mail:"></asp:Label>
        <asp:Label ID="Label4" runat="server" style="top: 206px; left: 661px; position: absolute; height: 27px; width: 116px" Text="contraseña: "></asp:Label>
        <asp:Button ID="Button1" runat="server" style="top: 265px; left: 712px; position: absolute; height: 35px; width: 172px; bottom: 665px" Text="Iniciar sesión" />
    </form>
</body>
</html>
