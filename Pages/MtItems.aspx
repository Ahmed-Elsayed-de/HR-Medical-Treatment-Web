<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/MT.master" AutoEventWireup="false" CodeFile="MtItems.aspx.vb" Inherits="Pages_Contractors" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="WebUserSecurityManager.ascx" tagname="WebUserSecurityManager" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 33px;
        }
        .style15
        {
            width: 71px;
        }
        .style17
        {
            width: 132px;
            text-align: right;
        }
        .style18
        {
            width: 105px;
            text-align: left;
        }
        .style20
        {
            width: 71px;
            text-align: left;
            height: 7px;
        }
        .style22
        {
            width: 129px;
        }
        .style23
        {
            text-align: left;
            width: 128px;
        }
        .style24
        {
            width: 118px;
            text-align: left;
        }
        .style27
        {
            width: 1234px;
            text-align: left;
        }
        .style30
        {
            width: 505px;
            text-align: right;
        }
        .style31
        {
            width: 128px;
            height: 7px;
        }
        .style32
        {
            height: 7px;
        }
        .style33
        {
            height: 7px;
        }
        .style34
        {
            width: 105px;
            text-align: left;
            height: 7px;
        }
        .style35
        {
            height: 7px;
        }
        .style36
        {
            width: 43px;
            color: #000099;
            font-weight: bold;
        }
        .style38
        {
            text-align: right;
        }
        .style39
        {
            width: 505px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <uc1:WebUserSecurityManager ID="wuc1" runat="server" 
                ApplicationName="MedicalTreatment" ConnectionString="HRWEbDbConnectionString" 
                PermissionError="~/Pages/PermissionError.aspx" />
            <asp:SqlDataSource ID="sdsMtItems" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
            DeleteCommand="DELETE FROM [MtItems] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [MtItems] ([TreatType], [SpecialNeed], [EmpMax], [WifeMax], [SonMax], [SpecialNeedVersion], [Notes], [SpecialNeedLevel], [Rang], [GenTreatType], [LastTableAuditDate], [LastTableAuditBy], [LastModifiedDate], [LastModifiedBy], [CreatedDate], [CreatedBy]) VALUES (@TreatType, @SpecialNeed, @EmpMax, @WifeMax, @SonMax, @SpecialNeedVersion, @Notes, @SpecialNeedLevel, @Rang, @GenTreatType, @LastTableAuditDate, @LastTableAuditBy, @LastModifiedDate, @LastModifiedBy, @CreatedDate, @CreatedBy)" 
            SelectCommand="SELECT [id], [TreatType], [SpecialNeed], [EmpMax], [WifeMax], [SonMax], [SpecialNeedVersion], [Notes], [SpecialNeedLevel], [Rang], [GenTreatType], [LastTableAuditDate], [LastTableAuditBy], [LastModifiedDate], [LastModifiedBy], [CreatedDate], [CreatedBy] FROM [MtItems] WHERE ([SpecialNeedVersion] &gt; @SpecialNeedVersion) and IsDeleted=0 ORDER BY [TreatType]" 
            
    
                
                
                UpdateCommand="UPDATE [MtItems] SET [TreatType] = @TreatType, [SpecialNeed] = @SpecialNeed, [EmpMax] = @EmpMax, [WifeMax] = @WifeMax, [SonMax] = @SonMax, [SpecialNeedVersion] = @SpecialNeedVersion, [Notes] = @Notes, [SpecialNeedLevel] = @SpecialNeedLevel, [Rang] = @Rang, [GenTreatType] = @GenTreatType, [LastTableAuditDate] = @LastTableAuditDate, [LastTableAuditBy] = @LastTableAuditBy, [LastModifiedDate] = @LastModifiedDate, [LastModifiedBy] = @LastModifiedBy, [CreatedDate] = @CreatedDate, [CreatedBy] = @CreatedBy WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TreatType" Type="String" />
                    <asp:Parameter Name="SpecialNeed" Type="String" />
                    <asp:Parameter Name="EmpMax" Type="Single" />
                    <asp:Parameter Name="WifeMax" Type="Single" />
                    <asp:Parameter Name="SonMax" Type="Single" />
                    <asp:Parameter Name="SpecialNeedVersion" Type="String" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="SpecialNeedLevel" Type="String" />
                    <asp:Parameter Name="Rang" Type="String" />
                    <asp:Parameter Name="GenTreatType" Type="String" />
                    <asp:Parameter Name="LastTableAuditDate" Type="DateTime" />
                    <asp:Parameter Name="LastTableAuditBy" Type="String" />
                    <asp:Parameter Name="LastModifiedDate" Type="DateTime" />
                    <asp:Parameter Name="LastModifiedBy" Type="String" />
                    <asp:Parameter Name="CreatedDate" Type="DateTime" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="2007" Name="SpecialNeedVersion" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TreatType" Type="String" />
                    <asp:Parameter Name="SpecialNeed" Type="String" />
                    <asp:Parameter Name="EmpMax" Type="Single" />
                    <asp:Parameter Name="WifeMax" Type="Single" />
                    <asp:Parameter Name="SonMax" Type="Single" />
                    <asp:Parameter Name="SpecialNeedVersion" Type="String" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="SpecialNeedLevel" Type="String" />
                    <asp:Parameter Name="Rang" Type="String" />
                    <asp:Parameter Name="GenTreatType" Type="String" />
                    <asp:Parameter Name="LastTableAuditDate" Type="DateTime" />
                    <asp:Parameter Name="LastTableAuditBy" Type="String" />
                    <asp:Parameter Name="LastModifiedDate" Type="DateTime" />
                    <asp:Parameter Name="LastModifiedBy" Type="String" />
                    <asp:Parameter Name="CreatedDate" Type="DateTime" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsMtJobtype" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT [نوع_الوظيفة], [الرقم] FROM [MtJobType] ORDER BY [الرقم]">
            </asp:SqlDataSource>
            <asp:FormView ID="fvMtitems" runat="server" DataKeyNames="id" 
                DataSourceID="sdsMtItems0" Width="903px">
                <EditItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td class="style17">
                                id</td>
                            <td>
                                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td class="style36" colspan="4">
                                &nbsp;</td>
                            <td class="style38" colspan="2">
                                &nbsp;</td>
                            <td class="style13">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                نوع المعاملة الطبية :
                                <br />
                            </td>
                            <td colspan="8">
                                <asp:TextBox ID="TreatTypeTextBox" runat="server" 
                                    Text='<%# Bind("TreatType") %>' Width="200px" MaxLength="50" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style17">
                                بند خاص:
                            </td>
                            <td colspan="2">
                                <asp:DropDownList ID="ddlSpecialNeed" runat="server" Height="16px" 
                                    SelectedValue='<%# Bind("SpecialNeed") %>' style="font-weight: 700" 
                                    Width="192px">
                                    <asp:ListItem>لا</asp:ListItem>
                                    <asp:ListItem>نعم</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td colspan="2" style="text-align: left">
                                االمستوى الوظيفى:</td>
                            <td colspan="2">
                                <asp:DropDownList ID="ddlSpecialNeedLevel" runat="server" 
                                    DataSourceID="sdsMtJobtype" DataTextField="نوع_الوظيفة" 
                                    DataValueField="نوع_الوظيفة" Height="16px" 
                                    SelectedValue='<%# Bind("SpecialNeedLevel") %>' style="font-weight: 700" 
                                    Width="192px">
                                    <asp:ListItem Selected="True">بدون</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td colspan="2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                حصة العامل:</td>
                            <td colspan="3">
                                <asp:TextBox ID="EmpMaxTextBox" runat="server" Text='<%# Bind("EmpMax") %>' 
                                    MaxLength="6" />
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToValidate="EmpMaxTextBox" ErrorMessage="ادخل رقم مناسب !" 
                                    ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </td>
                            <td colspan="2" style="text-align: left">
                                حصة الزوجة:</td>
                            <td class="style38">
                                <asp:TextBox ID="WifeMaxTextBox" runat="server" Text='<%# Bind("WifeMax") %>' 
                                    MaxLength="6" />
                                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                    ControlToValidate="WifeMaxTextBox" ErrorMessage="ادخل رقم مناسب !" 
                                    ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </td>
                            <td class="style38">
                                &nbsp;</td>
                            <td class="style13">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                المدى:</td>
                            <td>
                                <asp:TextBox ID="RangTextBox" runat="server" Text='<%# Bind("Rang") %>' 
                                    MaxLength="50" />
                            </td>
                            <td class="style36" colspan="4">
                                &nbsp;</td>
                            <td class="style38" colspan="2">
                                &nbsp;</td>
                            <td class="style13">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style17">
                                ملاحظات</td>
                            <td colspan="8">
                                <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' 
                                    Width="500px" MaxLength="200" />
                            </td>
                        </tr>
                    </table>
&nbsp;<br />&nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        Text="تحديث" onclick="UpdateButton_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="إلغاء" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table style="width:99%;">
                        <tr>
                            <td class="style27">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td class="style30" colspan="6">
                                &nbsp;</td>
                            <td class="style30">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style27">
                                نوع المعاملة الطبية:
                                <br />
                            </td>
                            <td colspan="7">
                                <asp:TextBox ID="TreatTypeTextBox" runat="server" 
                                    Text='<%# Bind("TreatType") %>' MaxLength="50" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style27">
                                بند خاص:
                            </td>
                            <td colspan="7">
                                <asp:DropDownList ID="ddlSpecialNeed" runat="server" Height="16px" 
                                    SelectedValue='<%# Bind("SpecialNeed") %>' style="font-weight: 700" 
                                    Width="192px">
                                    <asp:ListItem>لا</asp:ListItem>
                                    <asp:ListItem>نعم</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style27">
                                حصة العامل :</td>
                            <td>
                                <asp:TextBox ID="EmpMaxTextBox" runat="server" Text='<%# Bind("EmpMax") %>' 
                                    MaxLength="4" />
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToValidate="EmpMaxTextBox" ErrorMessage="ادخل رقم مناسب !" 
                                    ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </td>
                            <td class="style24">
                                حصة االزوجة :</td>
                            <td colspan="2" style="text-align: right">
                                <asp:TextBox ID="WifeMaxTextBox" runat="server" Text='<%# Bind("WifeMax") %>' 
                                    MaxLength="4" />
                                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                    ControlToValidate="WifeMaxTextBox" ErrorMessage="ادخل رقم مناسب !" 
                                    ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            </td>
                            <td colspan="2" style="text-align: left">
                                &nbsp;</td>
                            <td style="text-align: left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style27">
                                المستوى الوظيفى:</td>
                            <td>
                                <asp:DropDownList ID="ddlSpecialNeedLevel" runat="server" 
                                    DataSourceID="sdsMtJobtype" DataTextField="نوع_الوظيفة" 
                                    DataValueField="نوع_الوظيفة" Height="16px" 
                                    SelectedValue='<%# Bind("SpecialNeedLevel") %>' style="font-weight: 700" 
                                    Width="200px">
                                    <asp:ListItem Selected="True">بدون</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style39">
                                المدى:</td>
                            <td class="style30">
                                <asp:TextBox ID="RangTextBox" runat="server" Text='<%# Bind("Rang") %>' 
                                    MaxLength="50" />
                            </td>
                            <td class="style30" colspan="2">
                                &nbsp;</td>
                            <td class="style30" colspan="2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style27">
                                ملاحظات</td>
                            <td colspan="7">
                                <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' 
                                    Width="700px" MaxLength="200" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    &nbsp;
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        Text="حفظ" onclick="InsertButton_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="إلغاء" />
                    &nbsp;&nbsp;
                </InsertItemTemplate>
                <ItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td class="style23">
                                id</td>
                            <td class="style17">
                                <asp:Label ID="idLabel" runat="server" CssClass="style36" 
                                    Text='<%# Eval("id") %>' />
                            </td>
                            <td class="style15" colspan="2">
                                &nbsp;</td>
                            <td class="style22">
                                &nbsp;</td>
                            <td class="style18" colspan="2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style23">
                                نوع المعاملة الطبية:
                            </td>
                            <td colspan="7">
                                <asp:Label ID="TreatTypeLabel" runat="server" CssClass="style36" 
                                    Text='<%# Bind("TreatType") %>' Width="700px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style23">
                                عنوان الجهة الطبية:
                            </td>
                            <td colspan="7">
                                <asp:Label ID="SpecialNeedLabel" runat="server" CssClass="style36" 
                                    Text='<%# Bind("SpecialNeed") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style24" style="text-align: left">
                                المستوى الوظيفى:</td>
                            <td colspan="3">
                                <asp:Label ID="SpecialNeedLevelLabel" runat="server" CssClass="style36" 
                                    Text='<%# Bind("SpecialNeedLevel") %>' />
                            </td>
                            <td class="style33" colspan="3">
                            بنود خاصة : 
                                <asp:Label ID="Label1" runat="server" CssClass="style36"  Text='<%# Eval("SpecialNeed") %>'></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style31" style="text-align: left">
                                حصة العامل:</td>
                            <td class="style32" colspan="3">
                                <asp:Label ID="EmpMaxLabel" runat="server" CssClass="style36" 
                                    Text='<%# Bind("EmpMax") %>' />
                            </td>
                            <td class="style33" colspan="3">
                            حصة الزوجة:
                                <asp:Label ID="WifeMaxLabel" runat="server" CssClass="style36" 
                                    Text='<%# Bind("WifeMax") %>' />
                            </td>
                            <td class="style35">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style31" style="text-align: left">
                                المدى:</td>
                            <td class="style32">
                                <asp:Label ID="RangLabel" runat="server" CssClass="style36" 
                                    Text='<%# Bind("Rang") %>' />
                            </td>
                            <td align="right" class="style20" colspan="2" dir="rtl">
                                &nbsp;</td>
                            <td class="style33">
                                &nbsp;</td>
                            <td class="style34" colspan="2">
                                &nbsp;</td>
                            <td class="style35">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style24" style="text-align: left">
                                ملاحظات</td>
                            <td colspan="7" style="margin-right: 80px">
                                <asp:Label ID="NotesLabel" runat="server" CssClass="style36" 
                                    Text='<%# Bind("Notes") %>' Width="700px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style24">
                                &nbsp;</td>
                            <td colspan="2" style="margin-right: 80px">
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                    CommandName="New" Text="جديد" Visible="False" />
                            </td>
                            <td colspan="3" style="margin-right: 80px">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="تعديل" Visible="False" />
                            </td>
                            <td colspan="2" style="margin-right: 80px">
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="حذف" Visible="False" />
                                <asp:ConfirmButtonExtender ID="DeleteButton_ConfirmButtonExtender" 
                                    runat="server" ConfirmText="هل أنت متأكد من حذف البند الحالى" 
                                    Enabled="True" TargetControlID="DeleteButton">
                                </asp:ConfirmButtonExtender>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:SqlDataSource ID="sdsMtItems0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                DeleteCommand="update [MtItems] set IsDeleted=1  ,DeletedBy = @DeletedBy ,WinUser =@WinUser ,WinHost =@WinHost WHERE [id] = @id" 
                InsertCommand="INSERT INTO [MtItems] ([TreatType], [SpecialNeed], [EmpMax], [WifeMax], [SonMax], 
[SpecialNeedVersion], [Notes], [SpecialNeedLevel], [Rang], [GenTreatType], 
[LastModifiedDate], [LastModifiedBy], [CreatedDate], [CreatedBy] , WinUser,WinHost) VALUES 
(@TreatType, @SpecialNeed, @EmpMax, @WifeMax, @SonMax, @SpecialNeedVersion, @Notes, @SpecialNeedLevel, @Rang,
 @GenTreatType, GETDATE(), @LastModifiedBy, GETDATE(), @CreatedBy ,@WinUser,@WinHost)" 
                SelectCommand="SELECT id, TreatType, SpecialNeed, EmpMax, WifeMax, SonMax, SpecialNeedVersion, Notes, SpecialNeedLevel, Rang, GenTreatType, LastTableAuditDate, LastTableAuditBy, LastModifiedDate, LastModifiedBy, CreatedDate, CreatedBy, IsDeleted, DeletedBy, WinUser, WinHost FROM MtItems WHERE (id = @id) AND (IsDeleted = 0)" 
                
                
                UpdateCommand="UPDATE MtItems SET TreatType = @TreatType, SpecialNeed = @SpecialNeed, EmpMax = @EmpMax, 
