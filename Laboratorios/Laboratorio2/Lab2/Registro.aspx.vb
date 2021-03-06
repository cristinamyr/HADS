﻿Imports AccesoBD.AccesoBD
Public Class Registro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim result As String
        result = conectar()
        l_conexion.Text = result
        btn_registro.Enabled = False
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
            mensaje = "Para confirmar la cuenta pulsa en el siguiente <a href='http://hads2018-10.azurewebsites.net/Confirmar.aspx?mail=" & email & "&num=" & NumConf & "'> enlace. </a>"
            asunto = "Confirmación de registro"
            mail.enviarEmail(t_email.Text, asunto, mensaje)
        End If

    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarconexion()
    End Sub

    Protected Sub t_email_TextChanged(sender As Object, e As EventArgs) Handles t_email.TextChanged
        Dim mat As New Matricula.Matriculas

        Dim result = mat.comprobar(t_email.Text)

        If (result = "SI") Then
            comp_email.Text = "Email válido"
            Session.Contents("valEmail") = 1
        Else
            comp_email.Text = "No estás matriculado!"
            Session.Contents("valEmail") = 0
        End If
        comprobar()
    End Sub

    Protected Sub comprobar()
        If ((Session.Contents("valEmail") = 1) And (Session.Contents("valPass") = 1)) Then
            btn_registro.Enabled = True
        Else
            btn_registro.Enabled = False
        End If
    End Sub

    Protected Sub t_pass_TextChanged(sender As Object, e As EventArgs) Handles t_pass.TextChanged
        Dim pas As New comp_pass.comprobarPass
        Dim result = pas.comprobar(t_pass.Text)
        If (result = "VALIDA") Then
            pass_comp.Text = "Pass válida"
            Session.Contents("valPass") = 1
        Else
            pass_comp.text = "Pass no valida"
            Session.Contents("valPass") = 0
        End If
        comprobar()
    End Sub
End Class