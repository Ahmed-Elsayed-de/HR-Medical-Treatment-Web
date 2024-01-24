Imports System.Security.Principal
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports System.Data
Imports System.IO


Partial Class Pages_MtNewTickets
    Inherits System.Web.UI.Page


    Dim emps As New ArrayList()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Page.SetFocus(txtRegFilter)
            txtRegFilter.Attributes.Add("onfocusin", " select();")
            Page.Form.DefaultButton = LinkButton1.UniqueID

            Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
            Dim sql As String = "SELECT   HRdata.Regist_No1    FROM HRdata  inner join MedicalNotes m   on HRdata.Code = m.Code   inner join HR..[1112] x   on HRdata.Code = x.Code    WHERE ((HRdata.الموقف_الحالي <>'إنهاء عمل') or (HRdata.الموقف_الحالي ='إنهاء عمل' and x.إنهاء_عمل in ('معاش','عجز','بدون')))"
            '   Dim cmd As New SqlCommand("select Regist_No1 from HRData ", cn)
            Dim cmd As New SqlCommand(sql, cn)
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader
            While dr.Read
                emps.Add(dr.GetInt32(0))
                ViewState("emps") = emps
                ViewState("empIndx") = 0


            End While

            cn.Close()
            DisplayEmp(0)


        End If

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
    Protected Sub txtItemsFilter_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtItemsFilter.TextChanged
        sdsItems.DataBind()
        gvItems.DataBind()
    End Sub
    Protected Sub btnTreatTypeId_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Panel17_ModalPopupExtender.Show()
    End Sub
    Protected Sub btnSelectItems_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cb As LinkButton = DirectCast(sender, LinkButton)
        Dim gvRow As GridViewRow = cb.NamingContainer
        Dim rowIn As Int16 = gvRow.RowIndex
        '    Try
        If fvTickets.CurrentMode = FormViewMode.Edit Then
            CType(fvTickets.FindControl("ddlTreatTypeId"), DropDownList).SelectedValue() = CType(gvItems.Rows(gvRow.RowIndex).FindControl("Label1"), Label).Text
            GetSpecialNeed(sender, e) 'check for special need
        ElseIf fvTickets.CurrentMode = FormViewMode.Insert Then
            CType(fvTickets.FindControl("ddlTreatTypeIdIns"), DropDownList).SelectedValue = CType(gvItems.Rows(gvRow.RowIndex).FindControl("Label1"), Label).Text
        End If

        Me.Panel17_ModalPopupExtender.Hide()
        Me.Panel17_ModalPopupExtender.Dispose()
      
    End Sub
    Private Sub GetSpecialNeed(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim id As Int32 = CType(fvTickets.FindControl("ddlTreatTypeId"), DropDownList).SelectedValue()
        Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
        Dim cmd As New SqlCommand("select SpecialNeed from MtItems where id=" + id.ToString(), cn)
        cn.Open()
        Dim sn As String = cmd.ExecuteScalar().ToString
        cn.Close()
        ViewState("SpecialNeed") = sn
    End Sub
    Protected Sub btnOk0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOk0.Click
        Me.Panel17_ModalPopupExtender.Hide()
        Me.Panel17_ModalPopupExtender.Dispose()
    End Sub
    Protected Sub ddlTreatTypeId0_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTreatTypeId0.SelectedIndexChanged
        txtItemsFilter.Text = ddlTreatTypeId0.SelectedItem.Text
        txtItemsFilter_TextChanged(sender, e)
        Me.Panel17_ModalPopupExtender.Show()
    End Sub
    Protected Sub fvHRData_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvHRData.DataBound
        ViewState("indx") = Nothing
        If fvHRData.DataItemCount > 0 Then
            fvWife.DataBind()
            gvChildren.DataBind()
            fvTickets.DataBind()
            FormView1.DataBind()
            fvTickets.ChangeMode(FormViewMode.Insert)
        Else
            '  fvHRData.Visible = False
            fvTickets.Visible = False
            fvMaxFamilyEmp.Visible = False
            fvMaxFamilyBox.Visible = False
            fvWife.Visible = False
            gvChildren.Visible = False

            LinkButton1.Visible = False
            LinkButton2.Visible = False
            btnExit.Visible = False
            txtRegFilter.Focus()
            lblNav.Text = ""
        End If
    End Sub
    Protected Sub ddlTreatKind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim _ddlTreatKind As DropDownList = CType(sender, DropDownList)
        If _ddlTreatKind.SelectedIndex = 0 Then
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).Enabled = False
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).SelectedIndex = 0

        Else
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).Enabled = True
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).SelectedIndex = 2

        End If
        GetSpecialNeed(sender, e)
    End Sub
    Protected Sub ddlDokConfirm_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        GetSpecialNeed(sender, e)
    End Sub
    Protected Sub ddlPharmConfirm0_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        GetSpecialNeed(sender, e)
    End Sub
    Protected Sub YearMTTextBoxIns_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim TYear As TextBox = CType(sender, TextBox)
        TYear.Text = ddlYearMt.SelectedValue
    End Sub

    Protected Sub ddlTreatKindIns_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim _ddlTreatKindIns As DropDownList = CType(sender, DropDownList)

        If _ddlTreatKindIns.SelectedIndex = 0 Then ' شخصى
            CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).Enabled = False
            CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).SelectedValue = "-"
        Else
            CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).Enabled = True
            CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).SelectedValue = "الابن - الابنة - الزوجة"
        End If
    End Sub
    Protected Sub btnTreatTypeIdIns_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Panel17_ModalPopupExtender.Show()
    End Sub
    Protected Sub codeTextBoxIns_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim TCode As TextBox = CType(sender, TextBox)
        If fvHRData.FindControl("CodeLabel3") IsNot Nothing Then
            TCode.Text = CType(fvHRData.FindControl("CodeLabel3"), Label).Text
        End If
    End Sub

    Protected Sub TarnsDateTextBoxIns_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txt As TextBox = CType(fvTickets.FindControl("TarnsDateTextBoxIns"), TextBox)
        If txt.Text = "" Then
            txt.Text = Date.Now.ToShortDateString
        End If
    End Sub

    Protected Sub ddlTreatKind_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim ddl As DropDownList = CType(sender, DropDownList)
        'chbFamilyBox.Enabled = (ddl.SelectedIndex <> 0)
    End Sub
    
   
    Dim showNew As Boolean = False
    Protected Sub fvTickets_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvTickets.ModeChanged

    End Sub
    Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'txtRegFilter.Text = ""
        'fvHRData.DataSource = Nothing
        'fvHRData.DataBind()
        'btnPrint1.Visible = False
        'wuc1.NewBtnVisable = False
    End Sub
    Protected Sub InsertButton_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        

        Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
        Dim cmd As New SqlCommand(" INSERT INTO [MtTickets] ([Contractors],TarnsDate, [TreatType], [TreatTypeId], [TreatKind], [relatives], [notes],[PharmMemo] ,[code],[YearMT], [HospitalLevel],  [CreatedBy],[Contractors2],categorization,CreatedDate,WinHostName,WinUserName,LastModifiedDate,LastModifiedBy)   VALUES (  @Contractors,@TarnsDate, @TreatType,   @TreatTypeId, @TreatKind,   @relatives, @notes,@PharmMemo,   @code, @YearMT,    @HospitalLevel,    @CreatedBy,    @Contractors2,@categorization,getdate(),@WinHostName,@WinUserName,GetDate(),@LastModifiedBy) ;select @@identity", cn)

        cmd.Parameters.AddWithValue("@Contractors", CType(fvTickets.FindControl("ddlContractorsIns"), DropDownList).SelectedValue)
        Dim s As String = CType(fvTickets.FindControl("TarnsDateTextBoxIns"), TextBox).Text
        cmd.Parameters.AddWithValue("@TarnsDate", CDate(s))
        cmd.Parameters.AddWithValue("@TreatTypeId", CType(fvTickets.FindControl("ddlTreatTypeIdIns"), DropDownList).SelectedValue)

        Dim cn1 As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
        Dim cmd1 As New SqlCommand("select TreatType from MtItems where id=" + CType(fvTickets.FindControl("ddlTreatTypeIdIns"), DropDownList).SelectedValue, cn1)
        cn1.Open()
        Dim TreatType As String = cmd1.ExecuteScalar().ToString
        cn1.Close()

        cmd.Parameters.AddWithValue("@TreatType", TreatType)
        cmd.Parameters.AddWithValue("@TreatKind", CType(fvTickets.FindControl("ddlTreatKindIns"), DropDownList).SelectedValue)
        cmd.Parameters.AddWithValue("@relatives", CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).SelectedValue)
        cmd.Parameters.AddWithValue("@notes", CType(fvTickets.FindControl("TextBoxNodeIns"), TextBox).Text)
        cmd.Parameters.AddWithValue("@PharmMemo", CType(fvTickets.FindControl("TextBoxPharmNodeIns"), TextBox).Text)
        cmd.Parameters.AddWithValue("@code", CType(fvHRData.FindControl("CodeLabel3"), Label).Text)
        cmd.Parameters.AddWithValue("@YearMT", CType(fvTickets.FindControl("YearMTTextBoxIns"), TextBox).Text)
        cmd.Parameters.AddWithValue("@HospitalLevel", CType(fvTickets.FindControl("ddlHospitalIns"), DropDownList).SelectedValue)
        cmd.Parameters.AddWithValue("@CreatedBy", Session("UserName"))
        cmd.Parameters.AddWithValue("@Contractors2", CType(fvTickets.FindControl("ddlContractorsPHIns"), DropDownList).SelectedValue)
        cmd.Parameters.AddWithValue("@categorization", CType(fvTickets.FindControl("ddlCategorizationIns"), DropDownList).SelectedValue)
        cmd.Parameters.AddWithValue("@WinHostName", Session("pcName"))
        cmd.Parameters.AddWithValue("@WinUserName", Session("UserName"))
        cmd.Parameters.AddWithValue("@LastModifiedBy", Session("UserName"))
        cn.Open()
        Dim i As Integer = cmd.ExecuteScalar()
        If i > 0 Then ' i is the identity value
            ViewState("TransID") = i
        End If
        cn.Close()

        btnPrint1.Visible = True
        btnPrintManegers.Visible = True
        wuc1.NewBtnVisable = True
        txtRegFilter.Focus()
        fvTickets.ChangeMode(FormViewMode.ReadOnly)
        btnPrint_Click(sender, e)
 
    End Sub
    Protected Sub NewBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnNewClick
        btnPrint1.Visible = False
        btnPrintManegers.Visible = False
        wuc1.NewBtnVisable = False
        fvTickets.ChangeMode(FormViewMode.Insert)
        ViewState("cancle") = False
        'Dim txt As TextBox = CType(fvTickets.FindControl("TarnsDateTextBoxIns"), TextBox)
        'If txt IsNot Nothing And fvTickets.CurrentMode = FormViewMode.Insert Then
        '    txt.Focus()
        '    txt.Attributes.Add("onfocusin", " select();")
        'End If
    End Sub
    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        If ViewState("empIndx") = 0 Or ViewState("cancle") = True Then
            txtRegFilter.Focus()
            txtRegFilter.Attributes.Add("onfocusin", " select();")
        Else
            'Dim txt As TextBox = CType(fvTickets.FindControl("TarnsDateTextBoxIns"), TextBox)
            'If txt IsNot Nothing And fvTickets.CurrentMode = FormViewMode.Insert Then
            '    txt.Focus()
            '    txt.Attributes.Add("onfocusin", " select();")
            'End If
        End If
    End Sub

    Protected Sub fvTickets_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvTickets.DataBound
        
        If fvTickets.CurrentMode = FormViewMode.ReadOnly And fvTickets.DataItemCount > 0 Then

            LinkButton1.Visible = False
            LinkButton2.Visible = False
            btnExit.Visible = False
            btnPrint1.Visible = True
            btnPrintManegers.Visible = True
            wuc1.NewBtnVisable = True
            fvHRData.Visible = True
            fvTickets.Visible = True
            fvMaxFamilyBox.Visible = True
            fvMaxFamilyEmp.Visible = True
            fvWife.Visible = True
            gvChildren.Visible = True

        ElseIf fvTickets.CurrentMode = FormViewMode.Insert Then


            LinkButton1.Visible = True
            LinkButton2.Visible = True
            btnExit.Visible = True
            btnPrint1.Visible = False
            btnPrintManegers.Visible = False
            wuc1.NewBtnVisable = False

            'Dim txt As TextBox = CType(fvTickets.FindControl("TarnsDateTextBoxIns"), TextBox)
            'If txt IsNot Nothing And fvTickets.CurrentMode = FormViewMode.Insert Then
            '    txt.Focus()
            '    txt.Attributes.Add("onfocusin", " select();")
            'End If

        End If

        wuc1.EditBtnVisable = False
        wuc1.DeleteBtnVisable = False


        If fvTickets.DataItemCount > 0 Then

            If ViewState("indx") Is Nothing Then
                FVPageing(0)
            Else
                FVPageing(CInt(ViewState("indx")))
            End If


            Dim lbl As Label = CType(fvTickets.FindControl("Id_3101Label"), Label)
            If lbl IsNot Nothing Then
                txtNav.Text = lbl.Text
                lblNav.Text = (CInt(ViewState("indx")) + 1).ToString() + " من " + fvTickets.PageCount.ToString
            End If
            btnNxt.Visible = True
            btnPrev.Visible = True
            txtNav.Visible = True
            lblNav.Visible = True
            btnFrstTick.Visible = True
            btnlstTick.Visible = True
        Else
            btnNxt.Visible = False
            btnPrev.Visible = False
            txtNav.Visible = False
            lblNav.Visible = False
            btnFrstTick.Visible = False
            btnlstTick.Visible = False
        End If



    End Sub
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, Session("pcName"), Session("UserName"), Me.User.Identity.Name, Server.GetLastError(), Me)
        Server.ClearError()
        Response.Redirect("Error.aspx")
    End Sub
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        InsertButton_Click1(sender, e)
    End Sub

 
    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click

        fvTickets.DataBind()

        ''cancle

        'fvHRData.Visible = False
        'fvTickets.Visible = False
        'fvMaxFamilyEmp.Visible = False
        'fvMaxFamilyBox.Visible = False
        'fvWife.Visible = False
        'gvChildren.Visible = False
        ''btnHistory.Visible = False
        'LinkButton1.Visible = False
        'LinkButton2.Visible = False
        'txtRegFilter.Text = "0"
        'txtRegFilter.Focus()
        'txtRegFilter.Attributes.Add("onfocusin", " select();")

        'ViewState("cancle") = True


    End Sub

    Protected Sub ddlContractorsIns_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddl As DropDownList = CType(sender, DropDownList)
        ddl.SelectedValue = "83"

    End Sub

    Protected Sub txtRegFilter_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRegFilter.TextChanged
        emps = CType(ViewState("emps"), ArrayList)
        ViewState("empIndx") = emps.IndexOf(CInt(txtRegFilter.Text))
        DisplayEmp(CInt(ViewState("empIndx")))

        ViewState("cancle") = False
        fvTickets.Visible = True
        fvHRData.Visible = True
        fvMaxFamilyBox.Visible = True
        fvMaxFamilyEmp.Visible = True
        fvWife.Visible = True
        gvChildren.Visible = True

    End Sub

    Protected Sub btnLoadItm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLoadItm.Click
        sdsItems.DataBind()
        gvItems.DataBind()
    End Sub

    Protected Sub TarnsDateTextBoxIns_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
     
    End Sub
 

    Protected Sub btnHistory2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Panel8_ModalPopupExtender2.Show()
    End Sub

    Protected Sub btnNxt_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNxt.Click

        Dim i As Integer = 0
        If ViewState("indx") IsNot Nothing Then
            i = CInt(ViewState("indx"))
        End If
        i += 1
        FVPageing(i)

    End Sub
    Private Sub FVPageing(ByVal indx As Integer)
        ViewState("indx") = indx
        If fvTickets.PageCount > indx - 1 And indx >= 0 Then
            fvTickets.PageIndex = indx

        End If
        If fvTickets.PageIndex = 0 And fvTickets.PageCount = 1 Then
            btnPrev.Enabled = False
            btnPrev.ImageUrl = "~/Images/ltrX.png"
            btnNxt.Enabled = False
            btnNxt.ImageUrl = "~/Images/rtlX.png"
        ElseIf fvTickets.PageIndex = 0 And fvTickets.PageCount > 1 Then
            btnPrev.Enabled = False
            btnPrev.ImageUrl = "~/Images/ltrX.png"
            btnNxt.Enabled = True
            btnNxt.ImageUrl = "~/Images/rtl.png"
        ElseIf fvTickets.PageIndex <> 0 And fvTickets.PageIndex = fvTickets.PageCount - 1 Then
            btnPrev.Enabled = True
            btnPrev.ImageUrl = "~/Images/ltr.png"
            btnNxt.Enabled = False
            btnNxt.ImageUrl = "~/Images/rtlX.png"
        Else
            btnPrev.Enabled = True
            btnPrev.ImageUrl = "~/Images/ltr.png"
            btnNxt.Enabled = True
            btnNxt.ImageUrl = "~/Images/rtl.png"
        End If
    End Sub

    Protected Sub btnPrev_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPrev.Click
        Dim i As Integer = 0
        If ViewState("indx") IsNot Nothing Then
            i = CInt(ViewState("indx"))
        End If
        i -= 1
        FVPageing(i)
    End Sub
    
    Protected Sub btnExit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExit.Click
        'cancle

        'fvHRData.Visible = False
        'fvTickets.Visible = False
        'fvMaxFamilyEmp.Visible = False
        'fvMaxFamilyBox.Visible = False
        'fvWife.Visible = False
        'gvChildren.Visible = False
        'btnHistory.Visible = False 
        'txtRegFilter.Text = "0"
        LinkButton1.Visible = False
        LinkButton2.Visible = False
        btnExit.Visible = False
        wuc1.NewBtnVisable = True
        fvTickets.ChangeMode(FormViewMode.ReadOnly)

        'txtRegFilter.Focus()
        'txtRegFilter.Attributes.Add("onfocusin", " select();")

        '  ViewState("cancle") = True
    End Sub

 
    Protected Sub btnPrintManegers_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPrintManegers.Click
        Dim url As String = ""
        Dim id As String = ""
        If ViewState("TransID") IsNot Nothing Then
            id = ViewState("TransID").ToString()
        End If


        If (CType(fvTickets.FindControl("Id_3101Label"), Label) IsNot Nothing) Then
            id = CType(fvTickets.FindControl("Id_3101Label"), Label).Text
        ElseIf (CType(fvTickets.FindControl("Id_3101Label1"), Label) IsNot Nothing) Then
            id = CType(fvTickets.FindControl("Id_3101Label1"), Label).Text
        End If
        url = "MtPrint.aspx?id=" + id + "&typ=mngr"
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "openPopup", "window.open('" + url + "','_blank','height=500,width=800,status=yes,toolbar=no,menubar=no,location=yes,scrollbars=yes,resizable=yes,titlebar=no' );", True)

    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnPrint1.Click
        Dim url As String = ""
        Dim id As String = ""
        If ViewState("TransID") IsNot Nothing Then
            id = ViewState("TransID").ToString()
        End If


        If (CType(fvTickets.FindControl("Id_3101Label"), Label) IsNot Nothing) Then
            id = CType(fvTickets.FindControl("Id_3101Label"), Label).Text
        ElseIf (CType(fvTickets.FindControl("Id_3101Label1"), Label) IsNot Nothing) Then
            id = CType(fvTickets.FindControl("Id_3101Label1"), Label).Text
        End If
        url = "MtPrint.aspx?id=" + id
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "openPopup", "window.open('" + url + "','_blank','height=500,width=800,status=yes,toolbar=no,menubar=no,location=yes,scrollbars=yes,resizable=yes,titlebar=no' );", True)


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

    Protected Sub btnFrst_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnFrst.Click
        ViewState("empIndx") = 0
        DisplayEmp(0)
    End Sub

    Protected Sub btnLst_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLst.Click
        emps = CType(ViewState("emps"), ArrayList)
        ViewState("empIndx") = emps.Count - 1
        DisplayEmp(CInt(ViewState("empIndx")))
    End Sub

    Protected Sub btnFrstTick_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnFrstTick.Click
        ViewState("indx") = 0
        FVPageing(0)
    End Sub

    Protected Sub btnlstTick_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnlstTick.Click
        ViewState("indx") = fvTickets.PageCount - 1
        FVPageing(CInt(ViewState("indx")))
    End Sub

    Protected Sub ddlYearMt_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlYearMt.PreRender
        Dim clor As Int32
        Try
            clor = Val(ddlYearMt.Text)
            pnlYear.BackColor = Drawing.Color.FromArgb(clor * 100000)
            lblYear.Text = ddlYearMt.Text
        Catch ex As Exception
            ' MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub ddlYearMt_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlYearMt.SelectedIndexChanged
        Dim clor As Int32
        Try
            clor = Val(ddlYearMt.Text)
            pnlYear.BackColor = Drawing.Color.FromArgb(clor * 100000)
            lblYear.Text = ddlYearMt.Text
        Catch ex As Exception
            ' MsgBox(ex.Message)
        End Try
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
            If mylbl.Text = "مستمر بالعمل" Then
                mylbl.ForeColor = Drawing.Color.Green
                '    myPayYes.ForeColor = Drawing.Color.Green
                myImg.BorderColor = Drawing.Color.Green
            Else
                mylbl.ForeColor = Drawing.Color.Red
                '     myPayYes.ForeColor = Drawing.Color.Red ' ملف_الاجور
                myImg.BorderColor = Drawing.Color.Red
            End If

        Catch ex As Exception

        End Try

    End Sub




    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
        cn.Open()
        Dim c As Integer = Integer.Parse(TextBox1.Text)
        Dim h As String = ""
        Dim ids As String = ""
        Dim i As Integer
        For index = 1 To c
            Dim cmd As New SqlCommand(" INSERT INTO [MtTickets] ([Contractors],TarnsDate, [TreatType], [TreatTypeId], [TreatKind], [relatives], [notes],[PharmMemo] ,[code],[YearMT], [HospitalLevel],  [CreatedBy],[Contractors2],categorization,CreatedDate,WinHostName,WinUserName,LastModifiedDate,LastModifiedBy)   VALUES (  @Contractors,@TarnsDate, @TreatType,   @TreatTypeId, @TreatKind,   @relatives, @notes,@PharmMemo,   @code, @YearMT,    @HospitalLevel,    @CreatedBy,    @Contractors2,@categorization,getdate(),@WinHostName,@WinUserName,GetDate(),@LastModifiedBy) ;select @@identity", cn)

            cmd.Parameters.AddWithValue("@Contractors", CType(fvTickets.FindControl("ddlContractorsIns"), DropDownList).SelectedValue)
            Dim s As String = CType(fvTickets.FindControl("TarnsDateTextBoxIns"), TextBox).Text
            cmd.Parameters.AddWithValue("@TarnsDate", CDate(s))
            cmd.Parameters.AddWithValue("@TreatTypeId", CType(fvTickets.FindControl("ddlTreatTypeIdIns"), DropDownList).SelectedValue)

            Dim cn1 As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
            Dim cmd1 As New SqlCommand("select TreatType from MtItems where id=" + CType(fvTickets.FindControl("ddlTreatTypeIdIns"), DropDownList).SelectedValue, cn1)
            cn1.Open()
            Dim TreatType As String = cmd1.ExecuteScalar().ToString
            cn1.Close()

            cmd.Parameters.AddWithValue("@TreatType", TreatType)
            cmd.Parameters.AddWithValue("@TreatKind", CType(fvTickets.FindControl("ddlTreatKindIns"), DropDownList).SelectedValue)
            cmd.Parameters.AddWithValue("@relatives", CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).SelectedValue)
            cmd.Parameters.AddWithValue("@notes", CType(fvTickets.FindControl("TextBoxNodeIns"), TextBox).Text)
            cmd.Parameters.AddWithValue("@PharmMemo", CType(fvTickets.FindControl("TextBoxPharmNodeIns"), TextBox).Text)
            cmd.Parameters.AddWithValue("@code", CType(fvHRData.FindControl("CodeLabel3"), Label).Text)
            cmd.Parameters.AddWithValue("@YearMT", CType(fvTickets.FindControl("YearMTTextBoxIns"), TextBox).Text)
            cmd.Parameters.AddWithValue("@HospitalLevel", CType(fvTickets.FindControl("ddlHospitalIns"), DropDownList).SelectedValue)
            cmd.Parameters.AddWithValue("@CreatedBy", Session("UserName"))
            cmd.Parameters.AddWithValue("@Contractors2", CType(fvTickets.FindControl("ddlContractorsPHIns"), DropDownList).SelectedValue)
            cmd.Parameters.AddWithValue("@categorization", CType(fvTickets.FindControl("ddlCategorizationIns"), DropDownList).SelectedValue)
            cmd.Parameters.AddWithValue("@WinHostName", Session("pcName"))
            cmd.Parameters.AddWithValue("@WinUserName", Session("UserName"))
            cmd.Parameters.AddWithValue("@LastModifiedBy", Session("UserName"))


            i = cmd.ExecuteScalar()
            ids = ids + h + i.ToString()
            h = ","
        Next

        'Dim i As Integer = cmd.ExecuteScalar()
        'If i > 0 Then ' i is the identity value
        '    ViewState("TransID") = i
        'End If
        cn.Close()

        btnPrint1.Visible = True
        btnPrintManegers.Visible = True
        wuc1.NewBtnVisable = True
        txtRegFilter.Focus()
        fvTickets.ChangeMode(FormViewMode.ReadOnly)
        Dim url As String = "MtPrint.aspx?id=" + ids
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "openPopup", "window.open('" + url + "','_blank','height=500,width=800,status=yes,toolbar=no,menubar=no,location=yes,scrollbars=yes,resizable=yes,titlebar=no' );", True)
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
        cn.Open()
        Dim c As Integer = Integer.Parse(TextBox1.Text)
        Dim h As String = ""
        Dim ids As String = ""
        Dim i As Integer
        For index = 1 To c
            Dim cmd As New SqlCommand(" INSERT INTO [MtTickets] ([Contractors],TarnsDate, [TreatType], [TreatTypeId], [TreatKind], [relatives], [notes],[PharmMemo] ,[code],[YearMT], [HospitalLevel],  [CreatedBy],[Contractors2],categorization,CreatedDate,WinHostName,WinUserName,LastModifiedDate,LastModifiedBy)   VALUES (  @Contractors,@TarnsDate, @TreatType,   @TreatTypeId, @TreatKind,   @relatives, @notes,@PharmMemo,   @code, @YearMT,    @HospitalLevel,    @CreatedBy,    @Contractors2,@categorization,getdate(),@WinHostName,@WinUserName,GetDate(),@LastModifiedBy) ;select @@identity", cn)

            cmd.Parameters.AddWithValue("@Contractors", CType(fvTickets.FindControl("ddlContractorsIns"), DropDownList).SelectedValue)
            Dim s As String = CType(fvTickets.FindControl("TarnsDateTextBoxIns"), TextBox).Text
            cmd.Parameters.AddWithValue("@TarnsDate", CDate(s))
            cmd.Parameters.AddWithValue("@TreatTypeId", CType(fvTickets.FindControl("ddlTreatTypeIdIns"), DropDownList).SelectedValue)

            Dim cn1 As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
            Dim cmd1 As New SqlCommand("select TreatType from MtItems where id=" + CType(fvTickets.FindControl("ddlTreatTypeIdIns"), DropDownList).SelectedValue, cn1)
            cn1.Open()
            Dim TreatType As String = cmd1.ExecuteScalar().ToString
            cn1.Close()

            cmd.Parameters.AddWithValue("@TreatType", TreatType)
            cmd.Parameters.AddWithValue("@TreatKind", CType(fvTickets.FindControl("ddlTreatKindIns"), DropDownList).SelectedValue)
            cmd.Parameters.AddWithValue("@relatives", CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).SelectedValue)
            cmd.Parameters.AddWithValue("@notes", CType(fvTickets.FindControl("TextBoxNodeIns"), TextBox).Text)
            cmd.Parameters.AddWithValue("@PharmMemo", CType(fvTickets.FindControl("TextBoxPharmNodeIns"), TextBox).Text)
            cmd.Parameters.AddWithValue("@code", "5000")
            cmd.Parameters.AddWithValue("@YearMT", CType(fvTickets.FindControl("YearMTTextBoxIns"), TextBox).Text)
            cmd.Parameters.AddWithValue("@HospitalLevel", CType(fvTickets.FindControl("ddlHospitalIns"), DropDownList).SelectedValue)
            cmd.Parameters.AddWithValue("@CreatedBy", Session("UserName"))
            cmd.Parameters.AddWithValue("@Contractors2", CType(fvTickets.FindControl("ddlContractorsPHIns"), DropDownList).SelectedValue)
            cmd.Parameters.AddWithValue("@categorization", CType(fvTickets.FindControl("ddlCategorizationIns"), DropDownList).SelectedValue)
            cmd.Parameters.AddWithValue("@WinHostName", Session("pcName"))
            cmd.Parameters.AddWithValue("@WinUserName", Session("UserName"))
            cmd.Parameters.AddWithValue("@LastModifiedBy", Session("UserName"))


            i = cmd.ExecuteScalar()
            ids = ids + h + i.ToString()
            h = ","
        Next

        'Dim i As Integer = cmd.ExecuteScalar()
        'If i > 0 Then ' i is the identity value
        '    ViewState("TransID") = i
        'End If
        cn.Close()

        btnPrint1.Visible = True
        btnPrintManegers.Visible = True
        wuc1.NewBtnVisable = True
        txtRegFilter.Focus()
        fvTickets.ChangeMode(FormViewMode.ReadOnly)
        Dim url As String = "MtPrint.aspx?id=" + ids + "&typ=mngr"
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "openPopup", "window.open('" + url + "','_blank','height=500,width=800,status=yes,toolbar=no,menubar=no,location=yes,scrollbars=yes,resizable=yes,titlebar=no' );", True)
    End Sub
End Class
