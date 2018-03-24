<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExportarXML.aspx.vb" Inherits="Lab2.ExportarXML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 55px;
            height: 27px;
            position: absolute;
            left: 254px;
            top: 545px;
        }
        .auto-style3 {
            width: 255px;
            height: 79px;
            position: absolute;
            left: 69px;
            top: 412px;
        }
        .auto-style4 {
            width: 131px;
            height: 29px;
            position: absolute;
            left: 87px;
            top: 205px;
        }
        .auto-style5 {
            width: 814px;
            height: 248px;
            position: absolute;
            left: 644px;
            top: 230px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text="Label"></asp:Label>
        <asp:DropDownList ID="ddl_asignaturas" runat="server" CssClass="auto-style4" DataSourceID="datos_ddl" DataTextField="codigo" DataValueField="codigo">
        </asp:DropDownList>
        <asp:SqlDataSource ID="datos_ddl" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.email = @email AND ProfesoresGrupo.codigogrupo = GruposClase.codigo">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            <asp:Button ID="b_exportarXML" runat="server" CssClass="auto-style3" Text="EXPORTAR XML" />
        </p>
        <asp:GridView ID="tareas_view" runat="server" CellPadding="4" CssClass="auto-style5" ForeColor="#333333" GridLines="None" AllowSorting="True">
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
