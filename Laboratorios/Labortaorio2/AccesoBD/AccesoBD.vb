Public Class AccesoBD
    Private Shared conexion As New SqlClient.SqlConnection
    Private Shared comando As New SqlClient.SqlCommand

    Public Shared Function conectar() As String
        Try
            conexion.ConnectionString = "Server=tcp:hads-10.database.windows.net,1433;Initial Catalog=HADS10-TAREAS;Persist Security Info=False;User ID=HADS10;Password=Santurtzi8;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
            conexion.Open()
        Catch ex As Exception
            Return "ERROR DE CONEXIÓN: " + ex.Message
        End Try
        Return "CONEXION OK"
    End Function

    Public Shared Sub cerrarconexion()
        conexion.Close()
    End Sub

    Public Shared Function buscar(ByVal email As String) As Integer
        Dim st = "Select count(*) from Usuarios where email = '" & email & "'"
        comando = New SqlClient.SqlCommand(st, conexion)
        Return comando.ExecuteScalar()
    End Function

    Public Shared Function insertar(ByVal nombre As String, ByVal apellidos As String, ByVal email As String, ByVal contrasena As String, ByVal rol As String, ByVal NumConf As Integer) As Tuple(Of String, Integer)
        If (buscar(email) = 0) Then
            Dim st = "insert into Usuarios (email,nombre,apellidos,numconfir,confirmado,tipo,pass ) values ('" & email & "','" & nombre & "','" & apellidos & "','" & NumConf & "','" & 0 & "','" & rol & "','" & contrasena & "')"
            Dim numregs As Integer
            comando = New SqlClient.SqlCommand(st, conexion)
            Try
                numregs = comando.ExecuteNonQuery()
            Catch ex As Exception
                Return Tuple.Create(ex.Message, NumConf)
            End Try
            Return Tuple.Create(numregs & " registro(s) insertados(s) en la BD", NumConf)
        Else
            Return Tuple.Create("ese email ya existe en la base de datos, pruebe con otro", 0)
        End If

    End Function

    Public Shared Function buscarRegistro(ByVal email As String, ByVal pass As String) As Integer
        Dim st = "Select count(*) from Usuarios where email = '" & email & "' and pass = '" & pass & "'"
        comando = New SqlClient.SqlCommand(st, conexion)
        buscarRegistro = comando.ExecuteScalar()
    End Function

    Public Shared Function estaConfirmado(ByVal email As String) As Integer
        Dim st = "Select count(*) from Usuarios where email = '" & email & "' and confirmado = '" & 1 & "'"
        comando = New SqlClient.SqlCommand(st, conexion)
        Return comando.ExecuteScalar()
    End Function

    Public Shared Function cambiarPass(ByVal email As String, ByVal pass As String) As String
        Dim numRegs As Integer
        If buscar(email) Then
            Dim st = "Update Usuarios set pass = '" & pass & "' where email='" & email & "'"
            comando = New SqlClient.SqlCommand(st, conexion)
            Try
                numRegs = comando.ExecuteNonQuery()
            Catch ex As Exception
                Return ex.Message
            End Try
            Return numRegs & "registros(s) modificado(s) en la BD"
        Else
            Return "Ese email no está en la BD."
        End If
    End Function

    Public Shared Function cumpleCaracteristicas(ByVal email As String, ByVal codigo As Integer) As Integer
        Dim st = "Select count(*) from Usuarios where email = '" & email & "'and numconfir = '" & codigo & "' and confirmado = '" & 0 & "'"
        comando = New SqlClient.SqlCommand(st, conexion)
        Return comando.ExecuteScalar()
    End Function

    Public Shared Function confirmarUsuario(ByVal email As String) As Integer
        Dim numRegs As Integer
        If buscar(email) Then
            Dim st = "Update Usuarios set confirmado = '" & 1 & "' where email='" & email & "'"
            comando = New SqlClient.SqlCommand(st, conexion)
            Try
                numRegs = comando.ExecuteNonQuery()
            Catch ex As Exception
                Return 0
            End Try
            Return 1
        Else
            Return 0
        End If
    End Function


    Public Shared Function confirmarCodigo(ByVal email As String, ByVal codigo As Integer) As Integer
        If cumpleCaracteristicas(email, codigo) Then
            Return confirmarUsuario(email)
        End If
        Return 0
    End Function
End Class

