<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarPassword.aspx.vb" Inherits="Lab2.CambiarPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Size="30pt" style="top: 29px; left: 486px; position: absolute; height: 56px; width: 372px" Text="Cambiar Password"></asp:Label>
        <div>
        </div>
        <asp:Label ID="Label2" runat="server" style="top: 141px; left: 568px; position: absolute; height: 22px; width: 64px" Text="E-mail:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="top: 139px; left: 656px; position: absolute; height: 25px; width: 168px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" style="top: 192px; left: 576px; position: absolute; height: 29px; width: 249px" Text="Solicitar Cambiar Contraseña" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red" style="top: 145px; left: 843px; position: absolute; height: 22px; width: 14px"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Formato erróneo" style="top: 142px; left: 867px; position: absolute; height: 22px; width: 138px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </form>
</body>
</html>
