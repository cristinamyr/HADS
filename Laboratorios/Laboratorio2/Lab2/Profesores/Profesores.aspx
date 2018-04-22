<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profesores.aspx.vb" Inherits="Lab2.TareasProfesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 859px;
        }
        .auto-style4 {
            width: 1393px;
            height: 842px;
            position: absolute;
            left: 294px;
            top: 15px;
            text-align: left;
        }
        .auto-style5 {
            width: 115px;
            height: 27px;
            position: absolute;
            left: 98px;
            top: 80px;
        }
        .auto-style6 {
            width: 63px;
            position: absolute;
            left: 114px;
            top: 207px;
        }
        .auto-style7 {
            width: 70px;
            height: 27px;
            position: absolute;
            left: 112px;
            top: 335px;
        }
        .auto-style8 {
            text-align: center;
        }
        .auto-style9 {
            font-size: xx-large;
        }
        .auto-style10 {
            width: 113px;
            height: 27px;
            position: absolute;
            left: 91px;
            top: 461px;
        }
        .auto-style11 {
            top: 778px;
            left: 70px;
            position: absolute;
            width: 186px;
        }
        .auto-style12 {
            width: 215px;
            height: 55px;
            position: absolute;
            left: 1155px;
            top: 28px;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Panel ID="Panel1" runat="server" BorderColor="Black" Height="852px" Width="272px">
                <asp:Panel ID="Panel2" runat="server" BackColor="#B7FFC1" BorderColor="Gray" BorderWidth="4px" Height="841px" Width="264px">
                    <asp:Panel ID="Panel3" runat="server" BackColor="#CAFFCA" BorderColor="Gray" BorderWidth="4px" CssClass="auto-style4">
                        <div class="auto-style8">
                            <span class="auto-style9">
                            <br />
                            <br />
                            <br />
                            <br />
                            <strong>
                            <br />
                            Gestión Web de Tareas-Dedicación</strong></span><strong><br class="auto-style9" />
                            <br class="auto-style9" />
                            </strong><span class="auto-style9"><strong>Profesores</strong><asp:LinkButton ID="l_cerrarsesion" runat="server" CssClass="auto-style12">Cerrar sesión</asp:LinkButton>
                            </span></div>
                    </asp:Panel>
                    <asp:HyperLink ID="h_asignaturas" runat="server" CssClass="auto-style5">Asignaturas</asp:HyperLink>
                    <asp:HyperLink ID="h_tareas" runat="server" CssClass="auto-style6" NavigateUrl="~/Profesores/TareasProfesor.aspx">Tareas</asp:HyperLink>
                    <asp:HyperLink ID="h_grupos" runat="server" CssClass="auto-style7">Grupos</asp:HyperLink>
                    <asp:HyperLink ID="h_Estadisticas" runat="server" CssClass="auto-style10" NavigateUrl="~/Profesores/Estadisticas.aspx">Estadisticas</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Profesores/Vadillo/ImportarXML.aspx" style="top: 559px; left: 93px; position: absolute; height: 22px; width: 103px">Importar v. XMLDocument</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" style="top: 673px; left: 104px; position: absolute; height: 22px; width: 84px" NavigateUrl="~/Profesores/Vadillo/ExportarXML.aspx">Exportar</asp:HyperLink>
                    <asp:HyperLink ID="HyperLink3" runat="server" CssClass="auto-style11" NavigateUrl="~/Profesores/Vadillo/ImportarDataSet.aspx">Importar v. Dataset (Opcional)</asp:HyperLink>
                    <br />
                    <br />
                </asp:Panel>
            </asp:Panel>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:Timer ID="Timer1"  OnTick="Timer1_Tick" runat="server" Interval="10000">
        </asp:Timer>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
             <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
                Profesores conectados:
                <asp:Label ID="Label1" runat="server"></asp:Label>
                &nbsp;<br /> Alumnos conectados:
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
