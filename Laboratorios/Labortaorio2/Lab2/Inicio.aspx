<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="Lab2.FormularioWeb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio</title>
    <style type="text/css">
        #form1 {
            height: 893px;
        }
        .auto-style2 {
            width: 795px;
        }
        .auto-style6 {
            width: 795px;
            text-align: right;
            height: 32px;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style9 {
            text-align: center;
            height: 41px;
        }
        .auto-style10 {
            margin-right: 0px;
        }
        .auto-style11 {
            height: 33px;
        }
        .auto-style12 {
            width: 818px;
            height: 31px;
        }
        .auto-style14 {
            width: 795px;
            height: 31px;
        }
        .auto-style15 {
            width: 795px;
            height: 33px;
        }
        .auto-style16 {
            height: 32px;
        }
    </style>
</head>
<body style="height: 899px">
    <form id="form1" runat="server" class="auto-style10" title="Inicio">
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="30pt" style="text-align: center" Text="Formulario de inicio de sesión"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15" style="text-align: right">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15" style="text-align: right">
                    <asp:Label ID="l_email" runat="server" Text="email:"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="t_email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req_email" runat="server" ControlToValidate="t_email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="reg_email" runat="server" ControlToValidate="t_email" ErrorMessage="Formato erróneo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">password:</td>
                <td class="auto-style16">
                    <asp:TextBox ID="t_pass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7" colspan="2">
                    &nbsp;<asp:Button ID="b_inciar" runat="server" Text="Iniciar sesión" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7" colspan="2">&nbsp;&nbsp;
                    <asp:Label ID="l_iniciarSesion" runat="server" ForeColor="Red" Text="      "></asp:Label>
                    <asp:LinkButton ID="l_button" runat="server">aquí.</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="2">
                    <asp:HyperLink ID="h_registro" runat="server" NavigateUrl="~/Registro.aspx">Registrarse</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style7" colspan="2">
                    <asp:HyperLink ID="h_pass" runat="server" NavigateUrl="~/CambiarPassword.aspx">¿Olvidó su contraseña?</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" colspan="2">
                    <asp:Label ID="l_conexion" runat="server" Text="         "></asp:Label>
                    <asp:Button ID="Button1" runat="server" Text="Button" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14"></td>
                <td class="auto-style12"></td>
            </tr>
        </table>
    </form>
</body>
</html>
