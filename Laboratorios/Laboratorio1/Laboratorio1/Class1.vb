Public Class Class1
    Public Function calcularIVA(ByVal total As Integer, ByVal IVA As Integer) As Single
        calcularIVA = total / (1 + (IVA / 100))
    End Function

    Public Function buscarFactura(ByVal numFactura As Integer) As Tuple(Of Integer, String, Single, Single)
        Dim busqueda As Tuple(Of Integer, String)
        Dim solucion As Tuple(Of Integer, String, Single, Single)
        Dim opcional As New OpcionalLib.opcional
        Dim precioSinIva As Single
        Dim valor As Integer

        busqueda = opcional.numeroFactura(numFactura)
        If busqueda.Item2 = "General" Then
            valor = 21
        ElseIf busqueda.Item2 = "Reducido" Then
            valor = 10
        Else
            valor = 4
        End If

        precioSinIva = calcularIVA(busqueda.Item1, valor)

        solucion = Tuple.Create(busqueda.Item1, busqueda.Item2, precioSinIva, busqueda.Item1 - precioSinIva)
        Return solucion
    End Function
End Class
