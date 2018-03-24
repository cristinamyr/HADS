Imports System.Xml
Imports AccesoBD.AccesoBD
Imports AccesoBD.AccesoSqlBD

Public Class ExportarXML
    Inherits System.Web.UI.Page

    Private dataView As New DataView
    Private dataTable As New DataTable
    Private dset As New DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        dset = New DataSet
        dataTable = New DataTable
        dataView = New DataView
        If Not Page.IsPostBack Then
            Dim email = Session.Contents("email")
            conectarBD()
            Session.Contents("DataSet") = buscarTareas()
        End If

        dset = Session.Contents("DataSet")
        dataTable = dset.Tables(0)
        dataView = New DataView(dataTable)
        dataView.RowFilter = "CodAsig='" & ddl_asignaturas.SelectedValue & "'"
        MsgBox(dataTable.Columns.Count)
        tareas_view.DataSource = dataView
        tareas_view.DataBind()

    End Sub

    Protected Sub b_exportarXML_Click(sender As Object, e As EventArgs) Handles b_exportarXML.Click
        Dim xd As New XmlDocument


        Try
            xd.Load(Server.MapPath("App_Data/" & ddl_asignaturas.SelectedValue & ".xml"))
            'aquí va todo lo del write
            xd.Save(Server.MapPath("./App_Data/" & ddl_asignaturas.SelectedValue & ".xml"))
        Catch ex As Exception
            MsgBox("ups!")
        End Try

    End Sub

    Protected Sub ddl_asignaturas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_asignaturas.SelectedIndexChanged

    End Sub

End Class