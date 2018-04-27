<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Coordinador.aspx.vb" Inherits="Lab2.Coordinador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: x-large;
        }
        .auto-style3 {
            font-size: xx-small;
        }
        .auto-style4 {
            width: 267px;
            height: 27px;
            position: absolute;
            left: 71px;
            top: 60px;
        }
        .auto-style5 {
            width: 151px;
            height: 27px;
            position: absolute;
            left: 1407px;
            top: 68px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" BackColor="#CC99FF" Height="120px">
                <div class="auto-style1">
                    <strong><span class="auto-style3">&nbsp;</span><span class="auto-style2"><br /> Coordinador</span><br class="auto-style2" /> <span class="auto-style2">Gestión de las dedicaciones medias</span></strong></div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Height="780px">
                <br />
                Seleccione la asignatura de la que desee obtener la media:<br />
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" DataSourceID="datos_ddl" DataTextField="codigoasig" DataValueField="codigoasig">
                </asp:DropDownList>
                <asp:SqlDataSource ID="datos_ddl" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT DISTINCT GruposClase.codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.codigogrupo = GruposClase.codigo"></asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La media es:
                <asp:Label ID="l_media" runat="server"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style4" NavigateUrl="~/Profesores/Profesores.aspx">Volver al menú principal</asp:HyperLink>
            </asp:Panel>
            <br />
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="auto-style5">Cerrar sesión</asp:LinkButton>
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
