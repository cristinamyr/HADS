Public Class Registro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_registro_Click(sender As Object, e As EventArgs) Handles btn_registro.Click
        Server.Transfer("Inicio.aspx", True)
    End Sub
End Class