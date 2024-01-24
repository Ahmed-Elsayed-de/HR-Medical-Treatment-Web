Imports System.Drawing
Imports System.Security.Principal

Partial Class Pages_Contractors
    Inherits System.Web.UI.Page
    Protected Sub fvMtitems_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles fvMtitems.ItemDeleted
        gvMtItems.DataBind()
    End Sub
    Protected Sub fvMtitems_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvMtitems.ItemInserted
        gvMtItems.DataBind()
    End Sub
    Protected Sub fvMtitems_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles fvMtitems.ItemUpdated
        gvMtItems.DataBind()
    End Sub
    Protected Sub gvMtItems_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMtItems.RowDataBound
        Dim gv1 As GridView = gvMtItems
        Dim i As Int16 = 0
        ' Try
        For Each row In gv1.Rows
            If CType(gv1.Rows(i).FindControl("lblspetialneed"), Label).Text = "نعم" Then
                Dim clr As Color = ColorTranslator.FromHtml("#E6EEFC")
                gv1.Rows(i).BackColor = clr

            ElseIf CType(gv1.Rows(i).FindControl("lblspetialneed"), Label).Text = "لا" Then

                gv1.Rows(i).BackColor = Drawing.Color.White

            End If
            i += 1
        Next
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("id") IsNot Nothing Then
            wuc1.EditBtnVisable = True
            wuc1.DeleteBtnVisable = True
        End If
        wuc1.NewBtnVisable = True
    End Sub
    Protected Sub NewBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnNewClick
        fvMtitems.ChangeMode(FormViewMode.Insert)
    End Sub
    Protected Sub EditBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnEditClick
        fvMtitems.ChangeMode(FormViewMode.Edit)
    End Sub
    Protected Sub DeleteBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnDeleteClick
        'Dim myHostName As String = Request.UserHostName
        'Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        'Dim winUser As WindowsIdentity = WindowsIdentity.GetCurrent()
        hfWinHost.Value = Session("pcName")
        hfWinUser.Value() = Session("UserName")
        hfUserName.Value = Session("UserName")
        fvMtitems.DeleteItem()
        Response.Redirect("MtItems.aspx")
    End Sub
    Function FindTheControl(ByVal nm As String, ByVal pCtrl As Control) As Control
        Dim nam As String = pCtrl.ID
        Dim cnt As Integer = pCtrl.Controls.Count
        If pCtrl.ID = nm Then
            Return pCtrl
        Else
            For Each child As Control In pCtrl.Controls
                If child.ID = nm Then
                    Return child
                Else
                    Return FindTheControl(nm, child)
                End If
            Next
        End If
    End Function

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim myHostName As String = Request.UserHostName
        'Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        'Dim winUser As WindowsIdentity = WindowsIdentity.GetCurrent()
        hfWinHost.Value = Session("pcName")
        hfWinUser.Value() = Session("UserName")
        hfUserName.Value = Session("UserName")
        fvMtitems.UpdateItem(True)
        fvMtitems.ChangeMode(FormViewMode.ReadOnly)

    End Sub

    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ' Try
        'Dim myHostName As String = Request.UserHostName
        'Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        'Dim winUser As WindowsIdentity = WindowsIdentity.GetCurrent()
        hfWinHost.Value = Session("pcName")
        hfWinUser.Value() = Session("UserName")
        hfUserName.Value = Session("UserName")
        fvMtitems.InsertItem(True)
        fvMtitems.ChangeMode(FormViewMode.ReadOnly)
        gvMtItems.DataBind()

        'Catch ex As Exception

        '    Dim myHostName As String = Request.UserHostName
        '    Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        '    Dim user As WindowsIdentity = WindowsIdentity.GetCurrent()
        '    ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, pcName, user.Name, Me.User.Identity.Name, ex, Me)

        'End Try

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

    Protected Sub gvMtItems_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMtItems.SelectedIndexChanged
        Response.Redirect("MtItems.aspx?id=" + CType(gvMtItems.SelectedDataKey.Value, String))
    End Sub
End Class
