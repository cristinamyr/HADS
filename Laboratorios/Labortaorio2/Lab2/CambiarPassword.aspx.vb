Public Class CambiarPassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub l_solicitar_Click(sender As Object, e As EventArgs) Handles l_solicitar.Click
        Server.Transfer("CambiarPassword2.aspx", True)
    End Sub
End Class