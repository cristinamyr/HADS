Imports AccesoBD.AccesoSqlBD

Public Class TareasAlumnos
    Inherits System.Web.UI.Page

    Private dataSet As DataSet
    Private dataView As DataView
    Private dataTable As DataTable

    Dim tbTareasAsig As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim email = Session.Contents("email")
            Session.Contents("DataSet") = buscarTareasAlumnoPorEmail(email)
            dataSet = Session.Contents("DataSet")
            dataTable = dataSet.Tables("TareasG")

            ddl_alumnos.DataSource = dataTable
            ddl_alumnos.DataValueField = "CodAsig"
            ddl_alumnos.DataBind()

            dataView = New DataView(dataTable)
            dataView.RowFilter = "CodAsig='" & ddl_alumnos.SelectedValue & "'"
            tablaAlumnos.DataSource = dataView
            tablaAlumnos.DataBind()
        Else
            dataSet = Session.Contents("DataSet")
        End If
    End Sub

    Protected Sub ddl_alumnos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_alumnos.SelectedIndexChanged
        dataView.RowFilter = "CodAsig='" & ddl_alumnos.SelectedValue & "'"
        tablaAlumnos.DataSource = dataView
        tablaAlumnos.DataBind()
    End Sub

    Protected Sub l_cerrarSesion_Click(sender As Object, e As EventArgs) Handles l_cerrarSesion.Click
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub
End Class