Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports System.Data.SqlClient

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class WebService1
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Function obtenerMedia(ByVal asignatura As String) As Integer
        Dim con As New SqlConnection("Server=tcp:hads-10.database.windows.net,1433;Initial Catalog=HADS10-TAREAS;Persist Security Info=False;User ID=HADS10;Password=Santurtzi8;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;")
        con.Open()
        Dim comand As New SqlCommand("SELECT AVG(HReales) FROM EstudiantesTareas INNER JOIN TareasGenericas ON CodTarea=Codigo WHERE TareasGenericas.CodAsig='" & asignatura & "'", con)
        Dim resultado = comand.ExecuteScalar()
        If (resultado Is DBNull.Value) Then
            Return 0
        End If
        con.Close()
        Return resultado
    End Function

End Class