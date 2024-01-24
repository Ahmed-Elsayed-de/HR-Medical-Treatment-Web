<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/MT.master" AutoEventWireup="false" CodeFile="MtContractors.aspx.vb" Inherits="Pages_MtContractors" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="WebUserSecurityManager.ascx" tagname="WebUserSecurityManager" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 33px;
        }
        .style14
        {
            width: 6px;
        }
        .style27
        {
            width: 1234px;
        }
        .style30
        {
            width: 505px;
            text-align: right;
        }
        .style31
        {
            width: 510px;
        }
        .style36
        {
            width: 483px;
        }
        .style37
        {
            width: 237px;
        }
        .auto-style3 {
            width: 642px;
        }
        .auto-style4 {
            width: 547px;
            text-align: right;
        }
        .auto-style5 {
            width: 547px;
        }
        .auto-style6 {
            width: 533px;
            text-align: right;
        }
        .auto-style7 {
            width: 533px;
        }
        .auto-style9 {
            width: 100px;
        }
        .auto-style10 {
            width: 83px;
        }
        .auto-style11 {
            width: 115px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
       <center>
      <table>
            <tr>
                <td>                
                        &nbsp;</td>
                <td>
                          <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <uc1:WebUserSecurityManager ID="wuc1" runat="server" 
                                ApplicationName="MedicalTreatment" ConnectionString="HRWEbDbConnectionString" 
                                PermissionError="~/Pages/PermissionError.aspx" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="fvContractors" EventName="DataBinding" />
                        </Triggers>
                    </asp:UpdatePanel> 
                </td>
            </tr>
        </table>  
         </center>      
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:FormView ID="fvContractors" runat="server" DataKeyNames="id" 
                DataSourceID="sdsContratorsActions" Width="903px">
                <EditItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style11">
                                id</td>
                            <td class="style37">
                                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td class="auto-style9">
                                &nbsp;</td>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                الجهة التعاقد الطبية:
                                <br />
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="ContractorsTextBox" runat="server" Height="20px" 
                                    Text='<%# Bind("Contractors") %>' Width="750px" MaxLength="50" 
                                    Enabled="False" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                عنوان الجهة الطبية:
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="AddressTextBox" runat="server" Height="20px" 
                                    Text='<%# Bind("Address") %>' Width="750px" MaxLength="149" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                المنطقة :</td>
                            <td colspan="5">
                                <asp:TextBox ID="TextBox2" runat="server" Height="16px" 
                                    Text='<%# bind("District") %>' Width="337px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                التليفون:</td>
                            <td colspan="2">
                                <asp:TextBox ID="PhoneTextBox" runat="server" Height="20px" 
                                    Text='<%# Bind("Phone") %>' Width="292px" MaxLength="30" ></asp:TextBox>
                            </td>
                            <td class="style14">
                                &nbsp;</td>
                            <td class="style13">
                                نشط:</td>
                            <td>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isactive") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                المحافظة:</td>
                            <td class="style37">
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sdsCity2" 
                                    DataTextField="District_A" DataValueField="ID_1102" Height="26px" 
                                    SelectedValue='<%# Bind("CityID") %>' Width="282px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsCity2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                                    SelectCommand="SELECT [ID_1102], [District_A] FROM [City] WHERE ([IsDeleted] = @IsDeleted)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="false" Name="IsDeleted" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style9">
                                التخصص:</td>
                            <td class="style14">
                                <asp:TextBox ID="SpecialTextBox" runat="server" Height="20px" 
                                    Text='<%# Bind("Special") %>' Width="170px" MaxLength="50" />
                            </td>
                            <td class="style13">
                                النوع:</td>
                            <td>
                                <asp:TextBox ID="KindTextBox" runat="server" Height="20px" 
                                    Text='<%# Bind("Kind") %>' MaxLength="50" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">
                                ملاحظات</td>
                            <td colspan="5">
                                <asp:TextBox ID="NotesTextBox" runat="server" Height="20px" 
                                    Text='<%# Bind("Notes") %>' Width="750px" MaxLength="200" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">اسم البنك : </td>
                            <td class="style36">
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("BankName") %>' Height="16px" Width="265px"></asp:TextBox>
                                &nbsp;</td>
                            <td class="auto-style9">&nbsp;الفرع : </td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("BankBranch") %>' Height="16px" Width="259px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">اسم الحساب</td>
                            <td class="style36">
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("BankAccountName") %>' Height="16px" Width="270px"></asp:TextBox>
                            </td>
                            <td class="auto-style9">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">رقم الحساب : </td>
                            <td class="style36">
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("BankAccountNumber") %>' Height="16px" Width="266px"></asp:TextBox>
                                &nbsp; 
                                </td>
                            <td class="auto-style9">السويفت كود :</td>
                            <td>
                                <asp:TextBox ID="TextBox7" runat="server" Height="16px" Text='<%# Bind("BankSwiftCode") %>' Width="262px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                       <%--  --%>
                        <tr>
                            <td class="auto-style11">اسم البنك2 : </td>
                            <td class="style36">
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("BankName2")%>' Height="16px" Width="265px"></asp:TextBox>
                                &nbsp;</td>
                            <td class="auto-style9">&nbsp;الفرع2 : </td>
                            <td>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("BankBranch2")%>' Height="16px" Width="259px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">2اسم الحساب</td>
                            <td class="style36">
                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("BankAccountName2")%>' Height="16px" Width="270px"></asp:TextBox>
                            </td>
                            <td class="auto-style9">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">رقم الحساب2 : </td>
                            <td class="style36">
                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("BankAccountNumber2")%>' Height="16px" Width="266px"></asp:TextBox>
                                &nbsp; 
                                </td>
                            <td class="auto-style9">السويفت كود2 :</td>
                            <td>
                                <asp:TextBox ID="TextBox12" runat="server" Height="16px" Text='<%# Bind("BankSwiftCode2") %>' Width="262px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
&nbsp;<br />&nbsp; <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        Text="تحديث" onclick="UpdateButton_Click" 
                        onclientclick="return confirm(' هل انت متاكد من الحفظ ؟ ');" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="إلغاء" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table style="width:99%;">
                        <tr>
                            <td class="style27">
                                &nbsp;</td>
                            <td class="auto-style3">
                                &nbsp;</td>
                            <td class="auto-style4">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style27">
                                الجهة التعاقد الطبية:
                                <br />
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="ContractorsTextBox" runat="server" Height="20px" 
                                    Text='<%# Bind("Contractors") %>' Width="650px" MaxLength="50" />
                            </td>
                            <td class="auto-style7">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style27">
                                عنوان الجهة الطبية:
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="AddressTextBox" runat="server" Height="20px" 
                                    Text='<%# Bind("Address") %>' Width="650px" MaxLength="149" />
                            </td>
                            <td class="auto-style7">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style27">
                                المنطقة :</td>
                            <td colspan="2">
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("District") %>' 
                                    Height="20px" Width="292px"  ></asp:TextBox>
                            </td>
                            <td class="auto-style7">
                                <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("isactive") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style27">
                                التليفون:</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="PhoneTextBox2" runat="server" Height="20px" Width="292px" 
                                    Text='<%# Bind("Phone") %>' MaxLength="30" />&nbsp;
                                </td>
                            <td style="text-align: right" class="auto-style5">
                                النوع:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          <br/>      <asp:DropDownList ID="DropDownList3" runat="server" 
                                    DataSourceID="sdsContractKind" DataTextField="Kind" DataValueField="Kind" 
                                    SelectedValue='<%# Bind("Kind") %>' Height="26px" Width="294px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsContractKind" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                                    SelectCommand="SELECT DISTINCT Kind FROM MtContractors WHERE (IsDeleted = @IsDeleted) and Kind is not null">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="false" Name="IsDeleted" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td style="text-align: left" class="auto-style7">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style27">
                                المحافظة:</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsCity" 
                                    DataTextField="District_A" DataValueField="ID_1102" Height="26px" Width="294px"
                                    SelectedValue='<%# Bind("CityID") %>' >
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsCity" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                                    SelectCommand="SELECT [ID_1102], [District_A] FROM [City] WHERE ([IsDeleted] = @IsDeleted) ORDER BY [District_A]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="false" Name="IsDeleted" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style4">
                                التخصص: 
                              <br/>   <asp:DropDownList ID="DropDownList4" runat="server" 
                                    DataSourceID="sdsContractSP" DataTextField="Special" DataValueField="Special" Height="26px" Width="294px"
                                    SelectedValue='<%# Bind("Special") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sdsContractSP" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                                    SelectCommand="SELECT DISTINCT Special FROM MtContractors WHERE (IsDeleted = 0)and Special is not null ORDER BY Special">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="false" Name="IsDeleted" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style6">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style27">
                                ملاحظات</td>
                            <td colspan="2">
                                <asp:TextBox ID="NotesTextBox" runat="server" Height="20px" 
                                    Text='<%# Bind("Notes") %>' Width="650px" />
                            </td>
                            <td class="auto-style7">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>اسم البنك : </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("BankName") %>' Width="246px"></asp:TextBox>
                                &nbsp;&nbsp;</td>
                            <td class="auto-style5">الفرع :
                                <asp:TextBox ID="TextBox4" runat="server"  Width="246px" Text='<%# Bind("BankBranch") %>'></asp:TextBox>
                            </td>
                            <td class="auto-style7">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>اسم الحساب :</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="TextBox5"  Width="246px" runat="server" Text='<%# Bind("BankAccountName") %>' Height="19px"></asp:TextBox>
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>رقم الحساب : </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="TextBox6"  Width="246px" runat="server" Text='<%# Bind("BankAccountNumber") %>'></asp:TextBox>
                            </td>
                            <td class="auto-style5">&nbsp; السويفت كود :
                                <asp:TextBox ID="TextBox7"  Width="226px" runat="server" Text='<%# Bind("BankSwiftCode") %>'></asp:TextBox>
                            </td>
                            <td class="auto-style7">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>اسم البنك 2 : </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("BankName2")%>' Width="246px"></asp:TextBox>
                                &nbsp;&nbsp;</td>
                            <td class="auto-style5">الفرع 2 :
                                <asp:TextBox ID="TextBox14" runat="server"  Width="246px" Text='<%# Bind("BankBranch2")%>'></asp:TextBox>
                            </td>
                            <td class="auto-style7">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>2اسم الحساب :</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="TextBox15"  Width="246px" runat="server" Text='<%# Bind("BankAccountName2")%>' Height="19px"></asp:TextBox>
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>رقم الحساب2 : </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="TextBox16"  Width="246px" runat="server" Text='<%# Bind("BankAccountNumber2")%>'></asp:TextBox>
                            </td>
                            <td class="auto-style5">&nbsp; السويفت كود2 :
                                <asp:TextBox ID="TextBox17"  Width="210px" runat="server" Text='<%# Bind("BankSwiftCode2")%>'></asp:TextBox>
                            </td>
                            <td class="auto-style7">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
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
                    <table class="style3">
                        <tr>
                            <td>
                                الجهة التعاقد الطبية:</td>
                            <td colspan="6">
                                <asp:Label ID="ContractorsLabel" runat="server" CssClass="style19" 
                                    style="color: #0000FF; font-weight: bold" Text='<%# Bind("Contractors") %>' 
                                    Width="700px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                عنوان الجهة الطبية:</td>
                            <td colspan="4">
                                <asp:Label ID="AddressLabel" runat="server" CssClass="style19" 
                                    style="color: #0000FF; font-weight: bold" Text='<%# Bind("Address") %>' 
                                    Width="700px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                المنطقة :</td>
                            <td colspan="4">
                              <asp:Label ID="LabelDistrict" runat="server" CssClass="style19" 
                                    style="color: #0000FF; font-weight: bold" Text='<%# Bind("District") %>' 
                                    Width="700px" />
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                التليفون:</td>
                            <td class="style36">
&nbsp;
                                <asp:Label ID="PhoneLabel" runat="server" CssClass="style19" Height="19px" 
                                    style="color: #0000FF; font-weight: bold" Text='<%# Bind("Phone") %>' 
                                    Width="176px" />
                                &nbsp;&nbsp; النوع:
                                <asp:Label ID="KindLabel" runat="server" CssClass="style19" 
                                    style="color: #0000FF; font-weight: bold" Text='<%# Bind("Kind") %>' />
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                المحافظة:</td>
                            <td class="style36">
                                <asp:Label ID="DistrictLabel" runat="server" CssClass="style19" 
                                    style="color: #0000FF; font-weight: bold" 
                                    Text='<%# Bind("District_A") %>' />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; التخصص :
                                <asp:Label ID="SpecialLabel" runat="server" CssClass="style19" 
                                    style="color: #0000FF; font-weight: bold" Text='<%# Bind("Special") %>' />
                            </td>
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
                        <tr>
                            <td>
                                ملاحظات :</td>
                            <td class="style36">
                                <asp:Label ID="NotesLabel" runat="server" CssClass="style19" 
                                    style="color: #0000FF; font-weight: bold" Text='<%# Bind("Notes") %>' 
                                    Width="700px" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("isactive") %>' Enabled="False" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>اسم البنك : </td>
                            <td class="style36">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("BankName") %>'></asp:Label>
                                &nbsp;الفرع :
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("BankBranch") %>'></asp:Label>
                                &nbsp; اسم الحساب&nbsp;
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("BankAccountName") %>'></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>رقم الحساب : </td>
                            <td class="style36">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("BankAccountNumber") %>'></asp:Label>
                                &nbsp; السويفت كود :
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("BankSwiftCode") %>'></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>2اسم البنك : </td>
                            <td class="style36">
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("BankName2")%>'></asp:Label>
                                &nbsp;الفرع2 :
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("BankBranch2")%>'></asp:Label>
                                &nbsp; 2اسم الحساب&nbsp;
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("BankAccountName2")%>'></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>رقم الحساب2 : </td>
                            <td class="style36">
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("BankAccountNumber2")%>'></asp:Label>
                                &nbsp; السويفت كود2 :
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("BankSwiftCode2")%>'></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td class="style36">
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                    CommandName="New" Text="جديد" Visible="False" />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="تعديل" Visible="False" />
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="حذف" Visible="False" />
                                <asp:ConfirmButtonExtender ID="DeleteButton_ConfirmButtonExtender" 
                                    runat="server" ConfirmText="هل أنت متأكد من حذف جهة التعاقد الحالية" 
                                    Enabled="True" TargetControlID="DeleteButton">
                                </asp:ConfirmButtonExtender>
                            </td>
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

                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="sdsContratorsActions" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
            DeleteCommand=" UPDATE [MtContractors] 
SET  IsDeleted=1,DeletedBy=@DeletedBy,DeleteDate=GETDATE(), WinUser = @WinUser , WinHost =@WinHost
  WHERE [id] = @id" 
            InsertCommand="INSERT INTO [MtContractors] 
( [Contractors], [Address], [District], 
[Notes], [Phone], [Special], [Kind], 
 [LastModifiedDate], [LastModifiedBy],
  [CreatedDate], [CreatedBy]
  ,WinUser,WinHost,CityID ,isactive ,
BankName,BankBranch,BankAccountName,BankAccountNumber,BankSwiftCode
) 
  VALUES ( @Contractors, @Address, @District, @Notes, @Phone, @Special, @Kind,
   GETDATE(), @LastModifiedBy, GETDATE(), @CreatedBy,@WinUser,@WinHost ,@CityID,@isactive,
@BankName,@BankBranch,@BankAccountName,@BankAccountNumber,@BankSwiftCode
)" 
            SelectCommand="SELECT con.id, con.Contractors, con.Address, con.District, con.Notes, con.Phone, con.Special, con.Kind
, con.LastTableAuditDate, con.LastTableAuditBy, con.LastModifiedDate, con.LastModifiedBy, con.CreatedDate, 
con.CreatedBy, con.CityID ,City.District_A ,isactive , BankName,BankBranch,BankAccountName,BankAccountNumber,BankSwiftCode,
BankName2,BankBranch2,BankAccountName2,BankAccountNumber2,BankSwiftCode2
FROM MtContractors con
inner join City 
on ID_1102 = CityID
 WHERE (con.IsDeleted = 0 ) and(City.IsDeleted = 0 )   AND (id = @id) ORDER BY Contractors" 
            
    
                UpdateCommand="UPDATE [MtContractors]
 SET [Contractors] = @Contractors, 
 [Address] = @Address, 
 [District] = @District, 
 [Notes] = @Notes, [Phone] = @Phone, [Special] = @Special, 
 [Kind] = @Kind, 
isactive=@isactive,
 [LastModifiedDate] = GETDATE(), [LastModifiedBy] = @LastModifiedBy, WinUser = @WinUser , WinHost =@WinHost,
Cityid = @CityID,
BankName=@BankName,BankBranch=@BankBranch,BankAccountName=@BankAccountName,
BankAccountNumber=@BankAccountNumber,BankSwiftCode=@BankSwiftCode
   WHERE [id] = @id">
                <DeleteParameters>
                    <asp:SessionParameter Name="DeletedBy" SessionField="UserName" />
                    <asp:ControlParameter ControlID="hfWinUser" Name="WinUser" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinHost" Name="WinHost" 
                        PropertyName="Value" />
                    <asp:Parameter Name="id" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Contractors" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="District" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="Phone" />
                    <asp:Parameter Name="Special" />
                    <asp:Parameter Name="Kind" />
                    <asp:ControlParameter ControlID="hfUserName" Name="LastModifiedBy" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfUserName" Name="CreatedBy" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinUser" Name="WinUser" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinHost" Name="WinHost" 
                        PropertyName="Value" />
                    <asp:Parameter Name="CityID" />
                    <asp:Parameter Name="isactive" />
                    <asp:Parameter Name="BankName" />
                    <asp:Parameter Name="BankBranch" />
                    <asp:Parameter Name="BankAccountName" />
                    <asp:Parameter Name="BankAccountNumber" />
                    <asp:Parameter Name="BankSwiftCode" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="id" QueryStringField="id" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Contractors" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="District" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="Phone" />
                    <asp:Parameter Name="Special" />
                    <asp:Parameter Name="Kind" />
                    <asp:Parameter Name="isactive" />
                    <asp:SessionParameter Name="LastModifiedBy" SessionField="UserName" />
                    <asp:ControlParameter ControlID="hfWinUser" Name="WinUser" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinHost" Name="WinHost" 
                        PropertyName="Value" />
                    <asp:Parameter Name="CityID" />
                    <asp:Parameter Name="BankName" />
                    <asp:Parameter Name="BankBranch" />
                    <asp:Parameter Name="BankAccountName" />
                    <asp:Parameter Name="BankAccountNumber" />
                    <asp:Parameter Name="BankSwiftCode" />
                    <asp:Parameter Name="id" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsContrators1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" DeleteCommand=" UPDATE [MtContractors] 
SET  IsDeleted=1,DeletedBy=@DeletedBy,DeleteDate=GETDATE(), WinUser = @WinUser , WinHost =@WinHost
  WHERE [id] = @id" InsertCommand="INSERT INTO [MtContractors] 
( [Contractors], [Address], [District], 
[Notes], [Phone], [Special], [Kind], 
 [LastModifiedDate], [LastModifiedBy],
  [CreatedDate], [CreatedBy]
  ,WinUser,WinHost  ) 
  VALUES ( @Contractors, @Address, @District, @Notes, @Phone, @Special, @Kind,
   GETDATE(), @LastModifiedBy, GETDATE(), @CreatedBy,@WinUser,@WinHost )" SelectCommand="SELECT isactive, [id], [Contractors], [Address], [District], [Notes], [Phone], [Special], [Kind], [LastTableAuditDate], [LastTableAuditBy], [LastModifiedDate], [LastModifiedBy], [CreatedDate], [CreatedBy] FROM [MtContractors]
where IsDeleted= 0 and [Contractors] like '%'+@srch+'%'
 ORDER BY [Contractors]" UpdateCommand="UPDATE [MtContractors]
 SET [Contractors] = @Contractors, 
 [Address] = @Address, 
 [District] = @District, 
 [Notes] = @Notes, [Phone] = @Phone, [Special] = @Special, 
 [Kind] = @Kind, 
 [LastModifiedDate] = GETDATE(), [LastModifiedBy] = @LastModifiedBy, WinUser = @WinUser , WinHost =@WinHost
   WHERE [id] = @id">
                <DeleteParameters>
                    <asp:SessionParameter Name="DeletedBy" SessionField="UserName" />
                    <asp:ControlParameter ControlID="hfWinUser" Name="WinUser" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinHost" Name="WinHost" 
                        PropertyName="Value" />
                    <asp:Parameter Name="id" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Contractors" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="District" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="Phone" />
                    <asp:Parameter Name="Special" />
                    <asp:Parameter Name="Kind" />
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
                    <asp:ControlParameter ControlID="srchTB" ConvertEmptyStringToNull="False" Name="srch" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Contractors" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="District" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="Phone" />
                    <asp:Parameter Name="Special" />
                    <asp:Parameter Name="Kind" />
                    <asp:SessionParameter Name="LastModifiedBy" SessionField="UserName" />
                    <asp:ControlParameter ControlID="hfWinUser" Name="WinUser" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="hfWinHost" Name="WinHost" 
                        PropertyName="Value" />
                    <asp:Parameter Name="id" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Panel ID="Panel2" runat="server" ScrollBars="Horizontal">
                <asp:TextBox ID="srchTB" runat="server" AutoPostBack="True"></asp:TextBox>
                <asp:GridView ID="gvContractors" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="id" DataSourceID="sdsContrators1" ForeColor="#333333" 
                    GridLines="None" Height="211px" PageSize="20" style="text-align: right" 
                    Width="907px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Select"  Text="اختار"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="isactive" HeaderText="نشط" SortExpression="isactive" />
                        <asp:BoundField DataField="Contractors" HeaderText="الجهة" 
                            SortExpression="Contractors">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Address" HeaderText="العنوان" 
                            SortExpression="Address">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="District" HeaderText="المنطقة" 
                            SortExpression="District">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Phone" HeaderText="التليفون" SortExpression="Phone">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Special" HeaderText="التخصص" 
                            SortExpression="Special">
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Kind" HeaderText="النوع" SortExpression="Kind">
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
       </p>
    <p>
        &nbsp;</p>
    <p>
        <br />
    </p>
    </asp:Content>

