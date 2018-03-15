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
            height: 27px;
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
                            </strong><span class="auto-style9"><strong>Profesores</strong></span></div>
                    </asp:Panel>
                    <asp:HyperLink ID="h_asignaturas" runat="server" CssClass="auto-style5">Asignaturas</asp:HyperLink>
                    <asp:HyperLink ID="h_tareas" runat="server" CssClass="auto-style6" NavigateUrl="~/TareasProfesor.aspx">Tareas</asp:HyperLink>
                    <asp:HyperLink ID="h_grupos" runat="server" CssClass="auto-style7">Grupos</asp:HyperLink>
                </asp:Panel>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
