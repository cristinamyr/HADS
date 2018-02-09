<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarPassword2.aspx.vb" Inherits="Lab2.CambiarPassword2" %>

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
        <asp:Label ID="Label1" runat="server" style="top: 147px; left: 340px; position: absolute; height: 22px; width: 219px" Text="Código de Confirmación:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="top: 141px; left: 578px; position: absolute; height: 25px; width: 168px"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" style="top: 208px; left: 344px; position: absolute; height: 22px; width: 160px" Text="Nueva contraseña:"></asp:Label>
        <asp:Label ID="Label3" runat="server" style="top: 264px; left: 342px; position: absolute; height: 22px; width: 239px" Text="Confirmar nueva contraseña:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" style="top: 206px; left: 525px; position: absolute; height: 25px; width: 168px"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" style="top: 259px; left: 608px; position: absolute; height: 25px; width: 168px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" style="top: 337px; left: 556px; position: absolute; height: 29px; width: 103px" Text="Modificar" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red" style="top: 146px; left: 762px; position: absolute; height: 22px; width: 18px; margin-top: 0px"></asp:RequiredFieldValidator>
        <p>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red" style="top: 209px; left: 709px; position: absolute; height: 22px; width: 17px"></asp:RequiredFieldValidator>
        </p>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red" style="top: 264px; left: 798px; position: absolute; height: 22px; width: 19px"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Formato erróneo" style="top: 145px; left: 785px; position: absolute; height: 22px; width: 225px" ValidationExpression="[0-9][0-9][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="Las contraseñas no coinciden" style="top: 259px; left: 826px; position: absolute; height: 22px; width: 147px"></asp:CompareValidator>
    </form>
</body>
</html>
