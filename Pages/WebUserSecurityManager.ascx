<%@ Control Language="VB" AutoEventWireup="false" CodeFile="WebUserSecurityManager.ascx.vb" Inherits="Pages_WebUserSecurityManager" %>
<style type="text/css">
*{
	text-decoration: none;
	margin: 0px;
	padding: 0px;
	list-style: none;	
	outline:none;
    
}
*{
	text-decoration: none;
	margin: 0px;
	padding: 0px;
	list-style: none;	
	outline:none;
}
</style>
<div style="text-align:center;">
  <asp:ImageButton ID="btnDelete1" runat="server" Height="38px" 
                                ImageUrl="~/Images/delete.png" 
                                onclientclick="return confirm(' هل انت متاكد من الحذف ؟ ');" 
                                ToolTip="حذف" Visible="False" Width="37px" />
                            &nbsp;
                            <asp:ImageButton ID="btnNew1" runat="server" Height="38px" 
                                ImageUrl="~/Images/NewFile.png" 
                                ToolTip="  جديد" Visible="False" Width="37px" />
                            &nbsp;
                            <asp:ImageButton ID="btnEdit1" runat="server" Height="38px" 
                                ImageUrl="~/Images/edit.png" 
                                ToolTip="تعديل" Visible="False" Width="37px" />
  </center>   



