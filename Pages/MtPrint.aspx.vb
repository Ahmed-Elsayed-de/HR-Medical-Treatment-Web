Imports System.IO
Imports System.Diagnostics
Imports Microsoft.Reporting.WebForms
Imports Microsoft.Reporting
Imports System.Threading
Imports System.Net
Imports System.Data
Imports System.Data.SqlClient
Imports System.Security.Principal

Partial Class Pages_MtPrint
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ''Dim i As Integer
        ''i = "1245dfdfd"

        wuc1.Visible = False
        LoadPDF()
    End Sub
    Private Sub LoadPDF()
        '   Try
        Dim reportType As String = "PDF"
        Dim mimeType As String
        Dim encoding As String
        Dim fileNameExtension() As String


        Dim ds As New DataSet()
        Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
        Dim da = New SqlDataAdapter("select * from MtTicketRpt where Id_3101 in (" + Request.QueryString("id").ToString() + ")", cn)
        da.Fill(ds)


        Dim rv = New ReportViewer()
        rv.ProcessingMode = ProcessingMode.Local

        Dim type As String = Request.QueryString("typ")

        If type IsNot Nothing Then
            If type = "mngr" Then
                rv.LocalReport.ReportPath = "Pages/Litters2.rdlc"
                rv.LocalReport.ReportPath = "Pages/Litters2.rdlc"
            End If
        Else
            rv.LocalReport.ReportPath = "Pages/Litters.rdlc"
            rv.LocalReport.ReportPath = "Pages/Litters.rdlc"
        End If



        Dim repDS As New ReportDataSource("DataSet1", ds.Tables(0))
        rv.LocalReport.DataSources.Add(repDS)


        Dim Bytes() As Byte = rv.LocalReport.Render(reportType, "", Nothing, mimeType, encoding, fileNameExtension, Nothing)

        Response.Buffer = True
        Response.Clear()
        Response.ContentType = mimeType
        ' Response.AddHeader("content-disposition", "attachment; filename=MT Report")
        Response.BinaryWrite(Bytes) ' create the file
        ' Response.Flush() ' send it to the client to download

        'Catch ex As Exception
        '    ' Response.Write(ex.Message)
        '    Dim myHostName As String = Request.UserHostName
        '    Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        '    Dim user As WindowsIdentity = WindowsIdentity.GetCurrent()
        '    ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, pcName, user.Name, Me.User.Identity.Name, ex, Me)
        '    ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, Session("pcName"), Session("UserName"), Me.User.Identity.Name, Server.GetLastError(), Me)

        'End Try
    End Sub
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error



        'Dim myHostName As String = Request.UserHostName
        'Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        'Dim user As WindowsIdentity = WindowsIdentity.GetCurrent()
        'ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri + " \nid : " + Request.QueryString("id").ToString(), Request.Url.AbsolutePath, pcName, user.Name, Me.User.Identity.Name, Server.GetLastError(), Me)
        ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, Session("pcName"), Session("UserName"), Me.User.Identity.Name, Server.GetLastError(), Me)

        Server.ClearError()
        Response.Redirect("Error.aspx")
    End Sub


End Class
