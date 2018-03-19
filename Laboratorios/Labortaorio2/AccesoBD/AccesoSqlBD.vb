Imports System.Data.SqlClient
Imports System.Data.OleDb

Public Class AccesoSqlBD

    Private Shared conexion As New SqlConnection
    Private Shared DataAdapter As New SqlDataAdapter
    Private Shared DataSet As New DataSet

    Public Shared Function conectarBD() As String
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

    Public Shared Function buscarAsignaturasAlumnoPorEmail(ByVal email As String) As DataSet
        Dim st = "SELECT GruposClase.codigoasig FROM GruposClase INNER JOIN EstudiantesGrupo ON EstudiantesGrupo.email ='" & email & "' AND EstudiantesGrupo.Grupo = GruposClase.codigo"
        DataAdapter = New SqlDataAdapter(st, conexion)
        'DataSet.Clear()
        DataAdapter.Fill(DataSet, "GruposClase")
        Return DataSet

    End Function

    Public Shared Function buscarTareasAlumnoPorEmail(ByVal email As String) As DataSet
        Dim st = "SELECT * FROM TareasGenericas WHERE Codigo NOT IN (SELECT CodTarea FROM EstudiantesTareas WHERE Email = '" & email & "') AND Explotacion = 1"
        DataAdapter = New SqlDataAdapter(st, conexion)
        DataSet.Clear()
        DataAdapter.Fill(DataSet, "TareasGenericas")
        Return DataSet
    End Function

    Public Shared Function buscarEstudiantesTarea() As DataSet
        Dim st = "SELECT * FROM EstudiantesTareas"
        DataAdapter = New SqlDataAdapter(st, conexion)
        DataSet.Clear()
        DataAdapter.Fill(DataSet, "EstudiantesTareas")
        Return DataSet
    End Function


End Class
