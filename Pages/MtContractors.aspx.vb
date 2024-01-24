Imports System.Security.Principal

Partial Class Pages_MtContractors
    Inherits System.Web.UI.Page
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("srch") IsNot Nothing And Not IsPostBack Then
            srchTB.Text = Request.QueryString("srch")
        End If
        wuc1.NewBtnVisable = True
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("id") IsNot Nothing Then
            wuc1.EditBtnVisable = True
            wuc1.DeleteBtnVisable = True
        End If
        wuc1.NewBtnVisable = True
    End Sub
    Protected Sub fvContractors_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvContractors.ItemInserted
        gvContractors.DataBind()
    End Sub

    Protected Sub fvContractors_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles fvContractors.ItemUpdated
        gvContractors.DataBind()
    End Sub
    Protected Sub fvContractors_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles fvContractors.ItemDeleted
        gvContractors.DataBind()
        wuc1.EditBtnVisable = False
        wuc1.NewBtnVisable = False
        wuc1.DeleteBtnVisable = False
    End Sub
    Protected Sub NewBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnNewClick
        fvContractors.ChangeMode(FormViewMode.Insert)
    End Sub
    Protected Sub EditBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnEditClick
        fvContractors.ChangeMode(FormViewMode.Edit)
    End Sub
    Protected Sub DeleteBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnDeleteClick
        'Dim myHostName As String = Request.UserHostName
        'Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        'Dim winUser As WindowsIdentity = WindowsIdentity.GetCurrent()
        hfWinHost.Value = Session("pcName")
        hfWinUser.Value() = Session("UserName")
        hfUserName.Value = Session("UserName")
        fvContractors.DeleteItem()
        Response.Redirect("MtContractors.aspx")
    End Sub
    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim myHostName As String = Request.UserHostName
        'Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        'Dim winUser As WindowsIdentity = WindowsIdentity.GetCurrent()
        hfWinHost.Value = Session("pcName")
        hfWinUser.Value() = Session("UserName")
        hfUserName.Value = Session("UserName")
        fvContractors.InsertItem(True)
    End Sub
    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim myHostName As String = Request.UserHostName
        'Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        'Dim winUser As WindowsIdentity = WindowsIdentity.GetCurrent()
        hfWinHost.Value = Session("pcName")
        hfWinUser.Value() = Session("UserName")
        hfUserName.Value = Session("UserName")
        fvContractors.UpdateItem(True)
    End Sub
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        'Dim myHostName As String = Request.UserHostName
        'Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        'Dim user As WindowsIdentity = WindowsIdentity.GetCurrent()
        ' ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, pcName, user.Name, Me.User.Identity.Name, Server.GetLastError(), Me)
        ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, Session("pcName"), Session("UserName"), Me.User.Identity.Name, Server.GetLastError(), Me)

        Server.ClearError()
        Response.Redirect("Error.aspx")
    End Sub

    Protected Sub fvContractors_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvContractors.DataBound

       

    End Sub
   
  

    Protected Sub gvContractors_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvContractors.SelectedIndexChanged

        Response.Redirect("MtContractors.aspx?id=" + CType(gvContractors.SelectedDataKey.Value, String) + "&srch=" + CType(srchTB.Text, String))



    End Sub
End Class
