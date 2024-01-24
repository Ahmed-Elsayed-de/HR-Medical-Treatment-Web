<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MtPrint.aspx.vb" Inherits="Pages_MtPrint" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register src="WebUserSecurityManager.ascx" tagname="WebUserSecurityManager" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      
    <style type="text/css">


a:link, a:visited
{
    color: #034af3;
    font-family: Tahoma;
    font-size: small;
}

*{
	text-decoration: none;
	margin: 0px;
	padding: 0px;
	list-style: none;	
	outline:none;
    text-align: right;
}
*{
	text-decoration: none;
	margin: 0px;
	padding: 0px;
	list-style: none;	
	outline:none;
}
    </style>
   
</head>
<body>
    <form id="form1" runat="server" >
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <center>
        <div dir="rtl">
        
            <uc1:WebUserSecurityManager ID="wuc1" runat="server" 
                ApplicationName="MedicalTreatment" ConnectionString="HRWEbDbConnectionString" 
                PermissionError="~/Pages/PermissionError.aspx" />
        
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            </asp:UpdatePanel>
            <br />
        
        </div>
        </center>
     
    
    </div>
    </form>
</body>
</html>
