Public Class FormularioOpcional
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim iva As New Laboratorio1.Class1
        Dim numFactura As Integer
        Dim solucion As Tuple(Of Integer, String, Single, Single)
        numFactura = TextBox1.Text
        solucion = iva.buscarFactura(numFactura)
        Label4.Text = solucion.Item1
        Label5.Text = solucion.Item2
        Label8.Text = solucion.Item3
        Label9.Text = solucion.Item4
    End Sub
End Class