<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/MT.master" AutoEventWireup="false" CodeFile="MtEmployeeData.aspx.vb" Inherits="Pages_MtEmployeeData" %>

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
        .style168
        {
            text-align: center;
            direction: ltr;
        }
        .style173
        {
            direction: ltr;
        }
        .style182
        {
            font-size: medium;
        }
        .style170
    {
        width: 100%;
        background-color: #FFFF99;
    }
        .style174
        {
            background-color: #66CCFF;
            color: #FF0000;
            font-size: medium;
            text-align: left;
        }
        .style172
        {
            background-color: #FF66CC;
            text-align: right;
        }
        .style183
        {
            width: 17px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="sds" runat="server">
        <ContentTemplate>
          
  <asp:Panel ID="pnlOperationAuditing" runat="server" Direction="RightToLeft" style="background-color: #FFFF99">   
                <table class="style14">
                    <tr>
                        <td class="style182" width="65px" style="text-align:left;">
                            سنة العلاج :</td>
                        <td>
                            <asp:DropDownList ID="ddlYearMt" runat="server" AutoPostBack="True" 
                                DataSourceID="sdsYearMt" DataTextField="YearMt" DataValueField="YearMt" 
                                Height="30px" Width="336px">
                                <asp:ListItem Selected="True">2013</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%">
                                <tr>
                                    <td class="style183">
                                        <asp:ImageButton ID="btnFrst" runat="server" Height="45px" 
                                            ImageUrl="~/Images/frst.png" Width="45px" />
                                    </td>
                                    <td width="20px">
                                        <asp:ImageButton ID="btnEmpprv" runat="server" Height="45px" 
                                            ImageUrl="~/Images/ltr.png" Width="45px" />
                                    </td>
                                    <td width="50px">
                                        <asp:Label ID="lblEmpCount" runat="server" Width="80px"></asp:Label>
                                    </td>
                                    <td style="text-align:center" width="100px">
                                        <asp:TextBox ID="txtRegFilter" runat="server" AutoPostBack="True" 
                                            CssClass="style154" Height="30px" 
                                            style="color: #FFFFFF; background-color: #000000" Width="100px">0</asp:TextBox>
                                    </td>
                                    <td width="10px">
                                        <asp:CompareValidator ID="CompareValidator18" runat="server" 
                                            ControlToValidate="txtRegFilter" Display="Dynamic" 
                                            ErrorMessage=" من فضلك ادخل رقم مناسب" ForeColor="Red" Operator="DataTypeCheck" 
                                            Type="Integer">*</asp:CompareValidator>
                                    </td>
                                    <td width="20px">
                                        <asp:ImageButton ID="btnEmpNxt" runat="server" Height="45px" 
                                            ImageUrl="~/Images/rtl.png" Width="45px" />
                                    </td>
                                    <td width="20px">
                                        <asp:ImageButton ID="btnLst" runat="server" Height="45px" 
                                            ImageUrl="~/Images/lst.png" Width="45px" />
                                    </td>
                                    <td width="2px">
                                        <asp:LinkButton ID="btnS" runat="server">.</asp:LinkButton>
                                    </td>
                                    <td width="20px">
                                        <uc1:WebUserSecurityManager ID="wuc1" runat="server" 
                                            ApplicationName="MedicalTreatment" ConnectionString="HRWEbDbConnectionString" 
                                            PermissionError="~/Pages/PermissionError.aspx" />
                                    </td>
                                    <td style="width:250px;">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
            </table>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
              </td>
            </tr>
            </table>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            </tr>                 
            </table>
       
          <asp:Panel ID="PanelSearch" runat="server" Direction="RightToLeft" DefaultButton="btnS">
            
                </td>
                </tr>
                <tr>
                    <td dir="rtl" valign="top" style="text-align:right;">                    
                            <asp:FormView ID="fvHRData" runat="server" CaptionAlign="Right" CellPadding="4" 
                                DataKeyNames="Code" DataSourceID="sdsHRData" 
                                EmptyDataText=".                .                 ...  من   فضلك   ادخل   رقم   القيد    " 
                                ForeColor="#333333" Height="63px" Width="502px">
                                <EditItemTemplate>
                                    <table class="style170">
                                        <tr>
                                            <td class="style174" width="120px">
                                                <b>
                                                <asp:Image ID="Image1" runat="server" BorderColor="White" BorderStyle="Solid" 
                                                    BorderWidth="5px" Height="109px" 
                                                    ImageUrl='<%# "ShowImage.ashx?Code=" & eval("Code") %>' />
                                                </b>
                                            </td>
                                            <td class="style172" width="220px">
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                رقم التسجيل :</td>
                                            <td class="style172" style="background-color:Lime;">
                                                <span class="style15">
                                                <asp:Label ID="Regist_No1Label2" runat="server" CssClass="style33" 
                                                    ForeColor="Red" Text='<%# Bind("Regist_No1") %>' />
                                                </span>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                كود :</td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="CodeLabel3" runat="server" CssClass="style18" Font-Bold="True" 
                                                    Font-Italic="False" ForeColor="Black" Text='<%# Eval("Code") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                الاسم :</td>
                                            <td class="style172">
                                                <asp:TextBox ID="E_NameTextBox" runat="server" CssClass="style18" 
                                                    Font-Italic="False" Text='<%# Bind("E_Name") %>' />
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                الوظيفة:</td>
                                            <td class="style172">
                                                <asp:Label ID="JOB_NAMELabel" runat="server" CssClass="style18" 
                                                    Font-Italic="False" Text='<%# Bind("JOB_NAME") %>' />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                الحالة الاجتماعية :</td>
                                            <td class="style172">
                                                <span class="style15">
                                                <asp:Label ID="Marital_Status_ALabel0" runat="server" CssClass="style18" 
                                                    Text='<%# Bind("Marital_Status_A") %>' />
                                                </span>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                تاريخ الميلاد :
                                            </td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="D_BirthLabel0" runat="server" CssClass="style18" 
                                                    Font-Bold="True" Font-Italic="False" Text='<%# Bind("D_Birth", "{0:d}") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                العمر :
                                            </td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="YearsOldLabel" runat="server" CssClass="style18" 
                                                    Font-Bold="True" Font-Italic="False" ForeColor="Blue" 
                                                    Text='<%# Eval("YearsOld") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                امراض مزمنة :</td>
                                            <td class="style172">
                                                <asp:TextBox ID="EndemicTextBox" runat="server" MaxLength="50" 
                                                    Text='<%# Bind("Endemic") %>' Width="180px" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                كشف بتروجاس :
                                            </td>
                                            <td class="style172">
                                                <asp:DropDownList ID="ddl" Width="180px" runat="server" 
                                                    SelectedValue='<%# Bind("كشف_بتروجاس") %>'>
                                                    <asp:ListItem>لم يتم الكشف</asp:ListItem>
                                                    <asp:ListItem>لائق</asp:ListItem>
                                                    <asp:ListItem>معاد لعدم الحضور</asp:ListItem>
                                                    <asp:ListItem>غير لائق</asp:ListItem>
                                                    <asp:ListItem>تم الحجز</asp:ListItem>
                                                    <asp:ListItem>النقراشي</asp:ListItem>
                                                    <asp:ListItem>لم يتم الكشف</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                إستلام دفتر :
                                            </td>
                                            <td class="style172">
                                                <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" 
                                                    SelectedValue='<%# Bind("إستلام_دفتر") %>' Width="185px">
                                                    <asp:ListItem>لا</asp:ListItem>
                                                    <asp:ListItem>نعم</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                ملاحظات بتروجاس :
                                            </td>
                                            <td class="style172">
                                                <asp:TextBox ID="PetroGasNotesTextBox" runat="server" Height="100px" 
                                                    MaxLength="149" Text='<%# Bind("PetroGasNotes") %>' TextMode="MultiLine" 
                                                    Width="180px" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                ملاحظات علاجية :</td>
                                            <td class="style172">
                                                <asp:TextBox ID="NotesTextBox" runat="server" Height="175px" MaxLength="149" 
                                                    Text='<%# Bind("Notes1") %>' TextMode="MultiLine" Width="180px" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                &nbsp;</td>
                                            <td class="style172">
                                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                                    CommandName="Cancel" onclick="UpdateCancelButton_Click" Text="إلغاء" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                                    onclick="UpdateButton_Click" Text="حفظ" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
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
                                    <table class="style170">
                                        <tr>
                                            <td class="style174" width="120px">                                               
                                                <asp:Image ID="Image1" runat="server" BorderColor="White" BorderStyle="Solid" 
                                                    BorderWidth="5px" Height="109px" 
                                                    ImageUrl='<%# "ShowImage.ashx?Code=" & eval("Code") %>' />
                                               </td>
                                            <td class="style172" width="220px">
                                                </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                رقم التسجيل :</td>
                                            <td class="style172" style="background-color:Lime;">
                                                <span class="style15">
                                                <asp:Label ID="Regist_No1Label2" runat="server" CssClass="style33" 
                                                    ForeColor="Red" Text='<%# Bind("Regist_No1") %>' />
                                                </span>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                كود :</td>
                                            <td class="style172">

                                                <b>
                                                <asp:Label ID="CodeLabel3" runat="server" CssClass="style18" Font-Bold="True" 
                                                    Font-Italic="False" ForeColor="Black" Text='<%# Eval("Code") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                الاسم :</td>
                                            <td class="style172">
                                                <asp:Label ID="E_NameLabel2" runat="server" CssClass="style18"
                                                    Text='<%# Bind("E_Name") %>' Font-Italic="False" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                الوظيفة:</td>
                                            <td class="style172">
                                                <asp:Label ID="JOB_NAMELabel" runat="server" CssClass="style18" 
                                                    Text='<%# Bind("JOB_NAME") %>' Font-Italic="False" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                الحالة الاجتماعية :</td>
                                            <td class="style172">
                                                <span class="style15">
                                                <asp:Label ID="Marital_Status_ALabel0" runat="server"   CssClass="style18"  
                                                    Text='<%# Bind("Marital_Status_A") %>' />
                                                </span>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                الموقف الحالي :
                                            </td>
                                            <td class="style172">
                                                <span class="style16">
                                                <asp:Label ID="الموقف_الحاليLabel0" runat="server"  CssClass="style18" 
                                                    Text='<%# Bind("الموقف_الحالي") %>' />
                                                </span>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                 نوع التعاقد :</td>
                                            <td class="style172">
                                                <span class="style18"><span class="style16">
                                                <asp:Label ID="نوع_التعاقدLabel0" runat="server"  CssClass="style18" 
                                                    Text='<%# Bind("نوع_التعاقد") %>' />
                                                </span></span>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                نوع الوظيفة :</td>
                                            <td class="style172">
                                                <span class="style18"><b>
                                                <asp:Label ID="نوع_الوظيفةLabel0" runat="server" Font-Bold="True"  CssClass="style18" 
                                                    Font-Italic="False" Text='<%# Bind("نوع_الوظيفة") %>' />
                                                </b></span>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                تاريخ الميلاد : </td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="D_BirthLabel0" runat="server" Font-Bold="True"  CssClass="style18"  
                                                    Font-Italic="False" Text='<%# Bind("D_Birth", "{0:d}") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                               العمر : </td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="YearsOldLabel" runat="server" Font-Bold="True"  CssClass="style18" 
                                                    Font-Italic="False" ForeColor="Blue" Text='<%# Eval("YearsOld") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                               عضو مجلس ادارة :</td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="BoardMemberLabel0" runat="server" Font-Bold="True"   CssClass="style18" 
                                                    Font-Italic="False" Text='<%# Bind("BoardMember") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                امراض مزمنة :</td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="EndemicLabel0" runat="server" Font-Bold="True"   CssClass="style18" 
                                                    Font-Italic="False" Text='<%# Bind("Endemic") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                               كشف بتروجاس : </td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="كشف_بتروجاسLabel0" runat="server" Font-Bold="True"   CssClass="style18" 
                                                    Font-Italic="False" style="direction: ltr" Text='<%# Bind("كشف_بتروجاس") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                كشف اول : </td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="كشف_اولLabel0" runat="server" Font-Bold="True"  CssClass="style18" 
                                                    Font-Italic="False" Text='<%# Bind("كشف_اول", "{0:d}") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                إستلام دفتر : </td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="إستلام_دفترLabel0" runat="server" Font-Bold="True"  CssClass="style18" 
                                                    Font-Italic="False" Text='<%# Bind("إستلام_دفتر") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                ملاحظات بتروجاس : </td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="PetroGasNotesLabel0" runat="server" Font-Bold="True"  CssClass="style18" 
                                                    Font-Italic="False" Text='<%# Bind("PetroGasNotes") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                                المستوى الوظيفى : </td>
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="slLabel0" runat="server"  Font-Bold="True"  CssClass="style18"  
                                                    Font-Italic="False" ForeColor="Black" Text='<%# Bind("sl") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style174">
                                               ملاحظات علاجية :</td> 
                                            <td class="style172">
                                                <b>
                                                <asp:Label ID="NotesLabel0" runat="server" Font-Bold="True" Font-Italic="False"  CssClass="style18" 
                                                    Text='<%# Bind("Notes1") %>' />
                                                </b>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            </asp:FormView>
                            <div class="style173" style="text-align:right;">
                                <asp:LinkButton ID="btnHistory" runat="server" Visible="False">حافظة البنود الخاصة</asp:LinkButton>                             
                            </div>
                      
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
                        <asp:Panel ID="Panel8" runat="server" BackColor="#B6AD92" Visible="False" 
                            Width="900px">
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
                        <asp:ModalPopupExtender ID="Panel8_ModalPopupExtender2" runat="server" 
                            CancelControlID="btnOk" DynamicServiceMethod="" DynamicServicePath="" 
                            Enabled="True" PopupControlID="Panel8" PopupDragHandleControlID="Panel8" 
                            RepositionMode="None" TargetControlID="btnHistory">
                        </asp:ModalPopupExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                </table>
            </asp:Panel>
         
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:SqlDataSource ID="sdsYearMt" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" 
                SelectCommand="SELECT YearMt FROM MtRules ORDER BY YearMt DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsHRData" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MTConnectionString %>" SelectCommand="SELECT h.Code, h.E_Name, h.PetroGasNotes, h.كشف_ثاني, h.كشف_اول, h.Notes, h.BoardMember, h.Endemic, h.sl, h.نوع_الوظيفة,
 h.نوع_التعاقد, h.الموقف_الحالي, h.إستلام_دفتر, h.كشف_بتروجاس, h.Regist_No1, h.Sex_A, h.Marital_Status_A, h.Regist_No,
  h.D_Birth, h.Picture, h.JOB_NAME, h.YearsOld ,m.Notes
  
   FROM HRdata h inner join MedicalNotes m
   on h.Code = m.Code
    WHERE (h.Regist_No1 = @reg)" UpdateCommand=" UPDATE HRdata SET PetroGasNotes = @PetroGasNotes, 
 @Endemic = @Endemic, 
كشف_بتروجاس = @كشف_بتروجاس
, إستلام_دفتر = @إستلام_دفتر, 
E_Name = @E_Name 
WHERE (Code = @code)
 Update MedicalNotes Set Notes = @Notes where Code= @Code">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtRegFilter" DefaultValue="0" Name="reg" 
                        PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PetroGasNotes" />
                    <asp:Parameter Name="Endemic" />
                    <asp:Parameter Name="كشف_بتروجاس" />
                    <asp:Parameter Name="إستلام_دفتر" />
                    <asp:Parameter Name="E_Name" />
                    <asp:Parameter Name="code" />
                    <asp:Parameter Name="Notes" />
                    <asp:Parameter Name="Code" />
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
            <asp:ModalPopupExtender ID="Panel17_ModalPopupExtender" runat="server" 
                BehaviorID="Panel17" CancelControlID="btnOk0" DynamicServicePath="" 
                Enabled="True" PopupControlID="Panel17" PopupDragHandleControlID="Panel17" 
                RepositionMode="None" TargetControlID="hfTreatTypeId">
            </asp:ModalPopupExtender>
            <br />
            <br />

    </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>  
</asp:Content>

