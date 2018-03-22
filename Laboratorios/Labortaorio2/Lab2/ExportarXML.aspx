<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExportarXML.aspx.vb" Inherits="Lab2.ExportarXML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 289px;
            height: 180px;
            position: absolute;
            left: 860px;
            top: 219px;
        }
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" DataKeyNames="Codigo" DataSourceID="datos_gvw">
            <Columns>
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="datos_gvw" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT TareasGenericas.Codigo, TareasGenericas.CodAsig, TareasGenericas.Descripcion, TareasGenericas.Explotacion, TareasGenericas.HEstimadas, TareasGenericas.TipoTarea FROM ((TareasGenericas INNER JOIN GruposClase ON TareasGenericas.CodAsig=GruposClase.codigoasig) INNER JOIN ProfesoresGrupo ON GruposClase.codigo=ProfesoresGrupo.codigogrupo) WHERE ProfesoresGrupo.email=@profesor and TareasGenericas.CodAsig=@asignatura">
            <SelectParameters>
                <asp:SessionParameter Name="profesor" SessionField="email" />
                <asp:ControlParameter ControlID="ddl_asignaturas" Name="asignatura" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
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
    </form>
</body>
</html>
