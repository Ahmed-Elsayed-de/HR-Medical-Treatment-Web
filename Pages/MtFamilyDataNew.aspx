<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/MT.master" AutoEventWireup="false" CodeFile="MtFamilyDataNew.aspx.vb" Inherits="Pages_MtEmployeeData" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register src="WebUserSecurityManager.ascx" tagname="WebUserSecurityManager" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style14
        {
            width: 100%;
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
        .style174
        {
            width: 95px;
        }
        .style179
        {
            width: 26px;
        }
        .style180
        {
            width: 267px;
        }
        .style182
        {
            height: 458px;
        }
        .style184
        {
            height: 126px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="sds" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:SqlDataSource ID="sdsYearMt" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT YearMt FROM MtRules ORDER BY YearMt DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SDSChildren" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [CODE], [CHILD_NAME], [SEX], [D_BIRTH], [age] FROM [Children] WHERE ([CODE] = @CODE)">
                <SelectParameters>
                    <asp:Parameter Name="CODE" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsHRData" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT Code, E_Name, PetroGasNotes, كشف_ثاني, كشف_اول, Notes, BoardMember, Endemic, sl, نوع_الوظيفة, نوع_التعاقد, الموقف_الحالي, إستلام_دفتر, كشف_بتروجاس, Regist_No1, Sex_A, Marital_Status_A, Regist_No, D_Birth, Picture, JOB_NAME, YearsOld FROM HRdata WHERE (Regist_No1 = @reg)" 
                
                
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
            <asp:SqlDataSource ID="SDSWives" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                
                SelectCommand="SELECT [CODE], [WIFE_NAME]  , [D_BIRTH], [RELIGION], [NATIONALITY], [WORK_PLACE], [P_BIRTH], [DISTRICT_A], [MARRIAGE_DATE], [ID_NO], [STATION] FROM [Wives] WHERE ([CODE] = @CODE)">
                <SelectParameters>
                    <asp:Parameter Name="CODE" Type="Int32" />
                </SelectParameters>
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
FROM MtItems INNER JOIN MtTickets ON MtItems.id = MtTickets.TreatTypeId
WHERE MtItems.SpecialNeed='نعم' and  (code = @Code)
ORDER BY MtTickets.code, MtTickets.TreatType, MtTickets.TarnsDate, MtTickets.TreatDate">
                <SelectParameters>
                    <asp:ControlParameter ControlID="fvHRData" DefaultValue="0" Name="Code" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlContractorsPh" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                
                SelectCommand="SELECT Contractors, Kind FROM MtContractors WHERE (Kind IN (N'صيدلية', '-')) ORDER BY Contractors">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SdsCategorization" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [categorization] FROM [MtCategorization] ORDER BY [categorization]">
            </asp:SqlDataSource>       
            <asp:HiddenField ID="hfTreatTypeId" runat="server" />
                <center>
      <table>
            <tr>
                <td>
                
                  
                </td>
            </tr>
        </table>   </center>
        <center>
        
      
            <asp:Panel ID="PanelSearch" runat="server" Direction="RightToLeft" 
                DefaultButton="btnS">
               <table style="width:100%;">
                    <table class="style14">
                        <tr>
                            <td class="style174">
                                سنة العلاج :</td>
                            <td class="style180">
                                <asp:DropDownList ID="ddlYearMt" runat="server" AutoPostBack="True" 
                                    DataSourceID="sdsYearMt" DataTextField="YearMt" DataValueField="YearMt" 
                                    Width="260px">
                                    <asp:ListItem Selected="True">2013</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style179">
                                &nbsp;</td>
                            <td rowspan="2">
                                <uc1:WebUserSecurityManager ID="wuc1" runat="server" 
                                    ApplicationName="MedicalTreatment" ConnectionString="HRWEbDbConnectionString" 
                                    PermissionError="~/Pages/PermissionError.aspx" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style174">
                                رقم القيد :</td>
                            <td class="style180">
                             
                                    <asp:TextBox ID="txtRegFilter" runat="server" AutoPostBack="True" 
                                        CssClass="style154" style="color: #FFFFFF; background-color: #000000" 
                                        Width="260px"></asp:TextBox>
                                             
                            
                            </td>
                            <td class="style179"> 
                            <asp:LinkButton ID="btnS" runat="server">.</asp:LinkButton>
                                <asp:CompareValidator ID="CompareValidator19" runat="server" 
                                    ControlToValidate="txtRegFilter" Display="Dynamic" 
                                    ErrorMessage=" من فضلك ادخل رقم مناسب" ForeColor="Red" Operator="DataTypeCheck" 
                                    Type="Integer">*</asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                    </td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <table class="style14">
                                <tr>
                                    <td class="style182" valign="top">
                                        <asp:Panel ID="Panel11" runat="server" Height="666px">
                                            <asp:FormView ID="fvHRData" runat="server" CaptionAlign="Right" CellPadding="4" 
                                                DataKeyNames="Code" DataSourceID="sdsHRData" 
                                                EmptyDataText=".                .                 ...  من   فضلك   ادخل   رقم   القيد    " 
                                                ForeColor="#333333" Height="16px" Width="502px">
                                                <EditItemTemplate>
                                                    <asp:Panel ID="Panel3" runat="server">
                                                        <table class="style14">
                                                            <tr>
                                                                <td align="right" colspan="2" style="text-align: center">
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                                                        CommandName="Cancel" onclick="UpdateCancelButton_Click" Text="إلغاء" />
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                                        CommandName="Update" onclick="UpdateButton_Click" Text="حفظ" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" colspan="2" style="text-align: center">
                                                                    <b>
                                                                    <asp:Image ID="Image1" runat="server" BorderColor="White" BorderStyle="Solid" 
                                                                        BorderWidth="5px" Height="109px" 
                                                                        ImageUrl='<%# "ShowImage.ashx?Code=" & eval("Code") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style49">
                                                                    كود الموظف :
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="CodeLabel1" runat="server" Text='<%# Eval("Code") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style49">
                                                                    الاسم</td>
                                                                <td>
                                                                    <asp:TextBox ID="E_NameTextBox" runat="server" Enabled="False" 
                                                                        Text='<%# Bind("E_Name") %>' Width="180px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style49">
                                                                    أمراض مزمنة</td>
                                                                <td>
                                                                    <asp:TextBox ID="EndemicTextBox" runat="server" Text='<%# Bind("Endemic") %>' 
                                                                        Width="180px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style49">
                                                                    كشف بتروجاس</td>
                                                                <td>
                                                                    <asp:TextBox ID="كشف_بتروجاسTextBox" runat="server" 
                                                                        Text='<%# Bind("كشف_بتروجاس") %>' Width="180px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style49" colspan="2">
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style49">
                                                                    كشف اول</td>
                                                                <td>
                                                                    <asp:TextBox ID="كشف_اولTextBox" runat="server" 
                                                                        Text='<%# Bind("كشف_اول", "{0:d}") %>' Width="180px" />
                                                                    <asp:CalendarExtender ID="كشف_اولTextBox_CalendarExtender" runat="server" 
                                                                        Enabled="True" Format="dd/MM/yyyy" TargetControlID="كشف_اولTextBox">
                                                                    </asp:CalendarExtender>
                                                                    <asp:CompareValidator ID="CompareValidator21" runat="server" 
                                                                        ControlToValidate="كشف_اولTextBox" ErrorMessage="ادخل تاريخ مناسب" 
                                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style49">
                                                                    كشف ثاني</td>
                                                                <td>
                                                                    <asp:TextBox ID="كشف_ثانيTextBox" runat="server" Text='<%# Bind("كشف_ثاني") %>' 
                                                                        Width="180px" />
                                                                    <asp:CalendarExtender ID="كشف_ثانيTextBox_CalendarExtender" runat="server" 
                                                                        Enabled="True" Format="dd/MM/yyyy" TargetControlID="كشف_ثانيTextBox">
                                                                    </asp:CalendarExtender>
                                                                    <asp:CompareValidator ID="CompareValidator20" runat="server" 
                                                                        ControlToValidate="كشف_ثانيTextBox" ErrorMessage="ادخل تاريخ مناسب" 
                                                                        ForeColor="Red" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style15">
                                                                    إستلام دفتر</td>
                                                                <td>
                                                                    <asp:TextBox ID="إستلام_دفترTextBox" runat="server" 
                                                                        Text='<%# Bind("إستلام_دفتر") %>' Width="180px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style15">
                                                                    ملاحظات بتروجاس</td>
                                                                <td>
                                                                    <asp:TextBox ID="PetroGasNotesTextBox" runat="server" Height="100px" 
                                                                        Text='<%# Bind("PetroGasNotes") %>' TextMode="MultiLine" Width="180px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style50">
                                                                    ملاحظات على العامل</td>
                                                                <td>
                                                                    <asp:TextBox ID="NotesTextBox" runat="server" Height="175px" 
                                                                        Text='<%# Bind("Notes") %>' TextMode="MultiLine" Width="180px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style46">
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
                                                    <br />
                                                    <asp:Panel ID="Panel2" runat="server">
                                                        <table dir="rtl" width="500">
                                                            <tr>
                                                                <td align="center" dir="rtl" rowspan="0">
                                                                     <asp:Image ID="Image2" runat="server" BorderColor="White" BorderStyle="Solid" 
                                                                        BorderWidth="5px" Height="109px" 
                                                                        ImageUrl='<%# "ShowImage.ashx?Code=" & eval("Code") %>' />                                                                  
                                                                </td>
                                                                <td align="center" dir="rtl" rowspan="0"  >    
                                                                             <asp:Label ID="E_NameLabel2" runat="server"  
                                                                        Font-Italic="False" Text='<%# Bind("E_Name") %>'  />                                            
                                                                   </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style28" dir="rtl" rowspan="0"  >
                                                                    رقم التسجيل :</td>
                                                                  <td class="style28" dir="rtl" rowspan="0" >
                                                                    <span class="style15">
                                                                    <asp:Label ID="Regist_No1Label2" runat="server" CssClass="style18" 
                                                                        ForeColor="Red" Text='<%# Bind("Regist_No1") %>' />
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                    كود الموظف :</td>
                                                                </span>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                    <b>
                                                                    <asp:Label ID="CodeLabel3" runat="server" CssClass="style18" Font-Bold="True" 
                                                                        Font-Italic="False" ForeColor="Black" Text='<%# Eval("Code") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style28" dir="rtl" rowspan="0" 
                                                                    style="direction: rtl; text-align: right;" >
                                                                    الوظيفة :</td>
                                                                <td class="style28" dir="rtl" rowspan="0" 
                                                                    style="direction: rtl; text-align: right;" >
                                                                    <asp:Label ID="JOB_NAMELabel" runat="server" CssClass="style53" 
                                                                        Font-Italic="False" Text='<%# Bind("JOB_NAME") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                    الحالة الاجتماعية :</td>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                    <span class="style15">
                                                                    <asp:Label ID="Marital_Status_ALabel0" runat="server" 
                                                                        Text='<%# Bind("Marital_Status_A") %>' />
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style28" dir="rtl" >
                                                                    الموقف الحالى :</td>
                                                                <td class="style28" dir="rtl" >
                                                                    <span class="style16">
                                                                    <asp:Label ID="الموقف_الحاليLabel0" runat="server" 
                                                                        Text='<%# Bind("الموقف_الحالي") %>' />
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                    نوع التعاقد :</td>
                                                            <td class="style28" dir="rtl" rowspan="0" >
                                                                    <span class="style18"><span class="style16">
                                                                    <asp:Label ID="نوع_التعاقدLabel0" runat="server" 
                                                                        Text='<%# Bind("نوع_التعاقد") %>' />
                                                                    </span></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                    نوع الوظيفة :</td>
                                                               <td class="style28" dir="rtl" rowspan="0" >
                                                                    <span class="style18"><b>
                                                                    <asp:Label ID="نوع_الوظيفةLabel0" runat="server" Font-Bold="True" 
                                                                        Font-Italic="False" Text='<%# Bind("نوع_الوظيفة") %>' />
                                                                    </b></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                    تاريخ الميلاد :</td>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                    <b>
                                                                    <asp:Label ID="D_BirthLabel0" runat="server" Font-Bold="True" 
                                                                        Font-Italic="False" Text='<%# Bind("D_Birth", "{0:d}") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                    العمر :</td>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                    <b>
                                                                    <asp:Label ID="YearsOldLabel" runat="server" Font-Bold="True" 
                                                                        Font-Italic="False" ForeColor="Blue" Text='<%# Eval("YearsOld") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" 
                                                                    style="direction: rtl; " >
                                                                    عضو مجلس إدارة:</td>
                                                                <td align="right" class="style28" dir="rtl" rowspan="0" 
                                                                    style="direction: rtl; " >
                                                                    <b>
                                                                    <asp:Label ID="BoardMemberLabel0" runat="server" Font-Bold="True" 
                                                                        Font-Italic="False" Text='<%# Bind("BoardMember") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" >
                                                                    أمراض مزمنة:&nbsp;</td>
                                                                <td align="right" class="style28" dir="rtl" rowspan="0" >
                                                                    <b>
                                                                    <asp:Label ID="EndemicLabel0" runat="server" Font-Bold="True" 
                                                                        Font-Italic="False" Text='<%# Bind("Endemic") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" >
                                                                    كشف بتروجاز:</td>
                                                                <td align="right" class="style28" dir="rtl" rowspan="0" >
                                                                    <b>
                                                                    <asp:Label ID="كشف_بتروجاسLabel0" runat="server" Font-Bold="True" 
                                                                        Font-Italic="False" style="direction: ltr" Text='<%# Bind("كشف_بتروجاس") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" >
                                                                    <span class="style15">تاريخ الكشف:</span></td>
                                                                <td align="right" class="style28" dir="rtl" rowspan="0" >
                                                                    <b>
                                                                    <asp:Label ID="كشف_اولLabel0" runat="server" Font-Bold="True" 
                                                                        Font-Italic="False" Text='<%# Bind("كشف_اول", "{0:d}") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" >
                                                                    <span class="style15">إستلام دفتر:</span></td>
                                                                <td align="right" class="style28" dir="rtl" rowspan="0" >
                                                                    <b>
                                                                    <asp:Label ID="إستلام_دفترLabel0" runat="server" Font-Bold="True" 
                                                                        Font-Italic="False" Text='<%# Bind("إستلام_دفتر") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" >
                                                                    <span class="style15">ملاحظات بتروجاس:</span></td>
                                                                <td align="right" class="style28" dir="rtl" rowspan="0" >
                                                                    <b>
                                                                    <asp:Label ID="PetroGasNotesLabel0" runat="server" Font-Bold="True" 
                                                                        Font-Italic="False" Text='<%# Bind("PetroGasNotes") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style28" colspan="1" dir="rtl" rowspan="0" >
                                                                    ملاحظات:</td>
                                                                <td align="right" class="style28" dir="rtl" rowspan="0" >
                                                                    &nbsp;<b><asp:Label ID="NotesLabel0" runat="server" Font-Bold="True" 
                                                                        Font-Italic="False" Text='<%# Bind("Notes") %>' />
                                                                    </b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style28" colspan="1" dir="rtl" style="style28" >
                                                                   المستوى الهيكلى :</td>
                                                                <td class="style28" dir="rtl" style="style28" >
                                                                        <asp:Label ID="slLabel0" runat="server" CssClass="style159" Font-Bold="True" 
                                                                        Font-Italic="False" ForeColor="Black" Text='<%# Bind("sl") %>' />
                                                                </td>
                                                            </tr>                                                       
                                                            <tr>
                                                                <td class="style28" colspan="1" dir="rtl" rowspan="0" >
                                                                    <asp:LinkButton ID="EditButton0" runat="server" CausesValidation="False" 
                                                                        CommandName="Edit" Text="تعديل" Visible="False" />
                                                                </td>
                                                                <td class="style28" dir="rtl" rowspan="0" >
                                                                 </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                    <br />
                                                </ItemTemplate>
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            </asp:FormView>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                </table>
                                <table>
                                <tr>
                                    <td class="style184" valign="top"> 
                                       <asp:GridView ID="GVWives" runat="server" AutoGenerateColumns="False" 
                                                CellPadding="4" DataSourceID="SDSWives" ForeColor="#333333" 
                                                GridLines="None" Width="860px">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="CODE" HeaderText="CODE" SortExpression="CODE" 
                                                        Visible="False" />
                                                    <asp:TemplateField HeaderText=" &nbsp; أسم الزوجة  &nbsp; " SortExpression="WIFE_NAME">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WIFE_NAME") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                        &nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("WIFE_NAME") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="D_BIRTH" HeaderText="تاريخ الميلاد" 
                                                        SortExpression="D_BIRTH" DataFormatString="{0:MM/dd/yyyy}" />
                                                    <asp:BoundField DataField="P_BIRTH" HeaderText="محل الميلاد" 
                                                        SortExpression="P_BIRTH" />
                                                    <asp:BoundField DataField="RELIGION" HeaderText="الديانة" 
                                                        SortExpression="RELIGION" />
                                                    <asp:BoundField DataField="NATIONALITY" HeaderText="الجنسية" 
                                                        SortExpression="NATIONALITY" />
                                                    <asp:BoundField DataField="WORK_PLACE" HeaderText="مكان العمل" 
                                                        SortExpression="WORK_PLACE" />
                                                    <asp:BoundField DataField="DISTRICT_A" HeaderText="المحافظة" 
                                                        SortExpression="DISTRICT_A" />
                                                    <asp:BoundField DataField="ID_NO" HeaderText="رقم البطاقة" 
                                                        SortExpression="ID_NO" />
                                                    <asp:BoundField DataField="STATION" HeaderText="السجل المدني" 
                                                        SortExpression="STATION" />
                                                    <asp:BoundField DataField="MARRIAGE_DATE" HeaderText="تاريخ الزواج" 
                                                        SortExpression="MARRIAGE_DATE" DataFormatString="{0:MM/dd/yyyy}" />
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style184" valign="top">
                                        <asp:GridView ID="GVChildren" runat="server" AutoGenerateColumns="False" 
                                            CellPadding="4" DataSourceID="SDSChildren" ForeColor="#333333" GridLines="None" 
                                            Width="466px">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="CODE" HeaderText="CODE" SortExpression="CODE" 
                                                    Visible="False" />
                                                <asp:TemplateField HeaderText="أسم الأبن" SortExpression="CHILD_NAME">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CHILD_NAME") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp;
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CHILD_NAME") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="SEX" HeaderText="النوع" SortExpression="SEX" />
                                                <asp:BoundField DataField="age" HeaderText="السن " ReadOnly="True" 
                                                    SortExpression="age" />
                                                <asp:BoundField DataField="D_BIRTH" DataFormatString="{0:MM/dd/yyyy}" 
                                                    HeaderText="تاريخ الميلاد" SortExpression="D_BIRTH" />
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="Panel8" runat="server" BackColor="#B6AD92" 
                                Width="900px" Visible="False">
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
                                            <asp:BoundField DataField="SpecialNeedLevel" HeaderText="المستوى الوظيفي" 
                                                SortExpression="SpecialNeedLevel" />
                                            <asp:BoundField DataField="Rang" HeaderText="المدى" SortExpression="Rang" />
                                            <asp:BoundField DataField="notes1" HeaderText="ملاحظات2" 
                                                SortExpression="notes1" />
                                            <asp:BoundField DataField="SpecialNeedVersion" HeaderText="الإصدار" 
                                                SortExpression="SpecialNeedVersion" />
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" Font-Italic="False" ForeColor="#333333" 
                                            Wrap="False" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                </asp:Panel>
                            </asp:Panel>
          
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                              

                            <asp:ModalPopupExtender ID="Panel17_ModalPopupExtender" runat="server" 
                                DynamicServicePath="" Enabled="True" PopupControlID="Panel17"    
                                PopupDragHandleControlID="Panel17" TargetControlID="hfTreatTypeId"  
                                RepositionMode="None" BehaviorID="Panel17" CancelControlID="btnOk0">
                            </asp:ModalPopupExtender>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
               
        </center>
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />
</asp:Content>

