<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FormularioOpcional.aspx.vb" Inherits="ClienteWebOpcional.FormularioOpcional" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" style="top: 149px; left: 445px; position: absolute; height: 27px; width: 161px" Text="Número factura:"></asp:Label>
        <asp:Label ID="Label2" runat="server" style="top: 327px; left: 463px; position: absolute; height: 27px; width: 152px" Text="Precio TOTAL:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="top: 147px; left: 614px; position: absolute; height: 29px; width: 188px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" BackColor="#00FFCC" style="top: 225px; left: 513px; position: absolute; height: 47px; width: 201px" Text="Obtener información" />
        <asp:Label ID="Label3" runat="server" style="top: 362px; left: 428px; position: absolute; height: 27px; width: 185px" Text="Tipo IVA aplicado:"></asp:Label>
        <asp:Label ID="Label4" runat="server" style="top: 328px; left: 629px; position: absolute; height: 27px; width: 55px" Text="Label"></asp:Label>
        <asp:Label ID="Label5" runat="server" style="top: 364px; left: 628px; position: absolute; height: 27px; width: 55px" Text="Label"></asp:Label>
        <asp:Label ID="Label6" runat="server" style="top: 400px; left: 471px; position: absolute; height: 27px; width: 142px" Text="Precio sin iva:"></asp:Label>
        <asp:Label ID="Label7" runat="server" style="top: 435px; left: 474px; position: absolute; height: 27px; width: 134px" Text="Importe IVA:"></asp:Label>
        <asp:Label ID="Label8" runat="server" style="top: 406px; left: 627px; position: absolute; height: 27px; width: 55px" Text="Label"></asp:Label>
        <asp:Label ID="Label9" runat="server" style="top: 439px; left: 625px; position: absolute; height: 27px; width: 55px" Text="Label"></asp:Label>
    </form>
</body>
</html>
