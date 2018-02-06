<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FormularioClienteObligatorio.aspx.vb" Inherits="ClienteWebObligatorio.FormularioClienteObligatorio" %>

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
        <asp:Label ID="Label1" runat="server" style="top: 143px; left: 444px; position: absolute; height: 27px; width: 156px" Text="Precio TOTAL:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="top: 139px; left: 603px; position: absolute; height: 29px; width: 188px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" style="top: 208px; left: 443px; position: absolute; height: 27px; width: 134px" Text="IVA aplicado:"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" style="top: 206px; left: 605px; position: absolute; height: 95px; width: 171px">
            <asp:ListItem Value="21">General</asp:ListItem>
            <asp:ListItem Value="10">Reducido</asp:ListItem>
            <asp:ListItem Value="4">Super reducido</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Button ID="Button1" runat="server" BackColor="#66FFFF" style="top: 334px; left: 544px; position: absolute; height: 35px; width: 133px" Text="Desglosar" />
        <asp:Label ID="Label3" runat="server" style="top: 402px; left: 465px; position: absolute; height: 26px; width: 142px" Text="Total sin IVA:"></asp:Label>
        <asp:Label ID="Label4" runat="server" style="top: 447px; left: 554px; position: absolute; height: 27px; width: 55px" Text="IVA:"></asp:Label>
        <asp:Label ID="Label5" runat="server" style="top: 403px; left: 620px; position: absolute; height: 29px; width: 55px" Text=" "></asp:Label>
        <asp:Label ID="Label6" runat="server" style="top: 446px; left: 620px; position: absolute; height: 27px; width: 55px" Text=" "></asp:Label>
    </form>
</body>
</html>
