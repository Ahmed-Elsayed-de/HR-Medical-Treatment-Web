Imports System.Security.Principal
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports System.Data

Partial Class Pages_MtTickets
    Inherits System.Web.UI.Page



    Dim emps As New ArrayList()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Page.SetFocus(txtRegFilter)
            txtRegFilter.Text = 0
            txtRegFilter.Attributes.Add("onfocusin", " select();")
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

    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)


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
        cmd.Parameters.AddWithValue("@code", CType(fvHRData.FindControl("CodeLabel5"), Label).Text)
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
     
        fvTickets.InsertItem(True)
        fvTickets.DataBind()
        fvTickets.ChangeMode(FormViewMode.Edit)
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
       
        If fvTickets.CurrentMode = FormViewMode.Edit Then
            CType(fvTickets.FindControl("ddlTreatTypeId"), DropDownList).SelectedValue() = CType(gvItems.Rows(gvRow.RowIndex).FindControl("Label1"), Label).Text
            'reset special need
            'ResetCheck()
            'ResetPharmcy()
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

        DocAndPharmcy(sender, e)
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
        fvTickets.DataSourceID = sdsTeckits.UniqueID
        fvTickets.DataBind()

        If fvHRData.DataItemCount > 0 Then
            fvWife.Visible = True
            gvChildren.Visible = True
            fvMaxFamilyBox.Visible = True
            fvMaxFamilyEmp.Visible = True
            FormView1.Visible = True

        Else
            lblNav.Text = ""

        End If


     

    End Sub
    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        sdsTeckits.UpdateParameters("TreatType").DefaultValue = CType(fvTickets.FindControl("ddlTreatTypeId"), DropDownList).SelectedItem.Text
        CType(fvTickets.FindControl("HiddenFieldHostName"), HiddenField).Value() = Session("pcName")
        CType(fvTickets.FindControl("HiddenFieldUserName"), HiddenField).Value() = Session("UserName")
        CType(fvTickets.FindControl("HidenFieldLastModefideBy"), HiddenField).Value() = Session("UserName") ' will be read from security of sms

        Dim cn1 As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
        Dim cmd1 As New SqlCommand("select TreatType from MtItems where id=" + CType(fvTickets.FindControl("ddlTreatTypeId"), DropDownList).SelectedValue, cn1)
        cn1.Open()
        Dim TreatType As String = cmd1.ExecuteScalar().ToString
        cn1.Close()
        hfTreateType.Value = TreatType

        fvTickets.UpdateItem(True)
     

    End Sub

    Protected Sub ddlTreatKind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim _ddlTreatKind As DropDownList = CType(sender, DropDownList)
        If _ddlTreatKind.SelectedIndex = 0 Then
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).Enabled = False
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).SelectedValue = "-"
            chbFamilyBox.Enabled = False
        Else
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).Enabled = True
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).SelectedValue = "الابن - الابنة - الزوجة"
            chbFamilyBox.Enabled = True
        End If
        GetSpecialNeed(sender, e)

    End Sub

    Protected Sub ddlDokConfirm_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        'ResetCheck()
        GetSpecialNeed(sender, e)
        ' DocAndPharmcy(sender, e)
        'DokConfirmDateTextBox.Text = Date.Now.ToShortDateString()
    End Sub

    Protected Sub ddlPharmConfirm0_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        'ResetPharmcy()
        GetSpecialNeed(sender, e)
        '  DocAndPharmcy(sender, e)
        'pharmConfirmDateTextBox.Text = Date.Now.ToShortDateString()
    End Sub

    Private Sub DocAndPharmcy(ByVal sender As Object, ByVal e As System.EventArgs) 'Enable or disable  Localdeduct and  ForeignDeduct

        Dim _ddlTreatKind As DropDownList = CType(fvTickets.FindControl("ddlTreatKind"), DropDownList)
        Dim spNeed As String = "لا"
        If ViewState("SpecialNeed") IsNot Nothing Then
            spNeed = ViewState("SpecialNeed")
        End If


        If spNeed = "نعم" And ddlDokConfirm.SelectedIndex = 1 And ddlPharmConfirm0.SelectedIndex = 1 Then ' special and doc and pharm  


            CheckTextBox.Enabled = False
            Check1TextBox.Enabled = False
            Check2TextBox.Enabled = False
            CheckFTextBox.Enabled = False
            CheckSTextBox.Enabled = True

            LocaldeductTextBox.Enabled = False
            Localdeduct1TextBox.Enabled = False
            Localdeduct2TextBox.Enabled = False
            LocaldeductFTextBox.Enabled = False
            LocaldeductSTextBox.Enabled = True

            ForeignDeductTextBox.Enabled = False
            ForeignDeduct1TextBox.Enabled = False
            ForeignDeduct2TextBox.Enabled = False
            ForeignDeductFTextBox.Enabled = False
            ForeignDeductSTextBox.Enabled = True

            CheckTextBox.Text = 0
            Check1TextBox.Text = 0
            Check2TextBox.Text = 0
            CheckFTextBox.Text = 0
            'CheckSTextBox.Text = 0

            LocaldeductTextBox.Text = 0
            Localdeduct1TextBox.Text = 0
            Localdeduct2TextBox.Text = 0
            LocaldeductFTextBox.Text = 0
            '  LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            ForeignDeductFTextBox.Text = 0
            ' ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = True
            pharmConfirmDateTextBox.Enabled = True

            DokConfirmDateTextBox.Text = Date.Now
            pharmConfirmDateTextBox.Text = Date.Now

            BillingNoTextBox0.Enabled = True
            BillingNo1TextBox0.Enabled = True

            chbFamilyBox.Enabled = False

        ElseIf spNeed = "نعم" And ddlDokConfirm.SelectedIndex = 1 And ddlPharmConfirm0.SelectedIndex = 0 Then ' sp and doc and no pharm


            CheckTextBox.Enabled = False
            Check1TextBox.Enabled = False
            Check2TextBox.Enabled = False
            CheckFTextBox.Enabled = False
            CheckSTextBox.Enabled = True

            LocaldeductTextBox.Enabled = False
            Localdeduct1TextBox.Enabled = False
            Localdeduct2TextBox.Enabled = False
            LocaldeductFTextBox.Enabled = False
            LocaldeductSTextBox.Enabled = False

            ForeignDeductTextBox.Enabled = False
            ForeignDeduct1TextBox.Enabled = False
            ForeignDeduct2TextBox.Enabled = False
            ForeignDeductFTextBox.Enabled = False
            ForeignDeductSTextBox.Enabled = False

            CheckTextBox.Text = 0
            Check1TextBox.Text = 0
            Check2TextBox.Text = 0
            CheckFTextBox.Text = 0
            'CheckSTextBox.Text = 0

            LocaldeductTextBox.Text = 0
            Localdeduct1TextBox.Text = 0
            Localdeduct2TextBox.Text = 0
            LocaldeductFTextBox.Text = 0
            LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            ForeignDeductFTextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = True
            pharmConfirmDateTextBox.Enabled = False

            DokConfirmDateTextBox.Text = Date.Now
            pharmConfirmDateTextBox.Text = ""

            BillingNoTextBox0.Enabled = True
            'BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = False
            BillingNo1TextBox0.Text = ""

            chbFamilyBox.Enabled = False
        ElseIf spNeed = "نعم" And ddlDokConfirm.SelectedIndex = 0 And ddlPharmConfirm0.SelectedIndex = 1 Then ' sp and no doc and pharm


            CheckTextBox.Enabled = False
            Check1TextBox.Enabled = False
            Check2TextBox.Enabled = False
            CheckFTextBox.Enabled = False
            CheckSTextBox.Enabled = False

            LocaldeductTextBox.Enabled = False
            Localdeduct1TextBox.Enabled = False
            Localdeduct2TextBox.Enabled = False
            LocaldeductFTextBox.Enabled = False
            LocaldeductSTextBox.Enabled = True

            ForeignDeductTextBox.Enabled = False
            ForeignDeduct1TextBox.Enabled = False
            ForeignDeduct2TextBox.Enabled = False
            ForeignDeductFTextBox.Enabled = False
            ForeignDeductSTextBox.Enabled = True

            CheckTextBox.Text = 0
            Check1TextBox.Text = 0
            Check2TextBox.Text = 0
            CheckFTextBox.Text = 0
            CheckSTextBox.Text = 0

            LocaldeductTextBox.Text = 0
            Localdeduct1TextBox.Text = 0
            Localdeduct2TextBox.Text = 0
            LocaldeductFTextBox.Text = 0
            '  LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            ForeignDeductFTextBox.Text = 0
            ' ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = False
            pharmConfirmDateTextBox.Enabled = True

            DokConfirmDateTextBox.Text = ""
            pharmConfirmDateTextBox.Text = Date.Now

            BillingNoTextBox0.Enabled = False
            BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = True
            ' BillingNo1TextBox0.Text = ""

            chbFamilyBox.Enabled = False


        ElseIf spNeed = "نعم" And ddlDokConfirm.SelectedIndex = 0 And ddlPharmConfirm0.SelectedIndex = 0 Then ' sp and no doc and no pharm



            CheckTextBox.Enabled = False
            Check1TextBox.Enabled = False
            Check2TextBox.Enabled = False
            CheckFTextBox.Enabled = False
            CheckSTextBox.Enabled = False

            LocaldeductTextBox.Enabled = False
            Localdeduct1TextBox.Enabled = False
            Localdeduct2TextBox.Enabled = False
            LocaldeductFTextBox.Enabled = False
            LocaldeductSTextBox.Enabled = False

            ForeignDeductTextBox.Enabled = False
            ForeignDeduct1TextBox.Enabled = False
            ForeignDeduct2TextBox.Enabled = False
            ForeignDeductFTextBox.Enabled = False
            ForeignDeductSTextBox.Enabled = False

            CheckTextBox.Text = 0
            Check1TextBox.Text = 0
            Check2TextBox.Text = 0
            CheckFTextBox.Text = 0
            CheckSTextBox.Text = 0

            LocaldeductTextBox.Text = 0
            Localdeduct1TextBox.Text = 0
            Localdeduct2TextBox.Text = 0
            LocaldeductFTextBox.Text = 0
            LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            ForeignDeductFTextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = False
            pharmConfirmDateTextBox.Enabled = False

            DokConfirmDateTextBox.Text = ""
            pharmConfirmDateTextBox.Text = ""

            BillingNoTextBox0.Enabled = False
            BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = False
            BillingNo1TextBox0.Text = ""

            chbFamilyBox.Enabled = False

        ElseIf spNeed = "لا" And ddlDokConfirm.SelectedIndex = 1 And ddlPharmConfirm0.SelectedIndex = 1 And _ddlTreatKind.SelectedIndex = 0 Then 'personal no special and doc and pharm 


            CheckTextBox.Enabled = True
            Check1TextBox.Enabled = True
            Check2TextBox.Enabled = True
            CheckFTextBox.Enabled = False
            CheckSTextBox.Enabled = False

            LocaldeductTextBox.Enabled = True
            Localdeduct1TextBox.Enabled = True
            Localdeduct2TextBox.Enabled = True
            LocaldeductFTextBox.Enabled = False
            LocaldeductSTextBox.Enabled = False

            ForeignDeductTextBox.Enabled = True
            ForeignDeduct1TextBox.Enabled = True
            ForeignDeduct2TextBox.Enabled = True
            ForeignDeductFTextBox.Enabled = False
            ForeignDeductSTextBox.Enabled = False

            'CheckTextBox.Text = 0
            'Check1TextBox.Text = 0
            'Check2TextBox.Text = 0
            CheckFTextBox.Text = 0
            CheckSTextBox.Text = 0

            'LocaldeductTextBox.Text = 0
            'Localdeduct1TextBox.Text = 0
            'Localdeduct2TextBox.Text = 0
            LocaldeductFTextBox.Text = 0
            LocaldeductSTextBox.Text = 0

            'ForeignDeductTextBox.Text = 0
            'ForeignDeduct1TextBox.Text = 0
            'ForeignDeduct2TextBox.Text = 0
            ForeignDeductFTextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = True
            pharmConfirmDateTextBox.Enabled = True

            DokConfirmDateTextBox.Text = Date.Now
            pharmConfirmDateTextBox.Text = Date.Now

            BillingNoTextBox0.Enabled = True
            ' BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = True
            ' BillingNo1TextBox0.Text = ""

            chbFamilyBox.Enabled = False
            chbFamilyBox.Checked = False

        ElseIf spNeed = "لا" And ddlDokConfirm.SelectedIndex = 1 And ddlPharmConfirm0.SelectedIndex = 0 And _ddlTreatKind.SelectedIndex = 0 Then 'personal no sp and doc and no pharm

            CheckTextBox.Enabled = True
            Check1TextBox.Enabled = True
            Check2TextBox.Enabled = True
            CheckFTextBox.Enabled = False
            CheckSTextBox.Enabled = False

            LocaldeductTextBox.Enabled = False
            Localdeduct1TextBox.Enabled = False
            Localdeduct2TextBox.Enabled = False
            LocaldeductFTextBox.Enabled = False
            LocaldeductSTextBox.Enabled = False

            ForeignDeductTextBox.Enabled = False
            ForeignDeduct1TextBox.Enabled = False
            ForeignDeduct2TextBox.Enabled = False
            ForeignDeductFTextBox.Enabled = False
            ForeignDeductSTextBox.Enabled = False

            'CheckTextBox.Text = 0
            'Check1TextBox.Text = 0
            'Check2TextBox.Text = 0
            CheckFTextBox.Text = 0
            CheckSTextBox.Text = 0

            LocaldeductTextBox.Text = 0
            Localdeduct1TextBox.Text = 0
            Localdeduct2TextBox.Text = 0
            LocaldeductFTextBox.Text = 0
            LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            ForeignDeductFTextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = True
            pharmConfirmDateTextBox.Enabled = False

            DokConfirmDateTextBox.Text = Date.Now
            pharmConfirmDateTextBox.Text = ""

            BillingNoTextBox0.Enabled = True
            ' BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = False
            BillingNo1TextBox0.Text = ""

            chbFamilyBox.Enabled = False
            chbFamilyBox.Checked = False

        ElseIf spNeed = "لا" And ddlDokConfirm.SelectedIndex = 0 And ddlPharmConfirm0.SelectedIndex = 1 And _ddlTreatKind.SelectedIndex = 0 Then 'personal no sp and no doc and pharm


            CheckTextBox.Enabled = False
            Check1TextBox.Enabled = False
            Check2TextBox.Enabled = False
            CheckFTextBox.Enabled = False
            CheckSTextBox.Enabled = False

            LocaldeductTextBox.Enabled = True
            Localdeduct1TextBox.Enabled = True
            Localdeduct2TextBox.Enabled = True
            LocaldeductFTextBox.Enabled = False
            LocaldeductSTextBox.Enabled = False

            ForeignDeductTextBox.Enabled = True
            ForeignDeduct1TextBox.Enabled = True
            ForeignDeduct2TextBox.Enabled = True
            ForeignDeductFTextBox.Enabled = False
            ForeignDeductSTextBox.Enabled = False

            CheckTextBox.Text = 0
            Check1TextBox.Text = 0
            Check2TextBox.Text = 0
            CheckFTextBox.Text = 0
            CheckSTextBox.Text = 0

            'LocaldeductTextBox.Text = 0
            'Localdeduct1TextBox.Text = 0
            'Localdeduct2TextBox.Text = 0
            LocaldeductFTextBox.Text = 0
            LocaldeductSTextBox.Text = 0

            'ForeignDeductTextBox.Text = 0
            'ForeignDeduct1TextBox.Text = 0
            'ForeignDeduct2TextBox.Text = 0
            ForeignDeductFTextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = False
            pharmConfirmDateTextBox.Enabled = True

            DokConfirmDateTextBox.Text = ""
            pharmConfirmDateTextBox.Text = Date.Now

            BillingNoTextBox0.Enabled = False
            BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = True
            '  BillingNo1TextBox0.Text = ""


            chbFamilyBox.Enabled = False
            chbFamilyBox.Checked = False

        ElseIf spNeed = "لا" And ddlDokConfirm.SelectedIndex = 0 And ddlPharmConfirm0.SelectedIndex = 0 And _ddlTreatKind.SelectedIndex = 0 Then 'personal no sp and no doc and no pharm


            CheckTextBox.Enabled = False
            Check1TextBox.Enabled = False
            Check2TextBox.Enabled = False
            CheckFTextBox.Enabled = False
            CheckSTextBox.Enabled = False

            LocaldeductTextBox.Enabled = False
            Localdeduct1TextBox.Enabled = False
            Localdeduct2TextBox.Enabled = False
            LocaldeductFTextBox.Enabled = False
            LocaldeductSTextBox.Enabled = False

            ForeignDeductTextBox.Enabled = False
            ForeignDeduct1TextBox.Enabled = False
            ForeignDeduct2TextBox.Enabled = False
            ForeignDeductFTextBox.Enabled = False
            ForeignDeductSTextBox.Enabled = False

            CheckTextBox.Text = 0
            Check1TextBox.Text = 0
            Check2TextBox.Text = 0
            CheckFTextBox.Text = 0
            CheckSTextBox.Text = 0

            LocaldeductTextBox.Text = 0
            Localdeduct1TextBox.Text = 0
            Localdeduct2TextBox.Text = 0
            LocaldeductFTextBox.Text = 0
            LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            ForeignDeductFTextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = False
            pharmConfirmDateTextBox.Enabled = False

            DokConfirmDateTextBox.Text = ""
            pharmConfirmDateTextBox.Text = ""

            BillingNoTextBox0.Enabled = False
            BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = False
            BillingNo1TextBox0.Text = ""

            chbFamilyBox.Enabled = False
            chbFamilyBox.Checked = False

        ElseIf spNeed = "لا" And ddlDokConfirm.SelectedIndex = 1 And ddlPharmConfirm0.SelectedIndex = 1 And _ddlTreatKind.SelectedIndex = 1 Then 'not personal no special and doc and pharm  



            CheckTextBox.Enabled = False
            Check1TextBox.Enabled = False
            Check2TextBox.Enabled = False
            CheckFTextBox.Enabled = True
            CheckSTextBox.Enabled = False

            LocaldeductTextBox.Enabled = False
            Localdeduct1TextBox.Enabled = False
            Localdeduct2TextBox.Enabled = False
            LocaldeductFTextBox.Enabled = True
            LocaldeductSTextBox.Enabled = False

            ForeignDeductTextBox.Enabled = False
            ForeignDeduct1TextBox.Enabled = False
            ForeignDeduct2TextBox.Enabled = False
            ForeignDeductFTextBox.Enabled = True
            ForeignDeductSTextBox.Enabled = False

            CheckTextBox.Text = 0
            Check1TextBox.Text = 0
            Check2TextBox.Text = 0
            'CheckFTextBox.Text = 0
            CheckSTextBox.Text = 0

            LocaldeductTextBox.Text = 0
            Localdeduct1TextBox.Text = 0
            Localdeduct2TextBox.Text = 0
            ' LocaldeductFTextBox.Text = 0
            LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            'ForeignDeductFTextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = True
            pharmConfirmDateTextBox.Enabled = True

            DokConfirmDateTextBox.Text = Date.Now
            pharmConfirmDateTextBox.Text = Date.Now

            BillingNoTextBox0.Enabled = True
            '  BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = True
            ' BillingNo1TextBox0.Text = ""

            chbFamilyBox.Enabled = True


        ElseIf spNeed = "لا" And ddlDokConfirm.SelectedIndex = 1 And ddlPharmConfirm0.SelectedIndex = 0 And _ddlTreatKind.SelectedIndex = 1 Then 'not personal no sp and doc and no pharm


            CheckTextBox.Enabled = False
            Check1TextBox.Enabled = False
            Check2TextBox.Enabled = False
            CheckFTextBox.Enabled = True
            CheckSTextBox.Enabled = False

            LocaldeductTextBox.Enabled = False
            Localdeduct1TextBox.Enabled = False
            Localdeduct2TextBox.Enabled = False
            LocaldeductFTextBox.Enabled = False
            LocaldeductSTextBox.Enabled = False

            ForeignDeductTextBox.Enabled = False
            ForeignDeduct1TextBox.Enabled = False
            ForeignDeduct2TextBox.Enabled = False
            ForeignDeductFTextBox.Enabled = False
            ForeignDeductSTextBox.Enabled = False

            CheckTextBox.Text = 0
            Check1TextBox.Text = 0
            Check2TextBox.Text = 0
            ' CheckFTextBox.Text = 0
            CheckSTextBox.Text = 0

            LocaldeductTextBox.Text = 0
            Localdeduct1TextBox.Text = 0
            Localdeduct2TextBox.Text = 0
            LocaldeductFTextBox.Text = 0
            LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            ForeignDeductFTextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = True
            pharmConfirmDateTextBox.Enabled = False

            DokConfirmDateTextBox.Text = Date.Now
            pharmConfirmDateTextBox.Text = ""

            BillingNoTextBox0.Enabled = True
            ' BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = False
            BillingNo1TextBox0.Text = ""

            chbFamilyBox.Enabled = True

        ElseIf spNeed = "لا" And ddlDokConfirm.SelectedIndex = 0 And ddlPharmConfirm0.SelectedIndex = 1 And _ddlTreatKind.SelectedIndex = 1 Then 'not personal no sp and no doc and pharm



            CheckTextBox.Enabled = False
            Check1TextBox.Enabled = False
            Check2TextBox.Enabled = False
            CheckFTextBox.Enabled = False
            CheckSTextBox.Enabled = False

            LocaldeductTextBox.Enabled = False
            Localdeduct1TextBox.Enabled = False
            Localdeduct2TextBox.Enabled = False
            LocaldeductFTextBox.Enabled = True
            LocaldeductSTextBox.Enabled = False

            ForeignDeductTextBox.Enabled = False
            ForeignDeduct1TextBox.Enabled = False
            ForeignDeduct2TextBox.Enabled = False
            ForeignDeductFTextBox.Enabled = True
            ForeignDeductSTextBox.Enabled = False

            CheckTextBox.Text = 0
            Check1TextBox.Text = 0
            Check2TextBox.Text = 0
            CheckFTextBox.Text = 0
            CheckSTextBox.Text = 0

            LocaldeductTextBox.Text = 0
            Localdeduct1TextBox.Text = 0
            Localdeduct2TextBox.Text = 0
            ' LocaldeductFTextBox.Text = 0
            LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            'ForeignDeductFTextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = False
            pharmConfirmDateTextBox.Enabled = True

            DokConfirmDateTextBox.Text = ""
            pharmConfirmDateTextBox.Text = Date.Now

            BillingNoTextBox0.Enabled = False
            BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = True
            '  BillingNo1TextBox0.Text = ""

            chbFamilyBox.Enabled = True

        ElseIf spNeed = "لا" And ddlDokConfirm.SelectedIndex = 0 And ddlPharmConfirm0.SelectedIndex = 0 And _ddlTreatKind.SelectedIndex = 1 Then 'not personal no sp and no doc and no pharm


            CheckTextBox.Enabled = False
            Check1TextBox.Enabled = False
            Check2TextBox.Enabled = False
            CheckFTextBox.Enabled = False
            CheckSTextBox.Enabled = False

            LocaldeductTextBox.Enabled = False
            Localdeduct1TextBox.Enabled = False
            Localdeduct2TextBox.Enabled = False
            LocaldeductFTextBox.Enabled = False
            LocaldeductSTextBox.Enabled = False

            ForeignDeductTextBox.Enabled = False
            ForeignDeduct1TextBox.Enabled = False
            ForeignDeduct2TextBox.Enabled = False
            ForeignDeductFTextBox.Enabled = False
            ForeignDeductSTextBox.Enabled = False

            CheckTextBox.Text = 0
            Check1TextBox.Text = 0
            Check2TextBox.Text = 0
            CheckFTextBox.Text = 0
            CheckSTextBox.Text = 0

            LocaldeductTextBox.Text = 0
            Localdeduct1TextBox.Text = 0
            Localdeduct2TextBox.Text = 0
            LocaldeductFTextBox.Text = 0
            LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            ForeignDeductFTextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = False
            pharmConfirmDateTextBox.Enabled = False

            DokConfirmDateTextBox.Text = ""
            pharmConfirmDateTextBox.Text = ""

            BillingNoTextBox0.Enabled = False
            BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = False
            BillingNo1TextBox0.Text = ""

            chbFamilyBox.Enabled = True

        End If

    End Sub
    'Private Sub PersonalDoctor(ByVal bol As Boolean)

    '    If bol Then
    '        DokConfirmDateTextBox.Text = Date.Now
    '    Else
    '        DokConfirmDateTextBox.Text = ""
    '    End If
    '    DokConfirmDateTextBox.Enabled = bol
    '    BillingNoTextBox0.Enabled = bol
    '    CheckTextBox.Enabled = bol
    '    Check1TextBox.Enabled = bol
    '    Check2TextBox.Enabled = bol

    '    CheckFTextBox.Enabled = False
    '    CheckSTextBox.Enabled = False

    'End Sub
    'Private Sub FamilyDoctor(ByVal bol As Boolean)
    '    If bol Then
    '        DokConfirmDateTextBox.Text = Date.Now
    '    Else
    '        DokConfirmDateTextBox.Text = ""
    '    End If
    '    CheckFTextBox.Enabled = bol

    '    DokConfirmDateTextBox.Enabled = bol
    '    BillingNoTextBox0.Enabled = bol

    '    CheckTextBox.Enabled = False
    '    Check1TextBox.Enabled = False
    '    Check2TextBox.Enabled = False
    'End Sub
    'Private Sub PersonalPharmacy(ByVal bol As Boolean) 'Enable or disable  Localdeduct and  ForeignDeduct
    '    If bol Then
    '        pharmConfirmDateTextBox.Text = Date.Now
    '    Else
    '        pharmConfirmDateTextBox.Text = ""
    '    End If
    '    pharmConfirmDateTextBox.Enabled = bol
    '    BillingNo1TextBox0.Enabled = bol
    '    LocaldeductTextBox.Enabled = bol
    '    Localdeduct1TextBox.Enabled = bol
    '    Localdeduct2TextBox.Enabled = bol
    '    ForeignDeductTextBox.Enabled = bol
    '    ForeignDeduct1TextBox.Enabled = bol
    '    ForeignDeduct2TextBox.Enabled = bol
    '    LocaldeductFTextBox.Enabled = False
    '    ForeignDeductFTextBox.Enabled = False


    'End Sub
    'Private Sub FamilylPharmacy(ByVal bol As Boolean) 'Enable or disable  Localdeduct and  ForeignDeduct
    '    If bol Then
    '        pharmConfirmDateTextBox.Text = Date.Now
    '    Else
    '        pharmConfirmDateTextBox.Text = ""
    '    End If
    '    pharmConfirmDateTextBox.Enabled = bol
    '    BillingNo1TextBox0.Enabled = bol

    '    LocaldeductTextBox.Enabled = False
    '    Localdeduct1TextBox.Enabled = False
    '    Localdeduct2TextBox.Enabled = False

    '    ForeignDeductTextBox.Enabled = False
    '    ForeignDeduct1TextBox.Enabled = False
    '    ForeignDeduct2TextBox.Enabled = False

    '    LocaldeductFTextBox.Enabled = bol
    '    ForeignDeductFTextBox.Enabled = bol

    'End Sub
    'Private Sub IsSpecialNeed(ByVal bol As Boolean) 'Enable or disable  Localdeduct and  ForeignDeduct



    '    CheckTextBox.Enabled = Not bol
    '    Check1TextBox.Enabled = Not bol
    '    Check2TextBox.Enabled = Not bol
    '    CheckFTextBox.Enabled = Not bol
    '    CheckSTextBox.Enabled = bol

    '    LocaldeductTextBox.Enabled = Not bol
    '    Localdeduct1TextBox.Enabled = Not bol
    '    Localdeduct2TextBox.Enabled = Not bol
    '    LocaldeductFTextBox.Enabled = Not bol
    '    LocaldeductSTextBox.Enabled = bol

    '    ForeignDeductTextBox.Enabled = Not bol
    '    ForeignDeduct1TextBox.Enabled = Not bol
    '    ForeignDeduct2TextBox.Enabled = Not bol
    '    ForeignDeductFTextBox.Enabled = Not bol
    '    ForeignDeductSTextBox.Enabled = bol



    'End Sub

    Protected Sub ddlDokConfirm_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        GetSpecialNeed(sender, e)
        '  DocAndPharmcy(sender, e)
    End Sub

    Protected Sub ddlPharmConfirm0_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        GetSpecialNeed(sender, e)
        ' DocAndPharmcy(sender, e)
    End Sub
    'Private Sub ResetCheck()

    '    If fvTickets.CurrentMode = FormViewMode.Edit Then
    '        CheckTextBox.Text = 0
    '        Check1TextBox.Text = 0
    '        Check2TextBox.Text = 0
    '        CheckFTextBox.Text = 0
    '        CheckSTextBox.Text = 0
    '    ElseIf fvTickets.CurrentMode = FormViewMode.Insert Then
    '    End If
    'End Sub
    'Private Sub ResetPharmcy()
    '    LocaldeductTextBox.Text = 0
    '    Localdeduct1TextBox.Text = 0
    '    Localdeduct2TextBox.Text = 0
    '    LocaldeductFTextBox.Text = 0
    '    LocaldeductSTextBox.Text = 0
    '    ForeignDeductTextBox.Text = 0
    '    ForeignDeduct1TextBox.Text = 0
    '    ForeignDeduct2TextBox.Text = 0
    '    ForeignDeductFTextBox.Text = 0
    '    ForeignDeductSTextBox.Text = 0
    'End Sub
    Protected Sub YearMTTextBoxIns_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim TYear As TextBox = CType(sender, TextBox)
        TYear.Text = ddlYearMt.SelectedValue
    End Sub

    Protected Sub ddlTreatKindIns_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim _ddlTreatKindIns As DropDownList = CType(sender, DropDownList)

        If _ddlTreatKindIns.SelectedIndex = 0 Then ' شخصى
            CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).Enabled = False
            CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).SelectedIndex = 0
        Else
            CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).Enabled = True
            CType(fvTickets.FindControl("ddlRelativesIns"), DropDownList).SelectedIndex = 2
        End If
    End Sub
    Protected Sub btnTreatTypeIdIns_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Panel17_ModalPopupExtender.Show()
    End Sub
    Protected Sub codeTextBoxIns_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim TCode As TextBox = CType(sender, TextBox)

        If fvHRData.FindControl("CodeLabel5") IsNot Nothing Then
            TCode.Text = CType(fvHRData.FindControl("CodeLabel5"), Label).Text
        End If


    End Sub

    Protected Sub TarnsDateTextBoxIns_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim TCode As TextBox = CType(sender, TextBox)

        If TCode.Text = "" Then
            TCode.Text = Date.Now.ToShortDateString
        End If


    End Sub
    Protected Sub InsertCancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
      
        fvTickets.DataBind()

    End Sub
    Protected Sub InsertButton_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
    
    End Sub
    Protected Sub ddlTreatKind_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim lbl As Label = CType(fvHRData.FindControl("نوع_التعاقدLabel0"), Label)
        'If lbl.Text = "عقد مكافأة شاملة" Then
        '    CType(sender, DropDownList).Enabled = False
        'End If
        'Dim ddl As DropDownList = CType(sender, DropDownList)
        'chbFamilyBox.Enabled = (ddl.SelectedIndex <> 0)
        '''' Load 
        'Dim _ddlTreatKind As DropDownList = CType(sender, DropDownList)
        'If _ddlTreatKind.SelectedIndex = 0 Then
        '    CType(fvTickets.FindControl("ddlRelatives"), DropDownList).Enabled = False
        '    CType(fvTickets.FindControl("ddlRelatives"), DropDownList).SelectedIndex = 0
        '    chbFamilyBox.Enabled = False
        'Else
        '    CType(fvTickets.FindControl("ddlRelatives"), DropDownList).Enabled = True
        '    CType(fvTickets.FindControl("ddlRelatives"), DropDownList).SelectedIndex = 2
        '    chbFamilyBox.Enabled = True
        'End If
        'GetSpecialNeed(sender, e)
        '''
        'chbFamilyBox.Enabled = (_ddlTreatKind.SelectedIndex <> 0)
        'DocAndPharmcy(sender, e))
    End Sub
    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrint.Click
        Dim url As String = ""
        Dim id As String = ""
        If (CType(fvTickets.FindControl("Id_3101Label"), Label) IsNot Nothing) Then
            id = CType(fvTickets.FindControl("Id_3101Label"), Label).Text
        ElseIf (CType(fvTickets.FindControl("Id_3101Label1"), Label) IsNot Nothing) Then
            id = CType(fvTickets.FindControl("Id_3101Label1"), Label).Text
        End If
        url = "MtPrint.aspx?id=" + id
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "openPopup", "window.open('" + url + "','_blank','height=500,width=800,status=yes,toolbar=no,menubar=no,location=yes,scrollbars=yes,resizable=yes,titlebar=no' );", True)
    End Sub
    'Protected Sub btnHistory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHistory.Click
    '    'Me.Panel8_ModalPopupExtender2.Show()
    'End Sub
    Dim showNew As Boolean = False
    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
  
    End Sub
    Protected Sub fvTickets_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvTickets.DataBound
        If fvTickets.CurrentMode = FormViewMode.ReadOnly And fvTickets.DataItemCount > 0 Then
            btnPrint.Visible = True
            btnPrintManegers.Visible = True
            wuc1.NewBtnVisable = True
            wuc1.EditBtnVisable = True
            wuc1.DeleteBtnVisable = True
        Else
            showNew = False
        End If


        If fvTickets.DataItemCount > 0 Then

            If ViewState("indx") Is Nothing Then
                FVPageing(0)
            Else
                FVPageing(CInt(ViewState("indx")))
            End If


            'Dim lbl As Label = CType(fvTickets.FindControl("Id_3101Label"), Label)
            'If lbl IsNot Nothing Then
            '    txtNav.Text = lbl.Text
            '    lblNav.Text = (CInt(ViewState("indx")) + 1).ToString() + " من " + fvTickets.PageCount.ToString
            'End If
            btnNxt.Visible = True
            btnPrev.Visible = True
            txtNav.Visible = True
            lblNav.Visible = True
            btnFrstTicket.Visible = True
            btnLstTick.Visible = True
        Else
            btnNxt.Visible = False
            btnPrev.Visible = False
            txtNav.Visible = False
            lblNav.Visible = False
            btnFrstTicket.Visible = False
            btnLstTick.Visible = False
        End If



   

    End Sub
    Protected Sub NewBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnNewClick
        btnPrint.Visible = False
        btnPrintManegers.Visible = False
        wuc1.NewBtnVisable = False
        wuc1.EditBtnVisable = False
        wuc1.DeleteBtnVisable = False

        fvTickets.ChangeMode(FormViewMode.Insert)
        Dim transDate As TextBox = CType(fvTickets.FindControl(""), TextBox)
        If transDate IsNot Nothing Then
            transDate.Focus()
            transDate.Attributes.Add("onfocusin", " select();")
        End If

    End Sub
    Protected Sub EditBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnEditClick
        btnPrint.Visible = False
        btnPrintManegers.Visible = False
        wuc1.NewBtnVisable = False
        wuc1.EditBtnVisable = False
        wuc1.DeleteBtnVisable = False
        ' pnlSearch.Visible = False
        fvTickets.ChangeMode(FormViewMode.Edit)
    End Sub
    Protected Sub DeleteBtn(ByVal sender As Object, ByVal e As System.EventArgs) Handles wuc1.btnDeleteClick
        fvTickets.DeleteItem()
    End Sub
    Protected Sub fvTickets_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvTickets.ModeChanged
        If fvTickets.CurrentMode = FormViewMode.Edit Then
            showNew = False
        ElseIf fvTickets.CurrentMode = FormViewMode.ReadOnly Then 'And fvTickets.DataItemCount > 0 
            showNew = True
        ElseIf fvTickets.CurrentMode = FormViewMode.Insert Then
            showNew = False
        End If
    End Sub

    Protected Sub fvTickets_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvTickets.ItemInserted
        btnPrint.Visible = True
        btnPrintManegers.Visible = True
        wuc1.NewBtnVisable = True
        wuc1.EditBtnVisable = True
        wuc1.DeleteBtnVisable = True
        '  pnlSearch.Visible = True
    End Sub

  

    Protected Sub fvTickets_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles fvTickets.ItemUpdated
        btnPrint.Visible = True
        btnPrintManegers.Visible = True
        wuc1.NewBtnVisable = True
        wuc1.EditBtnVisable = True
        wuc1.DeleteBtnVisable = True
        ' pnlSearch.Visible = True
    End Sub

    Protected Sub UpdateCancelButton0_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        btnPrint.Visible = True
        btnPrintManegers.Visible = True
        wuc1.NewBtnVisable = True
        wuc1.EditBtnVisable = True
        wuc1.DeleteBtnVisable = True
        '  pnlSearch.Visible = True
    End Sub
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error

      ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, Session("pcName"), Session("UserName"), Me.User.Identity.Name, Server.GetLastError(), Me)

        Server.ClearError()
        Response.Redirect("Error.aspx")

    End Sub

    Protected Sub ddlTreatKindread_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim lbl As Label = CType(fvHRData.FindControl("نوع_التعاقدLabel0"), Label)
        'If lbl.Text = "عقد مكافأة شاملة" Then
        '    CType(sender, DropDownList).Enabled = False
        'End If
    End Sub

    Protected Sub ddlTreatKindIns_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim lbl As Label = CType(fvHRData.FindControl("نوع_التعاقدLabel0"), Label)
        'If lbl.Text = "عقد مكافأة شاملة" Then
        '    CType(sender, DropDownList).Enabled = False
        'End If
    End Sub

    Protected Sub btnHistory2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Panel8_ModalPopupExtender2.Show()
    End Sub

    Protected Sub ddlTreatTypeId_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ' ResetPharmcy()
        GetSpecialNeed(sender, e)
        ' DocAndPharmcy(sender, e)
    End Sub

    Protected Sub btnPrintManegers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintManegers.Click
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
 

    Protected Sub ddlPharmNotesSearch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPharmNotesSearch.SelectedIndexChanged
        ' lblTicketID.Text = ddlPharmNotesSearch.SelectedValue.ToString
        txtTransIDSearch.Text = ddlPharmNotesSearch.SelectedValue.ToString
    End Sub

    Protected Sub btnApplay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnApplay.Click


        If IsNumeric(txtTransIDSearch.Text) Then
            Dim dv As DataView = DirectCast(sdsTeckitsByID.Select(DataSourceSelectArguments.Empty), DataView)
            If dv.Count > 0 Then
                For Each drv As DataRowView In dv
                    hfCode.Value = drv("code").ToString()

                Next
            Else
                hfCode.Value = 0
            End If




            sdsHRDataByID.DataBind()
            fvHRData.DataSourceID = sdsHRDataByID.UniqueID
            fvHRData.DataBind()

            ViewState("indx") = Nothing

            If fvHRData.DataItemCount > 0 Then
                txtRegFilter.Text = CType(fvHRData.FindControl("Regist_No1Label3"), Label).Text
                fvTickets.DataBind()

                Dim lst As New ArrayList()
                Dim dv2 As DataView = DirectCast(sdsTeckits.Select(DataSourceSelectArguments.Empty), DataView)

                If dv2 IsNot Nothing Then
                    If dv2.Count > 0 Then
                        For Each drv As DataRowView In dv2
                            lst.Add(drv("id_3101").ToString())
                        Next
                        ViewState("indx") = lst.IndexOf(txtTransIDSearch.Text)
                        fvTickets.PageIndex = ViewState("indx")  ' Move into the selected Ticket in fv
                    Else
                        lst.Add(0)
                    End If

                End If
            End If
            ''fvTickets.DataSource = Nothing
            ''fvTickets.DataSourceID = sdsTeckitsByID.UniqueID
            'fvTickets.DataBind()


            'If fvHRData.FindControl("Regist_No1Label3") IsNot Nothing Then
            '    txtRegFilter.Text = CType(fvHRData.FindControl("Regist_No1Label3"), Label).Text
            'End If


        End If

       


    End Sub

    Protected Sub ddlNotesSearch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlNotesSearch.SelectedIndexChanged
        '  lblTicketID.Text = ddlNotesSearch.SelectedValue.ToString
        txtTransIDSearch.Text = ddlNotesSearch.SelectedValue.ToString
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

    Protected Sub txtRegFilter_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRegFilter.TextChanged
        emps = CType(ViewState("emps"), ArrayList)
        ViewState("empIndx") = emps.IndexOf(CInt(txtRegFilter.Text))
        DisplayEmp(CInt(ViewState("empIndx")))

        sdsHRData.DataBind()
        fvHRData.DataSourceID = sdsHRData.UniqueID
        fvHRData.DataBind()
        txtTransIDSearch.Text = 0
    End Sub
   Protected Sub txtIndx22_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txt As TextBox = CType(sender, TextBox)
        Dim lbl As Label = CType(fvTickets.FindControl("Id_3101Label"), Label)
        If lbl IsNot Nothing And txt IsNot Nothing Then
            txt.Text = lbl.Text
        End If
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
            Dim lbl As Label = CType(fvTickets.FindControl("Id_3101Label"), Label)
            If lbl IsNot Nothing Then
                txtNav.Text = lbl.Text
                lblNav.Text = (CInt(ViewState("indx")) + 1).ToString() + " من " + fvTickets.PageCount.ToString
            Else
                lbl = CType(fvTickets.FindControl("Id_3101Label1"), Label)
                txtNav.Text = lbl.Text
                lblNav.Text = (CInt(ViewState("indx")) + 1).ToString() + " من " + fvTickets.PageCount.ToString
            End If
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

    Protected Sub btnExit_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        btnPrint.Visible = True
        btnPrintManegers.Visible = True
        wuc1.NewBtnVisable = True
        wuc1.EditBtnVisable = True
        wuc1.DeleteBtnVisable = True
        txtRegFilter.Attributes.Add("onfocusin", " select();")
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

    Protected Sub btnFrstTicket_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnFrstTicket.Click
        ViewState("indx") = 0
        FVPageing(0)
    End Sub

    Protected Sub btnLstTick_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLstTick.Click
        ViewState("indx") = fvTickets.PageCount - 1
        FVPageing(CInt(ViewState("indx")))
    End Sub

   
    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound

        Dim lbl As Label = CType(FormView1.FindControl("CheckTotalLabel0"), Label)

        If Not lbl Is Nothing Then
            Dim s As String = lbl.Text
        End If



    End Sub

    Protected Sub ddlYearMt_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlYearMt.PreRender
        Dim clor As Int32
        Try
            clor = Val(ddlYearMt.Text)
            Me.pnlYear.BackColor = Drawing.Color.FromArgb(clor * 100000)
            lblYear.Text = ddlYearMt.Text
        Catch ex As Exception
            'MsgBox(ex.Message)
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
            Dim myImg As Image = myFV.FindControl("Image3")
            Dim mylbl As Label = myFV.FindControl("الموقف_الحاليLabel1")
            '  Dim myPayYes As Label = myFV.FindControl("ملف_الاجورlabel")
            If mylbl.Text = "مستمر بالعمل" Then
                mylbl.ForeColor = Drawing.Color.Green
                '     myPayYes.ForeColor = Drawing.Color.Red ' ملف_الاجور
                myImg.BorderColor = Drawing.Color.Green
            Else
                mylbl.ForeColor = Drawing.Color.Red

                '    myPayYes.ForeColor = Drawing.Color.Green
                myImg.BorderColor = Drawing.Color.Red

            End If

        Catch ex As Exception

        End Try

    End Sub


    Protected Sub BtPrintRange_Click(sender As Object, e As ImageClickEventArgs) Handles BtPrintRange.Click
        Dim url As String = ""
        Dim id As String = ""

        Dim s As String = ""
        For index = Integer.Parse(TextBox1.Text) To Integer.Parse(TextBox2.Text)
            id += s + index.ToString()
            s = ","

        Next

        url = "MtPrint.aspx?id=" + id + "&typ=mngr"
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "openPopup", "window.open('" + url + "','_blank','height=500,width=800,status=yes,toolbar=no,menubar=no,location=yes,scrollbars=yes,resizable=yes,titlebar=no' );", True)

    End Sub
End Class
