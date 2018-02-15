Public Class CambiarPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub l_solicitar_Click(sender As Object, e As EventArgs) Handles l_solicitar.Click
        Dim mail As New Email.Enviar
        Dim codigo As Integer
        Randomize()
        codigo = CLng(Rnd() * 9000000) + 1000000
        mail.enviarEmail(l_email.Text, codigo)
        Response.Redirect("CambiarPassword2.aspx")
    End Sub
End Class