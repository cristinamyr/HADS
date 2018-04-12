<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AdministrarUsuarios.aspx.vb" Inherits="Lab2.AdministrarUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 1026px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            font-size: smaller;
        }
        .auto-style5 {
            width: 143px;
            height: 31px;
            position: absolute;
            left: 1430px;
            top: 55px;
        }
        .auto-style6 {
            width: 279px;
            height: 27px;
            position: absolute;
            left: 106px;
            top: 56px;
        }
        .auto-style7 {
            width: 289px;
            height: 180px;
            position: absolute;
            left: 158px;
            top: 292px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Panel ID="Panel1" runat="server" BackColor="#9933FF" Height="111px">
                <div class="auto-style2">
                    <strong><span class="auto-style4">&nbsp;</span><span class="auto-style3"><br /> ADMINISTRADORES</span></strong><strong><br class="auto-style3" /> </strong><span class="auto-style3"><strong>GESTIÓN DE USUARIOS</strong><asp:LinkButton ID="b_cerrarSesion" runat="server" CssClass="auto-style5">Cerrar sesión</asp:LinkButton>
                    </span>
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style6" NavigateUrl="~/Admin/Admin.aspx">Volver al menú principal</asp:HyperLink>
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style7" DataKeyNames="email" DataSourceID="source_gview">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                            <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                            <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
                            <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="source_gview" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" DeleteCommand="DELETE FROM Usuarios WHERE email=@email" SelectCommand="SELECT nombre,apellidos,email,tipo FROM Usuarios WHERE not email='admin@ehu.es'">
                        <DeleteParameters>
                            <asp:Parameter Name="email" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
