<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/MT.master" AutoEventWireup="false" CodeFile="MtHome.aspx.vb" Inherits="Pages_MtHome" %>

<%@ Register src="WebUserSecurityManager.ascx" tagname="WebUserSecurityManager" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
         <br />
  <center>
      <asp:Image ID="Image1" runat="server" Height="129px" Width="141px" 
          ImageUrl="~/Images/Petromaint-logo2.png" />
  <h1>مرحبا<br />
   اهلا بك فى برنامج العلاج</h1>
      <h1>&nbsp;</h1>
      <p>للحصول على اداء افضل يرجى تحميل برنامج&nbsp;
          <asp:HyperLink ID="HyperLink1" runat="server" 
              NavigateUrl="~/21.0.1180.60_chrome_installer.exe">Google Chrome</asp:HyperLink>
         


          </p>  </center>
   <div style="text-align:center">
   
   </div>
   
                

             
            

</asp:Content>

