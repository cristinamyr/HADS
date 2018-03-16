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
            width: 814px;
            height: 248px;
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
            <asp:DropDownList ID="ddl_alumnos" runat="server" Height="60px" AutoPostBack="True" Width="203px">
            </asp:DropDownList>
        </p>
        <asp:GridView ID="tablaAlumnos" runat="server" CellPadding="4" CssClass="auto-style5" ForeColor="#333333" GridLines="None" AllowSorting="True" AutoGenerateSelectButton="True">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT TareasGenericas.Codigo, TareasGenericas.Descripcion, TareasGenericas.HEstimadas, TareasGenericas.TipoTarea, TareasGenericas.CodAsig FROM TareasGenericas INNER JOIN GruposClase ON GruposClase.codigoasig = TareasGenericas.CodAsig INNER JOIN EstudiantesGrupo ON EstudiantesGrupo.Grupo = GruposClase.codigo AND EstudiantesGrupo.Email = @email WHERE TareasGenericas.Explotacion=1">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_alumnos" Name="email" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
