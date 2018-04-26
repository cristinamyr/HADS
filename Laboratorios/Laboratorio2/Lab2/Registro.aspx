<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registro.aspx.vb" Inherits="Lab2.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-size: xx-large;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: right;
            width: 786px;
        }
        .auto-style4 {
            width: 786px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 910px; width: 1596px;">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1" colspan="2"><strong>Formulario de Registro</strong></td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Nombre:</td>
                            <td>
                                <asp:TextBox ID="t_nombre" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="req_nombre" runat="server" ControlToValidate="t_nombre" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Apellido(s):</td>
                            <td>
                                <asp:TextBox ID="t_apellidos" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="req_apel" runat="server" ControlToValidate="t_apellidos" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">e-mail:</td>
                            <td>
                                <asp:TextBox ID="t_email" runat="server" AutoPostBack="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="req_email" runat="server" ControlToValidate="t_email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="reg_email" runat="server" ControlToValidate="t_email" ErrorMessage="Formato incorrecto" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:Label ID="comp_email" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Contraseña:</td>
                            <td>
                                <asp:TextBox ID="t_pass" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="req_pass" runat="server" ControlToValidate="t_pass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Validar contraseña:</td>
                            <td>
                                <asp:TextBox ID="t_rpass" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="req_rpass" runat="server" ControlToValidate="t_rpass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="comp_pass" runat="server" ControlToCompare="t_pass" ControlToValidate="t_rpass" ErrorMessage="Las contraseñas no coinciden"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">rol:</td>
                            <td>
                                <asp:RadioButtonList ID="rb_rol" runat="server">
                                    <asp:ListItem>Alumno</asp:ListItem>
                                    <asp:ListItem Value="profesor">Profesor</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="req_rol" runat="server" ControlToValidate="rb_rol" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2" colspan="2">
                                <asp:Button ID="btn_registro" runat="server" Text="Registrarse" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" colspan="2">
                                <asp:Label ID="l_insert" runat="server" Text=" "></asp:Label>
                                <asp:Label ID="l_conexion" runat="server" Text=" "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" colspan="2">&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
