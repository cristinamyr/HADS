Imports AccesoBD.AccesoSqlBD

Public Class TareasAlumnos
    Inherits System.Web.UI.Page

    Private dataSet As DataSet
    Private dataSet2 As DataSet
    Private dataView As DataView
    Private dataTable As DataTable
    Private dataTable2 As DataTable

    Dim tbTareasAsig As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
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

            dataView = New DataView(dataTable)
            dataView.RowFilter = "CodAsig='" & ddl_alumnos.SelectedValue & "'"
            tablaAlumnos.DataSource = dataView
            tablaAlumnos.DataBind()
        Else
            dataSet = Session.Contents("DataSet")
            dataTable = dataSet.Tables("TareasGenericas")
            dataView = New DataView(dataTable)
            dataView.RowFilter = "CodAsig='" & ddl_alumnos.SelectedValue & "'"
            tablaAlumnos.DataSource = dataView
            tablaAlumnos.DataBind()

        End If
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        desconectar()
    End Sub

    Protected Sub l_cerrarSesion_Click(sender As Object, e As EventArgs) Handles l_cerrarSesion.Click
        Session.RemoveAll()
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub

    Protected Sub TablaAlumnos_Sorting(sender As Object, e As GridViewSortEventArgs) Handles tablaAlumnos.Sorting
        dataView.Sort = e.SortExpression
        tablaAlumnos.DataSource = dataView.ToTable
        tablaAlumnos.DataBind()
    End Sub

    Protected Sub tablaAlumnos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles tablaAlumnos.SelectedIndexChanged
        '("heeeyyyy")
        Dim nombreTarea = dataTable.Rows(tablaAlumnos.SelectedIndex).Item(0).ToString()
        Dim estimacion = dataTable.Rows(tablaAlumnos.SelectedIndex).Item(3).ToString()
        ' MsgBox("hola")
        'Dim direccion = "InstanciarTarea.aspx?nomTarea=" & nombreTarea & "&estimacion=" & estimacion

        Response.Redirect("InstanciarTarea.aspx?nomTarea=" & nombreTarea & "&estimacion=" & estimacion & "")
    End Sub

    Protected Sub ddl_alumnos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_alumnos.SelectedIndexChanged

    End Sub
End Class