Imports System.Security.Principal
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports System.Data

Partial Class Pages_MtEmployeeData
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Form.DefaultButton = btnS.UniqueID
        txtRegFilter.Focus()
        wuc1.EditBtnVisable = False
        wuc1.NewBtnVisable = False
        wuc1.DeleteBtnVisable = False
    End Sub
    Protected Sub fvHRData_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvHRData.DataBound


        If fvHRData.DataItemCount > 0 And txtRegFilter.Text = "96000" And fvHRData.CurrentMode = FormViewMode.Edit Then
            CType(fvHRData.FindControl("E_NameTextBox"), TextBox).Enabled = True
        ElseIf fvHRData.DataItemCount > 0 And fvHRData.CurrentMode = FormViewMode.Edit Then
            CType(fvHRData.FindControl("E_NameTextBox"), TextBox).Enabled = False
        ElseIf fvHRData.DataItemCount > 0 And fvHRData.CurrentMode = FormViewMode.ReadOnly Then
            wuc1.EditBtnVisable = True
            SDSChildren.SelectParameters("CODE").DefaultValue = CType(fvHRData.FindControl("CodeLabel3"), Label).Text
            SDSWives.SelectParameters("CODE").DefaultValue = CType(fvHRData.FindControl("CodeLabel3"), Label).Text
        End If
    End Sub
    Protected Sub btnTreatTypeIdIns_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Panel17_ModalPopupExtender.Show()
    End Sub
    Protected Sub codeTextBoxIns_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim TCode As TextBox = CType(sender, TextBox)
        TCode.Text = CType(fvHRData.FindControl("CodeLabel3"), Label).Text
    End Sub
    Protected Sub TarnsDateTextBoxIns_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim TCode As TextBox = CType(sender, TextBox)
        TCode.Text = Date.Now.ToString
    End Sub
    Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
    'Protected Sub btnHistory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHistory.Click
    '    ''Me.Panel8_ModalPopupExtender2.Show()

    'End Sub
    Protected Sub NewBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnNewClick
        ' fvHRData.ChangeMode(FormViewMode.Insert)
    End Sub
    Protected Sub EditBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnEditClick
        fvHRData.ChangeMode(FormViewMode.Edit)
    End Sub
    Protected Sub DeleteBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnDeleteClick
        '   fvHRData.DeleteItem()
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnS.Click
        wuc1.EditBtnVisable = True

    End Sub
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error



        Dim myHostName As String = Request.UserHostName
        Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        Dim user As WindowsIdentity = WindowsIdentity.GetCurrent()
        ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, pcName, user.Name, Me.User.Identity.Name, Server.GetLastError(), Me)
        Server.ClearError()
        Response.Redirect("Error.aspx")
    End Sub

 
    Protected Sub UpdateCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        txtRegFilter.Focus()
    End Sub
End Class
