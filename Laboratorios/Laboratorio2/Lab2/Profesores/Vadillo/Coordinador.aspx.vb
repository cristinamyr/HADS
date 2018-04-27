Public Class Coordinador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cargar()
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        cargar()
    End Sub

    Protected Sub cargar()
        Dim media As New AzureWebService.WebService1
        l_media.Text = media.obtenerMedia(DropDownList1.SelectedValue)
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Session.Abandon()
        Application.Contents("numProfes") = Application.Contents("numProfes") - 1
        Application.Contents("emailProfes").Items.Remove(Session.Contents("email"))
        System.Web.Security.FormsAuthentication.SignOut()
    End Sub
End Class