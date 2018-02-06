Module Module1

    Sub Main()
        Dim iva As New IVALib.IVALib
        Console.WriteLine("Introducir el precio total CON iva")
        Dim precio As Single
        precio = Console.ReadLine
        Console.WriteLine("Introduce el iva que quieres (21|10|4)")
        Dim ivaSeleccionado As Integer
        ivaSeleccionado = Console.ReadLine
        Dim sinIva As Single
        sinIva = iva.calcularIVA(precio, ivaSeleccionado)
        Console.WriteLine("DESGLOSE: ")
        Console.Write("  Precio sin iva: ")
        Console.Write(sinIva)
        Console.WriteLine("")
        Console.Write("  IVA: ")
        Console.Write(precio - sinIva)
        Console.WriteLine("")
        Console.WriteLine("Pulsar return para salir.")
        Console.ReadLine()
    End Sub

End Module
