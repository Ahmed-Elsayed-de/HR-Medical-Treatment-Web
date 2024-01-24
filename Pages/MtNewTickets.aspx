<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/MT.master" AutoEventWireup="false" CodeFile="MtNewTickets.aspx.vb" Inherits="Pages_MtNewTickets" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register src="WebUserSecurityManager.ascx" tagname="WebUserSecurityManager" tagprefix="uc1" %>

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
        .style154
        {
            margin-bottom: 0px;
        }
        .style168
        {
            text-align: center;
            direction: ltr;
        }
        .style173
        {
            direction: ltr;
        }
        .style177
        {
            width: 599px;
        }
        .style179
        {
            width: 96px;
        }
        .style180
        {
            width: 275px;
        }
        .style181
        {
            width: 172px;
        }
                #MainContent_fvHRData_Panel2 tr{
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
            <asp:SqlDataSource ID="sdsHRData" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="if not exists (select * from MedicalNotes where Code =(select code from hrdata where Regist_No1 = @reg) )
Begin insert into MedicalNotes (Code) values ((select code from hrdata where Regist_No1 = @reg)) End
SELECT HRdata.Code, HRdata.E_Name, HRdata.PetroGasNotes, HRdata.كشف_ثاني, HRdata.كشف_اول,  HRdata.BoardMember, HRdata.Endemic, HRdata.sl, HRdata.نوع_الوظيفة,
 HRdata.نوع_التعاقد, HRdata.الموقف_الحالي, HRdata.إستلام_دفتر, HRdata.كشف_بتروجاس, HRdata.Regist_No1, HRdata.Sex_A, HRdata.Marital_Status_A, HRdata.Regist_No,
  HRdata.D_Birth, HRdata.Picture, HRdata.JOB_NAME, HRdata.YearsOld,HRdata.اول_تعيين, m.Notes  FROM HRdata  inner join MedicalNotes m
  on HRdata.Code = m.Code
  inner join HR..[1112] x
  on HRdata.Code = x.Code
   WHERE ((HRdata.الموقف_الحالي &lt;&gt;'إنهاء عمل') or (HRdata.الموقف_الحالي ='إنهاء عمل' and x.إنهاء_عمل in ('معاش','عجز','بدون')))   and (HRdata.Regist_No1 = @reg)
   " 
                
                
                
                
                
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
ORDER BY MtTickets.TarnsDate desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fvHRData" DefaultValue="0" Name="Code" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsTeckits" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                DeleteCommand="Update [MtTickets] set [IsDeleated]=1 , DeletedBy = @DeleatedBy WHERE [Id_3101] = @Id_3101" 
                SelectCommand="SELECT Id_3101, TarnsDate, TreatDate, Contractors, TreatType, TreatTypeId, TreatKind, relatives, DokConfirm, DokConfirmDate, Contractors2, pharmConfirm, pharmConfirmDate, notes, code, Localdeduct, ForeignDeduct, LocaldeductAfter, ForeignDeductAfter, CoSharehold, CoShareholdSurg, EmpSharehold, [Check], Localdeduct1, ForeignDeduct1, LocaldeductAfter1, ForeignDeductAfter1, CoSharehold1, CoShareholdSurg1, EmpSharehold1, Check1, Localdeduct2, ForeignDeduct2, LocaldeductAfter2, ForeignDeductAfter2, CoSharehold2, CoShareholdSurg2, EmpSharehold2, Check2, LocaldeductF, ForeignDeductF, LocaldeductAfterF, ForeignDeductAfterF, CoShareholdF, CoShareholdSurgF, EmpShareholdF, CheckF, LocaldeductS, ForeignDeductS, LocaldeductAfterS, ForeignDeductAfterS, CoShareholdS, EmpShareholdS, CheckS, CoShareholdNet, EmpShareholdNet, CoShareholdSurgNet, CaseName, BillingNo, BillingNo1, PharmMemo, YearMT, HospitalLevel, FamilyBox, LocalDeduct3, ForignDeduct, HospitalDeduct, categorization, LastTableAuditDate, LastTableAuditBy, LastModifiedDate, LastModifiedBy, CreatedDate, CreatedBy, WinHostName, WinUserName, IsDeleated, DeletedBy FROM MtTickets WHERE (code = @code) AND (YearMT = @YearMT) AND (IsDeleated = 0) ORDER BY Id_3101 DESC" 
                
                
                
                
                
                
                
                
                
                UpdateCommand="UPDATE MtTickets SET TarnsDate = @TarnsDate, TreatDate = @TreatDate, Contractors = @Contractors, TreatType = @TreatType, TreatTypeId = @TreatTypeId, TreatKind = @TreatKind, relatives = @relatives, DokConfirm = @DokConfirm, DokConfirmDate = @DokConfirmDate, Contractors2 = @Contractors2, pharmConfirm = @pharmConfirm, pharmConfirmDate = @pharmConfirmDate, notes = @notes, code = @code, Localdeduct = @Localdeduct, ForeignDeduct = @ForeignDeduct, LocaldeductAfter = @LocaldeductAfter, ForeignDeductAfter = @ForeignDeductAfter, CoSharehold = @CoSharehold, CoShareholdSurg = @CoShareholdSurg, EmpSharehold = @EmpSharehold, [Check] = @Check , Localdeduct1 = @Localdeduct1, ForeignDeduct1 = @ForeignDeduct1, LocaldeductAfter1 = @LocaldeductAfter1, ForeignDeductAfter1 = @ForeignDeductAfter1, CoSharehold1 = @CoSharehold1, CoShareholdSurg1 = @CoShareholdSurg1, EmpSharehold1 = @EmpSharehold1, Check1 = @Check1, Localdeduct2 = @Localdeduct2, ForeignDeduct2 = @ForeignDeduct2, LocaldeductAfter2 = @LocaldeductAfter2, ForeignDeductAfter2 = @ForeignDeductAfter2, CoSharehold2 = @CoSharehold2, CoShareholdSurg2 = @CoShareholdSurg2, EmpSharehold2 = @EmpSharehold2, Check2 = @Check2, LocaldeductF = @LocaldeductF, ForeignDeductF = @ForeignDeductF, LocaldeductAfterF = @LocaldeductAfterF, ForeignDeductAfterF = @ForeignDeductAfterF, CoShareholdF = @CoShareholdF, CoShareholdSurgF = @CoShareholdSurgF, EmpShareholdF = @EmpShareholdF, CheckF = @CheckF, LocaldeductS = @LocaldeductS, ForeignDeductS = @ForeignDeductS, LocaldeductAfterS = @LocaldeductAfterS, ForeignDeductAfterS = @ForeignDeductAfterS, CoShareholdS = @CoShareholdS, EmpShareholdS = @EmpShareholdS, CheckS = @CheckS, CoShareholdNet = @CoShareholdNet, EmpShareholdNet = @EmpShareholdNet, CoShareholdSurgNet = @CoShareholdSurgNet, CaseName = @CaseName, BillingNo = @BillingNo, BillingNo1 = @BillingNo1, PharmMemo = @PharmMemo, YearMT = @YearMT, HospitalLevel = @HospitalLevel, FamilyBox = @FamilyBox, LocalDeduct3 = @LocalDeduct3, ForignDeduct = @ForignDeduct, HospitalDeduct = @HospitalDeduct, categorization = @categorization, LastModifiedDate =GetDate(), LastModifiedBy = @LastModifiedBy ,WinHostName = @WinHostName, WinUserName = @WinUserName WHERE (Id_3101 = @Id_3101)" 
                
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
                
                
                SelectCommand="SELECT Contractors, Kind FROM MtContractors WHERE (Kind &lt;&gt; N'صيدلية') and isactive=1   ORDER BY Contractors">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlContractorsPh" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                
                
                
                
                SelectCommand="SELECT Contractors, Kind FROM MtContractors WHERE (Kind IN (N'صيدلية')) and isactive=1   ORDER BY Contractors">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SdsCategorization" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [categorization] FROM [MtCategorization] ORDER BY [categorization]">
            </asp:SqlDataSource>         
            <br />
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
            <td style="width:20px;">&nbsp;</td>
                <td  style="width:80px;&gt;
                    سنة العلاج :
                &lt;/td&gt; &lt;td style="width:3000px;>
                    سنة العلاج :</td>
                <td style="background-color: style=#E6EEFC;"background-color:#E6EEFC;">
                         <asp:DropDownList ID="ddlYearMt" runat="server" AutoPostBack="True" 
                             DataSourceID="sdsYearMt" DataTextField="YearMt" DataValueField="YearMt" 
                             Height="30px" Width="383px">
                             <asp:ListItem Selected="True">2013</asp:ListItem>
                         </asp:DropDownList>
                </td>
                     <td class="style181">
                         &nbsp;</td>
                     <td colspan="2">
                      </td>
            </tr>
                 <tr>
                     <td style="width:20px;">
                         &nbsp;</td>
                     <td style="width:80px;&gt;
                    سنة العلاج :
                &lt;/td&gt; &lt;td style=" width:3000px;="">
                         &nbsp;</td>
                     <td style="&gt;background-color:style=#E6EEFC;
                " style179"="">
                         &nbsp;</td>
                     <td class="style181">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                </tr>
                 <tr>
            <td>&nbsp;</td>
                     <td class="style179">
                         رقم القيد :</td>
                     <td class="style180" style="background-color: style=#E6EEFC">

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
                             style="color: #FFFFFF; background-color: #000000" Width="100px">0</asp:TextBox></td>
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
                     <td class="style181">
                         <asp:HiddenField ID="HiddenField1" runat="server" />
                     </td>
            <td>
                <asp:HiddenField ID="hfCode" runat="server" />
                     </td>
            <td>
                <asp:HiddenField ID="hfTreatTypeId" runat="server" />
                     </td>
            </tr>
            </table>


               <table style="background-color:#E6EEFC;width:100%;">
               <tr>
               <td style="width:150px"></td>
                     <td class="style188"  > 
                     <div>
                     <table>
                     <tr>
                     <td>
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
                               ImageUrl="~/Images/MNGprint.png" ToolTip="طباعة الادارة العليا" Visible="False" 
                               Width="37px" />
                         </td>
                         <td>
                         
                               <asp:ImageButton ID="btnFrstTick" runat="server" ImageUrl="~/Images/frst.png" 
                                   Height="45px" Width="45px" ToolTip="اول جواب" Visible="False" />
                         </td>
                        <td>
                            <asp:ImageButton ID="btnPrev" runat="server" ImageUrl="~/Images/ltr.png" 
                                Height="45px" Width="45px" ToolTip="الجواب السابق" />
                         </td>
                         <td>
                             <asp:Label ID="lblNav" runat="server"></asp:Label>
                         </td>
                          <td>
                              <asp:TextBox ID="txtNav" runat="server"></asp:TextBox>
                         </td>
                           <td>
                               <asp:ImageButton ID="btnNxt" runat="server" ImageUrl="~/Images/rtl.png" 
                                   Height="45px" Width="45px" ToolTip="الجواب التالى" />
                         </td>
                             <td>
                               <asp:ImageButton ID="btnlstTick" runat="server" ImageUrl="~/Images/lst.png" 
                                   Height="45px" Width="45px" ToolTip="اخر جواب" Visible="False" />
                         </td>

                     </tr>
                     </table>                     
                     </div>
                     </td>
                                             <td style="width:150px"></td>
               </tr>
               </table>



               <table style="width:100%;">                  
                    <tr>
                        <td class="style9" dir="rtl">
                            &nbsp;</td>
                        <td class="style177">
                            &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" Visible="False">حقظ</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" 
                                AccessKey="ء" Visible="False">الغاء</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="btnExit" runat="server" Visible="False">اغلاق</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server">1</asp:TextBox>
                            &nbsp;<asp:Button ID="Button1" runat="server" Text="حفظ مجموعة" />
                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button2" runat="server" Text="الى 96000" BackColor="#CC0000" Font-Bold="True" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top">
                            <asp:Panel ID="Panel5" runat="server" Width="265px" BackColor="#F7F6F3">
                                <asp:FormView ID="fvHRData" runat="server" CaptionAlign="Right" CellPadding="4" 
                                    DataKeyNames="Code" DataSourceID="sdsHRData" 
                                    EmptyDataText=".                .                 ...  من   فضلك   ادخل   رقم  قيد مناسب     " 
                                    ForeColor="#333333" Height="63px" Width="260px">
                                    <EditItemTemplate>
                                        <asp:Panel ID="Panel19" runat="server">
                                            <table class="style14">
                                                <tr>
                                                    <td class="style49">
                                                        Code</td>
                                                    <td>
                                                        <asp:Label ID="CodeLabel4" runat="server" Text='<%# Eval("Code") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" colspan="2" style="text-align: center">
                                                        <b>
                                                        <asp:Image ID="Image2" runat="server" BorderColor="White" BorderStyle="Solid" 
                                                            BorderWidth="5px" Height="109px" 
                                                            ImageUrl='<%# "ShowImage.ashx?Code=" & eval("Code") %>' />
                                                        </b>
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
                                                        <asp:TextBox ID="كشف_ثانيTextBox0" runat="server" Text='<%# Bind("كشف_ثاني") %>' 
                                                            Width="180px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style49">
                                                        كشف بتروجاس</td>
                                                    <td>
                                                        <asp:TextBox ID="كشف_بتروجاسTextBox0" runat="server" 
                                                            Text='<%# Bind("كشف_بتروجاس") %>' Width="180px" />
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
                                                <tr>
                                                    <td class="style46">
                                                        <asp:LinkButton ID="UpdateCancelButton1" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="إلغاء" />
                                                    </td>
                                                    <td class="style51">
                                                        <asp:LinkButton ID="UpdateButton1" runat="server" CausesValidation="True" 
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
                                        <asp:LinkButton ID="InsertButton2" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton2" runat="server" 
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
                                                            ImageUrl='<%# "ShowImage.ashx?Code=" & eval("Code") %>' />

                                                            



                                                        </b>
                                                    </td>
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
                                                        أول تعيين<span class="style15">:</span></td>
                                                    <td align="right" class="style28" dir="rtl" rowspan="0" width="250">
                                                        <b>
                                                        <asp:Label ID="كشف_اولLabel0" runat="server" Font-Bold="True" 
                                                            Font-Italic="False" Text='<%# Bind("اول_تعيين", "{0:d}")%>' />
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

                                <asp:FormView ID="FormView1" runat="server" DataSourceID="sdsPregnancyFollow" 
                                    Width="265px">
                                    <EditItemTemplate>
                                        code:
                                        <asp:TextBox ID="codeTextBox2" runat="server" Text='<%# Bind("code") %>' />
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
                                        <asp:TextBox ID="codeTextBox3" runat="server" Text='<%# Bind("code") %>' />
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
                                <br />
                                <div class="style173">
                                    <br />
                                </div>
                            </asp:Panel>
                        </td>
                        <td dir="rtl" valign="top" class="style177">
                       
                            <asp:FormView ID="fvTickets" runat="server" DataKeyNames="Id_3101" 
                                DataSourceID="sdsTeckits" Width="645px">
                                <EditItemTemplate>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <br />&nbsp;<br />&nbsp;<br /><br />&nbsp;
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    &nbsp;&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                        Text="حفظ"   
                                        onclientclick="alert('تم الحفظ');" 
                                        CommandName="Insert" onclick="InsertButton_Click1" Visible="False"   />
                                    <asp:AnimationExtender ID="InsertButton_AnimationExtender" runat="server" 
                                        Enabled="True" TargetControlID="InsertButton">
                                    </asp:AnimationExtender>
                                    &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="الغاء" 
                                        onclick="InsertCancelButton_Click" Visible="False" 
                                       />
                                    &nbsp;<br /><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><!-- --><div id="dvPrint" dir="rtl">
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
                                                    <asp:TextBox ID="TarnsDateTextBoxIns" runat="server"  
                                                        onFocus="style.backgroundColor='yellow'; "  onblur="checkdate(this);style.backgroundColor = 'white';"

                                                        ForeColor="Black" Width="170px" onload="TarnsDateTextBoxIns_Load" ondatabinding="TarnsDateTextBoxIns_DataBinding" 
                                                      />
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
                                                    <asp:TextBox ID="YearMTTextBoxIns" runat="server" BackColor="#B6B6B6"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white';"

                                                        ForeColor="Black" ReadOnly="True" Text='<%# Bind("YearMT") %>' 
                                                        Width="170px" onload="YearMTTextBoxIns_Load" />
                                                </td>
                                                <td class="style49">
                                                    كود الموظف:</td>
                                                <td>
                                                    <asp:TextBox ID="codeTextBoxIns" runat="server" BackColor="#B6B6B6"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white';"

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
                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white';"
                                                        Width="400px"
                                                        AppendDataBoundItems="True" DataSourceID="sdsItemsAll" 
                                                        DataTextField="نوع المعاملة" DataValueField="id" Height="20px" 
                                                        SelectedValue='<%# Bind("TreatTypeId") %>'  
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
                                                    <asp:DropDownList ID="ddlTreatKindIns" runat="server"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white';"

                                                        AppendDataBoundItems="True" AutoPostBack="True" 
                                                        onselectedindexchanged="ddlTreatKindIns_SelectedIndexChanged" 
                                                        SelectedValue='<%# Bind("TreatKind") %>' Width="170px" 
                                                         >
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
                                                            <asp:DropDownList ID="ddlRelativesIns" runat="server"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white';"

                                                                AppendDataBoundItems="True" DataSourceID="sdsRelatives" 
                                                                DataTextField="CaseType" DataValueField="CaseType" Enabled="False" 
                                                                SelectedValue='<%# Bind("relatives") %>' Width="170px">
                                                                <%--<asp:ListItem>-</asp:ListItem>--%>
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
                                                        DataSourceID="SqlContractors" DataTextField="Contractors"  
                                                        onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white';"
                                                        DataValueField="Contractors" SelectedValue='<%# Bind("Contractors") %>' 
                                                        Width="170px" ondatabound="ddlContractorsIns_DataBound" 
                                                       >
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
                                                        onFocus="style.backgroundColor='yellow'; " 
                                                        onblur="style.backgroundColor='white';" DataSourceID="SqlContractorsPh" 
                                                        DataTextField="Contractors" DataValueField="Contractors" 
                                                        SelectedValue='<%# Bind("Contractors2") %>' Width="170px">
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
                                                    <asp:DropDownList ID="ddlHospitalIns" runat="server"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white';"

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
                                                    <asp:DropDownList ID="ddlCategorizationIns" runat="server"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white';"

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
                                                    <asp:TextBox ID="TextBoxNodeIns" runat="server" Height="52px" MaxLength="150"  onFocus="style.backgroundColor='yellow'; " onblur="style.backgroundColor='white';"

                                                        Text='<%# Bind("notes") %>' TextMode="MultiLine" Width="500px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    ملاحظات الصيدلية :</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="TextBoxPharmNodeIns" runat="server" Height="52px" 
                                                        MaxLength="150" onblur="style.backgroundColor='white';" 
                                                        onFocus="style.backgroundColor='yellow'; " Text='<%# Bind("notes") %>' 
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
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
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
                                                <td>
                                                    <asp:DropDownList ID="ddlTreatTypeIdRead" runat="server" 
                                                        AppendDataBoundItems="True" DataSourceID="sdsItemsAll" 
                                                        DataTextField="نوع المعاملة" DataValueField="id" Enabled="False" Height="20px" 
                                                        SelectedValue='<%# Bind("TreatTypeId") %>' Width="170px">
                                                        <asp:ListItem Value="186">كشف</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="style49">
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style49">
                                                    نوع العلاج:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlTreatKindread" runat="server" AppendDataBoundItems="True" 
                                                        AutoPostBack="True" onselectedindexchanged="ddlTreatKind_SelectedIndexChanged" 
                                                        SelectedValue='<%# Bind("TreatKind") %>' Width="170px" Enabled="False">
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
                                                    ملاحطات:</td>
                                                <td colspan="3">
                                                    <asp:Label ID="notesLabel" runat="server" Text='<%# Bind("notes") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <br />
                                    <asp:Panel ID="Panel13" runat="server" Width="640px">
                                    </asp:Panel>
                                    &nbsp;<br />
                                </ItemTemplate>
                                <PagerSettings Mode="NumericFirstLast" />
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
                                    <asp:ControlParameter ControlID="ddlYearMt" DefaultValue="0" Name="YearMT" 
                                        PropertyName="SelectedValue" Type="Int16" />
                                    <asp:ControlParameter ControlID="fvHRData" DefaultValue="0" Name="code" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sdsChildren" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                                SelectCommand="SELECT [CODE], [CHILD_NAME], [SEX], [D_BIRTH], [age] FROM [Children] WHERE ([CODE] = @Code)
