<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Confirmar.aspx.vb" Inherits="Lab2.Confirmar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 554px">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="30pt" style="top: 41px; left: 691px; position: absolute; height: 68px; width: 354px" Text="Confirmación"></asp:Label>
            <asp:HyperLink ID="hl_inicio" runat="server" NavigateUrl="~/Inicio.aspx" style="top: 232px; left: 725px; position: absolute; height: 27px; width: 274px">Acceder a la página de Incio</asp:HyperLink>
            <asp:Label ID="l_conf" runat="server" style="top: 195px; left: 735px; position: absolute; height: 27px; width: 255px" Text="Su cuenta ha sido activada"></asp:Label>
            <asp:Label ID="l_error" runat="server" ForeColor="#FF3300" style="top: 304px; left: 636px; position: absolute; height: 27px; width: 503px" Text="Ha habido un error a la hora de confirmar su cuenta."></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
