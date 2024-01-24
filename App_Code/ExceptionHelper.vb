Imports Microsoft.VisualBasic
Imports System.IO
Public Class ExceptionHelper
    Public Shared Sub HandleException(ByVal logPath As String, ByVal pageUrl As String, ByVal pth As String, ByVal pcName As String, ByVal winUser As String, ByVal userName As String, ByVal ex As Exception, ByVal pg As Page)

        If Not TypeOf ex Is Threading.ThreadAbortException Then

            Dim _HttpBrowserCapabilities As HttpBrowserCapabilities
            _HttpBrowserCapabilities = pg.Request.Browser

            Dim fs As New FileStream(logPath, FileMode.Append)
            Dim sw As New StreamWriter(fs)
            sw.WriteLine("******************************************************************************************************************************************************************************")
            sw.WriteLine(Date.Now.ToLongDateString)
            sw.WriteLine(Date.Now.ToLongTimeString)
            sw.WriteLine("URL : " + pageUrl)
            sw.WriteLine("Path : " + pth)
            sw.WriteLine("PC Name :" + pcName)
            sw.WriteLine("pc account :" + winUser)
            sw.WriteLine("User Name :" + userName)
            sw.WriteLine("Error : " + ex.Message)
            If ex.InnerException IsNot Nothing Then
                sw.WriteLine("Inner Exception : " + ex.InnerException.Message)
            End If
            sw.WriteLine("General Browser family : " + _HttpBrowserCapabilities.Browser)
            sw.WriteLine("Browser Type : " + _HttpBrowserCapabilities.Type)


            sw.Close()
            fs.Close()
            If pg.Master IsNot Nothing Then
                CType(pg.Master.FindControl("lblError"), Label).Visible = True
                CType(pg.Master.FindControl("lblError"), Label).Text = " <h1>عفوا !<br />حدث خطأ فى النظام <br />   لمزيد من المعلومات اتصل ب مدير النظام</h1> "

            End If
        End If

    End Sub
End Class
