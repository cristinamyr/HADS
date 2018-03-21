Imports System.Xml
Imports AccesoBD.AccesoSqlBD
Imports AccesoBD.AccesoBD

Public Class ImportarXML
    Inherits System.Web.UI.Page
    Private ds As New DataSet
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Xml1.DocumentSource = Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml")
        Xml1.DocumentSource = Server.MapPath("App_Data/XSLTFile.xsl")
        If Not Page.IsPostBack Then
            conectarBD()
            Dim ds = buscarTareasProfesor(Session.Contents("email"))
            Dim dt = ds.Tables(0)
            Session.Contents("ds") = ds
        Else
            ds = Session.Contents("ds")
            dt = ds.Tables(0)
        End If

    End Sub

    Protected Sub b_importar_Click(sender As Object, e As EventArgs) Handles b_importar.Click
        conectar()
        Dim da = obtenerTodasLasTareas()
        cerrarconexion()
        Dim xd As New XmlDocument
        xd.Load(Server.MapPath(ddl_asignaturas.SelectedValue & ".xml"))
        Dim Tareas As XmlNodeList
        Tareas = xd.GetElementsByTagName("tarea")
        Dim i As Integer
        For i = 0 To Tareas.Count - 1
            Dim nuevafila = dt.NewRow()
            nuevafila("Codigo") = Tareas(i).Attributes(0).Name
            nuevafila("Descripcion") = Tareas(i).ChildNodes(0).Value
            nuevafila("CodAsig") = ddl_asignaturas.SelectedValue
            nuevafila("HEstimadas") = Tareas(i).ChildNodes(1).Value
            nuevafila("Explotacion") = Tareas(i).ChildNodes(2).Value
            nuevafila("TipoTarea") = Tareas(i).ChildNodes(3).Value

            Try
                dt.Rows.InsertAt(nuevafila, dt.Rows.Count + 1) 'añadimos la nueva fila en DT
                da.Update(ds, "TareasGenericas") 'refrescamos el DA
                ds.AcceptChanges() 'IMPORTANTE HACERLO!!

                MsgBox("Añadido")
                ' l_retroalimentacion.Text = "La tarea se ha añadido correctamente!!"
            Catch ex As Exception
                MsgBox("Error")
                'l_retroalimentacion.Text = "ERROR: " + ex.Message
            End Try
        Next

    End Sub

    Protected Sub ddl_asignaturas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_asignaturas.SelectedIndexChanged

    End Sub
End Class