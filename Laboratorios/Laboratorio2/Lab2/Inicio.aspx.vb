Imports AccesoBD.AccesoBD
Imports Email.Enviar
Public Class FormularioWeb
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim result As String
        result = conectar()
        l_conexion.Text = result
        l_button.Visible = False
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarconexion()
    End Sub

    Protected Sub b_inciar_Click(sender As Object, e As EventArgs) Handles b_inciar.Click
        Dim resultado As Integer
        If t_pass.Text = "" Then
            l_iniciarSesion.Text = "Debes introducir una contraseña"
        Else
            resultado = buscarRegistro(t_email.Text, t_pass.Text)
            If resultado = 1 Then
                If estaConfirmado(t_email.Text) Then
                    Session.Contents("email") = t_email.Text
                    Dim rol As String
                    rol = obtenerRol(t_email.Text)
                    If (rol = "Alumno") Then
                        System.Web.Security.FormsAuthentication.SetAuthCookie("alumnos", False)
                        Response.Redirect("Alumnos/Alumnos.aspx")
                    ElseIf (rol = "Profesor") Then
                        If (t_email.Text = "vadillo@ehu.es") Then
                            System.Web.Security.FormsAuthentication.SetAuthCookie("vadillo", False)
                        Else
                            System.Web.Security.FormsAuthentication.SetAuthCookie("profesores", False)
                        End If
                        Response.Redirect("Profesores/Profesores.aspx")
                    Else
                        System.Web.Security.FormsAuthentication.SetAuthCookie("admin", False)
                        Response.Redirect("Admin/Admin.aspx")
                    End If
                Else
                    l_iniciarSesion.Text = "No has confirmado tu cuenta. Si no tienes el enlace de confirmación pulsa "
                    l_button.Visible = True
                End If
            Else
                l_iniciarSesion.Text = "email/contraseña incorrectas"
            End If
        End If
 End Sub

    Protected Sub l_button_Click(sender As Object, e As EventArgs) Handles l_button.Click
        Dim email As String
        Dim mensaje As String
        Dim asunto As String
        Dim NumConf As Integer
        email = t_email.Text
        NumConf = obtenerCodigo(email)
        mensaje = "Para confirmar la cuenta pulsa en el siguiente <a href='http://hads2018-10.azurewebsites.net/Confirmar.aspx?mail=" & email & "&num=" & NumConf & "'> enlace. </a>"
        asunto = "Confirmación de registro"
        enviarEmail(email, asunto, mensaje)
    End Sub

End Class