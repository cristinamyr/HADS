<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InsertarTarea.aspx.vb" Inherits="Lab2.InsertarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 833px;
        }
        .auto-style3 {
            width: 86px;
            height: 31px;
            position: absolute;
            left: 119px;
            top: 179px;
        }
        .auto-style4 {
            width: 188px;
            height: 29px;
            position: absolute;
            left: 250px;
            top: 177px;
        }
        .auto-style5 {
            width: 120px;
            height: 27px;
            position: absolute;
            left: 82px;
            top: 252px;
        }
        .auto-style6 {
            width: 571px;
            height: 139px;
            position: absolute;
            left: 252px;
            top: 244px;
        }
        .auto-style7 {
            width: 104px;
            height: 27px;
            position: absolute;
            left: 91px;
            top: 448px;
        }
        .auto-style8 {
            width: 131px;
            height: 29px;
            position: absolute;
            left: 242px;
            top: 448px;
        }
        .auto-style9 {
            width: 173px;
            height: 27px;
            position: absolute;
            left: 34px;
            top: 525px;
        }
        .auto-style10 {
            width: 76px;
            height: 29px;
            position: absolute;
            left: 239px;
            top: 524px;
        }
        .auto-style11 {
            width: 113px;
            height: 27px;
            position: absolute;
            left: 87px;
            top: 594px;
        }
        .auto-style12 {
            width: 131px;
            height: 29px;
            position: absolute;
            left: 236px;
            top: 594px;
        }
        .auto-style13 {
            width: 412px;
            height: 120px;
            position: absolute;
            left: 168px;
            top: 683px;
        }
        .auto-style14 {
            width: 669px;
            height: 262px;
            position: absolute;
            left: 968px;
            top: 165px;
        }
        .auto-style15 {
            width: 105px;
            height: 27px;
            position: absolute;
            left: 654px;
            top: 735px;
        }
        .auto-style16 {
            width: 369px;
            height: 27px;
            position: absolute;
            left: 189px;
            top: 810px;
        }
        .auto-style17 {
            text-align: center;
        }
        .auto-style18 {
            width: 21px;
            height: 27px;
            position: absolute;
            left: 456px;
            top: 180px;
        }
        .auto-style19 {
            width: 34px;
            height: 36px;
            position: absolute;
            left: 834px;
            top: 301px;
        }
        .auto-style20 {
            width: 29px;
            height: 27px;
            position: absolute;
            left: 334px;
            top: 527px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Panel ID="Panel1" runat="server" BackColor="#00CC99" Height="113px">
                <div class="auto-style17">
                    <br />
                    PROFESOR<br /> GESTIÓN DE TAREAS GENÉRICAS<asp:Label ID="Label1" runat="server" CssClass="auto-style3" Text="Código:"></asp:Label>
                    <asp:RequiredFieldValidator ID="req_codigo" runat="server" ControlToValidate="t_codigo" CssClass="auto-style18" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="t_codigo" runat="server" CssClass="auto-style4"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" CssClass="auto-style5" Text="Descripción:"></asp:Label>
                    <asp:TextBox ID="t_descripcion" runat="server" CssClass="auto-style6"></asp:TextBox>
                    <asp:Label ID="Label3" runat="server" CssClass="auto-style7" Text="Asignatura:"></asp:Label>
                    <asp:DropDownList ID="ddl_asignatura" runat="server" CssClass="auto-style8" DataSourceID="asig_datos" DataTextField="codigoasig" DataValueField="codigoasig">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="asig_datos" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.email = @email AND ProfesoresGrupo.codigogrupo = GruposClase.codigo">
                        <SelectParameters>
                            <asp:SessionParameter Name="email" SessionField="email" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="ddl_tipoTarea" runat="server" CssClass="auto-style12" DataSourceID="tipoTarea_datos" DataTextField="TipoTarea" DataValueField="TipoTarea">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="tipoTarea_datos" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT DISTINCT [TipoTarea] FROM [TareasGenericas]"></asp:SqlDataSource>
                    <asp:HyperLink ID="l_volver" runat="server" CssClass="auto-style15" NavigateUrl="~/Profesores/TareasProfesor.aspx">Ver tareas</asp:HyperLink>
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" CssClass="auto-style14" ForeColor="#333333" GridLines="None" DataSourceID="GV_datos">
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
                    <asp:SqlDataSource ID="GV_datos" runat="server"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="t_estimacion" CssClass="auto-style20" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="req_desc" runat="server" ControlToValidate="t_descripcion" CssClass="auto-style19" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="l_retroalimentacion" runat="server" CssClass="auto-style16" Text=" "></asp:Label>
                    <asp:Button ID="b_insertar" runat="server" BackColor="#99FFCC" CssClass="auto-style13" Text="Insertar nueva tarea" />
                    <asp:Label ID="Label5" runat="server" CssClass="auto-style11" Text="Tipo tarea:"></asp:Label>
                    <asp:Label ID="Label4" runat="server" CssClass="auto-style9" Text="Horas estimadas:"></asp:Label>
                    <asp:TextBox ID="t_estimacion" runat="server" CssClass="auto-style10"></asp:TextBox>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
