Public Class CambiarPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub l_solicitar_Click(sender As Object, e As EventArgs) Handles l_solicitar.Click
        Response.Redirect("CambiarPassword2.aspx")
    End Sub
End Class