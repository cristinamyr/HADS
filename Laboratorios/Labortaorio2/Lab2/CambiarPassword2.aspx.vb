Imports Email.Enviar
Imports System
Imports System.Collections.Specialized
Imports System.Web

Public Class CambiarPassword2
    Inherits System.Web.UI.Page
    Dim numero As Integer
    Dim email As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim numm As String = Request.QueryString("num")
        numero = CType(numm, Integer)
        email = Request.QueryString("mail")
    End Sub

    Protected Sub b_cambiar_Click(sender As Object, e As EventArgs) Handles b_cambiar.Click
        Dim validar As Integer = t_codigo.Text
        Dim pass As String = t_pass.Text
        If validar = numero Then

            l_message.Text = "Contraseña cambiada"
        Else
            l_message.Text = "El código introducdo es erróneo"
        End If


    End Sub

    Protected Sub p_reenviar_Click(sender As Object, e As EventArgs) Handles p_reenviar.Click
        Dim mail As New Email.Enviar
        Dim mensaje As String = "El código de confirmación es el siguiente: " & codigo
        mail.enviarEmail(email, mensaje)
        l_message.Text = "Código reenviado"
    End Sub
End Class '