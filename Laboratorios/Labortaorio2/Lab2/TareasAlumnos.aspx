<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasAlumnos.aspx.vb" Inherits="Lab2.TareasAlumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style3 {
            width: 207px;
            height: 27px;
            position: absolute;
            left: 1421px;
            top: 78px;
        }
        .auto-style4 {
            font-size: large;
        }
        .auto-style5 {
            width: 289px;
            height: 180px;
            position: absolute;
            left: 88px;
            top: 368px;
        }
    </style>
</head>
<body style="height: 839px">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Panel ID="Panel1" runat="server" BackColor="#66CCFF" Height="124px">
                <strong><span>
                <br class="auto-style4" />
                </span><span class="auto-style4">ALUMNOS</span><br class="auto-style4" /> </strong><span class="auto-style4"><strong>GESTIÓN DE TAREAS GENÉRICAS </strong></span>
            </asp:Panel>
        </div>
        <asp:LinkButton ID="l_cerrarSesion" runat="server" CssClass="auto-style3">Cerrar Sesión</asp:LinkButton>
        <p>
            Seleccionar Asignatura
        </p>
        <p>
            <asp:DropDownList ID="ddl_alumnos" runat="server" Height="60px" Width="203px">
            </asp:DropDownList>
        </p>
        <asp:GridView ID="tablaAlumnos" runat="server" CellPadding="4" CssClass="auto-style5" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </form>
</body>
</html>
