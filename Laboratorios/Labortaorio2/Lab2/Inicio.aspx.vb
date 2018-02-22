Imports AccesoBD.AccesoBD
Public Class FormularioWeb
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim result As String
        result = conectar()
        l_conexion.Text = result
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarconexion()
    End Sub

    Protected Sub b_inciar_Click(sender As Object, e As EventArgs) Handles b_inciar.Click
        Dim resultado As Integer
        resultado = buscarRegistro(t_email.Text, t_pass.Text)
        If resultado = 1 Then
            If estaConfirmado(l_email.Text) Then
                Response.Redirect("Inciado.aspx")
            Else
                l_iniciarSesion.Text = "No has confirmado tu cuenta."
            End If
        Else
            l_iniciarSesion.Text = "email/contraseña incorrectas"
        End If
    End Sub
End Class