WifeMax = @WifeMax, SonMax = @SonMax,  Notes = @Notes, 
SpecialNeedLevel = @SpecialNeedLevel, Rang = @Rang, GenTreatType = @GenTreatType, 
 LastModifiedDate = GETDATE(), LastModifiedBy = @LastModifiedBy, WinUser =@WinUser , WinHost = @WinHost
 WHERE (id = @id)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="hfUserName" Name="DeletedBy" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinUser" Name="WinUser" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinHost" Name="WinHost" 
                        PropertyName="Value" />
                    <asp:Parameter Name="id" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TreatType" DefaultValue="" />
                    <asp:Parameter Name="SpecialNeed" />
                    <asp:Parameter Name="EmpMax" />
                    <asp:Parameter Name="WifeMax" />
                    <asp:Parameter Name="SonMax" />
                    <asp:Parameter Name="SpecialNeedVersion" DefaultValue="2008" />
                    <asp:Parameter Name="Notes" DefaultValue="" />
                    <asp:Parameter Name="SpecialNeedLevel" />
                    <asp:Parameter Name="Rang" DefaultValue="" />
                    <asp:Parameter Name="GenTreatType" DefaultValue="" />
                    <asp:ControlParameter ControlID="hfUserName" Name="LastModifiedBy" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfUserName" Name="CreatedBy" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinUser" Name="WinUser" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinHost" Name="WinHost" 
                        PropertyName="Value" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="id" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TreatType" />
                    <asp:Parameter Name="SpecialNeed" />
                    <asp:Parameter Name="EmpMax" />
                    <asp:Parameter Name="WifeMax" />
                    <asp:Parameter Name="SonMax" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="SpecialNeedLevel" />
                    <asp:Parameter Name="Rang" />
                    <asp:Parameter Name="GenTreatType" />
                    <asp:ControlParameter ControlID="hfUserName" Name="LastModifiedBy" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinUser" Name="WinUser" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinHost" Name="WinHost" 
                        PropertyName="Value" />
                    <asp:Parameter Name="id" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Panel ID="Panel2" runat="server" ScrollBars="Horizontal">
                <asp:GridView ID="gvMtItems" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="id" DataSourceID="sdsMtItems" ForeColor="#333333" 
                    GridLines="None" Height="211px" PageSize="20" style="text-align: right" 
                    Width="907px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="TreatType" HeaderText="نوع المعاملة الطبية" 
                            SortExpression="TreatType">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="بند خاص" SortExpression="SpecialNeed">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SpecialNeed") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSpetialNeed" runat="server" Text='<%# Bind("SpecialNeed") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="EmpMax" HeaderText="ح ص العامل" 
                            SortExpression="EmpMax">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="WifeMax" HeaderText="ح ص الزوجة" 
                            SortExpression="WifeMax">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SpecialNeedLevel" HeaderText="المستوى الوظيفى" 
                            SortExpression="SpecialNeedLevel">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rang" HeaderText="المدى" SortExpression="Rang">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Notes" HeaderText="ملاحظات" SortExpression="Notes">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                            SortExpression="id" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" Font-Bold="True" Font-Italic="False" 
                        ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <asp:HiddenField ID="hfWinUser" runat="server" />
        <asp:HiddenField ID="hfWinHost" runat="server" />
        <asp:HiddenField ID="hfUserName" runat="server" />
        <br />
    </p>
    </asp:Content>

