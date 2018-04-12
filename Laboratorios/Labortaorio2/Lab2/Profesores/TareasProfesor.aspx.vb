Public Class TareasProfesores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub b_insertar_Click(sender As Object, e As EventArgs) Handles b_insertar.Click
        Response.Redirect("InsertarTarea.aspx")
    End Sub

    Protected Sub b_cerrarSesion_Click(sender As Object, e As EventArgs) Handles b_cerrarSesion.Click
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("Inicio.aspx")
    End Sub

    Protected Sub ddl_datos_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub


End Class