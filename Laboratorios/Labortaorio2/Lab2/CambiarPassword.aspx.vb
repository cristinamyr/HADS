Imports AccesoBD.AccesoBD
Public Class CambiarPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim result As String
        result = conectar()
        l_conexion.Text = result
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarconexion()
    End Sub

    Protected Sub l_solicitar_Click(sender As Object, e As EventArgs) Handles l_solicitar.Click
        If buscar(l_email.Text) Then
            If estaConfirmado(l_email.Text) Then
                Dim mail As New Email.Enviar
                Dim mensaje As String
                Dim codigo As Integer
                Dim asunto As String
                Randomize()
                codigo = CLng(Rnd() * 900000) + 100000
                asunto = "Código de confirmación de cambio de contraseña"
                mensaje = "El código de confirmación es el siguiente: " & codigo
                mail.enviarEmail(l_email.Text, asunto, mensaje)
                Response.Redirect("CambiarPassword2.aspx?mail=" & l_email.Text & "&num=" & codigo)
            Else
                l_message.Text = "No has confirmado tu cuenta"
            End If
        Else
            l_message.Text = "Ese email no se encuentra en la base de datos"
        End If
    End Sub
End Class