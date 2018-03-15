Imports System.Data.SqlClient
Imports System.Data.OleDb

Public Class AccesoOleBD

    Private Shared conexion As New OleDbConnection
    Private Shared DataAdapter As New OleDbDataAdapter
    Private Shared DataSet As New DataSet

    Public Shared Function conectar() As String
        Try
            conexion = New OleDbConnection("Server=tcp:hads-10.database.windows.net,1433;Initial Catalog=HADS10-TAREAS;Persist Security Info=False;User ID=HADS10;Password=Santurtzi8;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30")
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

        Dim st = "SELECT Codigo, Descripcion,.... join ..... where ....."



        buscarTareasAlumnoPorEmail = New DataSet
    End Function



End Class
