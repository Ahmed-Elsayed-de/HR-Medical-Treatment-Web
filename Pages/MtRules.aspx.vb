Imports System.Security.Principal

Partial Class Pages_MtRoles
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        wuc1.EditBtnVisable = True
    End Sub
    Protected Sub NewBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnNewClick

    End Sub
    Protected Sub EditBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnEditClick
        fvMtitems.ChangeMode(FormViewMode.Edit)
    End Sub
    Protected Sub DeleteBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnDeleteClick
      
    End Sub
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        'Dim myHostName As String = Request.UserHostName
        'Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        'Dim user As WindowsIdentity = WindowsIdentity.GetCurrent()
        'ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, pcName, user.Name, Me.User.Identity.Name, Server.GetLastError(), Me)
        ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, Session("pcName"), Session("UserName"), Me.User.Identity.Name, Server.GetLastError(), Me)

        Server.ClearError()
        Response.Redirect("Error.aspx")
    End Sub

   

    Protected Sub ddlYearMt_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlYearMt.TextChanged
        Dim clor As Int32
        Try
            clor = Val(ddlYearMt.Text) 'Val(Right(ddlYearMt.Text, 3))
            Panel4.BackColor = Drawing.Color.FromArgb(clor * 100000) 'Val(Right(ddlYearMt.Text, 1)) + 19 0, 0, clor * 15
            Label1.Text = ddlYearMt.Text
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub

   
    Protected Sub ddlYearMt_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlYearMt.PreRender
        Dim clor As Int32
        Try
            clor = Val(ddlYearMt.Text) 'Val(Right(ddlYearMt.Text, 3))
            Panel4.BackColor = Drawing.Color.FromArgb(clor * 100000) 'Val(Right(ddlYearMt.Text, 1)) + 19 0, 0, clor * 15
            Label1.Text = ddlYearMt.Text
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub
End Class
