Public Class TareasProfesores
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub b_insertar_Click(sender As Object, e As EventArgs) Handles b_insertar.Click
        Response.Redirect("InsertarTarea.aspx")
    End Sub

    Protected Sub b_cerrarSesion_Click(sender As Object, e As EventArgs) Handles b_cerrarSesion.Click
        Session.Abandon()
        Application.Contents("numProfes") = Application.Contents("numProfes") - 1
        Application.Contents("emailProfes").Items.Remove(Session.Contents("email"))
        System.Web.Security.FormsAuthentication.SignOut()
    End Sub

    Protected Sub ddl_datos_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged

    End Sub
End Class