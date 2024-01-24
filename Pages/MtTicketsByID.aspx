<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/MT.master" AutoEventWireup="false" CodeFile="MtTicketsByID.aspx.vb" Inherits="Pages_MtTicketsByID" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register src="~/Pages/WebUserSecurityManager.ascx" tagname="WebUserSecurityManager" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style14
        {
            width: 100%;
        }
        .style15
        {
            font-style: normal;
            text-align: left;
        }
        .style16
        {
            font-style: normal;
            font-weight: bold;
        }
        .style18
        {
            color: #0000FF;
        }
        .style28
        {
            text-align: right;
            font-weight: 700;
            font-style: normal;
            width: 203px;
            font-size: 8pt;
            font-family: Tahoma;
            color: #0000FF;
        }
        .style46
        {
            width: 125px;
            text-align: center;
        }
        .style49
        {
            text-align: left;
        }
        .style50
        {
            width: 125px;
            text-align: left;
        }
        .style53
        {
            text-align: center;
        }
        .style168
        {
            text-align: center;
            direction: ltr;
        }
        .style170
        {
            text-align: left;
        }
        .style172
        {
            width: 101px;
        }
        .style173
        {
            direction: ltr;
        }
        .style177
        {
            width: 599px;
        }
        .style181
        {
            width: 120px;
        }
        .style182
        {
            width: 272px;
        }
        .style183
        {
            width: 686px;
            direction: ltr;
        }
        .style184
        {
            width: 88px;
        }
        .style185
        {
            width: 393px;
        }
        .style186
        {
            width: 63px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="sds" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="sdsYearMt" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT YearMt FROM MtRules ORDER BY YearMt DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsHRDataAll" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT HRdata.Code , E_Name+ '   ||   ' +  convert(varchar(8),  Regist_No1)  as E_Name     fROM HRdata 
order by E_Name" 
                
                
                
                
                
                
                
                UpdateCommand="UPDATE HRdata SET PetroGasNotes = @PetroGasNotes, كشف_ثاني = @كشف_ثاني, كشف_اول = @كشف_اول, Notes = @Notes, Endemic = @Endemic, كشف_بتروجاس = @كشف_بتروجاس, إستلام_دفتر = @إستلام_دفتر, E_Name = @E_Name WHERE (Code = @code)">
                <UpdateParameters>
                    <asp:Parameter Name="PetroGasNotes" />
                    <asp:Parameter Name="كشف_ثاني" />
                    <asp:Parameter Name="كشف_اول" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="Endemic" />
                    <asp:Parameter Name="كشف_بتروجاس" />
                    <asp:Parameter Name="إستلام_دفتر" />
                    <asp:Parameter Name="E_Name" />
                    <asp:Parameter Name="code" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsHRData" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" SelectCommand="SELECT HRdata.Code, E_Name, PetroGasNotes, كشف_ثاني, كشف_اول, m.Notes, BoardMember, Endemic, sl, نوع_الوظيفة, نوع_التعاقد, الموقف_الحالي, إستلام_دفتر, كشف_بتروجاس, Regist_No1, Sex_A, Marital_Status_A, Regist_No, D_Birth, Picture, JOB_NAME, YearsOld 
FROM HRdata  inner join MtTickets 
on HRdata.Code = MtTickets.code
inner join MedicalNotes m
on HRdata.Code = m.Code
WHERE MtTickets.Id_3101 = @Id_3101 and YearMT = @YearMT" 
                
                UpdateCommand="UPDATE HRdata SET PetroGasNotes = @PetroGasNotes, كشف_ثاني = @كشف_ثاني, كشف_اول = @كشف_اول, Notes = @Notes, Endemic = @Endemic, كشف_بتروجاس = @كشف_بتروجاس, إستلام_دفتر = @إستلام_دفتر, E_Name = @E_Name WHERE (Code = @code)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtTransID" Name="Id_3101" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="ddlYearMt" Name="YearMT" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PetroGasNotes" />
                    <asp:Parameter Name="كشف_ثاني" />
                    <asp:Parameter Name="كشف_اول" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="Endemic" />
                    <asp:Parameter Name="كشف_بتروجاس" />
                    <asp:Parameter Name="إستلام_دفتر" />
                    <asp:Parameter Name="E_Name" />
                    <asp:Parameter Name="code" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsMaxFamilyEmp" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [code], [CoShareholdFTotal], [CoShareholdTotal] FROM [MaxFamilyEmp] WHERE (([YearMT] = @YearMT) AND ([code] = @code)) ORDER BY [code], [YearMT]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlYearMt" DefaultValue="0" Name="YearMT" 
                        PropertyName="SelectedValue" Type="Int16" />
                    <asp:ControlParameter ControlID="fvHRData" DefaultValue="0" Name="code" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsMaxFamilyBox" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT code, SUM(CoShareholdF) AS CoShareholdFTotal FROM MtTickets WHERE (FamilyBox = 1) AND (YearMT = @YearMt) GROUP BY code HAVING (code = @Code)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlYearMt" DefaultValue="0" Name="YearMt" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="fvHRData" DefaultValue="0" Name="Code" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsHistory" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" SelectCommand="SELECT MtTickets.code, MtTickets.TreatType, MtItems.SpecialNeed, MtTickets.TarnsDate, MtTickets.TreatDate, MtTickets.TreatKind, MtTickets.relatives, 
MtTickets.notes, MtTickets.CheckS, MtItems.SpecialNeedVersion, MtItems.Notes AS notes1, MtItems.SpecialNeedLevel, MtItems.Rang, MtTickets.CoShareholdS
,dbo.dtdiff(MtTickets.TarnsDate,GETDATE())as FromDate
FROM MtItems INNER JOIN MtTickets ON MtItems.id = MtTickets.TreatTypeId
WHERE MtItems.SpecialNeed='نعم' and  (code = @code)
ORDER BY MtTickets.TarnsDate desc
 ">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fvHRData" DefaultValue="0" Name="Code" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsTeckits" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                DeleteCommand="Update [MtTickets] set [IsDeleated]=1 , DeletedBy = @DeleatedBy WHERE [Id_3101] = @Id_3101" 
                SelectCommand="SELECT Id_3101, TarnsDate, TreatDate, Contractors, TreatType, TreatTypeId, TreatKind, relatives, DokConfirm, DokConfirmDate, Contractors2, pharmConfirm, pharmConfirmDate, notes, code, Localdeduct, ForeignDeduct, LocaldeductAfter, ForeignDeductAfter, CoSharehold, CoShareholdSurg, EmpSharehold, [Check], Localdeduct1, ForeignDeduct1, LocaldeductAfter1, ForeignDeductAfter1, CoSharehold1, CoShareholdSurg1, EmpSharehold1, Check1, Localdeduct2, ForeignDeduct2, LocaldeductAfter2, ForeignDeductAfter2, CoSharehold2, CoShareholdSurg2, EmpSharehold2, Check2, LocaldeductF, ForeignDeductF, LocaldeductAfterF, ForeignDeductAfterF, CoShareholdF, CoShareholdSurgF, EmpShareholdF, CheckF, LocaldeductS, ForeignDeductS, LocaldeductAfterS, ForeignDeductAfterS, CoShareholdS, EmpShareholdS, CheckS, CoShareholdNet, EmpShareholdNet, CoShareholdSurgNet, CaseName, BillingNo, BillingNo1, PharmMemo, YearMT, HospitalLevel, FamilyBox, LocalDeduct3, ForignDeduct,EmpDeduct, HospitalDeduct, categorization, LastTableAuditDate, LastTableAuditBy, LastModifiedDate, LastModifiedBy, CreatedDate, CreatedBy, WinHostName, WinUserName, IsDeleated, DeletedBy FROM MtTickets WHERE (code = @code) AND (YearMT = @YearMT) AND (IsDeleated = 0) ORDER BY Id_3101 DESC" 
                
                
                
                
                
                
                
                
                
                UpdateCommand="UPDATE MtTickets SET TarnsDate = @TarnsDate, TreatDate = @TreatDate, Contractors = @Contractors, TreatType = @TreatType, TreatTypeId = @TreatTypeId, TreatKind = @TreatKind, relatives = @relatives, DokConfirm = @DokConfirm, DokConfirmDate = @DokConfirmDate, Contractors2 = @Contractors2, pharmConfirm = @pharmConfirm, pharmConfirmDate = @pharmConfirmDate, notes = @notes, code = @code, Localdeduct = @Localdeduct, ForeignDeduct = @ForeignDeduct, LocaldeductAfter = @LocaldeductAfter, ForeignDeductAfter = @ForeignDeductAfter, CoSharehold = @CoSharehold, CoShareholdSurg = @CoShareholdSurg, EmpSharehold = @EmpSharehold, [Check] = @Check , Localdeduct1 = @Localdeduct1, ForeignDeduct1 = @ForeignDeduct1, LocaldeductAfter1 = @LocaldeductAfter1, ForeignDeductAfter1 = @ForeignDeductAfter1, CoSharehold1 = @CoSharehold1, CoShareholdSurg1 = @CoShareholdSurg1, EmpSharehold1 = @EmpSharehold1, Check1 = @Check1, Localdeduct2 = @Localdeduct2, ForeignDeduct2 = @ForeignDeduct2, LocaldeductAfter2 = @LocaldeductAfter2, ForeignDeductAfter2 = @ForeignDeductAfter2, CoSharehold2 = @CoSharehold2, CoShareholdSurg2 = @CoShareholdSurg2, EmpSharehold2 = @EmpSharehold2, Check2 = @Check2, LocaldeductF = @LocaldeductF, ForeignDeductF = @ForeignDeductF, LocaldeductAfterF = @LocaldeductAfterF, ForeignDeductAfterF = @ForeignDeductAfterF, CoShareholdF = @CoShareholdF, CoShareholdSurgF = @CoShareholdSurgF, EmpShareholdF = @EmpShareholdF, CheckF = @CheckF, LocaldeductS = @LocaldeductS, ForeignDeductS = @ForeignDeductS, LocaldeductAfterS = @LocaldeductAfterS, ForeignDeductAfterS = @ForeignDeductAfterS, CoShareholdS = @CoShareholdS, EmpShareholdS = @EmpShareholdS, CheckS = @CheckS, CoShareholdNet = @CoShareholdNet, EmpShareholdNet = @EmpShareholdNet, CoShareholdSurgNet = @CoShareholdSurgNet, CaseName = @CaseName, BillingNo = @BillingNo, BillingNo1 = @BillingNo1, PharmMemo = @PharmMemo, YearMT = @YearMT, HospitalLevel = @HospitalLevel, FamilyBox = @FamilyBox, LocalDeduct3 = @LocalDeduct3, ForignDeduct = @ForignDeduct,EmpDeduct =@EmpDeduct,HospitalDeduct = @HospitalDeduct, categorization = @categorization, LastModifiedDate =GetDate(), LastModifiedBy = @LastModifiedBy ,WinHostName = @WinHostName, WinUserName = @WinUserName 
WHERE (Id_3101 = @Id_3101)
" 
                
                
                
                
                
                
                
                InsertCommand="SELECT TOP (1) Id_3101, TarnsDate, TreatDate, Contractors, TreatType, TreatTypeId, TreatKind, relatives, DokConfirm, DokConfirmDate, Contractors2, pharmConfirm, pharmConfirmDate, notes, code, Localdeduct, ForeignDeduct, LocaldeductAfter, ForeignDeductAfter, CoSharehold, CoShareholdSurg, EmpSharehold, [Check], Localdeduct1, ForeignDeduct1, LocaldeductAfter1, ForeignDeductAfter1, CoSharehold1, CoShareholdSurg1, EmpSharehold1, Check1, Localdeduct2, ForeignDeduct2, LocaldeductAfter2, ForeignDeductAfter2, CoSharehold2, CoShareholdSurg2, EmpSharehold2, Check2, LocaldeductF, ForeignDeductF, LocaldeductAfterF, ForeignDeductAfterF, CoShareholdF, CoShareholdSurgF, EmpShareholdF, CheckF, LocaldeductS, ForeignDeductS, LocaldeductAfterS, ForeignDeductAfterS, CoShareholdS, EmpShareholdS, CheckS, CoShareholdNet, EmpShareholdNet, CoShareholdSurgNet, CaseName, BillingNo, BillingNo1, PharmMemo, YearMT, HospitalLevel, FamilyBox, LocalDeduct3, ForignDeduct, HospitalDeduct, categorization, LastTableAuditDate, LastTableAuditBy, LastModifiedDate, LastModifiedBy, CreatedDate, CreatedBy, WinHostName, WinUserName, IsDeleated, DeletedBy FROM MtTickets">
                <DeleteParameters>
                    <asp:SessionParameter Name="DeleatedBy" SessionField="UserName" />
                    <asp:Parameter Name="Id_3101" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="fvHRData" Name="code" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlYearMt" Name="YearMT" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TarnsDate" Type="DateTime" />
                    <asp:Parameter Name="TreatDate" Type="DateTime" />
                    <asp:Parameter Name="Contractors" Type="String" />
                    <asp:Parameter Name="TreatType" Type="String" />
                    <asp:Parameter Name="TreatTypeId" Type="Int32" />
                    <asp:Parameter Name="TreatKind" Type="String" />
                    <asp:Parameter Name="relatives" Type="String" />
                    <asp:Parameter Name="DokConfirm" Type="String" />
                    <asp:Parameter Name="DokConfirmDate" Type="DateTime" />
                    <asp:Parameter Name="Contractors2" Type="String" />
                    <asp:Parameter Name="pharmConfirm" Type="String" />
                    <asp:Parameter Name="pharmConfirmDate" Type="DateTime" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="code" Type="Int32" />
                    <asp:Parameter Name="Localdeduct" Type="Single" />
                    <asp:Parameter Name="ForeignDeduct" Type="Single" />
                    <asp:Parameter Name="LocaldeductAfter" Type="Single" />
                    <asp:Parameter Name="ForeignDeductAfter" Type="Single" />
                    <asp:Parameter Name="CoSharehold" Type="Single" />
                    <asp:Parameter Name="CoShareholdSurg" Type="Single" />
                    <asp:Parameter Name="EmpSharehold" Type="Single" />
                    <asp:Parameter Name="Check" Type="Single" />
                    <asp:Parameter Name="Localdeduct1" Type="Single" />
                    <asp:Parameter Name="ForeignDeduct1" Type="Single" />
                    <asp:Parameter Name="LocaldeductAfter1" Type="Single" />
                    <asp:Parameter Name="ForeignDeductAfter1" Type="Single" />
                    <asp:Parameter Name="CoSharehold1" Type="Single" />
                    <asp:Parameter Name="CoShareholdSurg1" Type="Single" />
                    <asp:Parameter Name="EmpSharehold1" Type="Single" />
                    <asp:Parameter Name="Check1" Type="Single" />
                    <asp:Parameter Name="Localdeduct2" Type="Single" />
                    <asp:Parameter Name="ForeignDeduct2" Type="Single" />
                    <asp:Parameter Name="LocaldeductAfter2" Type="Single" />
                    <asp:Parameter Name="ForeignDeductAfter2" Type="Single" />
                    <asp:Parameter Name="CoSharehold2" Type="Single" />
                    <asp:Parameter Name="CoShareholdSurg2" Type="Single" />
                    <asp:Parameter Name="EmpSharehold2" Type="Single" />
                    <asp:Parameter Name="Check2" Type="Single" />
                    <asp:Parameter Name="LocaldeductF" Type="Single" />
                    <asp:Parameter Name="ForeignDeductF" Type="Single" />
                    <asp:Parameter Name="LocaldeductAfterF" Type="Single" />
                    <asp:Parameter Name="ForeignDeductAfterF" Type="Single" />
                    <asp:Parameter Name="CoShareholdF" Type="Single" />
                    <asp:Parameter Name="CoShareholdSurgF" Type="Single" />
                    <asp:Parameter Name="EmpShareholdF" Type="Single" />
                    <asp:Parameter Name="CheckF" Type="Single" />
                    <asp:Parameter Name="LocaldeductS" Type="Single" />
                    <asp:Parameter Name="ForeignDeductS" Type="Single" />
                    <asp:Parameter Name="LocaldeductAfterS" Type="Single" />
                    <asp:Parameter Name="ForeignDeductAfterS" Type="Single" />
                    <asp:Parameter Name="CoShareholdS" Type="Single" />
                    <asp:Parameter Name="EmpShareholdS" Type="Single" />
                    <asp:Parameter Name="CheckS" Type="Single" />
                    <asp:Parameter Name="CoShareholdNet" Type="Single" />
                    <asp:Parameter Name="EmpShareholdNet" Type="Single" />
                    <asp:Parameter Name="CoShareholdSurgNet" Type="Single" />
                    <asp:Parameter Name="CaseName" Type="String" />
                    <asp:Parameter Name="BillingNo" Type="Int32" />
                    <asp:Parameter Name="BillingNo1" Type="Int32" />
                    <asp:Parameter Name="PharmMemo" Type="String" />
                    <asp:Parameter Name="YearMT" Type="Int16" />
                    <asp:Parameter Name="HospitalLevel" Type="String" />
                    <asp:Parameter Name="FamilyBox" Type="Boolean" />
                    <asp:Parameter Name="LocalDeduct3" Type="Single" />
                    <asp:Parameter Name="ForignDeduct" Type="Single" />
                    <asp:Parameter Name="HospitalDeduct" Type="Single" />
                    <asp:Parameter Name="categorization" Type="String" />
                    <asp:Parameter Name="LastModifiedBy" Type="String" />               
                    <asp:Parameter Name="WinHostName" Type="String" />
                    <asp:Parameter Name="WinUserName" Type="String" />
                    <asp:Parameter Name="Id_3101" Type="Int32" />                  
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsItems" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" SelectCommand="SELECT id, TreatType AS [نوع المعاملة], SpecialNeedLevel AS [المستوى الوظيفي], Rang AS المدى,
 Notes AS ملاحظات, SpecialNeed AS [بند خاص]
FROM MtItems
WHERE (((SpecialNeedVersion)='2008')) and TreatType like @TreatType + '%'
ORDER BY TreatType
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtItemsFilter" DefaultValue="%" 
                        Name="TreatType" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsItemsAll" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" SelectCommand="SELECT id, ISNULL( TreatType,'') +'  || ' + ISNULL( SpecialNeedLevel,'')  +'  || '+ ISNULL( Rang,'') +' || '+ ISNULL( Notes,'') +' || بند خاص : '+ SpecialNeed AS [نوع المعاملة]  FROM MtItems
WHERE (((SpecialNeedVersion)='2008')) 
ORDER BY TreatType
"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsRelatives" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="select 2 as o, 'الابن - الابنة - الزوجة' as [CaseType]
union
SELECT 1 as o,[CaseType] FROM [MtRelatives] 

order by o">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlContractors" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                
                
                SelectCommand="SELECT Contractors, Kind FROM MtContractors WHERE (Kind &lt;&gt; N'صيدلية')   ORDER BY Contractors">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlContractorsPh" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                
                
                
                SelectCommand="SELECT Contractors, Kind FROM MtContractors WHERE (Kind IN (N'صيدلية')) and isdeleted = 0 ORDER BY Contractors">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SdsCategorization" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [categorization] FROM [MtCategorization] ORDER BY [categorization]">
            </asp:SqlDataSource>            
            <asp:Panel ID="pnlYear" runat="server" Height="50px">
                <div class="style53">
                    <strong>
                    <asp:Label ID="lblYear" runat="server" CssClass="style189" Font-Bold="True" 
                        Font-Italic="False" Font-Size="XX-Large" Font-Underline="True" 
                        ForeColor="White"></asp:Label>
                    </strong>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel4" runat="server" Direction="RightToLeft">
                <asp:Panel ID="Panel19" runat="server" DefaultButton="btnShow">
                  <asp:UpdatePanel ID="UpdatePanel5" runat="server">
          
                                    <ContentTemplate>
                                                <center>
      <table>
            <tr>
                <td>
                
                        <table class="style14">
                            <tr>
                                <td class="style181">
                                    سنة العلاج :</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddlYearMt" runat="server" AutoPostBack="True" 
                                        DataSourceID="sdsYearMt" DataTextField="YearMt" DataValueField="YearMt" 
                                        Height="30px" Visible="true"  Width="260px">
                                        <asp:ListItem Selected="True">2013</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style181">
                                    نوع المطالبة :</td>
                                <td>
                                    <asp:DropDownList ID="ddlRequestKind" runat="server" AutoPostBack="True" 
                                        Height="26px" Width="148px">
                                        <asp:ListItem>جهة طبية</asp:ListItem>
                                        <asp:ListItem>صيدلية</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="lblRequestKind" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlContractors0" runat="server" AutoPostBack="True" 
                                        Height="26px" Width="330px">
                                    </asp:DropDownList>
                                    <asp:ListSearchExtender ID="ddlContractors0_ListSearchExtender" runat="server" 
                                        Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                                        TargetControlID="ddlContractors0">
                                    </asp:ListSearchExtender>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style181">
                                    رقم المطالبة :&nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBillingNo" runat="server" Height="19px" Width="143px"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; " >0</asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator18" runat="server" 
                                        ControlToValidate="txtBillingNo" ErrorMessage="ادخل رقم مطالبة مناسب" 
                                        ForeColor="Red" Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>
                                </td>
                                <td>
                                    &nbsp;رقم الجواب :&nbsp;&nbsp;</td>
                                <td>
                                    <asp:Panel ID="Panelxx" runat="server" DefaultButton="btnShow">
                                        <asp:TextBox ID="txtTransID" runat="server" AutoPostBack="True" Height="18px"  
                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                            Width="228px" MaxLength="8">0</asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator17" runat="server" 
                                            ControlToValidate="txtTransID" ErrorMessage="ادخل رقم جواب مناسب" 
                                            ForeColor="Red" Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>
                                        <asp:LinkButton ID="btnShow" runat="server">تطبيق</asp:LinkButton>
                                    </asp:Panel>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                   </td>
                        <td>
                            &nbsp;</td>
                        <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
            </tr>
        </table>   </center>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
             </asp:Panel>

                <table style="background-color:#E6EEFC;width:100%;">
               <tr>
               <td class="style184"></td>
                     <td class="style183"  > 
                     <div>
                     <table>
                     <tr>
                     <td class="style185">
                         <uc1:WebUserSecurityManager ID="wuc1" runat="server" 
                             ApplicationName="MedicalTreatment" ConnectionString="HRWEbDbConnectionString" 
                             PermissionError="~/Pages/PermissionError.aspx" />
                         </td>
                      <td>
                          <asp:ImageButton ID="btnPrint1" runat="server" Height="38px" 
                              ImageUrl="~/Images/print.png" onclick="btnPrint_Click" ToolTip="طباعة" 
                              Visible="False" Width="37px" />
                         </td>
                       <td>
                           <asp:ImageButton ID="btnPrintManegers" runat="server" Height="38px" 
                               ImageUrl="~/Images/MNGprint.png" ToolTip="طباعة الادارة العليا" 
                               Width="37px" />
                         </td>
                         <td>
                         
                            <asp:ImageButton ID="btnFrst" runat="server" ImageUrl="~/Images/frst.png" 
                                Height="45px" Width="45px" Visible="False" />
                         
                         
                         </td>
                        <td>
                            <asp:ImageButton ID="btnPrev" runat="server" ImageUrl="~/Images/ltr.png" 
                                Height="45px" Width="45px" />
                         </td>
                         <td>
                             <asp:Label ID="lblNav" runat="server"></asp:Label>
                         </td>
                          <td>
                              <asp:TextBox ID="txtNav" runat="server"></asp:TextBox>
                         </td>
                           <td>
                               <asp:ImageButton ID="btnNxt" runat="server" ImageUrl="~/Images/rtl.png" 
                                   Height="45px" Width="45px" />
                         </td>
                       <td>
                               <asp:ImageButton ID="btnLst" runat="server" ImageUrl="~/Images/lst.png" 
                                   Height="45px" Width="45px" Visible="False" />
                         </td>

                     </tr>
                     </table>                     
                     </div>
                     </td>
                                             <td class="style186">
                                                 <asp:LinkButton ID="LinkButton1" runat="server">حفظ</asp:LinkButton>
                                                 &nbsp;&nbsp;
                                                 <asp:LinkButton ID="btnCancle" runat="server" AccessKey="ء" 
                                                     CausesValidation="False" CommandName="Cancel" ToolTip="alt + x">الغاء</asp:LinkButton>
                   </td>
               </tr>
               </table>



                <table style="width:100%;">
                      <tr>
                        <td class="style182" dir="rtl" valign="top">
                            <asp:Panel ID="Panel5" runat="server" BackColor="#F7F6F3" Width="265px">
                                <asp:FormView ID="fvHRData" runat="server" CaptionAlign="Right" CellPadding="4" 
                                    DataKeyNames="Code" DataSourceID="sdsHRData" ForeColor="#333333" Height="63px" 
                                    Width="260px" EmptyDataText="من فضلك ادخل رقم مناسب">
                                    <EditItemTemplate>
                                        <asp:Panel ID="Panel3" runat="server">
                                            <table class="style14">
                                                <tr>
                                                    <td align="right" colspan="2" style="text-align: center">
                                                        <b>
                                                        <asp:Image ID="Image1" runat="server" BorderColor="White" BorderStyle="Solid" 
                                                            BorderWidth="5px" Height="109px" 
                                                            ImageUrl='<%# "ShowImage.ashx?Code=" & Eval("Code") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        Code</td>
                                                    <td>
                                                        <asp:Label ID="CodeLabel1" runat="server" Text='<%# Eval("Code") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        الاسم</td>
                                                    <td>
                                                        <asp:TextBox ID="E_NameTextBox" runat="server" Text='<%# Bind("E_Name") %>' onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                            Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        أمراض مزمنة</td>
                                                    <td>
                                                        <asp:TextBox ID="EndemicTextBox" runat="server" Text='<%# Bind("Endemic") %>' onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                            Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        كشف بتروجاس</td>
                                                    <td>
                                                        <asp:TextBox ID="كشف_بتروجاسTextBox" runat="server"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                            Text='<%# Bind("كشف_بتروجاس") %>' Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        كشف ثاني</td>
                                                    <td>
                                                        <asp:TextBox ID="كشف_ثانيTextBox" runat="server" Text='<%# Bind("كشف_ثاني") %>' onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                            Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        كشف اول</td>
                                                    <td>
                                                        <asp:TextBox ID="كشف_اولTextBox" runat="server"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                            Text='<%# Bind("كشف_اول", "{0:d}") %>' Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        إستلام دفتر</td>
                                                    <td>
                                                        <asp:TextBox ID="إستلام_دفترTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                            Text='<%# Bind("إستلام_دفتر") %>' Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        ملاحظات بتروجاس</td>
                                                    <td>
                                                        <asp:TextBox ID="PetroGasNotesTextBox" runat="server" Height="100px"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                            Text='<%# Bind("PetroGasNotes") %>' TextMode="MultiLine" Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style50">
                                                        ملاحظات على العامل</td>
                                                    <td>
                                                        <asp:TextBox ID="NotesTextBox" runat="server" Height="175px" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                            Text='<%# Bind("Notes") %>' TextMode="MultiLine" Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style46">
                                                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="إلغاء" />
                                                    </td>
                                                    <td class="style51">
                                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                            CommandName="Update" Text="حفظ" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <br />
                                    </EditItemTemplate>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <InsertItemTemplate>
                                        <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton0" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Panel ID="Panel2" runat="server" Width="258px">
                                            <table dir="rtl" width="255">
                                                <tr>
                                                    <td align="center" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Image ID="Image1" runat="server" BorderColor="White" BorderStyle="Solid" 
                                                            BorderWidth="5px" Height="109px" 
                                                            ImageUrl='<%# "ShowImage.ashx?Code=" & Eval("Code") %>' />
                                                        </b>
                                                    </td>
                                                    <td align="center" dir="rtl" rowspan="0" width="250">

                                                    
                                                        <asp:LinkButton ID="btnHist" runat="server" onclick="btnHist_Click">حافظة البنود الخاصة</asp:LinkButton>
                                                      </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        رقم التسجيل :</td>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <span class="style15">
                                                        <asp:Label ID="Regist_No1Label2" runat="server" CssClass="style18" 
                                                            ForeColor="Red" Text='<%# Bind("Regist_No1") %>' />
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        كود الموظف :</td>
                                                    </span>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="CodeLabel3" runat="server" CssClass="style18" Font-Bold="True" 
                                                            Font-Italic="False" ForeColor="Black" Text='<%# Eval("Code") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        اسم الموظف :</td>
                                                    </span></span></span></span></span>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <asp:Label ID="E_NameLabel2" runat="server" CssClass="style53" 
                                                            Font-Italic="False" Text='<%# Bind("E_Name") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" 
                                                        style="direction: rtl; text-align: right;" width="250">
                                                        الوظيفة :</td>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span>
                                                    <td class="style28" dir="rtl" rowspan="0" 
                                                        style="direction: rtl; text-align: right;" width="250">
                                                        <asp:Label ID="JOB_NAMELabel" runat="server" CssClass="style53" 
                                                            Font-Italic="False" Text='<%# Bind("JOB_NAME") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        الحالة الاجتماعية :</td>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <span class="style15">
                                                        <asp:Label ID="Marital_Status_ALabel0" runat="server" 
                                                            Text='<%# Bind("Marital_Status_A") %>' />
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" width="250">
                                                        الموقف الحالى :</td>
                                                    <td class="style28" dir="rtl" width="250">
                                                        <span class="style16">
                                                        <asp:Label ID="الموقف_الحاليLabel0" runat="server" 
                                                            Text='<%# Bind("الموقف_الحالي") %>' />
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        نوع التعاقد :</td>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span></span>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <span class="style18"><span class="style16">
                                                        <asp:Label ID="نوع_التعاقدLabel0" runat="server" 
                                                            Text='<%# Bind("نوع_التعاقد") %>' />
                                                        </span></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        نوع الوظيفة :</td>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <span class="style28"><b>
                                                        <asp:Label ID="نوع_الوظيفةLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("نوع_الوظيفة") %>' />
                                                        </b></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        تاريخ الميلاد :</td>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="D_BirthLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("D_Birth", "{0:d}") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        العمر :</td>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="YearsOldLabel" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" ForeColor="Blue" Text='<%# Eval("YearsOld") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" 
                                                        style="direction: rtl; " width="250">
                                                        عضو مجلس إدارة:</td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" 
                                                        style="direction: rtl; " width="250">
                                                        <b>
                                                        <asp:Label ID="BoardMemberLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("BoardMember") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        أمراض مزمنة:&nbsp;</td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="EndemicLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("Endemic") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        كشف بتروجاز:</td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="كشف_بتروجاسLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" style="direction: ltr" Text='<%# Bind("كشف_بتروجاس") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        <span class="style15">تاريخ الكشف:</span></td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="كشف_اولLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("كشف_اول", "{0:d}") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        <span class="style15">إستلام دفتر:</span></td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="إستلام_دفترLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("إستلام_دفتر") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        <span class="style15">ملاحظات بتروجاس:</span></td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="PetroGasNotesLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("PetroGasNotes") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        ملاحظات:</td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        &nbsp;<b><asp:Label ID="NotesLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("Notes") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" colspan="1" dir="rtl" style="style27" width="250">
                                                        &nbsp;</td>
                                                    <td class="style28" dir="rtl" style="style27" width="250">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" colspan="1" dir="rtl" width="250">
                                                    </td>
                                                    <td class="style28" dir="rtl" width="250">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" colspan="1" dir="rtl" width="250">
                                                        <b>
                                                        <asp:Label ID="slLabel0" runat="server" CssClass="style159" Font-Bold="True" 
                                                            Font-Italic="False" ForeColor="Black" Text='<%# Bind("sl") %>' />
                                                        </b>
                                                    </td>
                                                    <td class="style28" dir="rtl" width="250">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        <asp:LinkButton ID="EditButton0" runat="server" CausesValidation="False" 
                                                            CommandName="Edit" Text="تعديل" Visible="False" />
                                                    </td>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                </asp:FormView>
                                <asp:FormView ID="fvWife" runat="server" AllowPaging="True" 
                                    DataSourceID="sdsEmpRelatives" Width="260px">
                                    <EditItemTemplate>
                                        CODE:
                                        <asp:TextBox ID="CODETextBox2" runat="server" Text='<%# Bind("CODE") %>' />
                                        <br />
                                        WIFE_NAME:
                                        <asp:TextBox ID="WIFE_NAMETextBox" runat="server" 
                                            Text='<%# Bind("WIFE_NAME") %>' />
                                        <br />
                                        D_BIRTH:
                                        <asp:TextBox ID="D_BIRTHTextBox" runat="server" Text='<%# Bind("D_BIRTH") %>' />
                                        <br />
                                        RELIGION:
                                        <asp:TextBox ID="RELIGIONTextBox" runat="server" 
                                            Text='<%# Bind("RELIGION") %>' />
                                        <br />
                                        NATIONALITY:
                                        <asp:TextBox ID="NATIONALITYTextBox" runat="server" 
                                            Text='<%# Bind("NATIONALITY") %>' />
                                        <br />
                                        WORK_PLACE:
                                        <asp:TextBox ID="WORK_PLACETextBox" runat="server" 
                                            Text='<%# Bind("WORK_PLACE") %>' />
                                        <br />
                                        P_BIRTH:
                                        <asp:TextBox ID="P_BIRTHTextBox" runat="server" Text='<%# Bind("P_BIRTH") %>' />
                                        <br />
                                        DISTRICT_A:
                                        <asp:TextBox ID="DISTRICT_ATextBox" runat="server" 
                                            Text='<%# Bind("DISTRICT_A") %>' />
                                        <br />
                                        MARRIAGE_DATE:
                                        <asp:TextBox ID="MARRIAGE_DATETextBox" runat="server" 
                                            Text='<%# Bind("MARRIAGE_DATE") %>' />
                                        <br />
                                        ID_NO:
                                        <asp:TextBox ID="ID_NOTextBox" runat="server" Text='<%# Bind("ID_NO") %>' />
                                        <br />
                                        STATION:
                                        <asp:TextBox ID="STATIONTextBox" runat="server" Text='<%# Bind("STATION") %>' />
                                        <br />
                                        <asp:LinkButton ID="UpdateButton1" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton1" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        CODE:
                                        <asp:TextBox ID="CODETextBox3" runat="server" Text='<%# Bind("CODE") %>' />
                                        <br />
                                        WIFE_NAME:
                                        <asp:TextBox ID="WIFE_NAMETextBox0" runat="server" 
                                            Text='<%# Bind("WIFE_NAME") %>' />
                                        <br />
                                        D_BIRTH:
                                        <asp:TextBox ID="D_BIRTHTextBox0" runat="server" 
                                            Text='<%# Bind("D_BIRTH") %>' />
                                        <br />
                                        RELIGION:
                                        <asp:TextBox ID="RELIGIONTextBox0" runat="server" 
                                            Text='<%# Bind("RELIGION") %>' />
                                        <br />
                                        NATIONALITY:
                                        <asp:TextBox ID="NATIONALITYTextBox0" runat="server" 
                                            Text='<%# Bind("NATIONALITY") %>' />
                                        <br />
                                        WORK_PLACE:
                                        <asp:TextBox ID="WORK_PLACETextBox0" runat="server" 
                                            Text='<%# Bind("WORK_PLACE") %>' />
                                        <br />
                                        P_BIRTH:
                                        <asp:TextBox ID="P_BIRTHTextBox0" runat="server" 
                                            Text='<%# Bind("P_BIRTH") %>' />
                                        <br />
                                        DISTRICT_A:
                                        <asp:TextBox ID="DISTRICT_ATextBox0" runat="server" 
                                            Text='<%# Bind("DISTRICT_A") %>' />
                                        <br />
                                        MARRIAGE_DATE:
                                        <asp:TextBox ID="MARRIAGE_DATETextBox0" runat="server" 
                                            Text='<%# Bind("MARRIAGE_DATE") %>' />
                                        <br />
                                        ID_NO:
                                        <asp:TextBox ID="ID_NOTextBox0" runat="server" Text='<%# Bind("ID_NO") %>' />
                                        <br />
                                        STATION:
                                        <asp:TextBox ID="STATIONTextBox0" runat="server" 
                                            Text='<%# Bind("STATION") %>' />
                                        <br />
                                        <asp:LinkButton ID="InsertButton2" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton2" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <table class="style14">
                                            <tr>
                                                <td class="style28">
                                                    اسم الزوجة :</td>
                                                <td class="style28">
                                                    <asp:Label ID="WIFE_NAMELabel" runat="server" Text='<%# Bind("WIFE_NAME") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style28">
                                                    تاريخ الميلاد :</td>
                                                <td class="style28">
                                                    <asp:Label ID="D_BIRTHLabel" runat="server" 
                                                        Text='<%# Bind("D_BIRTH", "{0:dd/MM/yyyy}") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style28">
                                                    رقم البطاقة :</td>
                                                <td class="style28">
                                                    <asp:Label ID="STATIONLabel" runat="server" Text='<%# Bind("ID_NO") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:FormView>
                                <span class="style18">الابناء :</span><asp:GridView ID="gvChildren" 
                                    runat="server" AutoGenerateColumns="False" CellPadding="4" 
                                    DataSourceID="sdsChildren" ForeColor="#333333" GridLines="None" Width="263px">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="CHILD_NAME" HeaderText="اسم الابن" 
                                            SortExpression="CHILD_NAME" />
                                        <asp:BoundField DataField="SEX" HeaderText="النوع" SortExpression="SEX" />
                                        <asp:BoundField DataField="age" HeaderText="العمر" ReadOnly="True" 
                                            SortExpression="age" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                                &nbsp;<asp:FormView ID="fvMaxFamilyEmp" runat="server" DataSourceID="sdsMaxFamilyEmp" 
                                    Width="260px">
                                    <EditItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox" runat="server" Text='<%# Bind("code") %>' onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; " />
                                        <br />
                                        CoShareholdFTotal:
                                        <asp:TextBox ID="CoShareholdFTotalTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                            Text='<%# Bind("CoShareholdFTotal") %>' />
                                        <br />
                                        CoShareholdTotal:
                                        <asp:TextBox ID="CoShareholdTotalTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                            Text='<%# Bind("CoShareholdTotal") %>' />
                                        <br />
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox" runat="server" Text='<%# Bind("code") %>' onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; " />
                                        <br />
                                        CoShareholdFTotal:
                                        <asp:TextBox ID="CoShareholdFTotalTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                            Text='<%# Bind("CoShareholdFTotal") %>' />
                                        <br />
                                        CoShareholdTotal:
                                        <asp:TextBox ID="CoShareholdTotalTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                            Text='<%# Bind("CoShareholdTotal") %>' />
                                        <br />
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Panel ID="Panel6" runat="server" BackColor="#F7F6F3" Width="258px">
                                            <table width="250">
                                                <tr>
                                                    <td class="style28">
                                                        العلاج الشخصي</td>
                                                    <td class="style28">
                                                        <asp:Label ID="CoShareholdTotalLabel" runat="server" CssClass="style28" 
                                                            Text='<%# Bind("CoShareholdTotal", "{0:C2}") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28">
                                                        العلاج الاسري</td>
                                                    <td class="style28">
                                                        <asp:Label ID="CoShareholdFTotalLabel" runat="server" CssClass="style28" 
                                                            Text='<%# Bind("CoShareholdFTotal", "{0:C2}") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:FormView ID="FormView1" runat="server" DataSourceID="sdsPregnancyFollow" 
                                    Width="265px">
                                    <EditItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox4" runat="server" Text='<%# Bind("code") %>' />
                                        <br />
                                        CheckTotal:
                                        <asp:TextBox ID="CheckTotalTextBox" runat="server" 
                                            Text='<%# Bind("CheckTotal") %>' />
                                        <br />
                                        <asp:LinkButton ID="UpdateButton2" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton2" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox5" runat="server" Text='<%# Bind("code") %>' />
                                        <br />
                                        CheckTotal:
                                        <asp:TextBox ID="CheckTotalTextBox0" runat="server" 
                                            Text='<%# Bind("CheckTotal") %>' />
                                        <br />
                                        <asp:LinkButton ID="InsertButton3" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton3" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Panel ID="Panel20" runat="server" Width="258px">
                                            <table class="style14">
                                                <tr>
                                                    <td class="style28">
                                                        اجمالى متابعة الحمل</td>
                                                    <td class="style28">
                                                        <asp:Label ID="CheckTotalLabel0" runat="server" 
                                                            Text='<%# Bind("CheckTotal") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:FormView ID="fvMaxFamilyBox" runat="server" DataSourceID="sdsMaxFamilyBox" 
                                    Width="265px">
                                    <EditItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox0" runat="server" Text='<%# Bind("code") %>' onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; " />
                                        <br />
                                        CoShareholdFTotal:
                                        <asp:TextBox ID="CoShareholdFTotalTextBox0" runat="server"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                            Text='<%# Bind("CoShareholdFTotal") %>' />
                                        <br />
                                        CoShareholdTotal:
                                        <asp:TextBox ID="CoShareholdTotalTextBox0" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                            Text='<%# Bind("CoShareholdTotal") %>' />
                                        <br />
                                        <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton0" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox1" runat="server" Text='<%# Bind("code") %>' onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; " />
                                        <br />
                                        CoShareholdFTotal:
                                        <asp:TextBox ID="CoShareholdFTotalTextBox1" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                            Text='<%# Bind("CoShareholdFTotal") %>' />
                                        <br />
                                        CoShareholdTotal:
                                        <asp:TextBox ID="CoShareholdTotalTextBox1" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                            Text='<%# Bind("CoShareholdTotal") %>' />
                                        <br />
                                        <asp:LinkButton ID="InsertButton1" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton1" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Panel ID="Panel7" runat="server" Width="258px">
                                            <table class="style14">
                                                <tr>
                                                    <td class="style28">
                                                        مخصص العلاج الأسري</td>
                                                    <td class="style28">
                                                        <asp:Label ID="CoShareholdFTotalLabel0" runat="server" CssClass="style28" 
                                                            Text='<%# Bind("CoShareholdFTotal", "{0:C2}") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <br />
                                    </ItemTemplate>
                                </asp:FormView>
                                <div class="style173">
                                    <br />
                                    <asp:HiddenField ID="hfSpecialFolder" runat="server" />
                                </div>
                            </asp:Panel>
                        </td>
                        <td class="style177" dir="rtl" valign="top">
                            <asp:FormView ID="fvTickets" runat="server" 
                                DataKeyNames="Id_3101" DataSourceID="sdsTeckits" DefaultMode="Edit" 
                                Width="645px" EmptyDataText="من فضلك ادخل رقم مناسب">
                                <EditItemTemplate>
                                    <asp:Panel ID="Panel14" runat="server" Width="620px">
                                        <table style="width:100%;">
                                            <tr>
                                                <td class="style49">
                                                    رقم الجواب :
                                                </td>
                                                <td>
                                                    <asp:Label ID="Id_3101Label1" runat="server" Text='<%# Eval("Id_3101") %>' />
                                                </td>
                                                <td class="style49">
                                                    <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" 
                                                        onclick="UpdateButton_Click" 
                                                        Text="حفظ" Visible="False" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="UpdateCancelButton0" runat="server" 
                                                        CausesValidation="False" CommandName="Cancel" 
                                                        Text="الغاء" Visible="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    تاريخ الجواب:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TarnsDateTextBox" runat="server" BackColor="White"  
                                                        onFocus="style.backgroundColor='yellow'; " onblur="checkdate(this);style.backgroundColor = 'white';"
                                                        ForeColor="Black" Text='<%# Bind("TarnsDate", "{0:dd/MM/yyyy}") %>' 
                                                        Width="170px" ontextchanged="TarnsDateTextBox_TextChanged" />
                                                    <asp:CompareValidator ID="CompareValidator19" runat="server" 
                                                        ControlToValidate="TarnsDateTextBox" ErrorMessage="ادخل تاريخ مناسب" 
                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                                </td>
                                                <td class="style49">
                                                    تاريخ العلاج:</td>
                                                <td>
                                                    <asp:TextBox ID="TreatDateTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="checkdate(this);style.backgroundColor = 'white';"
                                                        Text='<%# Bind("TreatDate", "{0:dd/MM/yyyy}") %>' Width="170px" />
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                        ControlToValidate="TreatDateTextBox" ErrorMessage="من فضلك ادخل تاريخ مناسب !" 
                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    السنة:</td>
                                                <td>
                                                    <asp:TextBox ID="YearMTTextBox" runat="server" BackColor="#B6B6B6" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        ForeColor="Black" ReadOnly="True" Text='<%# Bind("YearMT") %>' Width="170px" />
                                                </td>
                                                <td class="style49">
                                                    كود الموظف:</td>
                                                <td>
                                                    <asp:TextBox ID="codeTextBox" runat="server" BackColor="#B6B6B6" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        ForeColor="Black" ReadOnly="True" Text='<%# Bind("code") %>' Width="170px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    اسم الموظف :</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ddlEmpName" Width="400px"  Height="30px"  
                                                    onFocus="style.backgroundColor='yellow'; " 
                                                        onblur="style.backgroundColor='white'; " runat="server" AutoPostBack="True" 
                                                        DataSourceID="sdsHRDataAll" DataTextField="E_Name" DataValueField="Code" ondatabound="ddlEmpName_DataBound" 
                                                        onselectedindexchanged="ddlEmpName_SelectedIndexChanged" 
                                                        SelectedValue='<%# Bind("Code") %>' Enabled="False">
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlEmpName_ListSearchExtender" runat="server" 
                                                        Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                                                        TargetControlID="ddlEmpName">
                                                    </asp:ListSearchExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    نوع المعاملة الطبية:</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ddlTreatTypeId" runat="server" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        AppendDataBoundItems="True" DataSourceID="sdsItemsAll" 
                                                        DataTextField="نوع المعاملة" DataValueField="id" Height="20px" 
                                                        SelectedValue='<%# Bind("TreatTypeId") %>' Width="400px" 
                                                        AutoPostBack="True" 
                                                        onselectedindexchanged="ddlTreatTypeId_SelectedIndexChanged1">
                                                        <asp:ListItem Value="186">كشف</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlTreatTypeId_ListSearchExtender" runat="server" 
                                                        Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                                                        TargetControlID="ddlTreatTypeId">
                                                    </asp:ListSearchExtender>
                                                    <asp:Button ID="btnTreatTypeId" runat="server" Height="20px" 
                                                        onclick="btnTreatTypeId_Click" Text="B" Width="20px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    نوع العلاج:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlTreatKind" runat="server" AppendDataBoundItems="True" 
                                                        AutoPostBack="True"  
                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        onselectedindexchanged="ddlTreatKind_SelectedIndexChanged" 
                                                        SelectedValue='<%# Bind("TreatKind") %>' Width="170px">
                                                        <asp:ListItem Selected="True">علاج شخصي</asp:ListItem>
                                                        <asp:ListItem>علاج أسري</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="style49">
                                                    الأقارب:</td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="ddlRelatives" runat="server" AppendDataBoundItems="True" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                DataSourceID="sdsRelatives" DataTextField="CaseType" DataValueField="CaseType" 
                                                                ondatabound="ddlRelatives_DataBound" SelectedValue='<%# Bind("relatives") %>' 
                                                                Width="170px" onselectedindexchanged="ddlRelatives_SelectedIndexChanged">
                                                                <asp:ListItem>-</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="ddlTreatTypeId0" 
                                                                EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    الجهة الطبية:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlContractors" runat="server" 
                                                        DataSourceID="SqlContractors" DataTextField="Contractors" 
                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        DataValueField="Contractors" SelectedValue='<%# Bind("Contractors") %>' 
                                                        Width="170px" onselectedindexchanged="ddlContractors_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlContractors_ListSearchExtender" runat="server" 
                                                        Enabled="True" PromptCssClass="PromptCSS" PromptText="ابحث" 
                                                        QueryPattern="Contains" TargetControlID="ddlContractors">
                                                    </asp:ListSearchExtender>
                                                </td>
                                                <td class="style49">
                                                    الصيدلية:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlContractorsPH" runat="server" DataSourceID="SqlContractorsPh" 
                                                        DataTextField="Contractors" DataValueField="Contractors" 
                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        SelectedValue='<%# Bind("Contractors2") %>' Width="170px" 
                                                        onselectedindexchanged="ddlContractorsPH_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlContractorsPH_ListSearchExtender" runat="server" 
                                                        Enabled="True" PromptCssClass="PromptCSS" PromptText="ابحث" 
                                                        QueryPattern="Contains" TargetControlID="ddlContractorsPH">
                                                    </asp:ListSearchExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    درجة الإقامة:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlHospital" runat="server" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        SelectedValue='<%# Bind("HospitalLevel") %>' Width="170px" 
                                                        onselectedindexchanged="ddlHospital_SelectedIndexChanged">
                                                        <asp:ListItem Selected="True">-</asp:ListItem>
                                                        <asp:ListItem>جناح (أ)</asp:ListItem>
                                                        <asp:ListItem>جناح (ب)</asp:ListItem>
                                                        <asp:ListItem>درجة أولى ممتاز</asp:ListItem>
                                                        <asp:ListItem>درجة أولى</asp:ListItem>
                                                        <asp:ListItem>درجة ثانية</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="style49">
                                                    التصنيف:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCategorization" runat="server" 
                                                        AppendDataBoundItems="True" DataSourceID="SdsCategorization" 
                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        DataTextField="categorization" DataValueField="categorization" 
                                                        SelectedValue='<%# Bind("categorization") %>' Width="170px" 
                                                        onselectedindexchanged="ddlCategorization_SelectedIndexChanged">
                                                        <asp:ListItem Selected="True">-</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel17" runat="server" Width="620px">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="style149">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                            <table class="style14">
                                                                <tr>
                                                                    <td>
                                                                        تأكيد الطبيب :</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDokConfirm" runat="server" AppendDataBoundItems="True" 
                                                                            AutoPostBack="True" ondatabound="ddlDokConfirm_DataBound" 
                                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                            onselectedindexchanged="ddlDokConfirm_SelectedIndexChanged" 
                                                                            SelectedValue='<%# Bind("DokConfirm") %>' Width="170px">
                                                                            <asp:ListItem Selected="True">لا</asp:ListItem>
                                                                            <asp:ListItem>نعم</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                       </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        تاريخ تأكيد الطبيب:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="DokConfirmDateTextBox" runat="server" 
                                                                            onFocus="style.backgroundColor='yellow'; " onblur="checkdate(this);style.backgroundColor = 'white';"
                                                                            Text='<%# Bind("DokConfirmDate") %>' Width="170px" 
                                                                            ontextchanged="DokConfirmDateTextBox_TextChanged" ReadOnly="True" />
                                                                    </td>
                                                                    <td>
                                                                        </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        رقم مطالبة الطبيب:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="BillingNoTextBox0" runat="server" 
                                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                            Text='<%# Bind("BillingNo") %>' Width="170px" 
                                                                            ontextchanged="BillingNoTextBox0_TextChanged" />
                                                                    </td>
                                                                    <td>
                                                                        </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td class="style170">
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                        <ContentTemplate>
                                                            <table class="style49">
                                                                <tr>
                                                                    <td>
                                                                        تأكيد الصيدلية :
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlPharmConfirm0" runat="server" 
                                                                            AppendDataBoundItems="True" AutoPostBack="True" 
                                                                            ondatabound="ddlPharmConfirm0_DataBound" 
                                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                            onselectedindexchanged="ddlPharmConfirm0_SelectedIndexChanged" 
                                                                            SelectedValue='<%# Bind("pharmConfirm") %>' Width="170px">
                                                                            <asp:ListItem>لا</asp:ListItem>
                                                                            <asp:ListItem>نعم</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                       </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        تاريخ تأكيد الصيلية:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="pharmConfirmDateTextBox" runat="server"  
                                                                            onFocus="style.backgroundColor='yellow'; " onblur="checkdate(this);style.backgroundColor = 'white';"
                                                                            Text='<%# Bind("pharmConfirmDate") %>' Width="170px" 
                                                                            ontextchanged="pharmConfirmDateTextBox_TextChanged" ReadOnly="True" />
                                                                    </td>
                                                                    <td>
                                                                        </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        رقم مطالبة الصيدلية:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="BillingNo1TextBox0" runat="server" 
                                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                            Text='<%# Bind("BillingNo1") %>' Width="170px" 
                                                                            ontextchanged="BillingNo1TextBox0_TextChanged" />
                                                                    </td>
                                                                    <td>
                                                                        </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="Panel13" runat="server" Width="620px">
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                            <ContentTemplate>
                                                <table style="width:100%;"  >
                                                    <tr>
                                                        <td style="text-align:center;width:80px">
                                                            &nbsp;</td>
                                                        <td style="text-align:center;width:80px">
                                                            كشف</td>
                                                        <td style="text-align:center;width:80px">
                                                            محلي</td>
                                                        <td style="text-align:center;width:80px">
                                                            مستورد</td>
                                                        <td style="text-align:center;width:80px">
                                                            محلي <br /> بعد الخصم</td>
                                                        <td style="text-align:center;width:80px">
                                                            مستورد<br /> بعد الخصم</td>
                                                        <td style="text-align:center;width:80px">
                                                            حصة الشركة</td>
                                                        <td style="text-align:center;width:80px">
                                                            حصة العامل</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49">
                                                            بحد أقصى</td>
                                                        <td>
                                                            <asp:TextBox ID="CheckTextBox" runat="server" Text='<%# Bind("Check") %>' 
                                                                onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Width="70px" ontextchanged="CheckTextBox_TextChanged" />
                                                            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                                                ControlToValidate="CheckTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="LocaldeductTextBox" runat="server" 
                                                                onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("Localdeduct") %>' Width="70px" 
                                                                ontextchanged="CheckTextBox_TextChanged" />
                                                            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                                                ControlToValidate="LocaldeductTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ForeignDeductTextBox" runat="server" 
                                                                onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("ForeignDeduct") %>' Width="70px" 
                                                                ontextchanged="CheckTextBox_TextChanged" />
                                                            <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                                                ControlToValidate="ForeignDeductTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LocaldeductAfterLabe" runat="server" 
                                                                Text='<%# Bind("LocaldeductAfter", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="ForeignDeductAfterLabel" runat="server" 
                                                                Text='<%# Bind("ForeignDeductAfter", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="CoShareholdLabel" runat="server" 
                                                                Text='<%# Bind("CoSharehold", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="EmpShareholdLabel" runat="server" 
                                                                Text='<%# Bind("EmpSharehold", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49">
                                                            بدون حد أقصى</td>
                                                        <td>
                                                            <asp:TextBox ID="Check1TextBox" runat="server" Text='<%# Bind("Check1") %>'   ontextchanged="CheckTextBox_TextChanged" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator5" runat="server" 
                                                                ControlToValidate="Check1TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Localdeduct1TextBox" runat="server" onFocus="style.backgroundColor='yellow'; "   ontextchanged="CheckTextBox_TextChanged" onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("Localdeduct1") %>' Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                                                ControlToValidate="Localdeduct1TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ForeignDeduct1TextBox" runat="server" onFocus="style.backgroundColor='yellow'; "   ontextchanged="CheckTextBox_TextChanged" onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("ForeignDeduct1") %>' Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator7" runat="server" 
                                                                ControlToValidate="ForeignDeduct1TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LocaldeductAfter1Label" runat="server" 
                                                                Text='<%# Bind("LocaldeductAfter1", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="ForeignDeductAfter1Label" runat="server" 
                                                                Text='<%# Bind("ForeignDeductAfter1", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="CoSharehold1Label" runat="server" 
                                                                Text='<%# Bind("CoSharehold1", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="EmpSharehold1Label" runat="server" 
                                                                Text='<%# Bind("EmpSharehold1", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49">
                                                            إعفاء الموظف</td>
                                                        <td>
                                                            <asp:TextBox ID="Check2TextBox" runat="server" Text='<%# Bind("Check2") %>' 
                                                            onFocus="style.backgroundColor='yellow'; "   ontextchanged="CheckTextBox_TextChanged" onblur="style.backgroundColor='white'; "
                                                                Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator8" runat="server" 
                                                                ControlToValidate="Check2TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Localdeduct2TextBox" runat="server" onFocus="style.backgroundColor='yellow'; " 
                                                            onblur="style.backgroundColor='white'; "   ontextchanged="CheckTextBox_TextChanged"
                                                                Text='<%# Bind("Localdeduct2") %>' Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator9" runat="server" 
                                                                ControlToValidate="Localdeduct2TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ForeignDeduct2TextBox" runat="server" onFocus="style.backgroundColor='yellow'; " 
                                                            onblur="style.backgroundColor='white'; "   ontextchanged="CheckTextBox_TextChanged"
                                                                Text='<%# Bind("ForeignDeduct2") %>' Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator10" runat="server" 
                                                                ControlToValidate="ForeignDeduct2TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LocaldeductAfter2Label" runat="server" 
                                                                Text='<%# Bind("LocaldeductAfter2", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="ForeignDeductAfter2Label" runat="server" 
                                                                Text='<%# Bind("ForeignDeductAfter2", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="CoSharehold2Label" runat="server" 
                                                                Text='<%# Bind("CoSharehold2", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="EmpSharehold2Label" runat="server" 
                                                                Text='<%# Bind("EmpSharehold2", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49">
                                                            علاج أسري</td>
                                                        <td>
                                                            <asp:TextBox ID="CheckFTextBox" runat="server" Text='<%# Bind("CheckF") %>' 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "   ontextchanged="CheckTextBox_TextChanged"
                                                                Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator11" runat="server" 
                                                                ControlToValidate="CheckFTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="LocaldeductFTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " 
                                                            onblur="style.backgroundColor='white'; "   ontextchanged="CheckTextBox_TextChanged"
                                                                Text='<%# Bind("LocaldeductF") %>' Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator12" runat="server" 
                                                                ControlToValidate="LocaldeductFTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ForeignDeductFTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " 
                                                            onblur="style.backgroundColor='white'; "   ontextchanged="CheckTextBox_TextChanged"
                                                                Text='<%# Bind("ForeignDeductF") %>' Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator13" runat="server" 
                                                                ControlToValidate="ForeignDeductFTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LocaldeductAfterFLabel1" runat="server" 
                                                                Text='<%# Bind("LocaldeductAfterF", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="ForeignDeductAfterFLabel" runat="server" 
                                                                Text='<%# Bind("ForeignDeductAfterF", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="CoShareholdFLabel" runat="server" 
                                                                Text='<%# Bind("CoShareholdF", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="EmpShareholdFTextBox" runat="server" 
                                                                Text='<%# Bind("EmpShareholdF", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49">
                                                            بنود خاصة</td>
                                                        <td>
                                                            <asp:TextBox ID="CheckSTextBox" runat="server" Text='<%# Bind("CheckS") %>' onFocus="style.backgroundColor='yellow'; "   
                                                            ontextchanged="CheckTextBox_TextChanged" onblur="style.backgroundColor='white'; "
                                                                Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator14" runat="server" 
                                                                ControlToValidate="CheckSTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="LocaldeductSTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " 
                                                            onblur="style.backgroundColor='white'; "   ontextchanged="CheckTextBox_TextChanged"
                                                                Text='<%# Bind("LocaldeductS") %>' Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator15" runat="server" 
                                                                ControlToValidate="LocaldeductSTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ForeignDeductSTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " 
                                                            onblur="style.backgroundColor='white'; "   ontextchanged="CheckTextBox_TextChanged"
                                                                Text='<%# Bind("ForeignDeductS") %>' Width="70px" />
                                                            <asp:CompareValidator ID="CompareValidator16" runat="server" 
                                                                ControlToValidate="ForeignDeductSTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LocaldeductAfterSLabele0" runat="server" 
                                                                Text='<%# Bind("LocaldeductAfterS", "{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="ForeignDeductAfterSLabel1" runat="server" 
                                                                Text='<%# Bind("ForeignDeductAfterS", "{0:F2}") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="CoShareholdSlabele" runat="server" 
                                                                Text='<%# Bind("CoShareholdS", "{0:F2}") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="EmpShareholdSLable" runat="server" 
                                                                Text='<%# Bind("EmpShareholdS", "{0:F2}") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <asp:Label ID="CoShareholdNetLabel" runat="server" ForeColor="Red" 
                                                                Text='<%# Bind("CoShareholdNet", "{0:F2}") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="EmpShareholdNetLabel" runat="server" ForeColor="Red" 
                                                                Text='<%# Bind("EmpShareholdNet", "{0:F2}") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49" colspan="2">
                                                            مخصص علاج أسري:</td>
                                                        <td colspan="2">
                                                            <asp:CheckBox ID="chbFamilyBox" runat="server" 
                                                                Checked='<%# Bind("FamilyBox") %>' 
                                                                onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                oncheckedchanged="chbFamilyBox_CheckedChanged" />
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            <br />
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddlDokConfirm" 
                                                    EventName="SelectedIndexChanged" />
                                                <asp:AsyncPostBackTrigger ControlID="ddlPharmConfirm0" 
                                                    EventName="SelectedIndexChanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel15" runat="server" Width="620px">
                                        <table style="width:100%;">
                                            <tr>
                                                <td class="style49">
                                                    ملاحطات:
                                                </td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="notesTextBox" runat="server" Height="20px" 
                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; " 
                                                        Text='<%# Bind("notes") %>' Width="500px" 
                                                        ontextchanged="notesTextBox_TextChanged" />
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    اسم المريض:</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="CaseNameTextBox" runat="server" Height="20px" onFocus="style.backgroundColor='yellow'; " 
                                                    onblur="style.backgroundColor='white'; "
                                                        Text='<%# Bind("CaseName") %>' Width="292px"   ontextchanged="CheckTextBox_TextChanged" />
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    ملاحظات صيدلية:</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="PharmMemoTextBox" runat="server" Height="20px" onFocus="style.backgroundColor='yellow'; "   
                                                    ontextchanged="CheckTextBox_TextChanged" onblur="style.backgroundColor='white'; "
                                                        Text='<%# Bind("PharmMemo") %>' Width="500px" />
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td class="style172">
                                                    مsحلي<asp:CompareValidator ID="CompareValidator20" runat="server" 
                                                        ControlToValidate="LocalDeduct3TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                </td>
                                                <td>
                                                    مستورد<asp:CompareValidator ID="CompareValidator21" runat="server" 
                                                        ControlToValidate="ForignDeductTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                </td>
                                                <td>
                                                    مستشفيات<asp:CompareValidator ID="CompareValidator22" runat="server" 
                                                        ControlToValidate="HospitalDeductTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td class="style172">
                                                    <asp:TextBox ID="LocalDeduct3TextBox" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "   ontextchanged="CheckTextBox_TextChanged"
                                                        Text='<%# Bind("LocalDeduct3") %>' Width="180px" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ForignDeductTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "   ontextchanged="CheckTextBox_TextChanged"
                                                        Text='<%# Bind("ForignDeduct") %>' Width="180px" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="HospitalDeductTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "   ontextchanged="CheckTextBox_TextChanged"
                                                        Text='<%# Bind("HospitalDeduct") %>' Width="180px" />
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">&nbsp;</td>
                                                <td class="style172">عاملين<asp:CompareValidator ID="CompareValidator23" runat="server" ControlToValidate="EmpDeductTextBox" ErrorMessage="ادخل رقم من فضلك" ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">&nbsp;</td>
                                                <td class="style172">
                                                    <asp:TextBox ID="EmpDeductTextBox" runat="server" onblur="style.backgroundColor='white'; " onFocus="style.backgroundColor='yellow'; " ontextchanged="CheckTextBox_TextChanged" Text='<%# Bind("EmpDeduct") %>' Width="180px" />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td class="style172">
                                                    <asp:HiddenField ID="HidenFieldLastModefideBy" runat="server" 
                                                        Value='<%# Bind("LastModifiedBy") %>' />
                                                </td>
                                                <td>
                                                    <asp:HiddenField ID="HiddenFieldUserName" runat="server" 
                                                        Value='<%# Bind("WinUserName") %>' />
                                                </td>
                                                <td>
                                                    <asp:HiddenField ID="HiddenFieldHostName" runat="server" 
                                                        Value='<%# Bind("WinHostName") %>' />
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:LinkButton ID="UpdateButton" runat="server" 
                                        CausesValidation="True" 
                                        onclick="UpdateButton_Click" Text="حفظ" 
                                        onclientclick="return confirm(' هل انت متاكد من حفظ هذة التعديلات ؟ ');" 
                                        Visible="False" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="الغاء" 
                                        Visible="False" />
                                </EditItemTemplate>
                            
                                <PagerSettings Mode="NumericFirstLast" />
                            </asp:FormView>
                        </td>
                    </tr>
                    <tr>
                        <td class="style182">
                            <asp:SqlDataSource ID="sdsPregnancyFollow" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" SelectCommand="SELECT  SUM(CoShareholdNet) AS CheckTotal  FROM MtTickets 
where  TreatTypeId in( 17,146,187,188,189,190) 
  AND YearMT = @YearMT and code =@code
                                ">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlYearMt" DefaultValue="0" Name="YearMT" 
                                        PropertyName="SelectedValue" Type="Int16" />
                                    <asp:ControlParameter ControlID="fvHRData" DefaultValue="0" Name="code" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:HiddenField ID="hfCode" runat="server" />
                        </td>
                        <td class="style177">
                            <asp:HiddenField ID="hfTreatTypeId" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style182">
                            &nbsp;</td>
                        <td class="style177">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="Panel8" runat="server" BackColor="#B6AD92" Width="900px">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgProgress" runat="server" Height="10px" 
                                                ImageUrl="~/Images/progress_bar_animated.gif" Width="900px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style168">
                                            <asp:LinkButton ID="btnOk" runat="server">رجوع</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Panel ID="Panel9" runat="server" ScrollBars="Horizontal" Width="900px">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" DataSourceID="sdsHistory" ForeColor="#333333" GridLines="None" 
                                        Width="893px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="TreatType" HeaderText="نوع العلاج" 
                                                SortExpression="TreatType" />
                                            <asp:BoundField DataField="TarnsDate" DataFormatString="{0:yyyy/MM/dd}" 
                                                HeaderText="تاريخ الحركة" SortExpression="TarnsDate" />
                                            <asp:BoundField DataField="TreatDate" DataFormatString="{0:yyyy/MM/dd}" 
                                                HeaderText="تاريخ العلاج" SortExpression="TreatDate" />
                                            <asp:BoundField DataField="TreatKind" HeaderText="نوع العلاج" 
                                                SortExpression="TreatKind" />
                                            <asp:BoundField DataField="relatives" HeaderText="أقارب" 
                                                SortExpression="relatives" />
                                            <asp:BoundField DataField="CoShareholdS" HeaderText="القيمة" 
                                                SortExpression="CoShareholdS" />
                                            <asp:BoundField DataField="notes" HeaderText="ملاحظات" SortExpression="notes" />
                                            <asp:BoundField DataField="FromDate" HeaderText="مدة البند" 
                                                SortExpression="FromDate" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" Font-Italic="False" ForeColor="#333333" 
                                            Wrap="False" Height="25px" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:ModalPopupExtender ID="Panel8_ModalPopupExtender2" runat="server" 
                                CancelControlID="btnOk" DynamicServiceMethod="" DynamicServicePath="" 
                                Enabled="True" PopupControlID="Panel8" PopupDragHandleControlID="Panel8" 
                                RepositionMode="None" TargetControlID="hfSpecialFolder">
                            </asp:ModalPopupExtender>
                            <%-- <asp:ModalPopupExtender ID="Panel8_ModalPopupExtender" runat="server" 
                                CancelControlID="btncancel" DynamicServicePath="" 
                                Enabled="True" PopupControlID="Panel8" PopupDragHandleControlID="Panel8" 
                                RepositionMode="None" TargetControlID="btnHistory" 
                                Drag="false"   >
                            </asp:ModalPopupExtender>
--%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="Panel17" runat="server" BackColor="#B6AD92" Width="900px">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style53" dir="rtl">
                                            <asp:DropDownList ID="ddlTreatTypeId0" runat="server" AutoPostBack="True" 
                                                DataSourceID="sdsItemsAll" DataTextField="نوع المعاملة" DataValueField="id" 
                                                Height="20px" Width="400px">
                                                <asp:ListItem Selected="True" Value="186">كشف</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:ListSearchExtender ID="ddlTreatTypeId0_ListSearchExtender" runat="server" 
                                                Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                                                TargetControlID="ddlTreatTypeId0">
                                            </asp:ListSearchExtender>
                                            <asp:TextBox ID="txtItemsFilter" runat="server" Height="20px" Width="268px" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; ">كشف</asp:TextBox>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style168">
                                            <asp:LinkButton ID="btnOk0" runat="server">رجوع</asp:LinkButton>
                                            .</td>
                                    </tr>
                                </table>
                                <asp:Panel ID="Panel18" runat="server" ScrollBars="Horizontal" Width="900px">
                                    <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" DataKeyNames="id" DataMember="DefaultView" 
                                        DataSourceID="sdsItems" ForeColor="#333333" GridLines="None" PageSize="15" 
                                        Width="893px">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="إختار" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnSelectItems" runat="server" CausesValidation="False" 
                                                        CommandName="Select" Text="إختار" onclick="btnSelectItems_Click"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="مسلسل" InsertVisible="False" SortExpression="id">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="نوع المعاملة" HeaderText="نوع المعاملة" 
                                                SortExpression="نوع المعاملة" />
                                            <asp:BoundField DataField="المستوى الوظيفي" HeaderText="المستوى الوظيفي" 
                                                SortExpression="المستوى الوظيفي" />
                                            <asp:BoundField DataField="المدى" HeaderText="المدى" SortExpression="المدى" />
                                            <asp:BoundField DataField="ملاحظات" HeaderText="ملاحظات" 
                                                SortExpression="ملاحظات" />
                                            <asp:BoundField DataField="بند خاص" HeaderText="بند خاص" 
                                                SortExpression="بند خاص" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerSettings Mode="NumericFirstLast" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" Font-Italic="False" ForeColor="#333333" 
                                            Wrap="False" Height="25px" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:ModalPopupExtender ID="Panel17_ModalPopupExtender" runat="server" 
                                BehaviorID="Panel17" CancelControlID="btnOk0" DynamicServicePath="" 
                                Enabled="True" PopupControlID="Panel17" PopupDragHandleControlID="Panel17" 
                                RepositionMode="None" TargetControlID="hfTreatTypeId">
                            </asp:ModalPopupExtender>
                        </td>
                    </tr>
                    </caption>
                </table>
            </asp:Panel>
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" ForeColor="Red" 
                ShowMessageBox="True" ShowSummary="False" />
            <asp:SqlDataSource ID="sdsChildren" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [CODE], [CHILD_NAME], [SEX], [D_BIRTH], [age] FROM [Children] WHERE ([CODE] = @Code) order by age desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfCode" Name="Code" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsEmpRelatives" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [CODE], [WIFE_NAME]  , [D_BIRTH], [RELIGION], [NATIONALITY], [WORK_PLACE], [P_BIRTH], [DISTRICT_A], [MARRIAGE_DATE], [ID_NO], [STATION] FROM [Wives] WHERE ([CODE] = @CODE)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hfCode" Name="CODE" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
</asp:Content>

