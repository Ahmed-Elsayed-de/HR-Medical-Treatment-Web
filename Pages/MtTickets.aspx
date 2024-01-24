<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/MT.master" AutoEventWireup="false" CodeFile="MtTickets.aspx.vb" Inherits="Pages_MtTickets" %>

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
        .style176
        {
            text-align: left;
        }
        .style177
        {
            width: 599px;
            text-align: center;
        }
        .style179
        {
            width: 2px;
        }
        .style180
        {
            margin-right: 40px;
        }
        .style188
        {
            width: 584px;
        }
        .style189
        {
            width: 99%;
        }
        .style190
        {
            width: 99%;
            height: 26px;
        }
        .auto-style1 {
            text-align: right;
            font-style: normal;
            font-size: small;
            height: 8px;
        }
        .auto-style2 {
            height: 8px;
        }
        #MainContent_fvHRData_Panel20 tr{
            display:inline;
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
            <asp:SqlDataSource ID="sdsHRDataByID" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" SelectCommand="SELECT HRdata.Code, E_Name, PetroGasNotes, كشف_ثاني, كشف_اول, HRdata.Notes, BoardMember, Endemic, sl, نوع_الوظيفة, نوع_التعاقد, الموقف_الحالي, إستلام_دفتر, كشف_بتروجاس, Regist_No1, Sex_A, Marital_Status_A, Regist_No, D_Birth, Picture, JOB_NAME, YearsOld,اول_تعيين 
FROM HRdata  inner join MtTickets 
on HRdata.Code = MtTickets.code
WHERE MtTickets.Id_3101 = @Id_3101" 
                UpdateCommand="UPDATE HRdata SET PetroGasNotes = @PetroGasNotes, كشف_ثاني = @كشف_ثاني, كشف_اول = @كشف_اول, Notes = @Notes, Endemic = @Endemic, كشف_بتروجاس = @كشف_بتروجاس, إستلام_دفتر = @إستلام_دفتر, E_Name = @E_Name WHERE (Code = @code)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtTransIDSearch" Name="Id_3101" 
                        PropertyName="Text" />
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
            <asp:SqlDataSource ID="sdsHRData" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT HRdata.Code, E_Name, PetroGasNotes, كشف_ثاني, كشف_اول,  BoardMember, Endemic, sl, نوع_الوظيفة,
 نوع_التعاقد, الموقف_الحالي, إستلام_دفتر, كشف_بتروجاس, Regist_No1, Sex_A, Marital_Status_A, Regist_No,اول_تعيين,
  D_Birth, Picture, JOB_NAME, YearsOld , m.Notes FROM HRdata inner join MedicalNotes m
  on HRdata.Code = m.Code
   WHERE (Regist_No1 = @reg)" 
                
                
                
                UpdateCommand="UPDATE HRdata SET PetroGasNotes = @PetroGasNotes, كشف_ثاني = @كشف_ثاني, كشف_اول = @كشف_اول, Notes = @Notes, Endemic = @Endemic, كشف_بتروجاس = @كشف_بتروجاس, إستلام_دفتر = @إستلام_دفتر, E_Name = @E_Name WHERE (Code = @code)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtRegFilter" DefaultValue="0" Name="reg" 
                        PropertyName="Text" Type="Int32" />
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
                SelectCommand="SELECT Id_3101, TarnsDate, TreatDate, Contractors, TreatType, TreatTypeId, TreatKind, relatives, DokConfirm, DokConfirmDate, Contractors2, pharmConfirm, pharmConfirmDate, notes, code, Localdeduct, ForeignDeduct, LocaldeductAfter, ForeignDeductAfter, CoSharehold, CoShareholdSurg, EmpSharehold, [Check], Localdeduct1, ForeignDeduct1, LocaldeductAfter1, ForeignDeductAfter1, CoSharehold1, CoShareholdSurg1, EmpSharehold1, Check1, Localdeduct2, ForeignDeduct2, LocaldeductAfter2, ForeignDeductAfter2, CoSharehold2, CoShareholdSurg2, EmpSharehold2, Check2, LocaldeductF, ForeignDeductF, LocaldeductAfterF, ForeignDeductAfterF, CoShareholdF, CoShareholdSurgF, EmpShareholdF, CheckF, LocaldeductS, ForeignDeductS, LocaldeductAfterS, ForeignDeductAfterS, CoShareholdS, EmpShareholdS, CheckS, CoShareholdNet, EmpShareholdNet, CoShareholdSurgNet, CaseName, BillingNo, BillingNo1, PharmMemo, YearMT, HospitalLevel, FamilyBox, LocalDeduct3, ForignDeduct, EmpDeduct,HospitalDeduct, categorization, LastTableAuditDate, LastTableAuditBy, LastModifiedDate, LastModifiedBy, CreatedDate, CreatedBy, WinHostName, WinUserName, IsDeleated, DeletedBy FROM MtTickets WHERE (code = @code) AND (YearMT = @YearMT) AND (IsDeleated = 0) ORDER BY Id_3101 DESC" 
                
                
                
                
                
                
                
                
                
                UpdateCommand="UPDATE MtTickets SET TarnsDate = @TarnsDate, TreatDate = @TreatDate, Contractors = @Contractors, TreatType = @TreatType, TreatTypeId = @TreatTypeId, TreatKind = @TreatKind, relatives = @relatives, DokConfirm = @DokConfirm, DokConfirmDate = @DokConfirmDate, Contractors2 = @Contractors2, pharmConfirm = @pharmConfirm, pharmConfirmDate = @pharmConfirmDate, notes = @notes, code = @code, Localdeduct = @Localdeduct, ForeignDeduct = @ForeignDeduct, LocaldeductAfter = @LocaldeductAfter, ForeignDeductAfter = @ForeignDeductAfter, CoSharehold = @CoSharehold, CoShareholdSurg = @CoShareholdSurg, EmpSharehold = @EmpSharehold, [Check] = @Check , Localdeduct1 = @Localdeduct1, ForeignDeduct1 = @ForeignDeduct1, LocaldeductAfter1 = @LocaldeductAfter1, ForeignDeductAfter1 = @ForeignDeductAfter1, CoSharehold1 = @CoSharehold1, CoShareholdSurg1 = @CoShareholdSurg1, EmpSharehold1 = @EmpSharehold1, Check1 = @Check1, Localdeduct2 = @Localdeduct2, ForeignDeduct2 = @ForeignDeduct2, LocaldeductAfter2 = @LocaldeductAfter2, ForeignDeductAfter2 = @ForeignDeductAfter2, CoSharehold2 = @CoSharehold2, CoShareholdSurg2 = @CoShareholdSurg2, EmpSharehold2 = @EmpSharehold2, Check2 = @Check2, LocaldeductF = @LocaldeductF, ForeignDeductF = @ForeignDeductF, LocaldeductAfterF = @LocaldeductAfterF, ForeignDeductAfterF = @ForeignDeductAfterF, CoShareholdF = @CoShareholdF, CoShareholdSurgF = @CoShareholdSurgF, EmpShareholdF = @EmpShareholdF, CheckF = @CheckF, LocaldeductS = @LocaldeductS, ForeignDeductS = @ForeignDeductS, LocaldeductAfterS = @LocaldeductAfterS, ForeignDeductAfterS = @ForeignDeductAfterS, CoShareholdS = @CoShareholdS, EmpShareholdS = @EmpShareholdS, CheckS = @CheckS, CoShareholdNet = @CoShareholdNet, EmpShareholdNet = @EmpShareholdNet, CoShareholdSurgNet = @CoShareholdSurgNet, CaseName = @CaseName, BillingNo = @BillingNo, BillingNo1 = @BillingNo1, PharmMemo = @PharmMemo, YearMT = @YearMT, HospitalLevel = @HospitalLevel, FamilyBox = @FamilyBox, LocalDeduct3 = @LocalDeduct3, ForignDeduct = @ForignDeduct,EmpDeduct=@EmpDeduct, HospitalDeduct = @HospitalDeduct, categorization = @categorization, LastModifiedDate =GetDate(), LastModifiedBy = @LastModifiedBy ,WinHostName = @WinHostName, WinUserName = @WinUserName WHERE (Id_3101 = @Id_3101)" 
                
                InsertCommand="SELECT TOP (1) Id_3101, TarnsDate, TreatDate, Contractors, TreatType, TreatTypeId, TreatKind, relatives, DokConfirm, DokConfirmDate, Contractors2, pharmConfirm, pharmConfirmDate, notes, code, Localdeduct, ForeignDeduct, LocaldeductAfter, ForeignDeductAfter, CoSharehold, CoShareholdSurg, EmpSharehold, [Check], Localdeduct1, ForeignDeduct1, LocaldeductAfter1, ForeignDeductAfter1, CoSharehold1, CoShareholdSurg1, EmpSharehold1, Check1, Localdeduct2, ForeignDeduct2, LocaldeductAfter2, ForeignDeductAfter2, CoSharehold2, CoShareholdSurg2, EmpSharehold2, Check2, LocaldeductF, ForeignDeductF, LocaldeductAfterF, ForeignDeductAfterF, CoShareholdF, CoShareholdSurgF, EmpShareholdF, CheckF, LocaldeductS, ForeignDeductS, LocaldeductAfterS, ForeignDeductAfterS, CoShareholdS, EmpShareholdS, CheckS, CoShareholdNet, EmpShareholdNet, CoShareholdSurgNet, CaseName, BillingNo, BillingNo1, PharmMemo, YearMT, HospitalLevel, FamilyBox, LocalDeduct3, ForignDeduct, HospitalDeduct, categorization, LastTableAuditDate, LastTableAuditBy, LastModifiedDate, LastModifiedBy, CreatedDate, CreatedBy, WinHostName, WinUserName, IsDeleated, DeletedBy FROM MtTickets">
                <DeleteParameters>
                    <asp:SessionParameter Name="DeleatedBy" SessionField="UserName" />
                    <asp:Parameter Name="Id_3101" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="fvHRData" DefaultValue="0" Name="code" 
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ddlYearMt" DefaultValue="0" Name="YearMT" 
                        PropertyName="SelectedValue" Type="Int16" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TarnsDate" Type="DateTime" />
                    <asp:Parameter Name="TreatDate" Type="DateTime" />
                    <asp:Parameter Name="Contractors" Type="String" />
                    <asp:ControlParameter ControlID="hfTreateType" Name="TreatType" 
                        PropertyName="Value" Type="String" />
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
WHERE (((SpecialNeedVersion)='2008')) and TreatType like '%'+ @TreatType + '%'
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
                SelectCommand="SELECT Contractors, Kind FROM MtContractors WHERE (Kind &lt;&gt; N'صيدلية') ORDER BY Contractors">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlContractorsPh" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                
                
                SelectCommand="SELECT Contractors, Kind FROM MtContractors WHERE (Kind IN (N'صيدلية')) ORDER BY Contractors">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SdsCategorization" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [categorization] FROM [MtCategorization] ORDER BY [categorization]">
            </asp:SqlDataSource>       
            <asp:SqlDataSource ID="sdsPharmNotesSearch" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [Id_3101], [PharmMemo] FROM [MtTickets] WHERE (([code] = @code) AND ([IsDeleated] = @IsDeleated) AND ([YearMT] = @YearMT))
