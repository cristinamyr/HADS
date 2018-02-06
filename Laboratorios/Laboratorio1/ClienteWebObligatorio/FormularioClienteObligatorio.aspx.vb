Public Class FormularioClienteObligatorio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim iva As New Laboratorio1.Class1
        Dim precio As Single
        Dim ivaSeleccionado As Integer
        Dim sinIVA As Single
        precio = TextBox1.Text
        ivaSeleccionado = RadioButtonList1.SelectedValue
        sinIVA = iva.calcularIVA(precio, ivaSeleccionado)
        Label5.Text = sinIVA
        Label6.Text = (precio - sinIVA)
    End Sub
End Class