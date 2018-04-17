Imports System.Data.SqlClient
Imports System.IO
Imports AccesoBD.AccesoSqlBD
Imports AccesoBD.AccesoBD

Public Class ImportarDataSet
    Inherits System.Web.UI.Page
    Private ds As New DataSet
    Private dt As New DataTable
    Private dap As New SqlDataAdapter
    Private data As New DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            conectarBD()
            Dim ds = buscarTareas()
            Dim dt = ds.Tables(0)
            Session.Contents("ds") = ds
            dap = obtenerTodasLasTareas()
            dap.Fill(ds, "TareasGenericas")
            ds.AcceptChanges()
            Session.Contents("dap") = dap
        Else
            ds = Session.Contents("ds")
            dt = ds.Tables(0)
            dap = Session.Contents("dap")
        End If
    End Sub

    Protected Sub verTareas()
        If File.Exists(Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml")) Then
            data.ReadXml(Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml"))
            Dim columna As New DataColumn
            columna.ColumnName = "CodAsig"
            columna.DefaultValue = ddl_asignaturas.SelectedValue
            data.Tables(0).Columns.Add(columna)
            tabla_asignaturas.DataSource = data.Tables(0)
            tabla_asignaturas.DataBind()
            b_importar.Enabled = True
            l_retroalimentacion.Text = ""
        Else
            l_retroalimentacion.Text = "Esa asignatura no tiene el correspondiente XML para poder añadir asignaturas."
            b_importar.Enabled = False
        End If
    End Sub

    Protected Sub ddl_asignaturas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_asignaturas.SelectedIndexChanged
        verTareas()
    End Sub

    Protected Sub ddl_asignaturas_DataBound(sender As Object, e As EventArgs) Handles ddl_asignaturas.DataBound
        ddl_asignaturas.SelectedValue = ddl_asignaturas.Items.Item(0).Text
        verTareas()
    End Sub

    Protected Sub b_cerrarSesion_Click(sender As Object, e As EventArgs) Handles b_cerrarSesion.Click
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
    End Sub

    Protected Sub b_importar_Click(sender As Object, e As EventArgs) Handles b_importar.Click
        verTareas()
        Try
            Dim commandbldr As New SqlCommandBuilder(dap)
            ds.Merge(data)
            MsgBox(ds.Tables(0).Rows.Count)
            dap.Update(data.Tables(0))
            ds.AcceptChanges()
            dap.Fill(data)
            Session.Contents("dap") = dap
            Session.Contents("ds") = ds
            l_retroalimentacion.Text = "Tareas añadidas correctamente!"
        Catch ex As Exception
            l_retroalimentacion.Text = "Parece que has intentado añadir una tarea que ya existia en la base de datos..."
        End Try
    End Sub
End Class