order by PharmMemo">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fvHRData" Name="code" 
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter DefaultValue="false" Name="IsDeleated" Type="Boolean" />
                    <asp:ControlParameter ControlID="ddlYearMt" Name="YearMT" 
                        PropertyName="SelectedValue" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsNotesSearch" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [Id_3101], [notes] FROM [MtTickets] WHERE (([code] = @code) AND ([YearMT] = @YearMT) AND ([IsDeleated] = @IsDeleated))
order by notes">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fvHRData" Name="code" 
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ddlYearMt" Name="YearMT" 
                        PropertyName="SelectedValue" Type="Int16" />
                    <asp:Parameter DefaultValue="false" Name="IsDeleated" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsTeckitsByID" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                DeleteCommand="Update [MtTickets] set [IsDeleated]=1 , DeletedBy = @DeleatedBy WHERE [Id_3101] = @Id_3101" 
                InsertCommand="SELECT TOP (1) Id_3101, TarnsDate, TreatDate, Contractors, TreatType, TreatTypeId, TreatKind, relatives, DokConfirm, DokConfirmDate, Contractors2, pharmConfirm, pharmConfirmDate, notes, code, Localdeduct, ForeignDeduct, LocaldeductAfter, ForeignDeductAfter, CoSharehold, CoShareholdSurg, EmpSharehold, [Check], Localdeduct1, ForeignDeduct1, LocaldeductAfter1, ForeignDeductAfter1, CoSharehold1, CoShareholdSurg1, EmpSharehold1, Check1, Localdeduct2, ForeignDeduct2, LocaldeductAfter2, ForeignDeductAfter2, CoSharehold2, CoShareholdSurg2, EmpSharehold2, Check2, LocaldeductF, ForeignDeductF, LocaldeductAfterF, ForeignDeductAfterF, CoShareholdF, CoShareholdSurgF, EmpShareholdF, CheckF, LocaldeductS, ForeignDeductS, LocaldeductAfterS, ForeignDeductAfterS, CoShareholdS, EmpShareholdS, CheckS, CoShareholdNet, EmpShareholdNet, CoShareholdSurgNet, CaseName, BillingNo, BillingNo1, PharmMemo, YearMT, HospitalLevel, FamilyBox, LocalDeduct3, ForignDeduct, HospitalDeduct, categorization, LastTableAuditDate, LastTableAuditBy, LastModifiedDate, LastModifiedBy, CreatedDate, CreatedBy, WinHostName, WinUserName, IsDeleated, DeletedBy FROM MtTickets" SelectCommand="SELECT Id_3101, TarnsDate, TreatDate, Contractors, TreatType, TreatTypeId, TreatKind, relatives, DokConfirm, DokConfirmDate, Contractors2, pharmConfirm, pharmConfirmDate, notes, code, Localdeduct, ForeignDeduct, LocaldeductAfter, ForeignDeductAfter, CoSharehold, CoShareholdSurg, EmpSharehold, [Check], Localdeduct1, ForeignDeduct1, LocaldeductAfter1, ForeignDeductAfter1, CoSharehold1, CoShareholdSurg1, EmpSharehold1, Check1, Localdeduct2, ForeignDeduct2, LocaldeductAfter2, ForeignDeductAfter2, CoSharehold2, CoShareholdSurg2, EmpSharehold2, Check2, LocaldeductF, ForeignDeductF, LocaldeductAfterF, ForeignDeductAfterF, CoShareholdF, CoShareholdSurgF, EmpShareholdF, CheckF, LocaldeductS, ForeignDeductS, LocaldeductAfterS, ForeignDeductAfterS, CoShareholdS, EmpShareholdS, CheckS, CoShareholdNet, EmpShareholdNet, CoShareholdSurgNet, CaseName, BillingNo, BillingNo1, PharmMemo, YearMT, HospitalLevel, FamilyBox, LocalDeduct3, ForignDeduct, HospitalDeduct, categorization, LastTableAuditDate, LastTableAuditBy, LastModifiedDate, LastModifiedBy, CreatedDate, CreatedBy, WinHostName, WinUserName, IsDeleated, DeletedBy FROM MtTickets WHERE id_3101 = @id and IsDeleated=0   and YearMT =@YearMT 
 ORDER BY TarnsDate DESC" UpdateCommand="UPDATE MtTickets SET TarnsDate = @TarnsDate, TreatDate = @TreatDate, Contractors = @Contractors, TreatType = @TreatType, TreatTypeId = @TreatTypeId, TreatKind = @TreatKind, relatives = @relatives, DokConfirm = @DokConfirm, DokConfirmDate = @DokConfirmDate, Contractors2 = @Contractors2, pharmConfirm = @pharmConfirm, pharmConfirmDate = @pharmConfirmDate, notes = @notes, code = @code, Localdeduct = @Localdeduct, ForeignDeduct = @ForeignDeduct, LocaldeductAfter = @LocaldeductAfter, ForeignDeductAfter = @ForeignDeductAfter, CoSharehold = @CoSharehold, CoShareholdSurg = @CoShareholdSurg, EmpSharehold = @EmpSharehold, [Check] = @Check , Localdeduct1 = @Localdeduct1, ForeignDeduct1 = @ForeignDeduct1, LocaldeductAfter1 = @LocaldeductAfter1, ForeignDeductAfter1 = @ForeignDeductAfter1, CoSharehold1 = @CoSharehold1, CoShareholdSurg1 = @CoShareholdSurg1, EmpSharehold1 = @EmpSharehold1, Check1 = @Check1, Localdeduct2 = @Localdeduct2, ForeignDeduct2 = @ForeignDeduct2, LocaldeductAfter2 = @LocaldeductAfter2, ForeignDeductAfter2 = @ForeignDeductAfter2, CoSharehold2 = @CoSharehold2, CoShareholdSurg2 = @CoShareholdSurg2, EmpSharehold2 = @EmpSharehold2, Check2 = @Check2, LocaldeductF = @LocaldeductF, ForeignDeductF = @ForeignDeductF, LocaldeductAfterF = @LocaldeductAfterF, ForeignDeductAfterF = @ForeignDeductAfterF, CoShareholdF = @CoShareholdF, CoShareholdSurgF = @CoShareholdSurgF, EmpShareholdF = @EmpShareholdF, CheckF = @CheckF, LocaldeductS = @LocaldeductS, ForeignDeductS = @ForeignDeductS, LocaldeductAfterS = @LocaldeductAfterS, ForeignDeductAfterS = @ForeignDeductAfterS, CoShareholdS = @CoShareholdS, EmpShareholdS = @EmpShareholdS, CheckS = @CheckS, CoShareholdNet = @CoShareholdNet, EmpShareholdNet = @EmpShareholdNet, CoShareholdSurgNet = @CoShareholdSurgNet, CaseName = @CaseName, BillingNo = @BillingNo, BillingNo1 = @BillingNo1, PharmMemo = @PharmMemo, YearMT = @YearMT, HospitalLevel = @HospitalLevel, FamilyBox = @FamilyBox, LocalDeduct3 = @LocalDeduct3, ForignDeduct = @ForignDeduct, HospitalDeduct = @HospitalDeduct, categorization = @categorization, LastModifiedDate =GetDate(), LastModifiedBy = @LastModifiedBy ,WinHostName = @WinHostName, WinUserName = @WinUserName 