order by age desc">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="fvHRData" Name="Code" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td class="style177">
                            &nbsp;</td>
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
                                            <asp:BoundField DataField="TreatDate" HeaderText="تاريخ العلاج" 
                                                SortExpression="TreatDate" DataFormatString="{0:yyyy/MM/dd}" />
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
                            <asp:Panel ID="Panel17" runat="server" BackColor="#B6AD92" Width="900px" 
                                DefaultButton="btnLoadItm">
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
                                            <asp:ListSearchExtender ID="ddlTreatTypeId0_ListSearchExtender" runat="server" 
                                                Enabled="True" PromptText="بحث" QueryPattern="Contains" 
                                                TargetControlID="ddlTreatTypeId0">
                                            </asp:ListSearchExtender>
                                            <asp:TextBox ID="txtItemsFilter" runat="server" Height="20px" Width="268px" 
                                                AutoPostBack="True">كشف</asp:TextBox>
                                            &nbsp;<asp:LinkButton ID="btnLoadItm" runat="server">.</asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style168">
                                            <asp:LinkButton ID="btnOk0" runat="server">رجوع</asp:LinkButton>
                                            .</td>
                                    </tr>
                                </table>
                                <asp:Panel ID="Panel18" runat="server" ScrollBars="Vertical" Width="900px" Height="400px">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                    
                                    
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
                                    </ContentTemplate>

                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="txtItemsFilter" EventName="TextChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="ddlTreatTypeId0" 
                                                EventName="SelectedIndexChanged" />
                                        </Triggers>

                                    </asp:UpdatePanel>
                                 
                                 
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
            <asp:SqlDataSource ID="sdsItems0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" SelectCommand="SELECT id, TreatType AS [نوع المعاملة], SpecialNeedLevel AS [المستوى الوظيفي], Rang AS المدى,
 Notes AS ملاحظات, SpecialNeed AS [بند خاص]
FROM MtItems
WHERE (((SpecialNeedVersion)='2008')) 
ORDER BY TreatType
"></asp:SqlDataSource>
            <br />
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="txtItemsFilter" EventName="TextChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <br />
    <br />
</asp:Content>

