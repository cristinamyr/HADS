Public Class CambiarPassword2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles l_cambiar.Click
        Server.Transfer("Inicio.aspx", True)
    End Sub
End Class