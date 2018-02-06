Public Class opcional
    Public Function numeroFactura(ByVal codigoFactura As Integer) As Tuple(Of Integer, String)
        If (codigoFactura = 121212) Then
            Return Tuple.Create(1000, "General")
        Else
            Return Tuple.Create(2000, "Reducido")
        End If
    End Function
End Class
