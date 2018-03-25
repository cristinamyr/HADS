<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExportarXML.aspx.vb" Inherits="Lab2.ExportarXML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 131px;
            height: 29px;
            position: absolute;
            left: 220px;
            top: 248px;
        }
        .auto-style2 {
            width: 289px;
            height: 180px;
            position: absolute;
            left: 933px;
            top: 193px;
            bottom: 492px;
        }
        .auto-style3 {
            width: 238px;
            height: 87px;
            position: absolute;
            left: 224px;
            top: 383px;
        }
        .auto-style6 {
            width: 219px;
            height: 27px;
            position: absolute;
            left: 101px;
            top: 466px;
        }
        .auto-style8 {
            text-align: center;
        }
        .auto-style9 {
            font-size: x-large;
        }
        .auto-style10 {
            width: 193px;
            height: 27px;
            position: absolute;
            left: 50px;
            top: 47px;
        }
        .auto-style11 {
            width: 142px;
            height: 27px;
            position: absolute;
            left: 1370px;
            top: 60px;
        }
        .auto-style12 {
            width: 389px;
            height: 27px;
            position: absolute;
            left: 49px;
            top: 204px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" BackColor="#99FFCC" Height="111px">
                <div class="auto-style8">
                    <span class="auto-style9">PROFESORES</span><br class="auto-style9" /> <span class="auto-style9">Exportación de tareas a documentos XML</span><asp:HyperLink ID="h_menu" runat="server" CssClass="auto-style10" NavigateUrl="~/Profesores.aspx">Volver al menú principal</asp:HyperLink>
                </div>
            </asp:Panel>
        </div>
        <asp:DropDownList ID="ddl_asignaturas" runat="server" AutoPostBack="true" CssClass="auto-style1" DataSourceID="asignaturas_datos" DataTextField="codigoasig" DataValueField="codigoasig">
        </asp:DropDownList>
        <asp:SqlDataSource ID="asignaturas_datos" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.email = @email AND ProfesoresGrupo.codigogrupo = GruposClase.codigo">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="tareas_view" runat="server" CssClass="auto-style2" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:Button ID="b_exportarXML" runat="server" CssClass="auto-style3" Text="EXPORTAR XML" />
        <asp:Label ID="Label1" runat="server" CssClass="auto-style12" Text="Selecciona la asignatura a ser exportada:"></asp:Label>
        <asp:Label ID="l_retroalimentacion" runat="server" CssClass="auto-style6" Text=" "></asp:Label>
        <asp:LinkButton ID="l_cerrarSesion" runat="server" CssClass="auto-style11">Cerrar sesión</asp:LinkButton>
    </form>
    </body>
</html>
