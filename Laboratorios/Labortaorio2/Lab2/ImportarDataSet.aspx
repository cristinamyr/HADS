<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarDataSet.aspx.vb" Inherits="Lab2.ImportarDataSet" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            top: 257px;
            left: 149px;
            position: absolute;
            height: 25px;
            width: 162px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            font-size: x-large;
        }
        .auto-style6 {
            width: 587px;
            height: 27px;
            position: absolute;
            left: 44px;
            top: 193px;
        }
        .auto-style7 {
            top: 331px;
            left: 215px;
            position: absolute;
            height: 66px;
            width: 252px;
        }
        .auto-style8 {
            width: 171px;
            height: 27px;
            position: absolute;
            left: 112px;
            top: 54px;
        }
        .auto-style9 {
            width: 164px;
            height: 27px;
            position: absolute;
            left: 1301px;
            top: 65px;
        }
        .auto-style10 {
            font-size: x-small;
        }
        .auto-style11 {
            width: 289px;
            height: 180px;
            position: absolute;
            left: 1000px;
            top: 235px;
        }
        .auto-style12 {
            width: 421px;
            height: 27px;
            position: absolute;
            left: 126px;
            top: 420px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style4">
        <div>
            <asp:Panel ID="Panel1" runat="server" BackColor="#99FFCC" Height="124px">
                <div class="auto-style4">
                    <span class="auto-style10">&nbsp;</span><span class="auto-style5"><br /> PROFESORES</span><br class="auto-style5" /> <span class="auto-style5">Importar tareas desde XML</span></div>
            </asp:Panel>
        </div>
        <asp:DropDownList ID="ddl_asignaturas" AutoPostBack="True" runat="server" DataSourceID="datos_ddl" CssClass="auto-style1" DataTextField="codigoasig" DataValueField="codigoasig">
        </asp:DropDownList>
        <asp:SqlDataSource ID="datos_ddl" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.email = @email AND ProfesoresGrupo.codigogrupo = GruposClase.codigo">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:Label ID="l_retroalimentacion" runat="server" CssClass="auto-style12" Text=" "></asp:Label>
        <asp:Button ID="b_importar" runat="server" style="margin-top: 0px" Text="IMPORTAR (XMLD)" CssClass="auto-style7" />
            <asp:GridView ID="tabla_asignaturas" runat="server" CellPadding="4" CssClass="auto-style11" ForeColor="#333333" GridLines="None">
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
            <asp:Label ID="Label1" runat="server" CssClass="auto-style6" Text="Selecciona la asignatura de la que quieres importar las tareas:"></asp:Label>
            <asp:LinkButton ID="b_cerrarSesion" runat="server" CssClass="auto-style9">Cerrar sesión</asp:LinkButton>
            <asp:HyperLink ID="h_menupral" runat="server" CssClass="auto-style8" NavigateUrl="~/Profesores.aspx">Volver al menú principal</asp:HyperLink>
        </div>
    </form>
</body>
</html>
