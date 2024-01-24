Imports System.Security.Principal

Partial Class LoginMt
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error



        'Dim myHostName As String = Request.UserHostName
        'Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        'Dim user As WindowsIdentity = WindowsIdentity.GetCurrent()
        'ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, pcName, user.Name, Me.User.Identity.Name, Server.GetLastError())
        'Server.ClearError()
    End Sub
End Class

