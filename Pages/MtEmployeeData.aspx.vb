Imports System.Security.Principal
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports System.Data

Partial Class Pages_MtEmployeeData
    Inherits System.Web.UI.Page
    Dim emps As New ArrayList()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then


            Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
            Dim cmd As New SqlCommand("select Regist_No1 from HRData ", cn)
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            While dr.Read
                emps.Add(dr.GetInt32(0))
                ViewState("emps") = emps
                ViewState("empIndx") = 0


            End While

            cn.Close()
            DisplayEmp(0)

            wuc1.EditBtnVisable = True

        End If


        Page.Form.DefaultButton = btnS.UniqueID
        txtRegFilter.Focus()
    End Sub

    Private Sub DisplayEmp(ByVal indx As Integer)

        emps = CType(ViewState("emps"), ArrayList)
        ViewState("empIndx") = indx
        If emps.Count > indx - 1 And indx >= 0 Then
            txtRegFilter.Text = emps(indx)
            lblEmpCount.Text = (CInt(ViewState("empIndx")) + 1).ToString + " من " + emps.Count.ToString
        End If

        If indx = 0 And emps.Count = 1 Then
            btnEmpprv.Enabled = False
            btnEmpprv.ImageUrl = "~/Images/ltrX.png"
            btnEmpNxt.Enabled = False
            btnEmpNxt.ImageUrl = "~/Images/rtlX.png"
        ElseIf indx = 0 And emps.Count > 1 Then
            btnEmpprv.Enabled = False
            btnEmpprv.ImageUrl = "~/Images/ltrX.png"
            btnEmpNxt.Enabled = True
            btnEmpNxt.ImageUrl = "~/Images/rtl.png"
        ElseIf indx <> 0 And indx = emps.Count - 1 Then
            btnEmpprv.Enabled = True
            btnEmpprv.ImageUrl = "~/Images/ltr.png"
            btnEmpNxt.Enabled = False
            btnEmpNxt.ImageUrl = "~/Images/rtlX.png"
        Else
            btnEmpprv.Enabled = True
            btnEmpprv.ImageUrl = "~/Images/ltr.png"
            btnEmpNxt.Enabled = True
            btnEmpNxt.ImageUrl = "~/Images/rtl.png"
        End If

    End Sub

    Protected Sub fvHRData_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvHRData.DataBound


        If fvHRData.DataItemCount > 0 And txtRegFilter.Text = "96000" And fvHRData.CurrentMode = FormViewMode.Edit Then
            CType(fvHRData.FindControl("E_NameTextBox"), TextBox).Enabled = True
        ElseIf fvHRData.DataItemCount > 0 And fvHRData.CurrentMode = FormViewMode.Edit Then
            CType(fvHRData.FindControl("E_NameTextBox"), TextBox).Enabled = False
        ElseIf fvHRData.DataItemCount > 0 And fvHRData.CurrentMode = FormViewMode.ReadOnly Then
            wuc1.EditBtnVisable = True
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


    Protected Sub btnHistory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHistory.Click
        Me.Panel8_ModalPopupExtender2.Show()

    End Sub
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
        ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, Session("pcName"), Session("UserName"), Me.User.Identity.Name, Server.GetLastError(), Me)
        Server.ClearError()
        Response.Redirect("Error.aspx")
    End Sub

 
    Protected Sub UpdateCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
        Dim PetroCheck As DropDownList = CType(fvHRData.FindControl("ddl"), DropDownList)
        'Dim frst As TextBox = CType(fvHRData.FindControl("كشف_اولTextBox"), TextBox)
        'Dim scnd As TextBox = CType(fvHRData.FindControl("كشف_ثانيTextBox"), TextBox)
        Dim endmic As TextBox = CType(fvHRData.FindControl("EndemicTextBox"), TextBox)
        Dim book As DropDownList = CType(fvHRData.FindControl("DropDownList1"), DropDownList)
        Dim PetroGasNotes As TextBox = CType(fvHRData.FindControl("PetroGasNotesTextBox"), TextBox)
        Dim code As Label = CType(fvHRData.FindControl("CodeLabel3"), Label)
        Dim Notes As TextBox = CType(fvHRData.FindControl("NotesTextBox"), TextBox)
        Dim nm As TextBox = CType(fvHRData.FindControl("E_NameTextBox"), TextBox)

        'Dim cmd As New SqlCommand("UPDATE HRdata SET PetroGasNotes = @PetroGasNotes, [كشف_اول]  = @frst,[كشف_ثاني]=@scnd , Endemic = @Endemic,[إستلام_دفتر]= @book , [كشف_بتروجاس] =@PetroCheck ,E_Name= @E_Name WHERE (Code = @code) ", cn)
        Dim cmd As New SqlCommand("UPDATE HRdata SET PetroGasNotes = @PetroGasNotes, Endemic = @Endemic,[إستلام_دفتر]= @book , [كشف_بتروجاس] =@PetroCheck ,E_Name= @E_Name  WHERE (Code = @code) ", cn)

        cmd.Parameters.AddWithValue("@PetroGasNotes", PetroGasNotes.Text)
        'cmd.Parameters.AddWithValue("@frst", frst.Text)
        'cmd.Parameters.AddWithValue("@scnd", scnd.Text)
        cmd.Parameters.AddWithValue("@Endemic", endmic.Text)
        cmd.Parameters.AddWithValue("@book", book.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@PetroCheck", PetroCheck.SelectedItem.Text)
        cmd.Parameters.AddWithValue("@Code", code.Text)
        cmd.Parameters.AddWithValue("@E_Name", nm.Text)
        cn.Open()
        If cmd.ExecuteNonQuery() > 0 Then
            cn.Close()

            cmd.Parameters.Clear()
            cmd.CommandText = "Update MedicalNotes Set Notes = @Notes where Code= @Code"
            cmd.Parameters.AddWithValue("@Notes", Notes.Text)
            cmd.Parameters.AddWithValue("@Code", code.Text)
            cn.Open()
            cmd.ExecuteNonQuery()
            cn.Close()
        End If

        txtRegFilter.Focus()
        fvHRData.ChangeMode(FormViewMode.ReadOnly)
    End Sub

    Protected Sub btnFrst_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnFrst.Click
        ViewState("empIndx") = 0
        DisplayEmp(0)
    End Sub

    Protected Sub btnEmpprv_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEmpprv.Click
        Dim i As Integer = 1
        If ViewState("empIndx") IsNot Nothing Then
            i = CInt(ViewState("empIndx"))
        End If
        i -= 1
        ViewState("empIndx") = i
        DisplayEmp(i)
    End Sub

    Protected Sub btnEmpNxt_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEmpNxt.Click
        Dim i As Integer = 0
        If ViewState("empIndx") IsNot Nothing Then
            i = CInt(ViewState("empIndx"))
        End If
        i += 1
        ViewState("empIndx") = i
        DisplayEmp(i)
    End Sub

    Protected Sub btnLst_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLst.Click
        emps = CType(ViewState("emps"), ArrayList)
        ViewState("empIndx") = emps.Count - 1
        DisplayEmp(CInt(ViewState("empIndx")))
    End Sub

    Protected Sub txtRegFilter_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRegFilter.TextChanged
        emps = CType(ViewState("emps"), ArrayList)
        ViewState("empIndx") = emps.IndexOf(CInt(txtRegFilter.Text))
        DisplayEmp(CInt(ViewState("empIndx")))
    End Sub







    Protected Sub fvHRData_PreRender(sender As Object, e As EventArgs) Handles fvHRData.PreRender
        MarkJobEnds()
    End Sub


    Private Sub MarkJobEnds()
        Try
            Dim myFV As FormView = fvHRData
            Dim myImg As Image = myFV.FindControl("Image1")
            Dim mylbl As Label = myFV.FindControl("الموقف_الحاليLabel0")
            '  Dim myPayYes As Label = myFV.FindControl("ملف_الاجورlabel")
            If mylbl.Text = "إنهاء عمل" Then
                mylbl.ForeColor = Drawing.Color.Red
                '     myPayYes.ForeColor = Drawing.Color.Red ' ملف_الاجور
                myImg.BorderColor = Drawing.Color.Red
            Else
                mylbl.ForeColor = Drawing.Color.Green
                '    myPayYes.ForeColor = Drawing.Color.Green
                myImg.BorderColor = Drawing.Color.Green
            End If

        Catch ex As Exception

        End Try

    End Sub


End Class
