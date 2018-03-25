Imports System.Xml
Imports AccesoBD.AccesoSqlBD
Imports AccesoBD.AccesoBD
Imports System.IO
Imports System.Data.SqlClient

Public Class ImportarXML
    Inherits System.Web.UI.Page
    Private ds As New DataSet
    Private dt As New DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            conectarBD()
            Dim ds = buscarTareas()
            Dim dt = ds.Tables(0)
            Session.Contents("ds") = ds
        Else
            ds = Session.Contents("ds")
            dt = ds.Tables(0)
        End If

        If File.Exists(Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml")) Then
            Xml1.DocumentSource = Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
            b_importar.Enabled = True
            l_retroalimentacion.Text = ""
        Else
            l_retroalimentacion.Text = "Esa asignatura no tiene el correspondiente XML para poder añadir asignaturas."
            b_importar.Enabled = False
        End If

    End Sub

    Protected Sub b_importar_Click(sender As Object, e As EventArgs) Handles b_importar.Click

        Dim dap As SqlDataAdapter
        dap = obtenerTodasLasTareas()
        Dim commandBuilder As New SqlCommandBuilder(dap)

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

            Try
                dt.Rows.Add(nuevafila)
            Catch ex As Exception
                l_retroalimentacion.Text = "Solo se han insertado las tareas no repetidas."
            End Try
        Next
        Try
            dap.Update(ds, "TareasGenericas")
            ds.AcceptChanges()
        Catch ex As Exception
            l_retroalimentacion.Text = "Hay tareas repetidas, revise el documento para poder añadir las tareas que desea."
        End Try


        If (l_retroalimentacion.Text = "") Then
            l_retroalimentacion.Text = "Tareas añadidas correctamente!"
        End If

    End Sub

    Protected Sub ddl_asignaturas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_asignaturas.SelectedIndexChanged
        If File.Exists(Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml")) Then
            Xml1.DocumentSource = Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
            b_importar.Enabled = True
        Else
            l_retroalimentacion.Text = "Esa asignatura no tiene el correspondiente XML para poder añadir asignaturas."
            b_importar.Enabled = False
        End If
    End Sub

    Protected Sub b_cerrarSesion_Click(sender As Object, e As EventArgs) Handles b_cerrarSesion.Click
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub
End Class