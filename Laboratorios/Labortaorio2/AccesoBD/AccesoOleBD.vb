Imports System.Data.SqlClient

Public Class AccesoSQL

    Private Shared conexion As New SqlConnection
    Private Shared DataAdapter As New SqlDataAdapter
    Private Shared DataSet As New DataSet

    Public Shared Function conectar() As String
        Try
            conexion = New SqlConnection("Server=tcp:hads-10.database.windows.net,1433;Initial Catalog=HADS10-TAREAS;Persist Security Info=False;User ID=HADS10;Password=Santurtzi8;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30")
            conexion.Open()
            Return "CONEXION OK"
        Catch ex As Exception
            Return "ERROR: " + ex.Message
        End Try
    End Function

    Public Shared Sub desconectar()
        conexion.Close()
    End Sub

    Public Shared Function buscarTareasAlumnoPorEmail(ByVal email As String) As DataSet

        ' ?? Deberíamos tener esto en otra clase??




        ' queremos:
        '            De la tarea: codigo, descripción, horas estimadas de la tarea, tipo tarea, codigo tarea, 
        '     Las tareas tienen que estar en EXPLOTACIÓN
        '     El usuario no debería haber realizado la tarea??
        ' los datos están en: TareasGenericas y EstudiantesTareas

        Dim st = "SELECT TareasGenericas.Codigo, TareasGenericas.Descripcion, TareasGenericas.HEstimadas, TareasGenericas.TipoTarea FROM  EstudiantesTareas INNER JOIN TareasGenericas ON EstudiantesTareas.CodTarea = TareasGenericas.Codigo WHERE TareasGenericas.Explotacion = 1 AND EstudiantesTareas.HReales = 0 AND EstudiantesTareas.email = '" & email & "'"

        DataAdapter = New SqlDataAdapter(st, conexion)
        DataAdapter.Fill(DataSet, "TareasGenericas")
        Return DataSet

    End Function



End Class
