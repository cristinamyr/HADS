<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="Lab2.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 861px;
        }
        .auto-style2 {
            text-align: center;
            height: 120px;
        }
        .auto-style4 {
            font-size: large;
        }
        .auto-style5 {
            width: 93px;
            height: 27px;
            position: absolute;
            left: 186px;
            top: 203px;
        }
        .auto-style6 {
            width: 55px;
            height: 27px;
            position: absolute;
            left: 206px;
            top: 265px;
        }
        .auto-style7 {
            width: 191px;
            height: 27px;
            position: absolute;
            left: 91px;
            top: 321px;
        }
        .auto-style8 {
            width: 144px;
            height: 27px;
            position: absolute;
            left: 128px;
            top: 382px;
        }
        .auto-style9 {
            width: 391px;
            height: 112px;
            position: absolute;
            left: 168px;
            top: 493px;
        }
        .auto-style10 {
            width: 188px;
            height: 29px;
            position: absolute;
            left: 307px;
            top: 198px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Panel ID="Panel1" runat="server" BackColor="#66CCFF" Height="122px">
                <div class="auto-style2">
                    <strong><span class="auto-style4">
                    <br />
                    ALUMNOS</span><br class="auto-style4" /> <span class="auto-style4">INSTANCIAR LA TAREA GENÉRICA</span></strong><br class="auto-style4" />
                    <asp:Label ID="l_usuario" runat="server" CssClass="auto-style5" Text="Usuario:"></asp:Label>
                    <asp:Label ID="l_tarea" runat="server" CssClass="auto-style6" Text="Tarea:"></asp:Label>
                    <asp:Label ID="l_hest" runat="server" CssClass="auto-style7" Text="Horas estimadas:"></asp:Label>
                    <asp:Label ID="l_hreal" runat="server" CssClass="auto-style8" Text="Horas reales:"></asp:Label>
                    <asp:Button ID="b_instanciar" runat="server" BackColor="#0099FF" CssClass="auto-style9" Text="Instanciar tarea" />
                    <asp:TextBox ID="t_usuario" runat="server" CssClass="auto-style10"></asp:TextBox>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
