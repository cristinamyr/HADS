<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarPassword2.aspx.vb" Inherits="Lab2.CambiarPassword2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cambiar contraseña</title>
    <style type="text/css">
        .auto-style1 {
            height: 547px;
        }
        .auto-style2 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            text-align: right;
            width: 843px;
        }
        .auto-style5 {
            width: 843px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
        <table style="width:100%;">
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2"><strong>Confirmación del código </strong></td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Código de confirmación:</td>
                <td>
                    <asp:TextBox ID="t_codigo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req_codigo" runat="server" ControlToValidate="t_codigo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="reg_codigo" runat="server" ControlToValidate="t_codigo" ErrorMessage="Formato erróneo" ValidationExpression="[0-9][0-9][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Nueva contraseña:</td>
                <td>
                    <asp:TextBox ID="t_pass" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req_pass" runat="server" ControlToValidate="t_pass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Repetir contraseña:</td>
                <td>
                    <asp:TextBox ID="t_rpass" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="req_rpass" runat="server" ControlToValidate="t_rpass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="comp_rpass" runat="server" ControlToCompare="t_pass" ControlToValidate="t_rpass" ErrorMessage="Las contraseñas no coinciden"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Button ID="b_cambiar" runat="server" Text="Cambiar contraseña" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Label ID="l_message" runat="server" ForeColor="Red" Text=" "></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Button ID="p_reenviar" runat="server" Text="Reenviar código." />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">
                    <asp:Label ID="l_conexion" runat="server" Text="    "></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
