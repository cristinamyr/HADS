Imports AccesoBD.AccesoBD
Public Class Registro
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim result As String
        result = conectar()
        l_conexion.Text = result
    End Sub

    Protected Sub btn_registro_Click(sender As Object, e As EventArgs) Handles btn_registro.Click
        Dim resultado As Tuple(Of String, Integer)

        resultado = insertar(t_nombre.Text, t_apellidos.Text, t_email.Text, t_pass.Text, rb_rol.SelectedValue)
        l_insert.Text = resultado.Item1
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarconexion()
    End Sub
End Class