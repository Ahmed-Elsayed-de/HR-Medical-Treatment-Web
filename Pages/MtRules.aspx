<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/MT.master" AutoEventWireup="false" CodeFile="MtRules.aspx.vb" Inherits="Pages_MtRoles" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="WebUserSecurityManager.ascx" tagname="WebUserSecurityManager" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style17
        {
            text-align: right;
        }
        .style31
        {
            text-align: center;
        }
        .style32
        {
            height: 7px;
        }
        .style42
        {
            text-align: left;
            font-family: Tahoma;
            font-size: small;
            color: #000000;
        }
        .style59
        {
            width: 155px;
            height: 7px;
            font-style: normal;
        }
        .style62
        {
            width: 141px;
            height: 12px;
            font-style: normal;
        }
        .style64
        {
            width: 155px;
            text-align: right;
            height: 12px;
            font-style: normal;
        }
        .style65
        {
            text-align: left;
            height: 12px;
        }
        .style72
        {
            width: 141px;
            height: 7px;
            font-style: normal;
        }
        .style86
        {
            width: 45px;
        }
        .style87
        {
            text-align: justify;
            width: 45px;
        }
        .style88
        {
            text-align: left;
            width: 45px;
        }
        .style89
        {
            text-align: left;
            width: 45px;
            height: 12px;
        }
        .style90
        {
            width: 45px;
            height: 7px;
        }
        .style91
        {
            text-align: center;
            font-family: Tahoma;
            font-style: normal;
        }
        .style94
        {
            width: 155px;
            text-align: right;
        }
        .style96
        {
            text-align: left;
            width: 12px;
        }
        .style97
        {
            text-align: left;
            height: 12px;
            width: 12px;
        }
        .style99
        {
            height: 7px;
            width: 12px;
        }
        .style100
        {
            width: 12px;
        }
        .style101
        {
            width: 12px;
            text-align: right;
        }
        .style108
        {
            font-family: Tahoma;
        }
        .style111
        {
            text-align: center;
            font-family: Tahoma;
            color: #000000;
            font-style: normal;
        }
        .style112
        {
            width: 199px;
        }
        .style138
        {
            height: 7px;
            width: 132px;
            text-align: center;
        }
        .style155
        {
            text-align: justify;
        }
        .style156
        {
            text-align: center;
            width: 192px;
        }
        .style157
        {
            text-align: left;
            width: 192px;
            font-family: Tahoma;
            color: #000000;
            font-style: normal;
            font-size: small;
        }
        .style158
        {
            text-align: left;
            width: 269px;
            height: 12px;
            font-family: Tahoma;
            font-style: normal;
            color: #000000;
            font-size: small;
        }
        .style159
        {
            width: 269px;
            height: 7px;
            font-family: Tahoma;
            font-style: normal;
            color: #000000;
            font-size: small;
            text-align: left;
        }
        .style160
        {
            width: 192px;
            text-align: center;
        }
        .style162
        {
            width: 155px;
            text-align: right;
            font-style: normal;
        }
        .style164
        {
            width: 141px;
            text-align: right;
        }
        .style165
        {
            width: 141px;
            font-style: normal;
        }
        .style166
        {
            text-align: center;
        }
        .style167
        {
            width: 213px;
        }
        .style169
        {
            height: 7px;
            font-size: small;
            font-style: normal;
            text-align: left;
        }
        .style171
        {
            height: 7px;
            width: 132px;
            text-align: center;
            font-style: normal;
        }
        .style172
        {
            text-align: center;
            font-style: normal;
        }
        .style174
        {
            width: 192px;
            text-align: center;
            font-style: normal;
        font-family: Tahoma;
        font-size: small;
        color: #000000;
    }
        .style176
        {
            height: 7px;
            font-family: Tahoma;
            font-size: small;
            font-style: normal;
            color: #000000;
        }
        .style177
        {
            text-align: left;
            font-family: Tahoma;
            font-size: small;
            font-style: normal;
            color: #000000;
        }
        .style178
        {
            text-align: left;
            height: 12px;
            font-family: Tahoma;
            font-size: small;
            font-style: normal;
            color: #000000;
        }
        .style179
        {
            font-family: Tahoma;
            font-size: small;
            font-style: normal;
            color: #000000;
        }
        .style180
        {
            font-style: normal;
        }
        .style182
        {
            text-align: center;
            width: 19px;
        }
        .style183
        {
            width: 19px;
            text-align: right;
        }
        .style184
        {
            text-align: center;
            width: 269px;
        }
        .style185
        {
            text-align: left;
            width: 269px;
            font-family: Tahoma;
            color: #000000;
            font-style: normal;
            font-size: small;
        }
        .style187
        {
            width: 269px;
            text-align: center;
            font-style: normal;
            font-family: Tahoma;
            font-size: small;
            color: #000000;
        }
        .style188
        {
            direction: ltr;
        }
        .style189
        {
            font-size: xx-large;
            text-decoration: underline;
            color: #FFFFFF;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        &nbsp;</p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                 <center>
                 <asp:Panel ID="Panel4" runat="server" Height="50px">
                    <div class="style31">
                        <strong>
                        <asp:Label ID="Label1" runat="server" CssClass="style189"></asp:Label>
                        </strong>
                    </div>
                </asp:Panel>
      <table>
           
        </table>   </center>
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
                            <td class="style188">
                                 <uc1:WebUserSecurityManager 
            ID="wuc1" runat="server" 
                ApplicationName="MedicalTreatment" ConnectionString="HRWEbDbConnectionString" 
                PermissionError="~/Pages/PermissionError.aspx" />
                            </td>
                             </tr>
                                </table>
                     <asp:SqlDataSource ID="sdsYearMt" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT YearMt FROM MtRules ORDER BY YearMt DESC">
            </asp:SqlDataSource>
            <div class="style1">
                
                <asp:FormView ID="fvMtitems" runat="server" DataKeyNames="id" 
                    DataSourceID="sdsMtRules" Width="903px">
                    <EditItemTemplate>
                        &nbsp;<asp:Panel ID="Panel3" runat="server" Height="578px">
                            <table style="width:100%; height: 258px;">
                                <tr>
                                    <td class="style86">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style112" colspan="2" style="text-align: left">
                                        &nbsp;
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="تعديل" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="ألغاء" />
                                        &nbsp; </td>
                                    <td class="style164">
                                        &nbsp;</td>
                                    <td class="style183">
                                        &nbsp;</td>
                                    <td class="style156">
                                        &nbsp;</td>
                                    <td class="style94">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style86">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style112" colspan="2" style="text-align: left">
                                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' 
                                            Visible="False" />
                                    </td>
                                    <td class="style164">
                                        &nbsp;</td>
                                    <td class="style183">
                                        &nbsp;</td>
                                    <td class="style156">
                                        &nbsp;</td>
                                    <td class="style94">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style87">
                                        &nbsp;</td>
                                    <td class="style155">
                                        &nbsp;</td>
                                    <td class="style91" colspan="6" 
                                        style="border: thin solid CornflowerBlue; color: #000000; text-align: center; background-color: #E6EEFC; font-family: Tahoma;">
                                        العلاج الشخصى</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style87">
                                        &nbsp;</td>
                                    <td class="style155">
                                        &nbsp;</td>
                                    <td bgcolor="#E6EEFC" class="style111" colspan="3" 
                                        style="border-width: thin; border-color: CornflowerBlue; border-top-style: solid; border-right-style: solid; border-bottom-style: solid;">
                                        المستوى الأول</td>
                                    <td bgcolor="#E6EEFC" class="style183" 
                                        style="border-width: thin; border-color: CornflowerBlue; border-top-style: solid;">
                                        &nbsp;</td>
                                    <td bgcolor="#E6EEFC" class="style111" colspan="2" 
                                        style="border-width: thin; border-color: CornflowerBlue; border-top-style: solid; border-bottom-style: solid; border-left-style: solid;">
                                        المستوى الثانى</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style88">
                                        &nbsp;</td>
                                    <td class="style42" colspan="3">
                                        <span class="style180">الحد الأقصى قبل المستوى الأول:</span>
                                    </td>
                                    <td class="style165">
                                        <asp:TextBox ID="MaxBeforeTextBox" runat="server" 
                                            Text='<%# Bind("MaxBefore") %>' />
                                    </td>
                                    <td bgcolor="#E6EEFC" class="style183" rowspan="8" 
                                        style="border-width: thin; border-color: CornflowerBlue; border-right-style: solid; border-bottom-style: solid; border-left-style: solid;">
                                        &nbsp;</td>
                                    <td class="style157">
                                        الحد الأقصى قبل المستوى الثانى:
                                    </td>
                                    <td class="style162">
                                        <asp:TextBox ID="MaxBefore66TextBox" runat="server" 
                                            Text='<%# Bind("MaxBefore66") %>' />
                                    </td>
                                    <td class="style96">
                                        &nbsp;</td>
                                    <td class="style96">
                                        &nbsp;</td>
                                    <td class="style42">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style89">
                                        &nbsp;</td>
                                    <td class="style178" colspan="3">
                                        الحد الأقصى بعد المستوى الأول:
                                    </td>
                                    <td class="style62">
                                        <asp:TextBox ID="MaxTextBox" runat="server" Text='<%# Bind("Max") %>' />
                                    </td>
                                    <td class="style158">
                                        الحد الأقصى بعد المستوى الثانى:</td>
                                    <td class="style64">
                                        <asp:TextBox ID="Max66TextBox" runat="server" Text='<%# Bind("Max66") %>' />
                                    </td>
                                    <td class="style97">
                                    </td>
                                    <td class="style97">
                                        &nbsp;</td>
                                    <td class="style65">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style88" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style177" colspan="3" style="text-align: left">
                                        نسبة الموظف بعد :</td>
                                    <td class="style165">
                                        <asp:TextBox ID="EmpPercentTextBox" runat="server" 
                                            Text='<%# Bind("EmpPercent") %>' />
                                    </td>
                                    <td class="style157">
                                        نسبة الموظف بعد :</td>
                                    <td class="style162">
                                        <asp:TextBox ID="EmpPercent66TextBox" runat="server" 
                                            Text='<%# Bind("EmpPercent66") %>' />
                                    </td>
                                    <td class="style100">
                                        &nbsp;</td>
                                    <td class="style100">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style176" colspan="3" style="text-align: left">
                                        الحد الأقصى للمكافأة الشاملة قبل:</td>
                                    <td class="style72">
                                        <asp:TextBox ID="Max1TextBox" runat="server" Text='<%# Bind("Max1") %>' />
                                    </td>
                                    <td class="style159" style="text-align: right">
                                        الحد الأقصى للمكافأة الشاملة قبل:</td>
                                    <td class="style59">
                                        <asp:TextBox ID="Max166TextBox" runat="server" Text='<%# Bind("Max166") %>' />
                                    </td>
                                    <td class="style99">
                                        &nbsp;</td>
                                    <td class="style99">
                                        &nbsp;</td>
                                    <td class="style32">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style176" colspan="3" style="text-align: left">
                                        الحد الأقصى للمكافأة الشاملة بعد:</td>
                                    <td class="style165" style="margin-right: 80px">
                                        <asp:TextBox ID="MaxAfter1TextBox" runat="server" 
                                            Text='<%# Bind("MaxAfter1") %>' />
                                    </td>
                                    <td class="style157" style="margin-right: 80px">
                                        الحد الأقصى للمكافأة الشاملة بعد:</td>
                                    <td class="style162">
                                        <asp:TextBox ID="MaxAfter166TextBox" runat="server" 
                                            Text='<%# Bind("MaxAfter166") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style176" colspan="3" style="text-align: left">
                                        نسبة المكافأة الشاملة قبل:</td>
                                    <td class="style165" style="margin-right: 80px">
                                        <asp:TextBox ID="EmpPercent1TextBox" runat="server" 
                                            Text='<%# Bind("EmpPercent1") %>' />
                                    </td>
                                    <td class="style157" style="margin-right: 80px">
                                        نسبة المكافأة الشاملة قبل:</td>
                                    <td class="style162">
                                        <asp:TextBox ID="EmpPercent166TextBox" runat="server" 
                                            Text='<%# Bind("EmpPercent166") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style86" style="text-align: left">
                                    </td>
                                    <td class="style179" colspan="3" style="text-align: left">
                                        نسبة المكافأة الشاملة بعد:</td>
                                    <td class="style165" style="margin-right: 80px">
                                        <asp:TextBox ID="EmpPercentAfter1TextBox" runat="server" 
                                            Text='<%# Bind("EmpPercentAfter1") %>' />
                                    </td>
                                    <td class="style157" style="margin-right: 80px">
                                        نسبة المكافأة الشاملة بعد:</td>
                                    <td class="style162">
                                        <asp:TextBox ID="EmpPercentAfter166TextBox" runat="server" 
                                            Text='<%# Bind("EmpPercentAfter166") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                    </td>
                                    <td style="margin-right: 80px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style86" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style179" colspan="3" style="text-align: left">
                                        نسبة خصم الدواء المحلى:</td>
                                    <td class="style165" style="margin-right: 80px">
                                        <asp:TextBox ID="LocaldeductPercentTextBox" runat="server" 
                                            Text='<%# Bind("LocaldeductPercent") %>' />
                                    </td>
                                    <td class="style157" style="margin-right: 80px">
                                        نسبة خصم الدواء المستورد:</td>
                                    <td class="style162">
                                        <asp:TextBox ID="ForeignDeductPercentTextBox" runat="server" 
                                            Text='<%# Bind("ForeignDeductPercent") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style32" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style31" colspan="6" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        العلاج الأسرى</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style32" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style167" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        &nbsp;</td>
                                    <td class="style138" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة</td>
                                    <td class="style166" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة +1</td>
                                    <td class="style182" rowspan="10" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        &nbsp;</td>
                                    <td class="style160" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة +2</td>
                                    <td class="style31" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة +3+000</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000">
                                        &nbsp;</td>
                                    <td class="style171">
                                        &nbsp;</td>
                                    <td class="style172">
                                        &nbsp;</td>
                                    <td class="style174">
                                        &nbsp;</td>
                                    <td class="style172">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        رئيس الشركة</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife11TextBox" runat="server" Text='<%# Bind("Wife11") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus111TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus111") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus211TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus211") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus311TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus311") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مساعد رئيس الشركة</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife22TextBox" runat="server" Text='<%# Bind("Wife22") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus122TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus122") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus222TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus222") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus322TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus322") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مدير عام</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife33TextBox" runat="server" Text='<%# Bind("Wife33") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus233TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus233") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus133TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus133") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus333TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus333") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مدير عام مساعد</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife44TextBox" runat="server" Text='<%# Bind("Wife44") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus144TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus144") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus244TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus244") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus344TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus344") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مستوى أول</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife55TextBox" runat="server" Text='<%# Bind("Wife55") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus155TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus155") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus255TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus255") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus355TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus355") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مستوى ثاني</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife66TextBox" runat="server" Text='<%# Bind("Wife66") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus166TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus166") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus266TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus266") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus366TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus366") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="3" style="font-family: Tahoma; color: #000000;">
                                        مخصص&nbsp; العلاج الأسرى:</td>
                                    <td class="style172">
                                        <asp:TextBox ID="FamilySpecifiedTextBox" runat="server" 
                                            Text='<%# Bind("FamilySpecified") %>' />
                                    </td>
                                    <td class="style174">
                                        لائحة العلاج لعام :</td>
                                    <td class="style172">
                                        <asp:TextBox ID="YearMtTextBox" runat="server" Text='<%# Bind("YearMt") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="3" style="font-family: Tahoma; color: #000000;">
                                        &nbsp;</td>
                                    <td class="style172">
                                        &nbsp;</td>
                                    <td class="style174">
                                        &nbsp;</td>
                                    <td class="style172">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Panel ID="Panel3" runat="server" Height="578px">
                            <table style="width: 100%; height: 258px;">
                                <tr>
                                    <td class="style86">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style112" colspan="2" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style164">
                                        &nbsp;</td>
                                    <td class="style183">
                                        &nbsp;</td>
                                    <td class="style156">
                                        &nbsp;</td>
                                    <td class="style94">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style86">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style112" colspan="2" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style164">
                                        &nbsp;</td>
                                    <td class="style183">
                                        &nbsp;</td>
                                    <td class="style156">
                                        &nbsp;</td>
                                    <td class="style94">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style87">
                                        &nbsp;</td>
                                    <td class="style155">
                                        &nbsp;</td>
                                    <td class="style91" colspan="6" 
                                        style="border: thin solid CornflowerBlue; color: #000000; text-align: center; background-color: #E6EEFC; font-family: Tahoma;">
                                        العلاج الشخصى</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style87">
                                        &nbsp;</td>
                                    <td class="style155">
                                        &nbsp;</td>
                                    <td bgcolor="#E6EEFC" class="style111" colspan="3" 
                                        style="border-width: thin; border-color: CornflowerBlue; border-top-style: solid; border-right-style: solid; border-bottom-style: solid;">
                                        المستوى الأول</td>
                                    <td bgcolor="#E6EEFC" class="style183" 
                                        style="border-width: thin; border-color: CornflowerBlue; border-top-style: solid;">
                                        &nbsp;</td>
                                    <td bgcolor="#E6EEFC" class="style111" colspan="2" 
                                        style="border-width: thin; border-color: CornflowerBlue; border-top-style: solid; border-bottom-style: solid; border-left-style: solid;">
                                        المستوى الثانى</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style88">
                                        &nbsp;</td>
                                    <td class="style42" colspan="3">
                                        <span class="style180">الحد الأقصى قبل المستوى الأول:</span>
                                    </td>
                                    <td class="style165">
                                        <asp:TextBox ID="MaxBeforeTextBox" runat="server" 
                                            Text='<%# Bind("MaxBefore") %>' />
                                    </td>
                                    <td bgcolor="#E6EEFC" class="style183" rowspan="8" 
                                        style="border-width: thin; border-color: CornflowerBlue; border-right-style: solid; border-bottom-style: solid; border-left-style: solid;">
                                        &nbsp;</td>
                                    <td class="style157">
                                        الحد الأقصى قبل المستوى الثانى:
                                    </td>
                                    <td class="style162">
                                        <asp:TextBox ID="MaxBefore66TextBox" runat="server" 
                                            Text='<%# Bind("MaxBefore66") %>' />
                                    </td>
                                    <td class="style96">
                                        &nbsp;</td>
                                    <td class="style96">
                                        &nbsp;</td>
                                    <td class="style42">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style89">
                                        &nbsp;</td>
                                    <td class="style178" colspan="3">
                                        الحد الأقصى بعد المستوى الأول:
                                    </td>
                                    <td class="style62">
                                        <asp:TextBox ID="MaxTextBox" runat="server" Text='<%# Bind("Max") %>' />
                                    </td>
                                    <td class="style158">
                                        الحد الأقصى بعد المستوى الثانى:</td>
                                    <td class="style64">
                                        <asp:TextBox ID="Max66TextBox" runat="server" Text='<%# Bind("Max66") %>' />
                                    </td>
                                    <td class="style97">
                                    </td>
                                    <td class="style97">
                                        &nbsp;</td>
                                    <td class="style65">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style88" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style177" colspan="3" style="text-align: left">
                                        نسبة الموظف بعد :</td>
                                    <td class="style165">
                                        <asp:TextBox ID="EmpPercentTextBox" runat="server" 
                                            Text='<%# Bind("EmpPercent") %>' />
                                    </td>
                                    <td class="style157">
                                        نسبة الموظف بعد :</td>
                                    <td class="style162">
                                        <asp:TextBox ID="EmpPercent66TextBox" runat="server" 
                                            Text='<%# Bind("EmpPercent66") %>' />
                                    </td>
                                    <td class="style100">
                                        &nbsp;</td>
                                    <td class="style100">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style176" colspan="3" style="text-align: left">
                                        الحد الأقصى للمكافأة الشاملة قبل:</td>
                                    <td class="style72">
                                        <asp:TextBox ID="Max1TextBox" runat="server" Text='<%# Bind("Max1") %>' />
                                    </td>
                                    <td class="style159" style="text-align: right">
                                        الحد الأقصى للمكافأة الشاملة قبل:</td>
                                    <td class="style59">
                                        <asp:TextBox ID="Max166TextBox" runat="server" Text='<%# Bind("Max166") %>' />
                                    </td>
                                    <td class="style99">
                                        &nbsp;</td>
                                    <td class="style99">
                                        &nbsp;</td>
                                    <td class="style32">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style176" colspan="3" style="text-align: left">
                                        الحد الأقصى للمكافأة الشاملة بعد:</td>
                                    <td class="style165" style="margin-right: 80px">
                                        <asp:TextBox ID="MaxAfter1TextBox" runat="server" 
                                            Text='<%# Bind("MaxAfter1") %>' />
                                    </td>
                                    <td class="style157" style="margin-right: 80px">
                                        الحد الأقصى للمكافأة الشاملة بعد:</td>
                                    <td class="style162">
                                        <asp:TextBox ID="MaxAfter166TextBox" runat="server" 
                                            Text='<%# Bind("MaxAfter166") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style176" colspan="3" style="text-align: left">
                                        نسبة المكافأة الشاملة قبل:</td>
                                    <td class="style165" style="margin-right: 80px">
                                        <asp:TextBox ID="EmpPercent1TextBox" runat="server" 
                                            Text='<%# Bind("EmpPercent1") %>' />
                                    </td>
                                    <td class="style157" style="margin-right: 80px">
                                        نسبة المكافأة الشاملة قبل:</td>
                                    <td class="style162">
                                        <asp:TextBox ID="EmpPercent166TextBox" runat="server" 
                                            Text='<%# Bind("EmpPercent166") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style86" style="text-align: left">
                                    </td>
                                    <td class="style179" colspan="3" style="text-align: left">
                                        نسبة المكافأة الشاملة بعد:</td>
                                    <td class="style165" style="margin-right: 80px">
                                        <asp:TextBox ID="EmpPercentAfter1TextBox" runat="server" 
                                            Text='<%# Bind("EmpPercentAfter1") %>' />
                                    </td>
                                    <td class="style157" style="margin-right: 80px">
                                        نسبة المكافأة الشاملة بعد:</td>
                                    <td class="style162">
                                        <asp:TextBox ID="EmpPercentAfter166TextBox" runat="server" 
                                            Text='<%# Bind("EmpPercentAfter166") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                    </td>
                                    <td style="margin-right: 80px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style86" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style179" colspan="3" style="text-align: left">
                                        نسبة خصم الدواء المحلى:</td>
                                    <td class="style165" style="margin-right: 80px">
                                        <asp:TextBox ID="LocaldeductPercentTextBox" runat="server" 
                                            Text='<%# Bind("LocaldeductPercent") %>' />
                                    </td>
                                    <td class="style157" style="margin-right: 80px">
                                        نسبة خصم الدواء المستورد:</td>
                                    <td class="style162">
                                        <asp:TextBox ID="ForeignDeductPercentTextBox" runat="server" 
                                            Text='<%# Bind("ForeignDeductPercent") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style32" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style31" colspan="6" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        العلاج الأسرى</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style32" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style167" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        &nbsp;</td>
                                    <td class="style138" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة</td>
                                    <td class="style166" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة +1</td>
                                    <td class="style182" rowspan="10" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        &nbsp;</td>
                                    <td class="style160" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة +2</td>
                                    <td class="style31" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة +3+000</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000">
                                        &nbsp;</td>
                                    <td class="style171">
                                        &nbsp;</td>
                                    <td class="style172">
                                        &nbsp;</td>
                                    <td class="style174">
                                        &nbsp;</td>
                                    <td class="style172">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        رئيس الشركة</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife11TextBox" runat="server" Text='<%# Bind("Wife11") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus111TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus111") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus211TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus211") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus311TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus311") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مساعد رئيس الشركة</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife22TextBox" runat="server" Text='<%# Bind("Wife22") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus122TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus122") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus222TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus222") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus322TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus322") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مدير عام</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife33TextBox" runat="server" Text='<%# Bind("Wife33") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus233TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus233") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus133TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus133") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus333TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus333") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مدير عام مساعد</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife44TextBox" runat="server" Text='<%# Bind("Wife44") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus144TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus144") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus244TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus244") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus344TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus344") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مستوى أول</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife55TextBox" runat="server" Text='<%# Bind("Wife55") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus155TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus155") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus255TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus255") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus355TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus355") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مستوى ثاني</td>
                                    <td class="style171">
                                        <asp:TextBox ID="Wife66TextBox" runat="server" Text='<%# Bind("Wife66") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus166TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus166") %>' />
                                    </td>
                                    <td class="style174">
                                        <asp:TextBox ID="WifePlus266TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus266") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:TextBox ID="WifePlus366TextBox" runat="server" 
                                            Text='<%# Bind("WifePlus366") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="3" style="font-family: Tahoma; color: #000000;">
                                        مخصص&nbsp; العلاج الأسرى:</td>
                                    <td class="style172">
                                        <asp:TextBox ID="FamilySpecifiedTextBox" runat="server" 
                                            Text='<%# Bind("FamilySpecified") %>' />
                                    </td>
                                    <td class="style174">
                                        لائحة العلاج لعام :</td>
                                    <td class="style172">
                                        <asp:TextBox ID="YearMtTextBox" runat="server" Text='<%# Bind("YearMt") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="3" style="font-family: Tahoma; color: #000000;">
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="حفظ" />
                                    </td>
                                    <td class="style172">
                                        &nbsp;</td>
                                    <td class="style174">
                                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="ألغاء" />
                                    </td>
                                    <td class="style172">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Panel ID="Panel3" runat="server" Height="578px">
                            <table style="width:100%; height: 258px;">
                                <tr>
                                    <td class="style86">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style112" colspan="2" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style164">
                                        &nbsp;</td>
                                    <td class="style184">
                                        &nbsp;</td>
                                    <td class="style94">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style86">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td class="style112" colspan="2" style="text-align: left">
                                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' 
                                            Visible="False" />
                                    </td>
                                    <td class="style164">
                                        &nbsp;</td>
                                    <td class="style184">
                                        &nbsp;</td>
                                    <td class="style94">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style87">
                                        &nbsp;</td>
                                    <td class="style155">
                                        &nbsp;</td>
                                    <td class="style91" colspan="5" 
                                        style="border: thin solid CornflowerBlue; color: #000000; text-align: center; background-color: #E6EEFC; font-family: Tahoma;">
                                        العلاج الشخصى</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style87">
                                        &nbsp;</td>
                                    <td class="style155">
                                        &nbsp;</td>
                                    <td bgcolor="#E6EEFC" class="style111" colspan="3" 
                                        style="border-width: thin; border-color: CornflowerBlue; border-top-style: solid; border-right-style: solid; border-bottom-style: solid;">
                                        المستوى الأول</td>
                                    <td bgcolor="#E6EEFC" class="style111" colspan="2" 
                                        style="border-width: thin; border-color: CornflowerBlue; border-top-style: solid; border-bottom-style: solid; border-left-style: solid;">
                                        المستوى الثانى</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style101">
                                        &nbsp;</td>
                                    <td class="style17">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style88">
                                        &nbsp;</td>
                                    <td class="style42" colspan="3">
                                        <span class="style180">الحد الأقصى قبل المستوى الأول:</span>
                                    </td>
                                    <td class="style165" 
                                        style="border-left-width: medium; border-left-style: double">
                                        <asp:Label ID="MaxBeforeLabel" runat="server" CssClass="style161" 
                                            style="color: #000000; font-family: Tahoma;" Text='<%# Bind("MaxBefore") %>' />
                                    </td>
                                    <td class="style185">
                                        الحد الأقصى قبل المستوى الثانى:
                                    </td>
                                    <td class="style162">
                                        <asp:Label ID="MaxBefore66Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("MaxBefore66") %>' />
                                    </td>
                                    <td class="style96">
                                        &nbsp;</td>
                                    <td class="style96">
                                        &nbsp;</td>
                                    <td class="style42">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style89">
                                        &nbsp;</td>
                                    <td class="style178" colspan="3">
                                        الحد الأقصى بعد المستوى الأول:
                                    </td>
                                    <td class="style62" 
                                        style="border-left-width: medium; border-left-style: double">
                                        <asp:Label ID="MaxLabel" runat="server" CssClass="style161" 
                                            style="color: #000000; font-family: Tahoma;" Text='<%# Bind("Max") %>' />
                                    </td>
                                    <td class="style158">
                                        الحد الأقصى بعد المستوى الثانى:</td>
                                    <td class="style64">
                                        <asp:Label ID="Max66Label" runat="server" CssClass="style161" 
                                            style="text-align: right; color: #000000;" Text='<%# Bind("Max66") %>' />
                                    </td>
                                    <td class="style97">
                                    </td>
                                    <td class="style97">
                                        &nbsp;</td>
                                    <td class="style65">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style88" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style177" colspan="3" style="text-align: left">
                                        نسبة الموظف بعد :</td>
                                    <td class="style165" 
                                        style="border-left-width: medium; border-left-style: double">
                                        <asp:Label ID="EmpPercentLabel" runat="server" CssClass="style161" 
                                            style="color: #000000; font-family: Tahoma;" Text='<%# Bind("EmpPercent") %>' />
                                    </td>
                                    <td class="style185">
                                        نسبة الموظف بعد :</td>
                                    <td class="style162">
                                        <asp:Label ID="EmpPercent66Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("EmpPercent66") %>' />
                                    </td>
                                    <td class="style100">
                                        &nbsp;</td>
                                    <td class="style100">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style176" colspan="3" style="text-align: left">
                                        الحد الأقصى للمكافأة الشاملة قبل:</td>
                                    <td class="style72" 
                                        style="border-left-width: medium; border-left-style: double">
                                        <asp:Label ID="Max1Label" runat="server" CssClass="style161" 
                                            style="color: #000000; font-family: Tahoma;" Text='<%# Bind("Max1") %>' />
                                    </td>
                                    <td class="style159">
                                        الحد الأقصى للمكافأة الشاملة قبل:</td>
                                    <td class="style59">
                                        <asp:Label ID="Max166Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("Max166") %>' />
                                    </td>
                                    <td class="style99">
                                        &nbsp;</td>
                                    <td class="style99">
                                        &nbsp;</td>
                                    <td class="style32">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style176" colspan="3" style="text-align: left">
                                        الحد الأقصى للمكافأة الشاملة بعد:</td>
                                    <td class="style165" 
                                        style="border-left-width: medium; border-left-style: double;">
                                        <asp:Label ID="MaxAfter1Label" runat="server" CssClass="style161" 
                                            style="color: #000000; font-family: Tahoma;" Text='<%# Bind("MaxAfter1") %>' />
                                    </td>
                                    <td class="style185" style="margin-right: 80px">
                                        الحد الأقصى للمكافأة الشاملة بعد:</td>
                                    <td class="style162">
                                        <asp:Label ID="MaxAfter166Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("MaxAfter166") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style176" colspan="3" style="text-align: left">
                                        نسبة المكافأة الشاملة قبل:</td>
                                    <td class="style165" 
                                        style="border-left-width: medium; border-left-style: double;">
                                        <asp:Label ID="EmpPercent1Label" runat="server" CssClass="style161" 
                                            style="color: #000000; font-family: Tahoma;" 
                                            Text='<%# Bind("EmpPercent1") %>' />
                                    </td>
                                    <td class="style185" style="margin-right: 80px">
                                        نسبة المكافأة الشاملة قبل:</td>
                                    <td class="style162">
                                        <asp:Label ID="EmpPercent166Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("EmpPercent166") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style86" style="text-align: left">
                                    </td>
                                    <td class="style179" colspan="3" style="text-align: left">
                                        نسبة المكافأة الشاملة بعد:</td>
                                    <td class="style165" 
                                        style="border-left-width: medium; border-left-style: double;">
                                        <asp:Label ID="EmpPercentAfter1Label" runat="server" CssClass="style161" 
                                            style="color: #000000; font-family: Tahoma;" 
                                            Text='<%# Bind("EmpPercentAfter1") %>' />
                                    </td>
                                    <td class="style185" style="margin-right: 80px">
                                        نسبة المكافأة الشاملة بعد:</td>
                                    <td class="style162">
                                        <asp:Label ID="EmpPercentAfter166Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("EmpPercentAfter166") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                    </td>
                                    <td style="margin-right: 80px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style86" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style179" colspan="3" style="text-align: left">
                                        نسبة خصم الدواء المحلى:</td>
                                    <td class="style165" 
                                        style="border-left-width: medium; border-left-style: double;">
                                        <asp:Label ID="LocaldeductPercentLabel" runat="server" CssClass="style161" 
                                            style="text-align: right; color: #000000; font-family: Tahoma;" 
                                            Text='<%# Bind("LocaldeductPercent") %>' />
                                    </td>
                                    <td class="style185" style="margin-right: 80px">
                                        نسبة خصم الدواء المستورد:</td>
                                    <td class="style162">
                                        <asp:Label ID="ForeignDeductPercentLabel" runat="server" CssClass="style161" 
                                            style="text-align: right; color: #000000;" 
                                            Text='<%# Bind("ForeignDeductPercent") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style32" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style31" colspan="5" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        العلاج الأسرى</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style32" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style167" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        &nbsp;</td>
                                    <td class="style138" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة</td>
                                    <td class="style166" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة +1</td>
                                    <td class="style184" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة +2</td>
                                    <td class="style31" 
                                        style="border: thin solid CornflowerBlue; text-align: center; color: #000000; background-color: #E6EEFC; font-family: Tahoma;">
                                        زوجة +3+000</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        رئيس الشركة</td>
                                    <td class="style171">
                                        <asp:Label ID="Wife11Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("Wife11") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus111Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("WifePlus111") %>' />
                                    </td>
                                    <td class="style187">
                                        <asp:Label ID="WifePlus211Label" runat="server" CssClass="style161" 
                                            Text='<%# Bind("WifePlus211") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus311Label" runat="server" CssClass="style175" 
                                            style="color: #000000" Text='<%# Bind("WifePlus311") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مساعد رئيس الشركة</td>
                                    <td class="style171">
                                        <asp:Label ID="Wife22Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("Wife22") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus122Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("WifePlus122") %>' />
                                    </td>
                                    <td class="style187">
                                        <asp:Label ID="WifePlus222Label" runat="server" CssClass="style161" 
                                            Text='<%# Bind("WifePlus222") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus322Label" runat="server" CssClass="style175" 
                                            style="color: #000000" Text='<%# Bind("WifePlus322") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مدير عام</td>
                                    <td class="style171">
                                        <asp:Label ID="Wife33Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("Wife33") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus133Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("WifePlus133") %>' />
                                    </td>
                                    <td class="style187">
                                        <asp:Label ID="WifePlus233Label" runat="server" CssClass="style161" 
                                            Text='<%# Bind("WifePlus233") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus333Label" runat="server" CssClass="style175" 
                                            style="color: #000000" Text='<%# Bind("WifePlus333") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مدير عام مساعد</td>
                                    <td class="style171">
                                        <asp:Label ID="Wife44Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("Wife44") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus144Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("WifePlus144") %>' />
                                    </td>
                                    <td class="style187">
                                        <asp:Label ID="WifePlus244Label" runat="server" CssClass="style161" 
                                            Text='<%# Bind("WifePlus244") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus344Label" runat="server" CssClass="style175" 
                                            style="color: #000000" Text='<%# Bind("WifePlus344") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مستوى أول</td>
                                    <td class="style171">
                                        <asp:Label ID="Wife55Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("Wife55") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus155Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("WifePlus155") %>' />
                                    </td>
                                    <td class="style187">
                                        <asp:Label ID="WifePlus255Label" runat="server" CssClass="style161" 
                                            Text='<%# Bind("WifePlus255") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus355Label" runat="server" CssClass="style175" 
                                            style="color: #000000" Text='<%# Bind("WifePlus355") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="2" style="font-family: Tahoma; color: #000000;">
                                        مستوى ثاني</td>
                                    <td class="style171">
                                        <asp:Label ID="Wife66Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("Wife66") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus166Label" runat="server" CssClass="style161" 
                                            style="color: #000000" Text='<%# Bind("WifePlus166") %>' />
                                    </td>
                                    <td class="style187">
                                        <asp:Label ID="WifePlus266Label" runat="server" CssClass="style161" 
                                            Text='<%# Bind("WifePlus266") %>' />
                                    </td>
                                    <td class="style172">
                                        <asp:Label ID="WifePlus366Label" runat="server" CssClass="style175" 
                                            style="color: #000000" Text='<%# Bind("WifePlus366") %>' />
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="3" style="font-family: Tahoma; color: #000000;">
                                        مخصص&nbsp; العلاج الأسرى:</td>
                                    <td class="style172">
                                        <asp:Label ID="FamilySpecifiedLabel" runat="server" 
                                            style="color: #000000; font-family: Tahoma; font-size: small" 
                                            Text='<%# Bind("FamilySpecified") %>' />
                                    </td>
                                    <td class="style187">
                                        &nbsp;</td>
                                    <td class="style172">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style90" style="text-align: left">
                                        &nbsp;</td>
                                    <td class="style169" colspan="3" style="font-family: Tahoma; color: #000000;">
                                        <span class="style108">
                                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                            CommandName="New" CssClass="style110" Text="جديد" Visible="False" />
                                        </span>
                                    </td>
                                    <td class="style172">
                                        &nbsp;</td>
                                    <td class="style187">
                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                            CommandName="Edit" CssClass="style110" Text="تعديل" Visible="False" />
                                    </td>
                                    <td class="style172">
                                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                            CommandName="Delete" CssClass="style110" Text="حذف" Visible="False" />
                                        <asp:ConfirmButtonExtender ID="DeleteButton_ConfirmButtonExtender" 
                                            runat="server" ConfirmText="هل أنت متأكد من حذف لائحة العام ؟" Enabled="True" 
                                            TargetControlID="DeleteButton">
                                        </asp:ConfirmButtonExtender>
                                    </td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td class="style100" style="margin-right: 80px">
                                        &nbsp;</td>
                                    <td style="margin-right: 80px">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:FormView>
            </div>
            <br />
            <asp:SqlDataSource ID="sdsMtRules" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                DeleteCommand="DELETE FROM [MtRules] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [MtRules] ([MaxBefore], [Max], [EmpPercent], [Max1], [MaxAfter1], [EmpPercent1], [EmpPercentAfter1], [LocaldeductPercent], [ForeignDeductPercent], [FamilySpecified], [MaxBefore66], [Max66], [EmpPercent66], [Max166], [MaxAfter166], [EmpPercent166], [EmpPercentAfter166], [Wife11], [WifePlus111], [WifePlus211], [WifePlus311], [Wife22], [WifePlus122], [WifePlus222], [WifePlus322], [Wife33], [WifePlus233], [WifePlus133], [WifePlus333], [Wife44], [WifePlus144], [WifePlus166], [WifePlus266], [WifePlus366], [YearMt]) VALUES (@MaxBefore, @Max, @EmpPercent, @Max1, @MaxAfter1, @EmpPercent1, @EmpPercentAfter1, @LocaldeductPercent, @ForeignDeductPercent, @FamilySpecified, @MaxBefore66, @Max66, @EmpPercent66, @Max166, @MaxAfter166, @EmpPercent166, @EmpPercentAfter166, @Wife11, @WifePlus111, @WifePlus211, @WifePlus311, @Wife22, @WifePlus122, @WifePlus222, @WifePlus322, @Wife33, @WifePlus233, @WifePlus133, @WifePlus333, @Wife44, @WifePlus144, @WifePlus166, @WifePlus266, @WifePlus366, @YearMt)" 
                SelectCommand="SELECT id, MaxBefore, Max, EmpPercent, Max1, MaxAfter1, EmpPercent1, EmpPercentAfter1, LocaldeductPercent, ForeignDeductPercent, FamilySpecified, MaxBefore66, Max66, EmpPercent66, Max166, MaxAfter166, EmpPercent166, EmpPercentAfter166, Wife11, WifePlus111, WifePlus211, WifePlus311, Wife22, WifePlus122, WifePlus222, WifePlus322, Wife33, WifePlus233, WifePlus133, WifePlus333, Wife44, WifePlus144, WifePlus166, WifePlus266, WifePlus366, YearMt, WifePlus244, WifePlus344, Wife55, WifePlus155, WifePlus255, WifePlus355, Wife66 FROM MtRules WHERE (YearMt = @YearMt)" 
                
                
                
                UpdateCommand="UPDATE [MtRules] SET [MaxBefore] = @MaxBefore, [Max] = @Max, [EmpPercent] = @EmpPercent, [Max1] = @Max1, [MaxAfter1] = @MaxAfter1, [EmpPercent1] = @EmpPercent1, [EmpPercentAfter1] = @EmpPercentAfter1, [LocaldeductPercent] = @LocaldeductPercent, [ForeignDeductPercent] = @ForeignDeductPercent, [FamilySpecified] = @FamilySpecified, [MaxBefore66] = @MaxBefore66, [Max66] = @Max66, [EmpPercent66] = @EmpPercent66, [Max166] = @Max166, [MaxAfter166] = @MaxAfter166, [EmpPercent166] = @EmpPercent166, [EmpPercentAfter166] = @EmpPercentAfter166, [Wife11] = @Wife11, [WifePlus111] = @WifePlus111, [WifePlus211] = @WifePlus211, [WifePlus311] = @WifePlus311, [Wife22] = @Wife22, [WifePlus122] = @WifePlus122, [WifePlus222] = @WifePlus222, [WifePlus322] = @WifePlus322, [Wife33] = @Wife33, [WifePlus233] = @WifePlus233, [WifePlus133] = @WifePlus133, [WifePlus333] = @WifePlus333, [Wife44] = @Wife44, [WifePlus144] = @WifePlus144, [WifePlus166] = @WifePlus166, [WifePlus266] = @WifePlus266, [WifePlus366] = @WifePlus366, [YearMt] = @YearMt WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MaxBefore" Type="Single" />
                    <asp:Parameter Name="Max" Type="Single" />
                    <asp:Parameter Name="EmpPercent" Type="Single" />
                    <asp:Parameter Name="Max1" Type="Single" />
                    <asp:Parameter Name="MaxAfter1" Type="Single" />
                    <asp:Parameter Name="EmpPercent1" Type="Single" />
                    <asp:Parameter Name="EmpPercentAfter1" Type="Single" />
                    <asp:Parameter Name="LocaldeductPercent" Type="Single" />
                    <asp:Parameter Name="ForeignDeductPercent" Type="Single" />
                    <asp:Parameter Name="FamilySpecified" Type="Single" />
                    <asp:Parameter Name="MaxBefore66" Type="Single" />
                    <asp:Parameter Name="Max66" Type="Single" />
                    <asp:Parameter Name="EmpPercent66" Type="Single" />
                    <asp:Parameter Name="Max166" Type="Single" />
                    <asp:Parameter Name="MaxAfter166" Type="Single" />
                    <asp:Parameter Name="EmpPercent166" Type="Single" />
                    <asp:Parameter Name="EmpPercentAfter166" Type="Single" />
                    <asp:Parameter Name="Wife11" Type="Single" />
                    <asp:Parameter Name="WifePlus111" Type="Single" />
                    <asp:Parameter Name="WifePlus211" Type="Single" />
                    <asp:Parameter Name="WifePlus311" Type="Single" />
                    <asp:Parameter Name="Wife22" Type="Single" />
                    <asp:Parameter Name="WifePlus122" Type="Single" />
                    <asp:Parameter Name="WifePlus222" Type="Single" />
                    <asp:Parameter Name="WifePlus322" Type="Single" />
                    <asp:Parameter Name="Wife33" Type="Single" />
                    <asp:Parameter Name="WifePlus233" Type="Single" />
                    <asp:Parameter Name="WifePlus133" Type="Single" />
                    <asp:Parameter Name="WifePlus333" Type="Single" />
                    <asp:Parameter Name="Wife44" Type="Single" />
                    <asp:Parameter Name="WifePlus144" Type="Single" />
                    <asp:Parameter Name="WifePlus166" Type="Single" />
                    <asp:Parameter Name="WifePlus266" Type="Single" />
                    <asp:Parameter Name="WifePlus366" Type="Single" />
                    <asp:Parameter Name="YearMt" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlYearMt" DefaultValue="0" Name="YearMt" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MaxBefore" Type="Single" />
                    <asp:Parameter Name="Max" Type="Single" />
                    <asp:Parameter Name="EmpPercent" Type="Single" />
                    <asp:Parameter Name="Max1" Type="Single" />
                    <asp:Parameter Name="MaxAfter1" Type="Single" />
                    <asp:Parameter Name="EmpPercent1" Type="Single" />
                    <asp:Parameter Name="EmpPercentAfter1" Type="Single" />
                    <asp:Parameter Name="LocaldeductPercent" Type="Single" />
                    <asp:Parameter Name="ForeignDeductPercent" Type="Single" />
                    <asp:Parameter Name="FamilySpecified" Type="Single" />
                    <asp:Parameter Name="MaxBefore66" Type="Single" />
                    <asp:Parameter Name="Max66" Type="Single" />
                    <asp:Parameter Name="EmpPercent66" Type="Single" />
                    <asp:Parameter Name="Max166" Type="Single" />
                    <asp:Parameter Name="MaxAfter166" Type="Single" />
                    <asp:Parameter Name="EmpPercent166" Type="Single" />
                    <asp:Parameter Name="EmpPercentAfter166" Type="Single" />
                    <asp:Parameter Name="Wife11" Type="Single" />
                    <asp:Parameter Name="WifePlus111" Type="Single" />
                    <asp:Parameter Name="WifePlus211" Type="Single" />
                    <asp:Parameter Name="WifePlus311" Type="Single" />
                    <asp:Parameter Name="Wife22" Type="Single" />
                    <asp:Parameter Name="WifePlus122" Type="Single" />
                    <asp:Parameter Name="WifePlus222" Type="Single" />
                    <asp:Parameter Name="WifePlus322" Type="Single" />
                    <asp:Parameter Name="Wife33" Type="Single" />
                    <asp:Parameter Name="WifePlus233" Type="Single" />
                    <asp:Parameter Name="WifePlus133" Type="Single" />
                    <asp:Parameter Name="WifePlus333" Type="Single" />
                    <asp:Parameter Name="Wife44" Type="Single" />
                    <asp:Parameter Name="WifePlus144" Type="Single" />
                    <asp:Parameter Name="WifePlus166" Type="Single" />
                    <asp:Parameter Name="WifePlus266" Type="Single" />
                    <asp:Parameter Name="WifePlus366" Type="Single" />
                    <asp:Parameter Name="YearMt" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        &nbsp;</p>
    </asp:Content>

