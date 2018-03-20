<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Estadisticas.aspx.vb" Inherits="Lab2.Estadisticas" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 901px;
        }
        .auto-style2 {
            text-align: center;
            font-size: xx-large;
        }
        .auto-style3 {
            font-size: xx-small;
        }
        .auto-style4 {
            width: 161px;
            height: 431px;
            position: absolute;
            left: 21px;
            top: 180px;
        }
        .auto-style5 {
            width: 707px;
            height: 27px;
            position: absolute;
            left: 25px;
            top: 143px;
        }
        .auto-style6 {
            width: 166px;
            height: 39px;
            position: absolute;
            left: 94px;
            top: 47px;
            font-size: medium;
        }
        .auto-style7 {
            font-size: medium;
            width: 130px;
            height: 27px;
            position: absolute;
            left: 1384px;
            top: 54px;
        }
    </style>
</head>
<body style="height: 920px">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Panel ID="Panel1" runat="server" BackColor="#99CCFF" Height="102px">
                <div class="auto-style2">
                    <span class="auto-style3">&nbsp;</span><br /> Dedicación de los alumnos<asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style6" NavigateUrl="~/Profesores.aspx">Volver al menú</asp:HyperLink>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="auto-style7">Cerrar Sesión</asp:LinkButton>
                    &nbsp;<asp:Panel ID="Panel2" runat="server" Height="126px">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" CssClass="auto-style4" DataSourceID="DDL_DATOS" DataTextField="Codigo" DataValueField="Codigo">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DDL_DATOS" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT TareasGenericas.Codigo FROM TareasGenericas INNER JOIN GruposClase ON GruposClase.codigoasig = TareasGenericas.CodAsig INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.codigogrupo = GruposClase.codigo WHERE ProfesoresGrupo.email = @email">
                            <SelectParameters>
                                <asp:SessionParameter Name="email" SessionField="email" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="chart_datos" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT AVG(HReales) AS Media FROM EstudiantesTareas WHERE CodTarea = @tarea">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="tarea" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style5" Font-Size="Medium" Text="Selecciona una tarea para conocer la dedicación media de los estudiantes:"></asp:Label>
                        <asp:Chart ID="Chart1" runat="server" CssClass="auto-style5" DataSourceID="chart_datos" Height="379px" style="left: 406px; top: 324px" Width="452px">
                            <series>
                                <asp:Series Name="Series1" YValueMembers="Media">
                                </asp:Series>
                            </series>
                            <chartareas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisY Title="Horas dedicadas"></AxisY>
                                    <AxisX Title="Tarea seleccionada"></AxisX>
                                </asp:ChartArea>
                            </chartareas>
                        </asp:Chart>
                        <br />
                        <br />
                    </asp:Panel>
                    &nbsp;</div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
