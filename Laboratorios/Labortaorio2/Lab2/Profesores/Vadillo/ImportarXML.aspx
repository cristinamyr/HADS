<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarXML.aspx.vb" Inherits="Lab2.ImportarXML" %>

<!DOCTYPE html>

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
        .auto-style2 {
            width: 757px;
            height: 27px;
            position: absolute;
            left: 60px;
            top: 427px;
        }
        .auto-style3 {
            margin-left: 920px;
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
            height: 35px;
            position: absolute;
            left: 38px;
            top: 483px;
            width: 204px;
            margin-bottom: 38px;
        }
        .auto-style12 {
            width: 267px;
            height: 35px;
            position: absolute;
            left: 269px;
            top: 482px;
        }
        .auto-style13 {
            width: 223px;
            height: 35px;
            position: absolute;
            left: 574px;
            top: 484px;
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
        <asp:Button ID="b_importar" runat="server" style="margin-top: 0px" Text="IMPORTAR (XMLD)" CssClass="auto-style7" />
            <div class="auto-style3">
                <asp:Button ID="b_codigo" runat="server" CssClass="auto-style11" Text="Ordenar por código" />
                <asp:Button ID="b_horas" runat="server" CssClass="auto-style12" Text="Ordenar por horas estimadas" />
                <asp:Xml ID="Xml1" runat="server"></asp:Xml>
            </div>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style6" Text="Selecciona la asignatura de la que quieres importar las tareas:"></asp:Label>
            <asp:LinkButton ID="b_cerrarSesion" runat="server" CssClass="auto-style9">Cerrar sesión</asp:LinkButton>
            <asp:HyperLink ID="h_menupral" runat="server" CssClass="auto-style8" NavigateUrl="~/Profesores.aspx">Volver al menú principal</asp:HyperLink>
        </div>
        <p>
        <asp:Label ID="l_retroalimentacion" runat="server" CssClass="auto-style2" Text=" "></asp:Label>
            </p>
        <asp:Button ID="b_descr" runat="server" CssClass="auto-style13" Text="Ordenar por descripción" />
    </form>
</body>
</html>
