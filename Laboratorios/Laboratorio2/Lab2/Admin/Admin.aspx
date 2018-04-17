<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Admin.aspx.vb" Inherits="Lab2.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1406px;
            height: 869px;
            position: absolute;
            left: 274px;
            top: 18px;
            text-align: center;
        }
        .auto-style2 {
            font-size: xx-large;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 249px;
            height: 27px;
            position: absolute;
            left: 15px;
            top: 125px;
        }
        .auto-style5 {
            width: 127px;
            height: 27px;
            position: absolute;
            left: 1504px;
            top: 50px;
        }
    </style>
</head>
<body style="height: 878px">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" BackColor="#9966FF" Height="873px" Width="256px">
            <asp:Panel ID="Panel2" runat="server" BackColor="#9966FF" CssClass="auto-style1">
                <div class="auto-style3">
                    <span class="auto-style2"><strong>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    Gesión Web</strong></span><strong><br class="auto-style2" /> </strong><span class="auto-style2"><strong>Administradores</strong></span></div>
            </asp:Panel>
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style4" NavigateUrl="~/Admin/AdministrarUsuarios.aspx">Administrar Usuarios</asp:HyperLink>
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="auto-style5">Cerrar sesión</asp:LinkButton>
        </asp:Panel>
    </form>
    </body>
</html>
