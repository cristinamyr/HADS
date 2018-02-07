<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="Lab2.FormularioWeb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 671px;
        }
    </style>
</head>
<body style="height: 899px">
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" style="top: 77px; left: 589px; position: absolute; height: 27px; width: 523px" Text="Formulario de Inicio de sesión"></asp:Label>
        <asp:Label ID="Label3" runat="server" style="top: 175px; left: 705px; position: absolute; height: 27px; width: 69px" Text="e-mail:"></asp:Label>
        <asp:Label ID="Label4" runat="server" style="top: 206px; left: 661px; position: absolute; height: 27px; width: 116px" Text="contraseña: "></asp:Label>
        <asp:Button ID="b_inic" runat="server" style="top: 265px; left: 712px; position: absolute; height: 35px; width: 172px; bottom: 665px" Text="Iniciar sesión" />
        <asp:TextBox ID="t_email" runat="server" style="top: 171px; left: 784px; position: absolute; height: 29px; width: 188px"></asp:TextBox>
        <asp:HyperLink ID="hl_pass" runat="server" NavigateUrl="~/CambiarPassword.aspx" style="top: 345px; left: 662px; position: absolute; height: 27px; width: 266px">¿Se te olvidó la contraseña?</asp:HyperLink>
        <asp:HyperLink ID="hp_registrar" runat="server" NavigateUrl="~/Registro.aspx" style="top: 384px; left: 746px; position: absolute; height: 27px; width: 107px">Registrarse</asp:HyperLink>
        <asp:RequiredFieldValidator ID="req_email" runat="server" ControlToValidate="t_email" ErrorMessage="*" style="top: 174px; left: 990px; position: absolute; height: 27px; width: 225px; bottom: 764px"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="t_email" ErrorMessage="Formato erróneo" style="top: 173px; left: 1009px; position: absolute; height: 27px; width: 270px"></asp:RegularExpressionValidator>
        <asp:TextBox ID="t_pass" runat="server" style="top: 208px; left: 784px; position: absolute; height: 29px; width: 188px" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="t_pass" ErrorMessage="*" style="top: 220px; left: 991px; position: absolute; height: 27px; width: 225px"></asp:RequiredFieldValidator>
    </form>
</body>
</html>
