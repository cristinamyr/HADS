<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Alumnos.aspx.vb" Inherits="Lab2.Alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-right: 1408px;
        }
        .auto-style2 {
            width: 1390px;
            height: 850px;
            position: absolute;
            left: 356px;
            top: 16px;
            text-align: center;
        }
        .auto-style3 {
            width: 189px;
            height: 27px;
            position: absolute;
            left: 87px;
            top: 98px;
            bottom: 795px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            font-size: xx-large;
        }
    </style>
</head>
<body style="height: 862px">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" BackColor="#6699FF" BorderWidth="4px" CssClass="auto-style1" Height="854px" Width="319px">
            <asp:Panel ID="Panel2" runat="server" BackColor="#33CCFF" BorderWidth="4px" CssClass="auto-style2">
                <div class="auto-style4">
                    <span class="auto-style5"><strong>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    Gestión Web de Tareas-Dedicación</strong></span><strong><br class="auto-style5" /> </strong><span class="auto-style5"><strong>Alumnos</strong></span></div>
            </asp:Panel>
            <asp:HyperLink ID="h_tareas" runat="server" CssClass="auto-style3" Font-Size="Large" NavigateUrl="~/Alumnos/TareasAlumnos.aspx">Tareas Genéricas</asp:HyperLink>
        </asp:Panel>
    </form>
</body>
</html>
