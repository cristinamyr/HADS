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
            ds = buscarTareas()
            dt = ds.Tables(0)
            Session.Contents("ds") = ds
        Else
            ds = Session.Contents("ds")
            dt = ds.Tables(0)
        End If

    End Sub

    Protected Sub b_importar_Click(sender As Object, e As EventArgs) Handles b_importar.Click

        Dim dap As SqlDataAdapter
        dap = obtenerTodasLasTareas()
        Dim commandBuilder As New SqlCommandBuilder(dap)
        Try
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


                dt.Rows.Add(nuevafila)

            Next
        Catch ex As Exception
            l_retroalimentacion.Text = "Solo se han insertado las tareas no repetidas."
        End Try
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

    Protected Sub verTareas(ByVal nombre As String)
        If File.Exists(Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml")) Then
            Xml1.DocumentSource = Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/" & nombre & ".xsl")
            b_importar.Enabled = True
            l_retroalimentacion.Text = ""
        Else
            l_retroalimentacion.Text = "Esa asignatura no tiene el correspondiente XML para poder añadir asignaturas."
            b_importar.Enabled = False
        End If
    End Sub

    Protected Sub ddl_asignaturas_DataBound(sender As Object, e As EventArgs) Handles ddl_asignaturas.DataBound
        ddl_asignaturas.SelectedValue = ddl_asignaturas.Items.Item(0).Text
        verTareas("XSLTFile")
    End Sub

    Protected Sub ddl_asignaturas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_asignaturas.SelectedIndexChanged
        verTareas("XSLTFile")
    End Sub

    Protected Sub b_cerrarSesion_Click(sender As Object, e As EventArgs) Handles b_cerrarSesion.Click
        Session.Abandon()
        Application.Contents("numProfes") = Application.Contents("numProfes") - 1
        Application.Contents("emailProfes").Items.Remove(Session.Contents("email"))
        System.Web.Security.FormsAuthentication.SignOut()
    End Sub

    Protected Sub b_horas_Click(sender As Object, e As EventArgs) Handles b_horas.Click
        verTareas("ordenHorasXSL")
    End Sub

    Protected Sub b_descr_Click(sender As Object, e As EventArgs) Handles b_descr.Click
        verTareas("ordenDescripcionXSL")
    End Sub

    Protected Sub b_codigo_Click1(sender As Object, e As EventArgs) Handles b_codigo.Click
        verTareas("ordenCodigoXSL")
    End Sub
End Class