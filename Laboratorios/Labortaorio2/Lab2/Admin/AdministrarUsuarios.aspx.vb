Public Class AdministrarUsuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub b_cerrarSesion_Click(sender As Object, e As EventArgs) Handles b_cerrarSesion.Click
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("Inicio.aspx")
    End Sub
End Class