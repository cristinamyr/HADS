﻿Imports AccesoBD.AccesoBD
Public Class Registro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim result As String
        result = conectar()
        l_conexion.Text = result
        h_enlace.Visible = False
    End Sub

    Protected Sub btn_registro_Click(sender As Object, e As EventArgs) Handles btn_registro.Click
        Dim resultado As Tuple(Of String, Integer)
        Dim NumConf As Integer
        Dim mail As New Email.Enviar
        Randomize()
        NumConf = CLng(Rnd() * 900000) + 100000
        If buscar(t_email.Text) Then
            l_insert.Text = "Ese email ya existe en la base de datos."
        Else
            resultado = insertar(t_nombre.Text, t_apellidos.Text, t_email.Text, t_pass.Text, rb_rol.SelectedValue, NumConf)
            l_insert.Text = resultado.Item1
            Dim email As String
            Dim mensaje As String
            Dim asunto As String
            email = t_email.Text
            mensaje = "Para confirmar la cuenta pulsa en el siguiente <a href='http://localhost:54472/Confirmar.aspx?mail=" & email & "&num=" & NumConf & "'> enlace. </a>"
            asunto = "Confirmación de registro"
            mail.enviarEmail(t_email.Text, asunto, mensaje)
            h_enlace.Visible = True
            h_enlace.NavigateUrl = "http://localhost:54472/Confirmar.aspx?mail=" & email & "&num=" & NumConf
        End If

    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarconexion()
    End Sub
End Class