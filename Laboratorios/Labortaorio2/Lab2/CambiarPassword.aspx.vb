Imports AccesoBD.AccesoBD
Public Class CambiarPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub l_solicitar_Click(sender As Object, e As EventArgs) Handles l_solicitar.Click
        'If buscar(l_email.Text) Then
        'If estaConfirmado(l_email.Text) Then
        Dim mail As New Email.Enviar
        Dim codigo As Integer
                Randomize()
                codigo = CLng(Rnd() * 9000000) + 1000000
                mail.enviarEmail(l_email.Text, codigo)
                Response.Redirect("CambiarPassword2.aspx?mail=" & l_email.Text & "&num=" & codigo)
        '    Else
        'l_message.Text = "No has confirmado tu cuenta"
        'End If
        'Else
        'l_message.Text = "Ese email no se encuentra en la base de datos"
        'End If
    End Sub
End Class