<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarXML.aspx.vb" Inherits="Lab2.ImportarXML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            top: 157px;
            left: 35px;
            position: absolute;
            height: 25px;
            width: 162px;
        }
        .auto-style2 {
            width: 757px;
            height: 27px;
            position: absolute;
            left: 31px;
            top: 367px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:DropDownList ID="ddl_asignaturas" AutoPostBack="True" runat="server" DataSourceID="datos_ddl" CssClass="auto-style1" DataTextField="codigoasig" DataValueField="codigoasig">
        </asp:DropDownList>
        <asp:SqlDataSource ID="datos_ddl" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.email = @email AND ProfesoresGrupo.codigogrupo = GruposClase.codigo">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="b_importar" runat="server" style="top: 306px; left: 32px; position: absolute; height: 29px; width: 219px; margin-top: 0px" Text="IMPORTAR (XMLD)" />
        <asp:Xml ID="Xml1" runat="server"></asp:Xml>
        <asp:Label ID="l_retroalimentacion" runat="server" CssClass="auto-style2" Text=" "></asp:Label>
    </form>
</body>
</html>