WHERE (Id_3101 = @Id_3101)
">
                <DeleteParameters>
                    <asp:SessionParameter Name="DeleatedBy" SessionField="UserName" />
                    <asp:Parameter Name="Id_3101" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtTransIDSearch" DefaultValue="" Name="id" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="ddlYearMt" DefaultValue="" Name="YearMT" 
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
               <table width="100%">
               <tr>
               <td></td>
                <td>سنة العلاج : </td>
                 <td>
                     <asp:DropDownList ID="ddlYearMt" runat="server" AutoPostBack="True" 
                         DataSourceID="sdsYearMt" DataTextField="YearMt" DataValueField="YearMt" 
                         Height="26px" Width="369px">
                         <asp:ListItem Selected="True">2013</asp:ListItem>
                     </asp:DropDownList>
                   </td>
                  <td></td>
                   <td></td>
                    <td>ملاحظات : </td>
                     <td>
                         <asp:DropDownList ID="ddlNotesSearch" runat="server" AutoPostBack="True" 
                             DataSourceID="sdsNotesSearch" DataTextField="notes" DataValueField="Id_3101" 
                             Height="30px" Width="400px">
                         </asp:DropDownList>
                         <asp:ListSearchExtender ID="ddlNotesSearch_ListSearchExtender" runat="server" 
                             Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                             TargetControlID="ddlNotesSearch">
                         </asp:ListSearchExtender>
                   </td>
                      <td></td>
                          <td></td>
               </tr>
               
               
               
                   <tr>
                       <td>
                           &nbsp;</td>
                       <td>
                           </td>
                       <td>
                           &nbsp;&nbsp;</td>
                       <td>
                           &nbsp;&nbsp;</td>
                       <td>
                           &nbsp;</td>
                       <td>
                           ملاحظات صيدلية :</td>
                       <td>
                           <asp:DropDownList ID="ddlPharmNotesSearch" runat="server" AutoPostBack="True" 
                               DataSourceID="sdsPharmNotesSearch" DataTextField="PharmMemo" 
                               DataValueField="Id_3101" Height="30px" Width="400px">
                           </asp:DropDownList>
                           <asp:ListSearchExtender ID="ddlPharmNotesSearch_ListSearchExtender" 
                               runat="server" Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                               TargetControlID="ddlPharmNotesSearch">
                           </asp:ListSearchExtender>
                       </td>
                       <td>
                           &nbsp;</td>
                       <td>
                           &nbsp;</td>
                   </tr>
                   <tr>
                       <td>
                           &nbsp;</td>
                       <td>
                           رقم القيد&nbsp;&nbsp;:&nbsp;&nbsp;</td>
                       <td>
                          
                     <table style="background-color:#E6EEFC;">
                     <tr>
                     <td>
                   
                         <asp:ImageButton ID="btnFrst" runat="server" Height="45px" 
                             ImageUrl="~/Images/frst.png" Width="45px" />
                     </td>

                     <td>  <asp:ImageButton ID="btnEmpprv" runat="server" Height="45px" 
                             ImageUrl="~/Images/ltr.png" Width="45px" /></td>
                     <td>
                      
                         <asp:Label ID="lblEmpCount" runat="server" Width="80px"  ></asp:Label>
                     
                     </td>
                     <td style="text-align:center">   <asp:TextBox ID="txtRegFilter" runat="server" AutoPostBack="True" 
                             CssClass="style154" Height="30px" 
                             style="color: #FFFFFF; background-color: #000000" Width="100px" 
                             MaxLength="8">0</asp:TextBox></td>
                     <td>  <asp:CompareValidator ID="CompareValidator18" runat="server" 
                             ControlToValidate="txtRegFilter" Display="Dynamic" 
                             ErrorMessage=" من فضلك ادخل رقم مناسب" ForeColor="Red" Operator="DataTypeCheck" 
                             Type="Integer">*</asp:CompareValidator></td>
                              <td>
                           <asp:ImageButton ID="btnEmpNxt" runat="server" Height="45px" 
                             ImageUrl="~/Images/rtl.png" Width="45px" /></td>
                             <td>
                                 <asp:ImageButton ID="btnLst" runat="server" Height="45px" 
                                     ImageUrl="~/Images/lst.png" Width="45px" />
                             </td>
                     </tr>
                     </table>

                     
                      
                       </td>
                       <td>
                           <asp:CompareValidator ID="CompareValidator19" runat="server" 
                               ControlToValidate="txtRegFilter" Display="Dynamic" 
                               ErrorMessage=" من فضلك ادخل رقم مناسب" ForeColor="Red" Operator="DataTypeCheck" 
                               Type="Integer">*</asp:CompareValidator>
                       </td>
                       <td>
                           &nbsp;</td>
                       <td>
                           رقم الجواب :</td>
                       <td>
                           <asp:TextBox ID="txtTransIDSearch" runat="server" Height="30px" Width="200px" 
                               MaxLength="8"></asp:TextBox>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CompareValidator ID="CompareValidator21" runat="server" 
                               ControlToValidate="txtTransIDSearch" Display="Dynamic" 
                               ErrorMessage=" من فضلك ادخل رقم مناسب" ForeColor="Red" Operator="DataTypeCheck" 
                               Type="Integer">*</asp:CompareValidator>
                           &nbsp;&nbsp;
                           <asp:LinkButton ID="btnApplay" runat="server">بحث بالجواب
                                     </asp:LinkButton>
                       </td>
                       <td>
                           &nbsp;</td>
                       <td>
                           &nbsp;</td>
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
                           &nbsp;</td>
                       <td>
                           &nbsp;</td>
                       <td>
                           &nbsp;</td>
                   </tr>
               
               
               
               </table>
                 <table style="background-color:#E6EEFC;" class="style190">
               <tr>
               <td style="width:150px">
                   <uc1:WebUserSecurityManager ID="wuc1" runat="server" 
                       ApplicationName="MedicalTreatment" ConnectionString="HRWEbDbConnectionString" 
                       PermissionError="~/Pages/PermissionError.aspx" />
                   </td>
                     <td class="style188"  > 
                     <div>
                     <table>
                     <tr>
                     <td>
                         &nbsp;</td>
                      <td>
                          <asp:ImageButton ID="btnPrint" runat="server" Height="38px" 
                              ImageUrl="~/Images/print.png" onclick="btnPrint_Click" ToolTip="طباعة" 
                              Visible="False" Width="37px" />
                         </td>
                       <td>
                           <asp:ImageButton ID="btnPrintManegers" runat="server" Height="38px" 
                               ImageUrl="~/Images/MNGprint.png" ToolTip="طباعة الادارة العليا" Visible="False" 
                               Width="37px" />
                         </td>
                        <td>
                            <asp:ImageButton ID="btnFrstTicket" runat="server" Height="45px" 
                                ImageUrl="~/Images/frst.png" Width="45px" Visible="False" />
                         </td>
                            <td>
                                <asp:ImageButton ID="btnPrev" runat="server" Height="45px" 
                                    ImageUrl="~/Images/ltr.png" Width="45px" />
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
                               <asp:ImageButton ID="btnLstTick" runat="server" ImageUrl="~/Images/lst.png" 
                                   Height="45px" Width="45px" Visible="False" />

                         </td>

                     </tr>
                     </table>                     
                     </div>
                     </td>
               </tr>
               </table>



                 <table style="width:100%;">
                    <tr>
                        <td dir="rtl" valign="top">
                            <asp:Panel ID="Panel5" runat="server" Width="265px" BackColor="#F7F6F3">
                                <asp:FormView ID="fvHRData" runat="server" CaptionAlign="Right" CellPadding="4" 
                                    DataKeyNames="Code" DataSourceID="sdsHRData" 
                                    EmptyDataText=".                .                 ...  من   فضلك   ادخل   رقم  قيد صحيح    " 
                                    ForeColor="#333333" Height="63px" Width="260px">
                                    <EditItemTemplate>
                                        <asp:Panel ID="Panel19" runat="server">
                                            <table class="style14">
                                                <tr>
                                                    <td class="style46">
                                                        <asp:LinkButton ID="UpdateCancelButton1" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="إلغاء" />
                                                    </td>
                                                    <td class="style51">
                                                        <asp:LinkButton ID="UpdateButton1" runat="server" CausesValidation="True" 
                                                            CommandName="Update" Text="حفظ" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="CodeLabel4" runat="server" Text='<%# Eval("Code") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        أمراض مزمنة</td>
                                                    <td>
                                                        <asp:TextBox ID="EndemicTextBox0" runat="server" Text='<%# Bind("Endemic") %>' 
                                                            Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        Code</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" colspan="2" style="text-align: center">
                                                        <b>
                                                        <asp:Image ID="Image2" runat="server" BorderColor="White" BorderStyle="Solid" 
                                                            BorderWidth="5px" Height="109px" 
                                                            ImageUrl='<%# "ShowImage.ashx?Code=" & eval("Code") %>' />
                                                        </b></td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        الاسم</td>
                                                    <td>
                                                        <asp:TextBox ID="E_NameTextBox0" runat="server" Text='<%# Bind("E_Name") %>' 
                                                            Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        كشف ثاني</td>
                                                    <td>
                                                        <asp:TextBox ID="كشف_ثانيTextBox0" runat="server" 
                                                            Text='<%# Bind("كشف_ثاني") %>' Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        كشف بتروجاس</td>
                                                    <td>
                                                        <asp:TextBox ID="كشف_بتروجاسTextBox0" runat="server" Text='<%# Bind("كشف_بتروجاس") %>' 
                                                            Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        إستلام دفتر</td>
                                                    <td>
                                                        <asp:TextBox ID="إستلام_دفترTextBox0" runat="server" 
                                                            Text='<%# Bind("إستلام_دفتر") %>' Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        كشف اول</td>
                                                    <td>
                                                        <asp:TextBox ID="كشف_اولTextBox0" runat="server" 
                                                            Text='<%# Bind("كشف_اول", "{0:d}") %>' Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        ملاحظات بتروجاس</td>
                                                    <td>
                                                        <asp:TextBox ID="NotesTextBox0" runat="server" Height="175px" 
                                                            Text='<%# Bind("Notes") %>' TextMode="MultiLine" Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style50">
                                                        ملاحظات على العامل</td>
                                                    <td>
                                                        <asp:TextBox ID="PetroGasNotesTextBox0" runat="server" Height="100px" 
                                                            Text='<%# Bind("PetroGasNotes") %>' TextMode="MultiLine" Width="180px" />
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
                                        <asp:LinkButton ID="InsertButton2" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton2" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Panel ID="Panel20" runat="server" Width="258px">
                                            <table dir="rtl" width="255">
                                                <tr>
                                                    <td align="center" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Image ID="Image3" runat="server" BorderColor="White" BorderStyle="Solid" 
                                                            BorderWidth="5px" Height="109px" 
                                                            ImageUrl='<%# "ShowImage.ashx?Code=" & eval("Code") %>' />
                                                        </b></td>
                                                    <td align="center" dir="rtl" rowspan="0" width="250">
                                                        <asp:LinkButton ID="btnHistory2" runat="server" onclick="btnHistory2_Click">حافظة البنود الخاصة</asp:LinkButton>
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
                                                        <asp:Label ID="Regist_No1Label3" runat="server" 
                                                            Text='<%# Bind("Regist_No1") %>' CssClass="style18" ForeColor="Red" />
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        كود الموظف :</td>
                                                    </span>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="CodeLabel5" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Eval("Code") %>' CssClass="style18" 
                                                            ForeColor="Black" />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        اسم الموظف :</td>
                                                    </span></span></span></span></span>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <asp:Label ID="E_NameLabel3" runat="server" CssClass="style53" 
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
                                                        <asp:Label ID="JOB_NAMELabel0" runat="server" CssClass="style53" 
                                                            Font-Italic="False" Text='<%# Bind("JOB_NAME") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        الحالة الاجتماعية :</td>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <span class="style15">
                                                        <asp:Label ID="Marital_Status_ALabel1" runat="server" 
                                                            Text='<%# Bind("Marital_Status_A") %>' />
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" width="250">
                                                        الموقف الحالى :</td>
                                                    <td class="style28" dir="rtl" width="250">
                                                        <span class="style16">
                                                        <asp:Label ID="الموقف_الحاليLabel1" runat="server" 
                                                            Text='<%# Bind("الموقف_الحالي") %>' />
                                                        </span></td>
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
                                                        <asp:Label ID="نوع_التعاقدLabel1" runat="server" 
                                                            Text='<%# Bind("نوع_التعاقد") %>' />
                                                        </span></span></td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        نوع الوظيفة :</td>
                                                    </span></span></span></span></span></span></span></span></span></span></span>
                                                    </span></span></span></span></span></span>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <span class="style28"><b>
                                                        <asp:Label ID="نوع_الوظيفةLabel1" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("نوع_الوظيفة") %>' />
                                                        </b></span></td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        تاريخ الميلاد :</td>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="D_BirthLabel1" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("D_Birth", "{0:d}") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        العمر :</td>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="YearsOldLabel0" runat="server" Font-Bold="True" 
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
                                                        <asp:Label ID="BoardMemberLabel1" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("BoardMember") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        أمراض مزمنة:&nbsp;</td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="EndemicLabel1" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("Endemic") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        كشف بتروجاز:</td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="كشف_بتروجاسLabel1" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" style="direction: ltr" 
                                                            Text='<%# Bind("كشف_بتروجاس") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        أول تعيين<span class="style15">:</span></td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="كشف_اولLabel1" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("اول_تعيين", "{0:d}")%>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        <span class="style15">إستلام دفتر:</span></td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="إستلام_دفترLabel1" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("إستلام_دفتر") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        <span class="style15">ملاحظات بتروجاس:</span></td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="PetroGasNotesLabel1" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("PetroGasNotes") %>' />
                                                        </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" width="250">
                                                        ملاحظات:</td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        &nbsp;<b><asp:Label ID="NotesLabel1" runat="server" Font-Bold="True" 
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
                                                        <asp:Label ID="slLabel1" runat="server" CssClass="style159" Font-Bold="True" 
                                                            Font-Italic="False" ForeColor="Black" Text='<%# Bind("sl") %>' />
                                                        </b>
                                                    </td>
                                                    <td class="style28" dir="rtl" width="250">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style28" dir="rtl" rowspan="0" width="250" colspan="1">
                                                        <asp:LinkButton ID="EditButton1" runat="server" CausesValidation="False" 
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
                                        <asp:TextBox ID="CODETextBox" runat="server" Text='<%# Bind("CODE") %>' />
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
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        CODE:
                                        <asp:TextBox ID="CODETextBox" runat="server" Text='<%# Bind("CODE") %>' />
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
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
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
                                <asp:SqlDataSource ID="sdsEmpRelatives" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                                    SelectCommand="SELECT [CODE], [WIFE_NAME]  , [D_BIRTH], [RELIGION], [NATIONALITY], [WORK_PLACE], [P_BIRTH], [DISTRICT_A], [MARRIAGE_DATE], [ID_NO], [STATION] FROM [Wives] WHERE ([CODE] = @CODE)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="fvHRData" Name="CODE" 
                                            PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <table >
                                <tr>
                                <td class="style28">                                 &nbsp; الابناء </td>
                                </tr>
                                <tr>
                                <td class="style28">
     <asp:GridView ID="gvChildren" runat="server" 
                                    AutoGenerateColumns="False" DataSourceID="sdsChildren" Width="263px" 
                                        CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                </td>
                                
                                </tr>
                                
                                </table>


                                <asp:FormView ID="fvMaxFamilyEmp" runat="server" DataSourceID="sdsMaxFamilyEmp" 
                                    Width="260px">
                                    <EditItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox" runat="server" Text='<%# Bind("code") %>' />
                                        <br />
                                        CoShareholdFTotal:
                                        <asp:TextBox ID="CoShareholdFTotalTextBox" runat="server" 
                                            Text='<%# Bind("CoShareholdFTotal") %>' />
                                        <br />
                                        CoShareholdTotal:
                                        <asp:TextBox ID="CoShareholdTotalTextBox" runat="server" 
                                            Text='<%# Bind("CoShareholdTotal") %>' />
                                        <br />
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox" runat="server" Text='<%# Bind("code") %>' />
                                        <br />
                                        CoShareholdFTotal:
                                        <asp:TextBox ID="CoShareholdFTotalTextBox" runat="server" 
                                            Text='<%# Bind("CoShareholdFTotal") %>' />
                                        <br />
                                        CoShareholdTotal:
                                        <asp:TextBox ID="CoShareholdTotalTextBox" runat="server" 
                                            Text='<%# Bind("CoShareholdTotal") %>' />
                                        <br />
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Panel ID="Panel6" runat="server" Width="258px" BackColor="#F7F6F3">
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
    <asp:FormView ID="FormView1" runat="server" DataSourceID="sdsPregnancyFollow"   Width="265px">
                                        <EditItemTemplate>
                                            code:
                                            <asp:TextBox ID="codeTextBox" runat="server" Text='<%# Bind("code") %>' />
                                            <br />
                                            CheckTotal:
                                            <asp:TextBox ID="CheckTotalTextBox" runat="server" 
                                                Text='<%# Bind("CheckTotal") %>' />
                                            <br />
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Update" />
                                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            code:
                                            <asp:TextBox ID="codeTextBox" runat="server" Text='<%# Bind("code") %>' />
                                            <br />
                                            CheckTotal:
                                            <asp:TextBox ID="CheckTotalTextBox" runat="server" 
                                                Text='<%# Bind("CheckTotal") %>' />
                                            <br />
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                                CommandName="Insert" Text="Insert" />
                                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Panel ID="Panel7" runat="server" Width="258px">
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
                                    Width="265px" Height="17px">
                                    <EditItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox0" runat="server" Text='<%# Bind("code") %>' />
                                        <br />
                                        CoShareholdFTotal:
                                        <asp:TextBox ID="CoShareholdFTotalTextBox0" runat="server" 
                                            Text='<%# Bind("CoShareholdFTotal") %>' />
                                        <br />
                                        CoShareholdTotal:
                                        <asp:TextBox ID="CoShareholdTotalTextBox0" runat="server" 
                                            Text='<%# Bind("CoShareholdTotal") %>' />
                                        <br />
                                        <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton0" runat="server" 
                                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox1" runat="server" Text='<%# Bind("code") %>' />
                                        <br />
                                        CoShareholdFTotal:
                                        <asp:TextBox ID="CoShareholdFTotalTextBox1" runat="server" 
                                            Text='<%# Bind("CoShareholdFTotal") %>' />
                                        <br />
                                        CoShareholdTotal:
                                        <asp:TextBox ID="CoShareholdTotalTextBox1" runat="server" 
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
                                </div>
                            </asp:Panel>
                        </td>
                        <td dir="rtl" valign="top" class="style177">
                             <asp:FormView ID="fvTickets" runat="server" DataKeyNames="Id_3101" 
                                DataSourceID="sdsTeckits" Width="645px" EmptyDataText="رقم الجواب غير صحيح">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" 
                                        Text="حفظ" onclick="UpdateButton_Click" />
                                    &nbsp;&nbsp;<asp:LinkButton ID="UpdateCancelButton0" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="الغاء" 
                                        onclick="UpdateCancelButton0_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                        ShowMessageBox="True" ShowSummary="False" />
                                    <br />&nbsp;
                                  
                                    <asp:Panel ID="Panel14" runat="server" Width="620px">
                                        <table style="width:100%;">
                                            <tr>
                                                <td class="style49">
                                                    رقم الجواب : </td>
                                                <td>
                                                    <asp:Label ID="Id_3101Label1" runat="server" Text='<%# Eval("Id_3101") %>' />
                                                </td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    تاريخ الجواب:
                                                </td>
                                                <td>
