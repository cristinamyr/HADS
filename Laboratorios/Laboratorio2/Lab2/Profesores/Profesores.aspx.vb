Public Class TareasProfesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub l_cerrarsesion_Click(sender As Object, e As EventArgs) Handles l_cerrarsesion.Click
        Session.Abandon()
        Application.Contents("numProfes") = Application.Contents("numProfes") - 1
        Application.Contents("emailProfes").Items.Remove(Session.Contents("email"))
        System.Web.Security.FormsAuthentication.SignOut()
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Dim list As ListBox
        Dim list2 As ListBox
        Dim profes = ""
        Dim alumnos = ""
        list = Application.Contents("emailProfes")
        For Each item As Object In list.Items
            profes = profes + item.ToString + "  "
        Next
        list2 = Application.Contents("emailAlumnos")
        For Each item As Object In list2.Items
            alumnos = alumnos + item.ToString + "  "
        Next
        Label1.Text = Application.Contents("numProfes").ToString + "  " + profes
        Label2.Text = Application.Contents("numAlumns").ToString + "  " + alumnos
    End Sub
End Class