<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasProfesor.aspx.vb" Inherits="Lab2.TareasProfesores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 859px;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            width: 232px;
            height: 31px;
            position: absolute;
            left: 1378px;
            top: 45px;
        }
        .auto-style6 {
            width: 227px;
            height: 27px;
            position: absolute;
            C: \Users\Cristinita\Documents\GitHub\HADS\Laboratorios\Labortaorio2\Lab2\TareasProfesor.aspx left: 79px;
            top: 161px;
            left: 72px;
        }
        .auto-style7 {
            width: 1213px;
            height: 266px;
            position: absolute;
            left: 85px;
            top: 509px;
        }
        .auto-style8 {
            width: 131px;
            height: 29px;
            position: absolute;
            left: 112px;
            top: 205px;
        }
        .auto-style9 {
            width: 242px;
            height: 81px;
            position: absolute;
            left: 124px;
            top: 334px;
            right: 1351px;
        }
        .auto-style10 {
            width: 272px;
            height: 31px;
            position: absolute;
            left: 81px;
            top: 59px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Panel ID="Panel1" runat="server" BackColor="#00FFCC" Height="109px">
                <div class="auto-style4">
                    <span class="auto-style2"><strong>
                    <br />
                    </strong>
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style10" NavigateUrl="~/Profesores/Profesores.aspx">Volver al menú principal</asp:HyperLink>
                    <strong>PROFESOR</strong></span><strong><br class="auto-style2" /> </strong><span class="auto-style2"><strong>GESTIÓN DE TAREAS GENÉRICAS</strong><asp:LinkButton ID="b_cerrarSesion" runat="server" CssClass="auto-style5" Font-Size="Large">Cerrar sesión</asp:LinkButton>
                    </span>
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style6" Text="Seleccionar asignatura:"></asp:Label>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style7" DataKeyNames="Codigo" DataSourceID="GridView_datos" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                            <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                            <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                            <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                            <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
                        </Columns>
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
                    <asp:SqlDataSource ID="GridView_datos" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT TareasGenericas.Codigo, TareasGenericas.CodAsig, TareasGenericas.Descripcion, TareasGenericas.Explotacion, TareasGenericas.HEstimadas, TareasGenericas.TipoTarea FROM ((TareasGenericas INNER JOIN GruposClase ON TareasGenericas.CodAsig=GruposClase.codigoasig) INNER JOIN ProfesoresGrupo ON GruposClase.codigo=ProfesoresGrupo.codigogrupo) WHERE ProfesoresGrupo.email=@profesor and TareasGenericas.CodAsig=@asignatura" UpdateCommand="UPDATE TareasGenericas SET Descripcion=@Descripcion,CodAsig=@CodAsig,HEstimadas=@HEstimadas,Explotacion=@Explotacion,TipoTarea=@TipoTarea WHERE Codigo=@Codigo">
                        <SelectParameters>
                            <asp:SessionParameter Name="profesor" SessionField="email" />
                            <asp:ControlParameter ControlID="DropDownList1" Name="asignatura" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Descripcion" />
                            <asp:Parameter Name="CodAsig" />
                            <asp:Parameter Name="HEstimadas" />
                            <asp:Parameter Name="Explotacion" />
                            <asp:Parameter Name="TipoTarea" />
                            <asp:Parameter Name="Codigo" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style8"  AutoPostBack="True" DataSourceID="ddl_datos" DataTextField="codigoasig" DataValueField="codigoasig">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ddl_datos" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.email = @email AND ProfesoresGrupo.codigogrupo = GruposClase.codigo">
                        <SelectParameters>
                            <asp:SessionParameter Name="email" SessionField="email" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="b_insertar" runat="server" BackColor="#009933" CssClass="auto-style9" Text="Insertar nueva tarea" />
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
