<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registro.aspx.vb" Inherits="Lab2.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 910px; width: 1596px;">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="30pt" style="top: 86px; left: 337px; position: absolute; height: 27px; width: 861px" Text="FORMULARIO DE REGISTRO"></asp:Label>
            <asp:Label ID="lnombre" runat="server" style="top: 194px; left: 541px; position: absolute; height: 27px; width: 78px" Text="Nombre: "></asp:Label>
            <asp:Label ID="lapel" runat="server" style="top: 239px; left: 511px; position: absolute; height: 27px; width: 113px; margin-bottom: 5px" Text="Apellido(s):"></asp:Label>
            <asp:Label ID="lmail" runat="server" style="top: 287px; left: 556px; position: absolute; height: 27px; width: 66px" Text="e-mail:"></asp:Label>
            <asp:Label ID="lpass" runat="server" style="top: 341px; left: 522px; position: absolute; height: 27px; width: 98px" Text="Password:"></asp:Label>
            <asp:Label ID="lvalpass" runat="server" style="top: 392px; left: 449px; position: absolute; height: 27px; width: 172px" Text="Validar password:"></asp:Label>
            <asp:Label ID="lrol" runat="server" style="top: 438px; left: 580px; position: absolute; height: 27px; width: 40px" Text="Rol:"></asp:Label>
            <asp:RadioButtonList ID="l_rol" runat="server" style="top: 437px; left: 642px; position: absolute; height: 64px; width: 108px">
                <asp:ListItem>Alumno</asp:ListItem>
                <asp:ListItem>Profesor</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="l_registrar" runat="server" style="top: 539px; left: 690px; position: absolute; height: 35px; width: 154px" Text="Registrarse" />
            <asp:TextBox ID="l_nombre" runat="server" style="top: 190px; left: 644px; position: absolute; height: 29px; width: 188px"></asp:TextBox>
            <asp:TextBox ID="l_apel" runat="server" style="top: 240px; left: 644px; position: absolute; height: 29px; width: 188px"></asp:TextBox>
            <asp:TextBox ID="l_email" runat="server" style="top: 285px; left: 645px; position: absolute; height: 29px; width: 188px"></asp:TextBox>
            <asp:TextBox ID="l_pass" runat="server" style="top: 337px; left: 645px; position: absolute; height: 29px; width: 188px" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="l_vpass" runat="server" style="top: 390px; left: 644px; position: absolute; height: 29px; width: 188px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="req_name" runat="server" ControlToValidate="l_nombre" ErrorMessage="*" style="top: 198px; left: 852px; position: absolute; height: 27px; width: 20px" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="req_apel" runat="server" ControlToValidate="l_apel" ErrorMessage="*" style="top: 241px; left: 853px; position: absolute; height: 27px; width: 20px; bottom: 697px;" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="req_email" runat="server" ControlToValidate="l_email" ErrorMessage="*" style="top: 291px; left: 853px; position: absolute; height: 27px; width: 27px" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="req_pass" runat="server" ControlToValidate="l_pass" ErrorMessage="*" style="top: 342px; left: 855px; position: absolute; height: 24px; width: 27px; bottom: 599px;" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="req_vpass" runat="server" ControlToValidate="l_vpass" ErrorMessage="*" style="top: 392px; left: 856px; position: absolute; height: 27px; width: 31px" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="req_rol" runat="server" ControlToValidate="l_rol" ErrorMessage="*" style="top: 455px; left: 771px; position: absolute; height: 27px; width: 26px" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="reg_email" runat="server" ControlToValidate="l_email" ErrorMessage="Formato no correcto" style="top: 291px; left: 884px; position: absolute; height: 27px; width: 270px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:CompareValidator ID="comp_pass" runat="server" ControlToCompare="l_pass" ControlToValidate="l_vpass" ErrorMessage="Las contraseñas no coincden" style="top: 379px; left: 893px; position: absolute; height: 27px; width: 177px"></asp:CompareValidator>
        </div>
    </form>
</body>
</html>
