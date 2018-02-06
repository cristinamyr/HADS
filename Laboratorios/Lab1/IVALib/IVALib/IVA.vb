Public Class IVALib
    Public Function calcularIVA(ByVal total As Single, ByVal IVA As Integer) As Single
        calcularIVA = total / (1 + (IVA / 100))
    End Function

    Public Function buscarFactura(ByVal numFactura As Integer) As Tuple(Of Integer, String, Single, Single)
        Dim busqueda As Tuple(Of Integer, String)
        Dim solucion As Tuple(Of Integer, String, Single, Single)
        Dim opcional As New BibliotecaOpcional.opcional
        Dim precioSinIva As Single

        busqueda = opcional.numeroFactura(numFactura)

        precioSinIva = calcularIVA(busqueda.Item1, busqueda.Item2)

        solucion = Tuple.Create(busqueda.Item1, busqueda.Item2, precioSinIva, busqueda.Item1 - precioSinIva)
        Return solucion
    End Function
End Class
