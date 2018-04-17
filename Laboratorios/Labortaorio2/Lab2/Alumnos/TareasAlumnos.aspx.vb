Imports AccesoBD.AccesoSqlBD

Public Class TareasAlumnos
    Inherits System.Web.UI.Page

    Private dataSet As New DataSet
    Private dataSet2 As New DataSet
    Private dataView As New DataView
    Private dataTable As New DataTable
    Private dataTable2 As New DataTable

    Dim tbTareasAsig As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim email = Session.Contents("email")
            conectarBD()
            Session.Contents("DataSet") = buscarTareasAlumnoPorEmail(email)
            dataSet = Session.Contents("DataSet")
            dataTable = dataSet.Tables("TareasGenericas")

            dataSet2 = buscarAsignaturasAlumnoPorEmail(email)
            dataTable2 = dataSet2.Tables("GruposClase")

            ddl_alumnos.DataSource = dataTable2
            ddl_alumnos.DataValueField = "codigoasig"
            ddl_alumnos.DataBind()
        End If

        dataSet = Session.Contents("DataSet")
        dataTable = dataSet.Tables(0)
        dataView = New DataView(dataTable)
        dataView.RowFilter = "CodAsig='" & ddl_alumnos.SelectedValue & "'"
        tablaAlumnos.DataSource = dataView
        tablaAlumnos.DataBind()
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        desconectar()
    End Sub

    Protected Sub l_cerrarSesion_Click(sender As Object, e As EventArgs) Handles l_cerrarSesion.Click
        Session.RemoveAll()
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
    End Sub

    Protected Sub TablaAlumnos_Sorting(sender As Object, e As GridViewSortEventArgs) Handles tablaAlumnos.Sorting
        dataView.Sort = e.SortExpression
        tablaAlumnos.DataSource = dataView
        tablaAlumnos.DataBind()
    End Sub

    Protected Sub tablaAlumnos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles tablaAlumnos.SelectedIndexChanged
        Dim nombreTarea = tablaAlumnos.Rows(tablaAlumnos.SelectedIndex).Cells(0).ToString()
        Dim estimacion = tablaAlumnos.Rows(tablaAlumnos.SelectedIndex).Cells(3).ToString()

        Response.Redirect("InstanciarTarea.aspx?nomTarea=" & nombreTarea & "&estimacion=" & estimacion & "")
    End Sub

    Protected Sub ddl_alumnos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_alumnos.SelectedIndexChanged

    End Sub
End Class