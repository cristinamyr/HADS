<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="Lab2.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 861px;
        }
        .auto-style2 {
            text-align: center;
            height: 120px;
        }
        .auto-style4 {
            font-size: large;
        }
        .auto-style5 {
            width: 93px;
            height: 27px;
            position: absolute;
            left: 186px;
            top: 203px;
        }
        .auto-style6 {
            width: 55px;
            height: 27px;
            position: absolute;
            left: 206px;
            top: 265px;
        }
        .auto-style7 {
            width: 191px;
            height: 27px;
            position: absolute;
            left: 91px;
            top: 321px;
        }
        .auto-style8 {
            width: 144px;
            height: 27px;
            position: absolute;
            left: 128px;
            top: 382px;
        }
        .auto-style9 {
            width: 391px;
            height: 112px;
            position: absolute;
            left: 168px;
            top: 493px;
        }
        .auto-style10 {
            width: 330px;
            height: 29px;
            position: absolute;
            left: 307px;
            top: 198px;
        }
        .auto-style11 {
            width: 329px;
            height: 29px;
            position: absolute;
            left: 305px;
            top: 264px;
        }
        .auto-style12 {
            width: 188px;
            height: 29px;
            position: absolute;
            left: 305px;
            top: 322px;
        }
        .auto-style13 {
            width: 188px;
            height: 29px;
            position: absolute;
            left: 305px;
            top: 384px;
        }
        .auto-style14 {
            width: 105px;
            height: 27px;
            position: absolute;
            left: 616px;
            top: 526px;
        }
        .auto-style15 {
            width: 194px;
            height: 26px;
            position: absolute;
            left: 1740px;
            top: 79px;
        }
        .auto-style16 {
            width: 508px;
            height: 346px;
            position: absolute;
            left: 1051px;
            top: 192px;
        }
        .auto-style17 {
            width: 330px;
            height: 27px;
            position: absolute;
            left: 193px;
            top: 625px;
        }
        .auto-style18 {
            width: 34px;
            height: 39px;
            position: absolute;
            left: 505px;
            top: 385px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Panel ID="Panel1" runat="server" BackColor="#66CCFF" Height="122px">
                <div class="auto-style2">
                    <strong><span class="auto-style4">
                    <br />
                    ALUMNOS</span><br class="auto-style4" /> <span class="auto-style4">INSTANCIAR LA TAREA GENÉRICA</span></strong><asp:LinkButton ID="lb_cerrarSesion" runat="server" CssClass="auto-style15">Cerrar sesión</asp:LinkButton>
                    <br class="auto-style4" />
                    <asp:Label ID="l_usuario" runat="server" CssClass="auto-style5" Text="Usuario:"></asp:Label>
                    <asp:Label ID="l_tarea" runat="server" CssClass="auto-style6" Text="Tarea:"></asp:Label>
                    <asp:Label ID="l_hest" runat="server" CssClass="auto-style7" Text="Horas estimadas:"></asp:Label>
                    <asp:Label ID="l_hreal" runat="server" CssClass="auto-style8" Text="Horas reales:"></asp:Label>
                    <asp:Button ID="b_instanciar" runat="server" BackColor="#0099FF" CssClass="auto-style9" Text="Instanciar tarea" />
                    <asp:TextBox ID="t_usuario" runat="server" CssClass="auto-style10" Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="t_tarea" runat="server" CssClass="auto-style11" Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="t_hest" runat="server" CssClass="auto-style12" Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="t_hreal" runat="server" CssClass="auto-style13"></asp:TextBox>
                    <asp:HyperLink ID="h_volver" runat="server" CssClass="auto-style14" NavigateUrl="~/Alumnos/TareasAlumnos.aspx">Ver Tareas</asp:HyperLink>
                    <asp:GridView ID="TareasAlumno" runat="server" CssClass="auto-style16" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                    <asp:Label ID="l_retroalimentacion" runat="server" CssClass="auto-style17" Text="  "></asp:Label>
                    <asp:RequiredFieldValidator ID="req_hreal" runat="server" ControlToValidate="t_hreal" CssClass="auto-style18" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
