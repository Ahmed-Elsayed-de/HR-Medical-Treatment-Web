<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/MT.master" AutoEventWireup="false" CodeFile="PermissionError.aspx.vb" Inherits="Pages_PermissionError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   
        <br />
  <center>
      <asp:Image ID="Image1" runat="server" Height="129px" Width="141px" 
          ImageUrl="~/Images/accessDenied.jpg" />
  <h1>عفوا !<br />
  حسابك ليس لة صلاحية الوصول لهذة الصفحة <br />
  لمزيد من المعلومات اتصل ب مدير النظام</h1>
  </center>
</asp:Content>

