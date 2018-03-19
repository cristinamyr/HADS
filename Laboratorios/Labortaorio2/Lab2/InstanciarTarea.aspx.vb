Imports System.Data.SqlClient
Imports AccesoBD.AccesoSqlBD
Imports AccesoBD.AccesoBD

Public Class InstanciarTarea
    Inherits System.Web.UI.Page

    Private dset As DataSet
    Private dview As DataView
    Private dtable As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            dset = Session.Contents("dset")
            dtable = dset.Tables("EstudiantesTarea")

        Else
            t_tarea.Text = Request.QueryString("nomTarea")
            t_hest.Text = Request.QueryString("estimacion")
            t_usuario.Text = Session.Contents("email")
            conectarBD()
            dset = buscarEstudiantesTarea()
            Session.Contents("dset") = dset
            dtable = dset.Tables("EstudiantesTareas")

        End If

        dview = New DataView(dtable)
        dview.RowFilter = "Email='" & Session.Contents("email") & "'"
        TareasAlumno.DataSource = dview
        TareasAlumno.DataBind()
    End Sub

    Protected Sub b_instanciar_Click(sender As Object, e As EventArgs) Handles b_instanciar.Click
        Dim DataAdapter As New SqlDataAdapter

        conectar()
        DataAdapter = obtenerDataAdapter()
        cerrarconexion()

        Dim commandBuilder As New SqlCommandBuilder(DataAdapter)

        DataAdapter.Fill(dset, "EstudiantesTareas") 'añadimos las tareas en el DS
        dtable = dset.Tables("EstudiantesTareas") 'añadimos las tareas en la DT

        Dim NuevaFila = dtable.NewRow() 'creamos una fila y la rellenamos con los datos
        NuevaFila("Email") = Session.Contents("email")
        NuevaFila("CodTarea") = Request.QueryString("nomTarea")
        NuevaFila("HEstimadas") = Request.QueryString("estimacion")
        NuevaFila("HReales") = t_hreal.Text

        Try
            dtable.Rows.InsertAt(NuevaFila, dtable.Rows.Count + 1) 'añadimos la nueva fila en DT
            DataAdapter.Update(dset, "TareasGenericas") 'refrescamos el DA
            dset.AcceptChanges() 'IMPORTANTE HACERLO!!

            l_retroalimentacion.Text = "La tarea se ha instanciado correctamente!!"
        Catch ex As Exception
            l_retroalimentacion.Text = "ERROR: " + ex.Message
        End Try
    End Sub

    Protected Sub lb_cerrarSesion_Click(sender As Object, e As EventArgs) Handles lb_cerrarSesion.Click
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub
End Class