<asp:TextBox ID="TarnsDateTextBox" runat="server" BackColor="#B6B6B6" onFocus="style.backgroundColor='yellow'; " onblur="checkdate(this);style.backgroundColor = 'white';"
                                                        ForeColor="Black" Text='<%# Bind("TarnsDate", "{0:dd/MM/yyyy}") %>' 
                                                        Width="170px" />
                                                               <asp:CompareValidator ID="CompareValidator17" runat="server" 
                                                        ControlToValidate="TarnsDateTextBox" ErrorMessage="من فضلك ادخل تاريخ مناسب !" 
                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
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
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
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
                                                        AutoPostBack="True" onselectedindexchanged="ddlTreatTypeId_SelectedIndexChanged" 
                                                    >
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
                                                    <asp:DropDownList ID="ddlTreatKind" runat="server" AppendDataBoundItems="True" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        SelectedValue='<%# Bind("TreatKind") %>' Width="170px" AutoPostBack="True" 
                                                        onselectedindexchanged="ddlTreatKind_SelectedIndexChanged" 
                                                        ondatabound="ddlTreatKind_DataBound">
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
                                                                DataSourceID="sdsRelatives" DataTextField="CaseType" 
                                                                DataValueField="CaseType" SelectedValue='<%# Bind("relatives") %>' 
                                                                Width="170px">
                                                                <%--<asp:ListItem>-</asp:ListItem>--%>
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
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    الجهة الطبية:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlContractors" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        DataSourceID="SqlContractors" DataTextField="Contractors" 
                                                        DataValueField="Contractors" SelectedValue='<%# Bind("Contractors") %>' 
                                                        Width="170px">
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlContractors_ListSearchExtender" runat="server" 
                                                        Enabled="True" PromptCssClass="PromptCSS" PromptText="ابحث" 
                                                        TargetControlID="ddlContractors" QueryPattern="Contains">
                                                    </asp:ListSearchExtender>
                                                </td>
                                                <td class="style49">
                                                    الصيدلية:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlContractorsPH" runat="server" 
                                                        onFocus="style.backgroundColor='yellow'; " 
                                                        onblur="style.backgroundColor='white'; " DataSourceID="SqlContractorsPh" 
                                                        DataTextField="Contractors" DataValueField="Contractors" 
                                                        SelectedValue='<%# Bind("Contractors2") %>' Width="170px">
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlContractorsPH_ListSearchExtender" runat="server" 
                                                        Enabled="True" PromptText="ابحث" TargetControlID="ddlContractorsPH" 
                                                        PromptCssClass="PromptCSS" QueryPattern="Contains">
                                                    </asp:ListSearchExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    درجة الإقامة:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlHospital" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        SelectedValue='<%# Bind("HospitalLevel") %>' Width="170px">
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
                                                    <asp:DropDownList ID="ddlCategorization" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        AppendDataBoundItems="True" DataSourceID="SdsCategorization" 
                                                        DataTextField="categorization" DataValueField="categorization" 
                                                        SelectedValue='<%# Bind("categorization") %>' Width="170px">
                                                        <asp:ListItem Selected="True">-</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <br />
                                    <asp:Panel ID="Panel17" runat="server" Width="620px">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td class="style176">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                            <table class="style14">
                                                                <tr>
                                                                    <td>
                                                                        تأكيد الطبيب :</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDokConfirm" runat="server" AppendDataBoundItems="True" 
                                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                            AutoPostBack="True" onselectedindexchanged="ddlDokConfirm_SelectedIndexChanged" 
                                                                            SelectedValue='<%# Bind("DokConfirm") %>' Width="170px" 
                                                                            ondatabound="ddlDokConfirm_DataBound">
                                                                            <asp:ListItem Selected="True">لا</asp:ListItem>
                                                                            <asp:ListItem>نعم</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        تاريخ تأكيد الطبيب:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="DokConfirmDateTextBox" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                            Text='<%# Bind("DokConfirmDate") %>' Width="170px" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        رقم مطالبة الطبيب:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="BillingNoTextBox0" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                            Text='<%# Bind("BillingNo") %>' Width="170px" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td class="style170">
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                        <ContentTemplate>
                                                            <table class="style14">
                                                                <tr>
                                                                    <td>
                                                                        تأكيد الصيدلية :
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlPharmConfirm0" runat="server" 
                                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                            AppendDataBoundItems="True" AutoPostBack="True" 
                                                                            onselectedindexchanged="ddlPharmConfirm0_SelectedIndexChanged" 
                                                                            SelectedValue='<%# Bind("pharmConfirm") %>' Width="170px" 
                                                                            ondatabound="ddlPharmConfirm0_DataBound">
                                                                            <asp:ListItem>لا</asp:ListItem>
                                                                            <asp:ListItem>نعم</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        تاريخ تأكيد الصيلية:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="pharmConfirmDateTextBox" runat="server" 
                                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                            Text='<%# Bind("pharmConfirmDate") %>' Width="170px" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        رقم مطالبة الصيدلية:</td>
                                                                    <td>
                                                                        <asp:TextBox ID="BillingNo1TextBox0" runat="server" onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                            Text='<%# Bind("BillingNo1") %>' Width="170px" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <br />
                                    <asp:Panel ID="Panel13" runat="server" Width="620px">
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                            <ContentTemplate>
                                                <table style="width:100%;">
                                                    <tr>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            كشف</td>
                                                        <td>
                                                            محلي</td>
                                                        <td>
                                                            مستورد</td>
                                                        <td>
                                                            محلي بعد الخصم</td>
                                                        <td>
                                                            مستورد بعد الخصم</td>
                                                        <td>
                                                            حصة الشركة</td>
                                                        <td>
                                                            حصة العامل</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49">
                                                            بحد أقصى</td>
                                                        <td>
                                                         
                                                            <asp:TextBox ID="CheckTextBox" runat="server" Text='<%# Bind("Check") %>' 
                                                                onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Width="70px" Enabled="False" />
                                                                   <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                                                ControlToValidate="CheckTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="LocaldeductTextBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("Localdeduct") %>' Width="70px" Enabled="False" />
                                                                     <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                                                ControlToValidate="LocaldeductTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ForeignDeductTextBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("ForeignDeduct") %>' Width="70px" Enabled="False" />
                                                                   <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                                                ControlToValidate="ForeignDeductTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LocaldeductAfterLabe"  Text='<%# Bind("LocaldeductAfter","{0:F2}") %>' Width="70px" runat="server"  ></asp:Label>
                                                           
                                                        </td>
                                                        <td>
                                                          
                                                            <asp:Label ID="ForeignDeductAfterLabel" runat="server"     Text='<%# Bind("ForeignDeductAfter","{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>                                                            
                                                            <asp:Label ID="CoShareholdLabel" runat="server"  Text='<%# Bind("CoSharehold","{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                           
                                                            <asp:Label ID="EmpShareholdLabel" runat="server"  Width="70px"  Text='<%# Bind("EmpSharehold","{0:F2}") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49">
                                                            بدون حد أقصى</td>
                                                        <td>
                                                            <asp:TextBox ID="Check1TextBox" runat="server" Text='<%# Bind("Check1") %>' 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Width="70px" Enabled="False" />
                                                                     <asp:CompareValidator ID="CompareValidator5" runat="server" 
                                                                ControlToValidate="Check1TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Localdeduct1TextBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("Localdeduct1") %>' Width="70px" Enabled="False" 
                                                                Height="20px" />

                                                                         <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                                                ControlToValidate="Localdeduct1TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ForeignDeduct1TextBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("ForeignDeduct1") %>' Width="70px" Enabled="False" />
                                                                  <asp:CompareValidator ID="CompareValidator7" runat="server" 
                                                                ControlToValidate="ForeignDeduct1TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LocaldeductAfter1Label" runat="server"     Text='<%# Bind("LocaldeductAfter1","{0:F2}") %>' Width="70px"  ></asp:Label>
                                                                                                                       
                                                        </td>
                                                        <td>
                                                          
                                                            <asp:Label ID="ForeignDeductAfter1Label" runat="server"  Text='<%# Bind("ForeignDeductAfter1","{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                         
                                                            <asp:Label ID="CoSharehold1Label" runat="server"    Text='<%# Bind("CoSharehold1","{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                           
                                                            <asp:Label ID="EmpSharehold1Label" runat="server" Text='<%# Bind("EmpSharehold1","{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49">
                                                            إعفاء الموظف</td>
                                                        <td>
                                                            <asp:TextBox ID="Check2TextBox" runat="server" Text='<%# Bind("Check2") %>' 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Width="70px" Enabled="False" />
                                                                     <asp:CompareValidator ID="CompareValidator8" runat="server" 
                                                                ControlToValidate="Check2TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="Localdeduct2TextBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("Localdeduct2") %>' Width="70px" Enabled="False" />
                                                                  <asp:CompareValidator ID="CompareValidator9" runat="server" 
                                                                ControlToValidate="Localdeduct2TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ForeignDeduct2TextBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("ForeignDeduct2") %>' Width="70px" Enabled="False" />
                                                                     <asp:CompareValidator ID="CompareValidator10" runat="server" 
                                                                ControlToValidate="ForeignDeduct2TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LocaldeductAfter2Label" runat="server"  Text='<%# Bind("LocaldeductAfter2","{0:F2}") %>' Width="70px" ></asp:Label>
                                                         
                                                                
                                                        </td>
                                                        <td>
                                                     
                                                            <asp:Label ID="ForeignDeductAfter2Label" runat="server"  Text='<%# Bind("ForeignDeductAfter2","{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                         
                                                            <asp:Label ID="CoSharehold2Label" Text='<%# Bind("CoSharehold2","{0:F2}") %>' Width="70px" runat="server" ></asp:Label>
                                                        </td>
                                                        <td>
                                                           
                                                            <asp:Label ID="EmpSharehold2Label" runat="server" Text='<%# Bind("EmpSharehold2","{0:F2}") %>' Width="70px" ></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49">
                                                            علاج أسري</td>
                                                        <td>
                                                            <asp:TextBox ID="CheckFTextBox" runat="server" Text='<%# Bind("CheckF") %>' 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Width="70px" Enabled="False" />
                                                                         <asp:CompareValidator ID="CompareValidator11" runat="server" 
                                                                ControlToValidate="CheckFTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="LocaldeductFTextBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("LocaldeductF") %>' Width="70px" Enabled="False" />
                                                                        <asp:CompareValidator ID="CompareValidator12" runat="server" 
                                                                ControlToValidate="LocaldeductFTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ForeignDeductFTextBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("ForeignDeductF") %>' Width="70px" Enabled="False" />
                                                                 <asp:CompareValidator ID="CompareValidator13" runat="server" 
                                                                ControlToValidate="ForeignDeductFTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LocaldeductAfterFLabel1"   Text='<%# Bind("LocaldeductAfterF","{0:F2}") %>' Width="70px" runat="server" ></asp:Label>
                                                          
                                                            
                                                        </td>
                                                        <td>
                                                           
                                                            <asp:Label ID="ForeignDeductAfterFLabel"  Text='<%# Bind("ForeignDeductAfterF","{0:F2}") %>' Width="70px" runat="server" ></asp:Label>
                                                        </td>
                                                        <td>
                                                           
                                                               
                                                            <asp:Label ID="CoShareholdFLabel" runat="server"  Text='<%# Bind("CoShareholdF","{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="EmpShareholdFTextBox" runat="server" 
                                                              Text='<%# Bind("EmpShareholdF","{0:F2}") %>' Width="70px"></asp:Label>                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49">
                                                            بنود خاصة</td>
                                                        <td>
                                                            <asp:TextBox ID="CheckSTextBox" runat="server" Text='<%# Bind("CheckS") %>' 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Width="70px" Enabled="False" />
                                                                         <asp:CompareValidator ID="CompareValidator14" runat="server" 
                                                                ControlToValidate="CheckSTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="LocaldeductSTextBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("LocaldeductS") %>' Width="70px" Enabled="False" />
                                                                           <asp:CompareValidator ID="CompareValidator15" runat="server" 
                                                                ControlToValidate="LocaldeductSTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ForeignDeductSTextBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Text='<%# Bind("ForeignDeductS") %>' Width="70px" Enabled="False" />
                                                                      <asp:CompareValidator ID="CompareValidator16" runat="server" 
                                                                ControlToValidate="ForeignDeductSTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                                ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LocaldeductAfterSLabele0" runat="server" 
                                                                Text='<%# Bind("LocaldeductAfterS","{0:F2}") %>' Width="70px"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="ForeignDeductAfterSLabel1" runat="server" 
                                                                Text='<%# Bind("ForeignDeductAfterS","{0:F2}") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                         <asp:Label ID="CoShareholdSlabele" runat="server"  
                                                                Text='<%# Bind("CoShareholdS","{0:F2}") %>'
                                                            ></asp:Label>
                                                                                                                  </td>
                                                        <td>
                                                         <asp:Label ID="EmpShareholdSLable" runat="server"  
                                                                Text='<%# Bind("EmpShareholdS","{0:F2}") %>'
                                                            ></asp:Label>
                                                       
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
                                                         <asp:Label ID="CoShareholdNetLabel" runat="server"  
                                                                Text='<%# Bind("CoShareholdNet","{0:F2}") %>' ForeColor="Red"
                                                            ></asp:Label>
                                                         
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="EmpShareholdNetLabel" runat="server"  
                                                                Text='<%# Bind("EmpShareholdNet","{0:F2}") %>' ForeColor="Red"
                                                            ></asp:Label>
                                                         
                                                      
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style49" colspan="2">
                                                            مخصص علاج أسري:</td>
                                                        <td colspan="2">
                                                            <asp:CheckBox ID="chbFamilyBox" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                Checked='<%# Bind("FamilyBox") %>' />
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
                                    <br />
                                    <asp:Panel ID="Panel15" runat="server" Width="620px">
                                        <table style="width:100%;">
                                            <tr>
                                                <td class="style49">
                                                    ملاحطات:
                                                </td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="notesTextBox" runat="server" Height="20px" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        Text='<%# Bind("notes") %>' Width="500px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    اسم المريض:</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="CaseNameTextBox" runat="server" Height="20px" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        Text='<%# Bind("CaseName") %>' Width="292px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    ملاحظات صيدلية:</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="PharmMemoTextBox" runat="server" Height="20px" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        Text='<%# Bind("PharmMemo") %>' Width="500px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td class="style172">
                                                    مsحلي<asp:CompareValidator ID="CompareValidator18" runat="server" 
                                                        ControlToValidate="LocalDeduct3TextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                </td>
                                                <td>
                                                    مستورد<asp:CompareValidator ID="CompareValidator19" runat="server" 
                                                        ControlToValidate="ForignDeductTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                </td>
                                                <td>
                                                    مستشفيات<asp:CompareValidator ID="CompareValidator20" runat="server" 
                                                        ControlToValidate="HospitalDeductTextBox" ErrorMessage="ادخل رقم من فضلك" 
                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td class="style172">
                                                    <asp:TextBox ID="LocalDeduct3TextBox" runat="server" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        Text='<%# Bind("LocalDeduct3") %>' Width="180px" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ForignDeductTextBox" runat="server" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        Text='<%# Bind("ForignDeduct") %>' Width="180px" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="HospitalDeductTextBox" runat="server" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        Text='<%# Bind("HospitalDeduct") %>' Width="180px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">&nbsp;</td>
                                                <td class="style172">عاملين<asp:CompareValidator ID="CompareValidator22" runat="server" ControlToValidate="EmpDeductTextBox" ErrorMessage="ادخل رقم من فضلك" ForeColor="Red" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">&nbsp;</td>
                                                <td class="style172">
                                                    <asp:TextBox ID="EmpDeductTextBox" runat="server" onblur="style.backgroundColor='white'; " onFocus="style.backgroundColor='yellow'; " Text='<%# Bind("EmpDeduct") %>' Width="180px" />
                                                </td>
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
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                        Text="حفظ" onclick="UpdateButton_Click" 
                                        onclientclick="return confirm(' هل انت متاكد من حفظ هذة التعديلات ؟ ');" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="الغاء" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    &nbsp;&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                        Text="حفظ" onclick="InsertButton_Click"                                          
                                        oncommand="InsertButton_Command" />
                                    &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                        CausesValidation="False"  Text="الغاء"  
                                        onclick="InsertCancelButton_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton 
                                        ID="btnExit" runat="server" CommandName="Cancel" onclick="btnExit_Click">اغلاق</asp:LinkButton>
                                    <br /><!-- --><!-- --> 
                                      <div id="dvPrint" dir="rtl">
                                    <asp:Panel ID="Panel14" runat="server" 
                                        Width="620px">
                                        <table style="width:100%;">
                                            <tr>
                                                <td class="style49" colspan="4">
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    تاريخ الجواب:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TarnsDateTextBoxIns" runat="server" BackColor="#B6B6B6" 
                                                        ForeColor="Black" Width="170px" onload="TarnsDateTextBoxIns_Load" 
                                                        onFocus="style.backgroundColor='yellow'; " 
                                                       onblur="checkdate(this);style.backgroundColor = 'white';"
                                                      />
                                                    <asp:CompareValidator ID="CompareValidator20" runat="server" 
                                                        ControlToValidate="TarnsDateTextBoxIns" ErrorMessage="ادخل تاريخ مناسب" ForeColor="Red" 
                                                        Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                                </td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    السنة:</td>
                                                <td>
                                                    <asp:TextBox ID="YearMTTextBoxIns" runat="server" BackColor="#B6B6B6" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        ForeColor="Black" ReadOnly="True" Text='<%# Bind("YearMT") %>' 
                                                        Width="170px" onload="YearMTTextBoxIns_Load" />
                                                </td>
                                                <td class="style49">
                                                    كود الموظف:</td>
                                                <td>
                                                    <asp:TextBox ID="codeTextBoxIns" runat="server" BackColor="#B6B6B6" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        ForeColor="Black" ReadOnly="True" Text='<%# Bind("code") %>' Width="170px" onload="codeTextBoxIns_Load" 
                                                     />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    نوع المعاملة الطبية:</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ddlTreatTypeIdIns" runat="server" 
                                                        AppendDataBoundItems="True" DataSourceID="sdsItemsAll" 
                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        DataTextField="نوع المعاملة" DataValueField="id" Height="20px" 
                                                        SelectedValue='<%# Bind("TreatTypeId") %>' Width="400px" 
                                                        >
                                                        <asp:ListItem Value="186">كشف</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlTreatTypeIdIns_ListSearchExtender" 
                                                        runat="server" Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                                                        TargetControlID="ddlTreatTypeIdIns">
                                                    </asp:ListSearchExtender>
                                                    <asp:Button ID="btnTreatTypeIdIns" runat="server" Height="20px" 
                                                        onclick="btnTreatTypeIdIns_Click" Text="B" Width="20px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    نوع العلاج:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlTreatKindIns" runat="server" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        AppendDataBoundItems="True" AutoPostBack="True" 
                                                        onselectedindexchanged="ddlTreatKindIns_SelectedIndexChanged" 
                                                        SelectedValue='<%# Bind("TreatKind") %>' Width="170px" 
                                                        ondatabound="ddlTreatKindIns_DataBound">
                                                        <asp:ListItem Selected="True">علاج شخصي</asp:ListItem>
                                                        <asp:ListItem>علاج أسري</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlTreatKindIns_ListSearchExtender" runat="server" 
                                                        Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                                                        TargetControlID="ddlTreatKindIns">
                                                    </asp:ListSearchExtender>
                                                </td>
                                                <td class="style49">
                                                    الأقارب:</td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="ddlRelativesIns" runat="server" 
                                                            onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                                AppendDataBoundItems="True" DataSourceID="sdsRelatives" 
                                                                DataTextField="CaseType" DataValueField="CaseType" Enabled="False" 
                                                                SelectedValue='<%# Bind("relatives") %>' Width="170px">
                                                                <asp:ListItem>-</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:ListSearchExtender ID="ddlRelativesIns_ListSearchExtender" runat="server" 
                                                                Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                                                                TargetControlID="ddlRelativesIns">
                                                            </asp:ListSearchExtender>
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
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    الجهة الطبية:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlContractorsIns" runat="server" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        DataSourceID="SqlContractors" DataTextField="Contractors" 
                                                        DataValueField="Contractors" SelectedValue='<%# Bind("Contractors") %>' 
                                                        Width="170px">
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlContractorsIns_ListSearchExtender" 
                                                        runat="server" Enabled="True" PromptCssClass="PromptCSS" 
                                                        QueryPattern="Contains" TargetControlID="ddlContractorsIns" 
                                                        PromptText="بحث">
                                                    </asp:ListSearchExtender>
                                                </td>
                                                <td class="style49">
                                                    الصيدلية:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlContractorsPHIns" runat="server" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        AppendDataBoundItems="True" DataSourceID="SqlContractorsPh" 
                                                        DataTextField="Contractors" DataValueField="Contractors" 
                                                        SelectedValue='<%# Bind("Contractors2") %>' Width="170px">
                                                        <asp:ListItem Selected="True">-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlContractorsPHIns_ListSearchExtender" 
                                                        runat="server" Enabled="True" PromptCssClass="PromptCSS" 
                                                        QueryPattern="Contains" TargetControlID="ddlContractorsPHIns" 
                                                        PromptText="بحث">
                                                    </asp:ListSearchExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    درجة الإقامة:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlHospitalIns" runat="server" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        SelectedValue='<%# Bind("HospitalLevel") %>' Width="170px">
                                                        <asp:ListItem Selected="True">-</asp:ListItem>
                                                        <asp:ListItem>جناح (أ)</asp:ListItem>
                                                        <asp:ListItem>جناح (ب)</asp:ListItem>
                                                        <asp:ListItem>درجة أولى ممتاز</asp:ListItem>
                                                        <asp:ListItem>درجة أولى</asp:ListItem>
                                                        <asp:ListItem>درجة ثانية</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlHospitalIns_ListSearchExtender" runat="server" 
                                                        Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                                                        TargetControlID="ddlHospitalIns">
                                                    </asp:ListSearchExtender>
                                                </td>
                                                <td class="style49">
                                                    التصنيف:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCategorizationIns" runat="server" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        AppendDataBoundItems="True" DataSourceID="SdsCategorization" 
                                                        DataTextField="categorization" DataValueField="categorization" 
                                                        Width="170px">
                                                        <asp:ListItem Selected="True">-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlCategorizationIns_ListSearchExtender" 
                                                        runat="server" Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                                                        TargetControlID="ddlCategorizationIns">
                                                    </asp:ListSearchExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    ملاحظات :</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="TextBoxNodeIns" runat="server" Height="52px" MaxLength="150" 
                                                    onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white'; "
                                                        Text='<%# Bind("notes") %>' TextMode="MultiLine" Width="500px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    ملاحظات صيدلية :</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="TextBoxPharmNodeIns" runat="server" Height="52px" 
                                                        MaxLength="150" onblur="style.backgroundColor='white'; " 
                                                        onFocus="style.backgroundColor='yellow'; " Text='<%# Bind("PharmMemo") %>' 
                                                        TextMode="MultiLine" Width="500px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style49" colspan="2">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style49" colspan="2">
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                        <br />
                                    </asp:Panel>
                                    </div>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="تعديل" Visible="False" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                        CommandName="Delete" Text="حذف الجواب" 
                                        onclientclick="return confirm(' هل انت متاكد من حذف هذا الجواب ؟ ');" 
                                        Visible="False" />
                                    &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                        CommandName="NEW" Text="جواب جديد" Visible="False" />
                                    <br />
                                    <br />
                                    <asp:Panel ID="Panel14" runat="server" Width="620px">
                                        <table style="width:100%;">
                                            <tr>
                                                <td class="style49">
                                                    رقم الجواب :
                                                </td>
                                                <td>
                                                    <asp:Label ID="Id_3101Label" runat="server" Text='<%# Eval("Id_3101") %>' />
                                                </td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    تاريخ الجواب:
                                                </td>
                                                <td>
                                                    <asp:Label ID="TarnsDateLabel" runat="server" 
                                                        Text='<%# Bind("TarnsDate", "{0:dd/MM/yyyy}") %>' />
                                                </td>
                                                <td class="style49">
                                                    تاريخ العلاج:</td>
                                                <td>
                                                    <asp:Label ID="TreatDateLabel" runat="server" 
                                                        Text='<%# Bind("TreatDate", "{0:dd/MM/yyyy}") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    السنة:</td>
                                                <td>
                                                    <asp:Label ID="YearMTLabel" runat="server" Text='<%# Bind("YearMT") %>' />
                                                </td>
                                                <td class="style49">
                                                    كود الموظف:</td>
                                                <td>
                                                    <asp:Label ID="codeLabel" runat="server" Text='<%# Bind("code") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    نوع المعاملة الطبية:</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ddlTreatTypeIdRead" runat="server" 
                                                        AppendDataBoundItems="True" DataSourceID="sdsItemsAll" 
                                                        DataTextField="نوع المعاملة" DataValueField="id" Enabled="False" Height="20px" 
                                                        SelectedValue='<%# Bind("TreatTypeId") %>' Width="400px">
                                                        <asp:ListItem Value="186">كشف</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    نوع العلاج:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlTreatKindread" runat="server" AppendDataBoundItems="True" 
                                                        AutoPostBack="True" onselectedindexchanged="ddlTreatKind_SelectedIndexChanged" 
                                                        SelectedValue='<%# Bind("TreatKind") %>' Width="170px" Enabled="False" 
                                                        ondatabound="ddlTreatKindread_DataBound">
                                                        <asp:ListItem>علاج شخصي</asp:ListItem>
                                                        <asp:ListItem>علاج أسري</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="style49">
                                                    الأقارب:</td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="Read" runat="server" AppendDataBoundItems="True" 
                                                                DataSourceID="sdsRelatives" DataTextField="CaseType" DataValueField="CaseType" 
                                                                Enabled="False" SelectedValue='<%# Bind("relatives") %>' Width="170px">
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
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    الجهة الطبية:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlContractorsRead" runat="server" 
                                                        DataSourceID="SqlContractors" DataTextField="Contractors" 
                                                        DataValueField="Contractors" SelectedValue='<%# Bind("Contractors") %>' 
                                                        Width="170px" Enabled="False" AppendDataBoundItems="True">
                                                        <asp:ListItem>-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlContractorsRead_ListSearchExtender" runat="server" 
                                                        Enabled="True" PromptCssClass="PromptCSS" PromptText="ابحث" 
                                                        QueryPattern="Contains" TargetControlID="ddlContractorsRead">
                                                    </asp:ListSearchExtender>
                                                </td>
                                                <td class="style49">
                                                    الصيدلية:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlContractorsPHRead" runat="server" 
                                                        AppendDataBoundItems="True" DataSourceID="SqlContractorsPh" 
                                                        DataTextField="Contractors" DataValueField="Contractors" 
                                                        SelectedValue='<%# Bind("Contractors2") %>' Width="170px" Enabled="False">
                                                        <asp:ListItem Selected="True">-</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:ListSearchExtender ID="ddlContractorsPHRead_ListSearchExtender" runat="server" 
                                                        Enabled="True" PromptCssClass="PromptCSS" PromptText="ابحث" 
                                                        QueryPattern="Contains" TargetControlID="ddlContractorsPHRead">
                                                    </asp:ListSearchExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    درجة الإقامة:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlHospitalRead" runat="server" 
                                                        SelectedValue='<%# Bind("HospitalLevel") %>' Width="170px" Enabled="False">
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
                                                    <asp:DropDownList ID="ddlCategorizationRead" runat="server" 
                                                        AppendDataBoundItems="True" DataSourceID="SdsCategorization" 
                                                        DataTextField="categorization" DataValueField="categorization" 
                                                        SelectedValue='<%# Bind("categorization") %>' Width="170px" 
                                                        Enabled="False">
                                                        <asp:ListItem Selected="True">-</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    تأكيد الطبيب :</td>
                                                <td>
                                                    <asp:Label ID="DokConfirmLabel" runat="server" 
                                                        Text='<%# Bind("DokConfirm") %>' />
                                                </td>
                                                <td class="style49">
                                                    تأكيد الصيدلية : </td>
                                                <td>
                                                    <asp:Label ID="pharmConfirmLabel" runat="server" 
                                                        Text='<%# Bind("pharmConfirm") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    تاريخ تأكيد الطبيب:</td>
                                                <td>
                                                    <asp:Label ID="DokConfirmDateLabel" runat="server" 
                                                        Text='<%# Bind("DokConfirmDate") %>' />
                                                </td>
                                                <td class="style49">
                                                    تاريخ تأكيد الصيلية:</td>
                                                <td>
                                                    <asp:Label ID="pharmConfirmDateLabel" runat="server" 
                                                        Text='<%# Bind("pharmConfirmDate") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    رقم مطالبة الطبيب:</td>
                                                <td>
                                                    <asp:Label ID="BillingNoLabel" runat="server" Text='<%# Bind("BillingNo") %>' />
                                                </td>
                                                <td class="style49">
                                                    رقم مطالبة الصيدلية:</td>
                                                <td>
                                                    <asp:Label ID="BillingNo1Label" runat="server" 
                                                        Text='<%# Bind("BillingNo1") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <br />
                                    <asp:Panel ID="Panel13" runat="server" Width="640px">
                                        <table style="width:100%;" width="630" border="3px" bordercolor="gray">
                                            <tr>
                                                <td style="text-align:center ; width : 80px; "> </td>
                                                <td style="text-align:center ; width : 80px; ">كشف</td>
                                                <td style="text-align:center ; width : 80px; ">محلي</td>
                                                <td style="text-align:center ; width : 80px; ">مستورد</td>
                                                <td style="text-align:center ; width : 80px; ">محلي <br /> بعد الخصم</td>
                                                <td style="text-align:center ; width : 80px; ">مستورد <br />  بعد الخصم</td>
                                                <td style="text-align:center ; width : 80px; ">حصة الشركة</td>
                                                <td style="text-align:center ; width : 80px; ">حصة العامل</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    بحد أقصى</td>
                                                <td class="style179">
                                                    <asp:Label ID="CheckLabel" runat="server" Text='<%# Bind("Check") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocaldeductLabel" runat="server" 
                                                        Text='<%# Bind("Localdeduct") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="ForeignDeductSLabel" runat="server" 
                                                        Text='<%# Bind("ForeignDeduct") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocaldeductAfterLabe" runat="server" 
                                                        Text='<%# Eval("LocaldeductAfter","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td class="style180">
                                                    <asp:Label ID="ForeignDeductAfterLabel0" runat="server" 
                                                        Text='<%# Bind("ForeignDeductAfter","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td class="style180">
                                                    <asp:Label ID="CoShareholdLabel0" runat="server" 
                                                        Text='<%# Bind("CoSharehold","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="EmpShareholdLabel0" runat="server" 
                                                        Text='<%# Bind("EmpSharehold","{0:F2}") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    بدون حد أقصى</td>
                                                <td class="style179">
                                                    <asp:Label ID="Check1Label" runat="server" Text='<%# Bind("Check1") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Localdeduct1Label" runat="server" 
                                                        Text='<%# Bind("Localdeduct1") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="ForeignDeduct1Label" runat="server" 
                                                        Text='<%# Bind("ForeignDeduct1") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocaldeductAfter1Label0" runat="server" 
                                                        Text='<%# Eval("LocaldeductAfter1","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="ForeignDeductAfter1Label0" runat="server" 
                                                        Text='<%# Bind("ForeignDeductAfter1","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="CoSharehold1Label0" runat="server" 
                                                        Text='<%# Bind("CoSharehold1","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="EmpSharehold1Label0" runat="server" 
                                                        Text='<%# Bind("EmpSharehold1","{0:F2}") %>' Width="70px"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    إعفاء الموظف</td>
                                                <td class="style179">
                                                    <asp:Label ID="Check2Label" runat="server" Text='<%# Bind("Check2") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="Localdeduct2Label" runat="server" 
                                                        Text='<%# Bind("Localdeduct2") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="ForeignDeduct2Label" runat="server" 
                                                        Text='<%# Bind("ForeignDeduct2") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocaldeductAfter2Label0" runat="server" 
                                                        Text='<%# Eval("LocaldeductAfter2","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="ForeignDeductAfter2Label0" runat="server" 
                                                        Text='<%# Bind("ForeignDeductAfter2","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="CoSharehold2Label0" runat="server" 
                                                        Text='<%# Bind("CoSharehold2","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="EmpSharehold2Label0" runat="server" 
                                                        Text='<%# Bind("EmpSharehold2","{0:F2}") %>' Width="70px"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    علاج أسري</td>
                                                <td class="style179">
                                                    <asp:Label ID="CheckFLabel" runat="server" Text='<%# Bind("CheckF") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocaldeductFLabel" runat="server" 
                                                        Text='<%# Bind("LocaldeductF") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="ForeignDeductFLabel" runat="server" 
                                                        Text='<%# Bind("ForeignDeductF") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocaldeductAfterFLabel1" runat="server" 
                                                        Text='<%# Eval("LocaldeductAfterF","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="ForeignDeductAfterFLabel0" runat="server" 
                                                        Text='<%# Bind("ForeignDeductAfterF","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="CoShareholdFLabel0" runat="server" 
                                                        Text='<%# Bind("CoShareholdF","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="EmpShareholdFTextBox" runat="server" 
                                                        Text='<%# Bind("EmpShareholdF","{0:F2}") %>' Width="70px"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    بنود خاصة</td>
                                                <td class="style179">
                                                    <asp:Label ID="CheckSLabel" runat="server" Text='<%# Bind("CheckS") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocaldeductSLabel" runat="server" 
                                                        Text='<%# Bind("LocaldeductS") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="ForeignDeductLabel" runat="server" 
                                                        Text='<%# Bind("ForeignDeductS") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="LocaldeductAfterSLabele0" runat="server" 
                                                        Text='<%# Eval("LocaldeductAfterS","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="ForeignDeductAfterSLabel1" runat="server" 
                                                        Text='<%# Bind("ForeignDeductAfterS","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="CoShareholdSlabele" runat="server" 
                                                        Text='<%# Bind("CoShareholdS","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="EmpShareholdSLable" runat="server" 
                                                        Text='<%# Bind("EmpShareholdS","{0:F2}") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style179">
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
                                                    <asp:Label ID="CoShareholdNetLabel0" runat="server" ForeColor="#ff0000"
                                                        Text='<%# Bind("CoShareholdNet","{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="EmpShareholdNetLabel0" runat="server" ForeColor="#ff0000"
                                                        Text='<%# Bind("EmpShareholdNet","{0:F2}") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49" colspan="2">
                                                    مخصص علاج أسري:</td>
                                                <td colspan="2">
                                                    <asp:CheckBox ID="chbFamilyBox" runat="server" 
                                                        Checked='<%# Eval("FamilyBox") %>' Enabled="False" />
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
                                    </asp:Panel>
                                    &nbsp;<asp:Panel ID="Panel15" runat="server" Width="620px" Height="262px">
                                        <table style="width:100%;">
                                            <tr>
                                                <td class="style49">
                                                    ملاحطات:
                                                </td>
                                                <td colspan="3">
                                                    <asp:Label ID="notesLabel" runat="server" Text='<%# Bind("notes") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    اسم المريض:</td>
                                                <td colspan="3">
                                                    <asp:Label ID="CaseNameLabel" runat="server" Text='<%# Bind("CaseName") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    ملاحظات صيدلية:</td>
                                                <td colspan="3">
                                                    <asp:Label ID="PharmMemoLabel" runat="server" Text='<%# Bind("PharmMemo") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td class="style172">
                                                    محلي</td>
                                                <td>
                                                    مستورد</td>
                                                <td>
                                                    مستشفيات</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td class="style172">
                                                    <asp:Label ID="LocalDeduct3Label" runat="server" 
                                                        Text='<%# Bind("LocalDeduct3") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="ForignDeductLabel" runat="server" 
                                                        Text='<%# Bind("ForignDeduct") %>' />
                                                </td>
                                                <td>
                                                    <asp:Label ID="HospitalDeductLabel" runat="server" 
                                                        Text='<%# Bind("HospitalDeduct") %>' />
                                                </td>
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
                                            </tr>
                                            <tr>
                                                <td class="style49">عاملين</td>
                                                <td class="style172">
                                                    <asp:Label ID="EmpDeductLabel" runat="server" Text='<%# Bind("EmpDeduct") %>' />
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    حرر بواسطة :</td>
                                                <td class="style172">
                                                    <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' />
                                                </td>
                                                <td>
                                                    حرر فى :</td>
                                                <td>
                                                    <asp:Label ID="CreatedDateLabel" runat="server" 
                                                        Text='<%# Bind("CreatedDate") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    عدل&nbsp; بواسطة :</td>
                                                <td class="style172">
                                                    <asp:Label ID="LastModifiedByLabel" runat="server" 
                                                        Text='<%# Bind("LastModifiedBy") %>' />
                                                </td>
                                                <td>
                                                    عدل في:</td>
                                                <td>
                                                    <asp:Label ID="LastModifiedDateLabel" runat="server" 
                                                        Text='<%# Bind("LastModifiedDate") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <br />
                                </ItemTemplate>
                                <PagerSettings Mode="NextPrevious" Position="TopAndBottom" 
                                    FirstPageText="الاول" LastPageText="الاخير" NextPageText="التالى" 
                                    PreviousPageText="السابق" />
                                <PagerStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <PagerTemplate>
                                  
                                </PagerTemplate>
                            </asp:FormView>
                          
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:SqlDataSource ID="sdsPregnancyFollow" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" SelectCommand="SELECT  SUM(CoShareholdNet) AS CheckTotal  FROM MtTickets 
where  TreatTypeId in( 17,146,187,188,189,190) 
  AND YearMT = @YearMT and code =@code
                                ">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlYearMt" Name="YearMT" 
                                        PropertyName="SelectedValue" DefaultValue="0" Type="Int16" />
                                    <asp:ControlParameter ControlID="fvHRData" Name="code" 
                                        PropertyName="SelectedValue" DefaultValue="0" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style177">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style177">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Panel ID="Panel8" runat="server" BackColor="#B6AD92" 
                                Width="900px">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgProgress" runat="server" 
                                                ImageUrl="~/Images/progress_bar_animated.gif" Height="10px" 
                                                Width="900px" />
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
                                DynamicServiceMethod="" DynamicServicePath="" Enabled="True" 
                                CancelControlID="btnOk" PopupControlID="Panel8" PopupDragHandleControlID="Panel8" 
                                RepositionMode="None" TargetControlID="HiddenField1" >
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
                                            <asp:DropDownList ID="ddlTreatTypeId0" runat="server" 
                                                DataSourceID="sdsItems0" DataTextField="نوع المعاملة" DataValueField="id" 
                                                Height="20px"  Width="136px" AutoPostBack="True">
                                                <asp:ListItem Value="186" Selected="True">كشف</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:TextBox ID="txtItemsFilter" runat="server" Height="20px" Width="268px">كشف</asp:TextBox>
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
                                                        CommandName="Select" onclick="btnSelectItems_Click" Text="إختار"></asp:LinkButton>
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
                                DynamicServicePath="" Enabled="True" PopupControlID="Panel17"    
                                PopupDragHandleControlID="Panel17" TargetControlID="hfTreatTypeId"  
                                RepositionMode="None" BehaviorID="Panel17" CancelControlID="btnOk0">
                            </asp:ModalPopupExtender>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:HiddenField ID="hfTreateType" runat="server" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:SqlDataSource ID="sdsItems0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" SelectCommand="SELECT id, TreatType AS [نوع المعاملة], SpecialNeedLevel AS [المستوى الوظيفي], Rang AS المدى,
 Notes AS ملاحظات, SpecialNeed AS [بند خاص]
FROM MtItems
WHERE (((SpecialNeedVersion)='2008')) 
ORDER BY TreatType
"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsChildren" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [CODE], [CHILD_NAME], [SEX], [D_BIRTH], [age] FROM [Children] WHERE ([CODE] = @Code)
order by age desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fvHRData" Name="Code" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfTreatTypeId" runat="server" />
            <br />
            <table>
                <tr>
                    <td class="auto-style2"></td>
                     <td class="auto-style1" colspan="4"><strong style="text-align: right">طباعة اكثر من خطاب</strong></td>
                </tr>
                <tr>
                    <td>من</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>الى</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="BtPrintRange" runat="server" Height="38px" ImageUrl="~/Images/print.png" OnClick="BtPrintRange_Click" ToolTip="طباعة" Width="37px" />
                    </td>
                </tr>
            </table>
            
                                      
                          
                           
     
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
</asp:Content>

