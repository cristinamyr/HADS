Public Class CambiarPassword2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub b_cambiar_Click(sender As Object, e As EventArgs) Handles b_cambiar.Click
        'Response.Redirect("CambiarPassword2.aspx")
        Dim numero = Request.QueryString("num")
        Dim email = Request.QueryString("mail")

    End Sub
End Class '