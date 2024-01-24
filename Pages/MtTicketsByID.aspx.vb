Imports System.Security.Principal
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports System.Data

Partial Class Pages_MtTicketsByID
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Page.Form.DefaultButton = LinkButton1.UniqueID
            txtBillingNo.Focus()
            txtBillingNo.Attributes.Add("onfocusin", " select();")
            If ddlRequestKind.SelectedIndex = 0 Then
                ddlContractors0.DataSource = SqlContractors
            ElseIf ddlRequestKind.SelectedIndex = 1 Then
                ddlContractors0.DataSource = SqlContractorsPh
            End If
            lblRequestKind.Text = ddlRequestKind.SelectedItem.Text + " : "
            ddlContractors0.DataTextField = "Contractors"
            ddlContractors0.DataValueField = "Contractors"
            ddlContractors0.DataBind()
        End If
    End Sub
    Protected Sub txtItemsFilter_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtItemsFilter.TextChanged
        sdsItems.DataBind()
        gvItems.DataBind()
    End Sub
    Protected Sub btnTreatTypeId_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Panel17_ModalPopupExtender.Show()
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

        If fvHRData.DataItemCount > 0 Then
            fvTickets.DataBind()

            Dim lst As New ArrayList()
            Dim dv As DataView = DirectCast(sdsTeckits.Select(DataSourceSelectArguments.Empty), DataView)

            If dv IsNot Nothing Then
                If dv.Count > 0 Then
                    For Each drv As DataRowView In dv
                        lst.Add(drv("id_3101").ToString())
                    Next
                    ViewState("indx") = lst.IndexOf(txtTransID.Text)
                    fvTickets.PageIndex = ViewState("indx")  ' Move into the selected Ticket in fv
                Else
                    lst.Add(0)
                End If

            End If
        End If

        fvMaxFamilyBox.DataBind()
        fvMaxFamilyEmp.DataBind()
        FormView1.DataBind()

    End Sub
    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
       
    End Sub

    Protected Sub ddlTreatKind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
        Dim _ddlTreatKind As DropDownList = CType(sender, DropDownList)
        If _ddlTreatKind.SelectedIndex = 0 Then 'personal
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).Enabled = False
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).SelectedIndex = 0
            ' chbFamilyBox.Enabled = False

        Else
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).Enabled = True
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).SelectedIndex = 2
            ' chbFamilyBox.Enabled = True
        End If
        GetSpecialNeed(sender, e)

    End Sub

    Protected Sub ddlDokConfirm_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        If ddlDokConfirm.SelectedIndex = 0 Then
            CType(fvTickets.FindControl("BillingNoTextBox0"), TextBox).Text = 0
        End If

        ViewState("changed") = True
        'ResetCheck()
        GetSpecialNeed(sender, e)

    End Sub

    Protected Sub ddlPharmConfirm0_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        If ddlPharmConfirm0.SelectedIndex = 0 Then
            CType(fvTickets.FindControl("BillingNo1TextBox0"), TextBox).Text = 0
        End If
        ViewState("changed") = True
        GetSpecialNeed(sender, e)

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


            If DokConfirmDateTextBox.Text = "" Then
                DokConfirmDateTextBox.Text = Date.Now
            End If

            If pharmConfirmDateTextBox.Text = "" Then
                pharmConfirmDateTextBox.Text = Date.Now
            End If


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


            If DokConfirmDateTextBox.Text = "" Then
                DokConfirmDateTextBox.Text = Date.Now
            End If

            If pharmConfirmDateTextBox.Text = "" Then
                pharmConfirmDateTextBox.Text = Date.Now
            End If
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
            If pharmConfirmDateTextBox.Text = "" Then
                pharmConfirmDateTextBox.Text = Date.Now
            End If

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

            If DokConfirmDateTextBox.Text = "" Then
                DokConfirmDateTextBox.Text = Date.Now
            End If

            If pharmConfirmDateTextBox.Text = "" Then
                pharmConfirmDateTextBox.Text = Date.Now
            End If

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

            If DokConfirmDateTextBox.Text = "" Then
                DokConfirmDateTextBox.Text = Date.Now
            End If
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
            If pharmConfirmDateTextBox.Text = "" Then
                pharmConfirmDateTextBox.Text = Date.Now
            End If

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

            If DokConfirmDateTextBox.Text = "" Then
                DokConfirmDateTextBox.Text = Date.Now
            End If

            If pharmConfirmDateTextBox.Text = "" Then
                pharmConfirmDateTextBox.Text = Date.Now
            End If

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

            If DokConfirmDateTextBox.Text = "" Then
                DokConfirmDateTextBox.Text = Date.Now
            End If
            pharmConfirmDateTextBox.Text = ""

            BillingNoTextBox0.Enabled = True
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
            LocaldeductSTextBox.Text = 0

            ForeignDeductTextBox.Text = 0
            ForeignDeduct1TextBox.Text = 0
            ForeignDeduct2TextBox.Text = 0
            ForeignDeductSTextBox.Text = 0


            DokConfirmDateTextBox.Enabled = False
            pharmConfirmDateTextBox.Enabled = True

            DokConfirmDateTextBox.Text = ""
            If pharmConfirmDateTextBox.Text = "" Then
                pharmConfirmDateTextBox.Text = Date.Now
            End If

            BillingNoTextBox0.Enabled = False
            BillingNoTextBox0.Text = ""
            BillingNo1TextBox0.Enabled = True

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
    Protected Sub ddlDokConfirm_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        GetSpecialNeed(sender, e)
    End Sub
    Protected Sub ddlPharmConfirm0_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
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
        TCode.Text = CType(fvHRData.FindControl("CodeLabel3"), Label).Text
    End Sub
    Protected Sub TarnsDateTextBoxIns_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim TCode As TextBox = CType(sender, TextBox)
        TCode.Text = Date.Now.ToString
    End Sub
    Protected Sub fvTickets_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvTickets.DataBound

        If ViewState("hasData") = True Then
            ViewState("docBillNumber") = Nothing
            ViewState("pharmBillNumber") = Nothing

            If fvTickets.DataItemCount > 0 Then 'Bind done

                fvTickets.Visible = True
                fvHRData.Visible = True
                fvMaxFamilyBox.Visible = True
                fvMaxFamilyEmp.Visible = True
                gvChildren.Visible = True
                fvWife.Visible = True
                btnPrint1.Visible = True
                btnPrintManegers.Visible = True
                If ViewState("newValue") IsNot Nothing Then
                    If ViewState("newValue") = True Then
                        fvTickets.FindControl("TarnsDateTextBox").Focus()
                    Else 'not new data
                        ' txtTransID.Focus()
                    End If
                Else
                    fvTickets.FindControl("TarnsDateTextBox").Focus()
                End If
                ' sdsTeckits.DataBind()


                Dim dv As DataView = DirectCast(sdsTeckits.Select(DataSourceSelectArguments.Empty), DataView)
                If dv.Count > 0 Then
                    For Each drv As DataRowView In dv
                        hfCode.Value = drv("code").ToString()
                    Next
                Else
                    hfCode.Value = 0
                End If

                '  fvHRData.DataBind()
                gvChildren.DataBind()
                fvWife.DataBind()
            End If
        Else
            fvHRData.Visible = False
            fvMaxFamilyBox.Visible = False
            fvMaxFamilyEmp.Visible = False
            gvChildren.Visible = False
            fvWife.Visible = False
            btnPrint1.Visible = False
            btnPrintManegers.Visible = False
        End If



        If fvTickets.DataItemCount > 0 Then

            If ViewState("indx") Is Nothing Then
                'ViewState("indx") = fvTickets.PageIndex
                'FVPageing(fvTickets.PageIndex)
            Else
                FVPageing(CInt(ViewState("indx")))
            End If


            Dim lbl As Label = CType(fvTickets.FindControl("Id_3101Label1"), Label)
            If lbl IsNot Nothing Then
                txtNav.Text = lbl.Text
                lblNav.Text = (CInt(ViewState("indx")) + 1).ToString() + " من " + fvTickets.PageCount.ToString
            End If
            btnNxt.Visible = True
            btnPrev.Visible = True
            btnFrst.Visible = True
            btnLst.Visible = True
            txtNav.Visible = True
            lblNav.Visible = True
            LinkButton1.Visible = True
            btnCancle.Visible = True
        Else
            btnNxt.Visible = False
            btnPrev.Visible = False
            txtNav.Visible = False
            lblNav.Visible = False
            LinkButton1.Visible = False
            btnCancle.Visible = False

            btnFrst.Visible = False
            btnLst.Visible = False
        End If




    End Sub
    Protected Sub btnShow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShow.Click
        If ViewState("hasData") = True Then
            If ddlRequestKind.SelectedIndex = 0 Then ' Doc
                Dim doc As DropDownList = CType(fvTickets.FindControl("ddlContractors"), DropDownList)
                doc.SelectedValue = ddlContractors0.SelectedValue
                ddlDokConfirm.SelectedIndex = 1
                BillingNoTextBox0.Text = txtBillingNo.Text
                DokConfirmDateTextBox.Text = Date.Now
                ddlDokConfirm_SelectedIndexChanged(sender, e)
            Else 'pharm
                Dim pharm As DropDownList = CType(fvTickets.FindControl("ddlContractorsPH"), DropDownList)
                pharm.SelectedValue = ddlContractors0.SelectedValue
                ddlPharmConfirm0.SelectedIndex = 1
                ddlPharmConfirm0_SelectedIndexChanged(sender, e)
                BillingNo1TextBox0.Text = txtBillingNo.Text
                pharmConfirmDateTextBox.Text = Date.Now
            End If
            ViewState("changed") = True
        End If
    End Sub
    Protected Sub fvTickets_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles fvTickets.ItemUpdated
        ViewState("newValue") = False
        txtTransID.Focus()
        txtTransID.Attributes.Add("onfocusin", " select();")


        If ViewState("tickID") IsNot Nothing Then ' this case happend if we change code from 6000 to any other Employee
            txtTransID.Text = ViewState("tickID")
            ViewState("tickID") = Nothing
            sdsHRData.DataBind()
            fvHRData.DataBind()
            fvTickets.DataBind()
        End If


    End Sub
    Protected Sub ddlRequestKind_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlRequestKind.SelectedIndexChanged
        lblRequestKind.Text = ddlRequestKind.SelectedItem.Text + " : "
        If ddlRequestKind.SelectedIndex = 0 Then
            ddlContractors0.DataSource = SqlContractors
        ElseIf ddlRequestKind.SelectedIndex = 1 Then
            ddlContractors0.DataSource = SqlContractorsPh
        End If
        ddlContractors0.DataTextField = "Contractors"
        ddlContractors0.DataValueField = "Contractors"
        ddlContractors0.DataBind()
        txtBillingNo.Focus()
    End Sub
    Protected Sub sdsTeckits_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sdsTeckits.Selecting
        fvTickets.ChangeMode(FormViewMode.Edit)
    End Sub
    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, Session("pcName"), Session("UserName"), Me.User.Identity.Name, Server.GetLastError(), Me)
        Server.ClearError()
        Response.Redirect("Error.aspx")
    End Sub
    Protected Sub txtTransID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtTransID.TextChanged
        ViewState("newValue") = True
        fvTickets.Visible = True
        fvHRData.Visible = True
        fvMaxFamilyBox.Visible = True
        fvMaxFamilyEmp.Visible = True
        gvChildren.Visible = True
        fvWife.Visible = True
    End Sub
    Protected Sub ddlRelatives_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim _ddlTreatKind As DropDownList = CType(sender, DropDownList)
        If _ddlTreatKind.SelectedIndex = 0 Then
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).Enabled = False
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).SelectedIndex = 0
        Else
            CType(fvTickets.FindControl("ddlRelatives"), DropDownList).Enabled = True
            chbFamilyBox.Enabled = True
        End If
        GetSpecialNeed(sender, e)
    End Sub
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        CType(fvTickets.FindControl("HiddenFieldHostName"), HiddenField).Value() = Session("pcName")
        CType(fvTickets.FindControl("HiddenFieldUserName"), HiddenField).Value() = Session("UserName")
        CType(fvTickets.FindControl("HidenFieldLastModefideBy"), HiddenField).Value() = Session("UserName")
        Dim cn1 As New SqlConnection(ConfigurationManager.ConnectionStrings("MTConnectionString").ToString())
        Dim cmd1 As New SqlCommand("select TreatType from MtItems where id=" + CType(fvTickets.FindControl("ddlTreatTypeId"), DropDownList).SelectedValue, cn1)
        cn1.Open()
        Dim TreatType As String = cmd1.ExecuteScalar().ToString
        cn1.Close()
        sdsTeckits.UpdateParameters("TreatType").DefaultValue = TreatType ' CType(fvTickets.FindControl("ddlTreatTypeId"), DropDownList).SelectedItem.Text
        If ViewState("changed") = True Then

            If hfCode.Value <> CType(fvTickets.FindControl("ddlEmpName"), DropDownList).SelectedValue.ToString() Then
                ViewState("tickID") = CType(fvTickets.FindControl("Id_3101Label1"), Label).Text
                hfCode.Value = CType(fvTickets.FindControl("ddlEmpName"), DropDownList).SelectedValue
            Else
                ViewState("tickID") = Nothing
            End If
            fvTickets.UpdateItem(True)
        End If
        'txtTransID.Focus()
        'txtTransID.Attributes.Add("onfocusin", " select();")
    End Sub
    Protected Sub btnCancle_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancle.Click
        'fvHRData.Visible = False
        'fvTickets.Visible = False
        'fvMaxFamilyEmp.Visible = False
        'fvMaxFamilyBox.Visible = False
        'gvChildren.Visible = False
        'fvWife.Visible = False
        'txtTransID.Focus()
        'txtTransID.Attributes.Add("onfocusin", " select();")
        fvTickets.DataBind()
    End Sub
    Protected Sub btnSelectItems_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cb As LinkButton = DirectCast(sender, LinkButton)
        Dim gvRow As GridViewRow = cb.NamingContainer
        Dim rowIn As Int16 = gvRow.RowIndex
        If fvTickets.CurrentMode = FormViewMode.Edit Then
            CType(fvTickets.FindControl("ddlTreatTypeId"), DropDownList).SelectedValue() = CType(gvItems.Rows(gvRow.RowIndex).FindControl("Label1"), Label).Text
            GetSpecialNeed(sender, e) 'check for special need
        ElseIf fvTickets.CurrentMode = FormViewMode.Insert Then
            CType(fvTickets.FindControl("ddlTreatTypeIdIns"), DropDownList).SelectedValue = CType(gvItems.Rows(gvRow.RowIndex).FindControl("Label1"), Label).Text
        End If
        Me.Panel17_ModalPopupExtender.Hide()
        Me.Panel17_ModalPopupExtender.Dispose()

    End Sub
    Protected Sub ddlTreatTypeId_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub notesTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub chbFamilyBox_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub ddlRelatives_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub ddlContractors_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub ddlContractorsPH_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub ddlHospital_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub ddlCategorization_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub DokConfirmDateTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub pharmConfirmDateTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub BillingNoTextBox0_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub BillingNo1TextBox0_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub CheckTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
    End Sub
    Protected Sub sdsTeckits_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles sdsTeckits.Selected
        If e.AffectedRows <= 0 Then
            ViewState("hasData") = False
        Else
            ViewState("hasData") = True
        End If
    End Sub
    Protected Sub btnHist_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Panel8_ModalPopupExtender2.Show()
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
        fvHRData.DataBind()
        sdsTeckits.DataBind()
        fvTickets.DataBind()
        Dim clor As Int32
        Try
            clor = Val(ddlYearMt.Text) 'Val(Right(ddlYearMt.Text, 3))
            pnlYear.BackColor = Drawing.Color.FromArgb(clor * 100000) 'Val(Right(ddlYearMt.Text, 1)) + 19 0, 0, clor * 15
            lblYear.Text = ddlYearMt.Text
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub ddlTreatTypeId_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        GetSpecialNeed(sender, e)
    End Sub
    Protected Sub TarnsDateTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ViewState("changed") = True
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
    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrint1.Click

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

    Protected Sub ddlEmpName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(fvTickets.FindControl("codeTextBox"), TextBox).Text = CType(sender, DropDownList).SelectedValue.ToString()
        ViewState("changed") = True
    End Sub

    Protected Sub ddlEmpName_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)

        If CType(fvTickets.FindControl("codeTextBox"), TextBox).Text = "5000" Then
            CType(sender, DropDownList).Enabled = True
        End If

    End Sub

    Protected Sub fvTickets_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs) Handles fvTickets.PageIndexChanging

    End Sub

    Protected Sub btnFrst_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnFrst.Click
        ViewState("indx") = 0
        FVPageing(0)
    End Sub

    Protected Sub btnLst_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLst.Click
        ViewState("indx") = fvTickets.PageCount - 1
        FVPageing(CInt(ViewState("indx")))
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
