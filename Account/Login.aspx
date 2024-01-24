<%@ Page Title="Log In" Language="VB" MasterPageFile="~/Pages/LoginMT.master" AutoEventWireup="false"
    CodeFile="Login.aspx.vb" Inherits="Account_Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
  
    <center>
       <br />
       <br />
        <br />
<configuration>
	<connectionStrings>
        <remove name="LocalSqlServer" />
  <add name="ApplicationServices" connectionString="Data Source=hrserver;Initial Catalog=hrwebdb;Persist Security Info=True;User ID=WebSecUser;Password=WebSecUser.WSU" providerName="System.Data.SqlClient" />
  <add name="HRSQLServerDBConnection" connectionString="Data Source=hrserver;Initial Catalog=HR;Persist Security Info=True;User ID=ReportUser;Password=ReportUser.RU" providerName="System.Data.SqlClient" />
  <add name="HRWEbDbConnectionString" connectionString="Data Source=HRSERVER;Initial Catalog=HRWEbDb;Persist Security Info=True;User ID=WebSecUser;Password=WebSecUser.WSU" providerName="System.Data.SqlClient" />
 </connectionStrings>
	<system.web>
        <sessionState timeout="10" />
        <customErrors mode="Off" />
  <compilation debug="true" strict="false" explicit="true" targetFramework="4.0">
			<assemblies>
				<add assembly="System.Design, Version=4.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A" />
				<add assembly="System.Web.Extensions.Design, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" />
				<add assembly="System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=B77A5C561934E089" /></assemblies></compilation>
		<authentication mode="Forms">
   <forms loginUrl="~/Account/Login.aspx" timeout="2880" />
  </authentication>
		<membership>
			<providers>
				<clear />
				<add name="AspNetSqlMembershipProvider" type="System.Web.Security.SqlMembershipProvider" connectionStringName="ApplicationServices" enablePasswordRetrieval="false" enablePasswordReset="true" requiresQuestionAndAnswer="false" requiresUniqueEmail="false" maxInvalidPasswordAttempts="10" minRequiredPasswordLength="6" minRequiredNonalphanumericCharacters="0" passwordAttemptWindow="10" applicationName="HRWebApps" />
			</providers>
		</membership>
		<profile>
			<providers>
				<clear />
				<add name="AspNetSqlProfileProvider" type="System.Web.Profile.SqlProfileProvider" connectionStringName="ApplicationServices" applicationName="HRWebApps" />
			</providers>
		</profile>
		<roleManager enabled="true">
   <providers>
    <clear />
    <add connectionStringName="ApplicationServices" applicationName="HRWebApps" name="AspNetSqlRoleProvider" type="System.Web.Security.SqlRoleProvider" />
    <add applicationName="HRWebApps" name="AspNetWindowsTokenRoleProvider" type="System.Web.Security.WindowsTokenRoleProvider" />
   </providers>
  </roleManager>
        <identity impersonate="false" />
        <globalization culture="ar-EG" uiCulture="ar-EG" />
	</system.web>
	<system.webServer>
		<modules runAllManagedModulesForAllRequests="true" />
	</system.webServer>
</configuration>
        <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" 
           BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
           Font-Names="Verdana" Font-Size="1.2em" ForeColor="#333333" Height="223px" 
           LoginButtonText="تسجيل الدخول" PasswordLabelText="كلمة المرور : " 
           PasswordRequiredErrorMessage="يجب ادخال كلمة المرور" 
           RememberMeText="تذكر الحساب المستخدم" TitleText="تسجيل الدخول" 
           UserNameLabelText="اسم المستخدم :" 
           UserNameRequiredErrorMessage="يجب ادخال اسم المستخدم" Width="480px" 
           FailureText="كلمة المرور و او اسم المستخدم غير صحيحة" 
           DestinationPageUrl="~/Pages/MtHome.aspx">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LayoutTemplate>
                <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0" style="height:223px;width:480px;">
                                <tr>
                                    <td align="center" colspan="2" 
                                        style="color:White;background-color:#5D7B9D;font-size:0.9em;font-weight:bold;">
                                        تسجيل الدخول</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">اسم المستخدم :</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="يجب ادخال اسم المستخدم" 
                                            ToolTip="يجب ادخال اسم المستخدم" ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">كلمة المرور : </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="يجب ادخال كلمة المرور" 
                                            ToolTip="يجب ادخال كلمة المرور" ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" 
                                            BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" Text="تسجيل الدخول" 
                                            ValidationGroup="Login1" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                ForeColor="White" />
       </asp:Login>
       <br />
        <asp:SqlDataSource ID="LoginAuditSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HRWEbDbConnectionString %>" 
            DeleteCommand="DELETE FROM [LoginAuditTable] WHERE [ID] = @ID" 
            InsertCommand="INSERT INTO [LoginAuditTable] ([UserName], [HostName], [SuccessfulLogin], [Program], [Time], [HostIP]) VALUES (@UserName, @HostName, @SuccessfulLogin, @Program, @Time, @HostIP);
            SELECT @ID = SCOPE_IDENTITY()" 
            SelectCommand="SELECT [ID], [UserName], [HostName], [SuccessfulLogin], [Program], [Time], [HostIP] FROM [LoginAuditTable]" 
            
            
            UpdateCommand="UPDATE LoginAuditTable SET SuccessfulLogin = @SuccessfulLogin WHERE (ID = @ID)">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="HostName" Type="String" />
                <asp:Parameter Name="SuccessfulLogin" Type="Boolean" />
                <asp:Parameter Name="Program" Type="String" />
                <asp:Parameter Name="Time" Type="DateTime" />
                <asp:Parameter Name="HostIP" Type="String" />
                <asp:Parameter Name="ID" Direction="Output" Type="Int32" DefaultValue="0" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SuccessfulLogin" Type="Boolean" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
       <br />
       <br />
   </center>
   
   
    </asp:Content>