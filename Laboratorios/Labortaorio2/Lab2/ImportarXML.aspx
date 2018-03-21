<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarXML.aspx.vb" Inherits="Lab2.ImportarXML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:DropDownList ID="ddl_asignaturas" AutoPostBack="True" runat="server" DataSourceID="ddl_datos" style="top: 157px; left: 35px; position: absolute; height: 25px; width: 112px">
        </asp:DropDownList>
        <asp:Button ID="b_importar" runat="server" style="top: 306px; left: 32px; position: absolute; height: 29px; width: 219px; margin-top: 0px" Text="IMPORTAR (XMLD)" />
        <asp:Xml ID="Xml1" runat="server"></asp:Xml>
                    <asp:SqlDataSource ID="ddl_datos" runat="server" ConnectionString="<%$ ConnectionStrings:HADS10-TAREASConnectionString %>" SelectCommand="SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.email = @email AND ProfesoresGrupo.codigogrupo = GruposClase.codigo">
                        <SelectParameters>
                            <asp:SessionParameter Name="email" SessionField="email" />
                        </SelectParameters>
                    </asp:SqlDataSource>
    </form>
</body>
</html>
