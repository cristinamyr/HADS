﻿Public Class Estadisticas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Session.RemoveAll()
        Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        Response.Redirect("Inicio.aspx")
    End Sub
End Class