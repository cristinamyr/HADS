Imports AccesoBD.AccesoBD
Imports System.Data.SqlClient

Public Class InsertarTarea
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub b_insertar_Click(sender As Object, e As EventArgs) Handles b_insertar.Click
        Dim DataSet As New DataSet
        Dim DataTable As New DataTable
        Dim DataAdapter As New SqlDataAdapter

        conectar()
        DataAdapter = obtenerTodasLasTareas()
        cerrarconexion()

        DataAdapter.Fill(DataSet, "TareasGenericas") 'añadimos las tareas en el DS
        DataTable = DataSet.Tables("TareasGenericas") 'añadimos las tareas en la DT

        Dim NuevaFila = DataTable.NewRow() 'creamos una fila y la rellenamos con los datos
        NuevaFila("Codigo") = t_codigo.Text
        NuevaFila("Descripcion") = t_descripcion.Text
        NuevaFila("CodAsig") = ddl_asignatura.SelectedValue
        NuevaFila("HEstimadas") = t_estimacion.Text
        NuevaFila("Explotacion") = 0
        NuevaFila("TipoTarea") = ddl_tipoTarea.SelectedValue

        Try
            DataTable.Rows.InsertAt(NuevaFila, DataTable.Rows.Count + 1) 'añadimos la nueva fila en DT

            DataAdapter.Update(DataSet, "TareasGenericas") 'refrescamos el DA
            DataSet.AcceptChanges() 'IMPORTANTE HACERLO!!

            l_retroalimentacion.Text = "La tarea se ha añadido correctamente!!"
        Catch ex As Exception
            l_retroalimentacion.Text = "ERROR: " + ex.Message
        End Try
    End Sub

End Class