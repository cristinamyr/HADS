Imports AccesoBD.AccesoSqlBD
Imports Newtonsoft.Json
Imports System.IO
Imports System.Xml

Public Class ExportarXML
    Inherits System.Web.UI.Page

    Private dataView As New DataView
    Private dataTable As New DataTable
    Private dset As New DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub b_exportarXML_Click(sender As Object, e As EventArgs) Handles b_exportarXML.Click
        verTareas()
        Dim datast As New DataSet
        Dim datatab As New DataTable
        datatab = dataView.ToTable
        datatab.Columns.Remove("CodAsig")
        datatab.Columns(0).ColumnMapping = MappingType.Attribute
        datatab.TableName = "tarea"
        For Each col As DataColumn In datatab.Columns
            col.ColumnName = col.ColumnName.ToLower
        Next
        datast.Tables.Add(datatab)
        datast.DataSetName = "tareas"

        datast.WriteXml(Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml"))

        Dim xd As New XmlDocument
        xd.Load(Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml"))
        xd.DocumentElement.SetAttribute("xmlns:" & ddl_asignaturas.SelectedValue.ToLower, "http://ji.ehu.es/" & ddl_asignaturas.SelectedValue.ToLower)
        xd.Save((Server.MapPath("./App_Data/" & ddl_asignaturas.SelectedValue & ".xml")))
        l_retroalimentacion.Text = "Exportación completada."


    End Sub

    Protected Sub verTareas()
        If Not Page.IsPostBack Then
            Dim email = Session.Contents("email")
            conectarBD()
            Session.Contents("DataSet") = buscarTareas()
        End If

        dset = Session.Contents("DataSet")
        dataTable = dset.Tables(0)
        dataView = New DataView(dataTable)
        dataView.RowFilter = "CodAsig='" & ddl_asignaturas.SelectedValue & "'"
        tareas_view.DataSource = dataView
        tareas_view.DataBind()
        l_retroalimentacion.Text = ""

    End Sub


    Protected Sub ddl_asignaturas_DataBound(sender As Object, e As EventArgs) Handles ddl_asignaturas.DataBound
        ddl_asignaturas.SelectedValue = ddl_asignaturas.Items.Item(0).Text
        verTareas()
    End Sub

    Protected Sub ddl_asignaturas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_asignaturas.SelectedIndexChanged
        verTareas()
    End Sub

    Protected Sub l_cerrarSesion_Click(sender As Object, e As EventArgs) Handles l_cerrarSesion.Click
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
    End Sub

    Protected Sub b_expJson_Click(sender As Object, e As EventArgs) Handles b_expJson.Click
        Dim dt As New DataTable
        dt.Columns.Add("codigo")
        dt.Columns.Add("descripcion")
        dt.Columns.Add("hestimadas")
        dt.Columns.Add("explotacion")
        dt.Columns.Add("tipotarea")

        For Each row As GridViewRow In tareas_view.Rows
            Dim nuevafila = dt.NewRow()
            nuevafila("codigo") = row.Cells(0).Text
            nuevafila("descripcion") = row.Cells(1).Text
            nuevafila("hestimadas") = row.Cells(3).Text
            nuevafila("explotacion") = row.Cells(4).Text
            nuevafila("tipotarea") = row.Cells(5).Text
            dt.Rows.Add(nuevafila)
        Next

        Try
            Dim documentoJson = JsonConvert.SerializeObject(dt)
            File.WriteAllText(Server.MapPath(("./App_Data/" & ddl_asignaturas.SelectedValue & ".json")), documentoJson.ToString())
            l_retroalimentacion.Text = "Tareas exportadas"
        Catch ex As Exception
            l_retroalimentacion.Text = "No se han podido exportar las tareas. -->" & ex.Message
        End Try
    End Sub
End Class