Public Class ExportarXML
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub b_exportarXML_Click(sender As Object, e As EventArgs) Handles b_exportarXML.Click
        ' Hay que tener en cuenta el ColumnMapping para los atributos
        ' Hay que cambiar los nombres para que coincidan
        ' 
        Dim xd As New XmlDocument
        xd.Load(Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml"))
        Dim Tareas As XmlNodeList
        Tareas = xd.GetElementsByTagName("tarea")
        For Each tarea As XmlNode In Tareas
            Dim nuevafila = dt.NewRow()
            nuevafila("Codigo") = tarea.Attributes(0).Value
            nuevafila("Descripcion") = tarea.ChildNodes(0).ChildNodes(0).Value
            nuevafila("CodAsig") = ddl_asignaturas.SelectedValue
            nuevafila("HEstimadas") = tarea.ChildNodes(1).ChildNodes(0).Value
            nuevafila("Explotacion") = tarea.ChildNodes(2).ChildNodes(0).Value
            nuevafila("TipoTarea") = tarea.ChildNodes(3).ChildNodes(0).Value
        Next
    End Sub
End Class