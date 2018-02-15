Imports AccesoBD.AccesoBD
Public Class Confirmar
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim numero As Integer
        Dim email As String
        Dim result As String
        result = conectar()
        l_conexion.Text = result
        Dim numm As String = Request.QueryString("num")
        numero = CType(numm, Integer)
        email = Request.QueryString("mail")
        If confirmarCodigo(email, numero) Then
            l_error.Visible = False
        Else
            l_conf.Visible = False
        End If
    End Sub


    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarconexion()
    End Sub

End Class