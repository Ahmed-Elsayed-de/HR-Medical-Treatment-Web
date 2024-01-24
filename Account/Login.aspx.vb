Imports System.Security.Principal
Partial Class Account_Login
    Inherits System.Web.UI.Page
    Dim AuditID As Int32 = Nothing
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("InRole") = Nothing
        Session("_edit") = Nothing
        Session("_insert") = Nothing
        Session("_delete") = Nothing
        Dim myHostName As String = Request.UserHostName
        Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        Session("pcName") = pcName
    End Sub
    Protected Sub Login1_LoggedIn(ByVal sender As Object, ByVal e As System.EventArgs) Handles Login1.LoggedIn
        LoginAuditSqlDataSource.UpdateParameters("SuccessfulLogin").DefaultValue = True
        LoginAuditSqlDataSource.UpdateParameters("ID").DefaultValue = AuditID
        LoginAuditSqlDataSource.Update()
    End Sub
    Protected Sub Login1_LoggingIn(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles Login1.LoggingIn
        LoginAuditSqlDataSource.InsertParameters("UserName").DefaultValue = Login1.UserName
        Dim uPW As String = Login1.Password
        Dim myHostName As String = Request.UserHostName
        Dim myHostIP As String = System.Net.Dns.GetHostEntry(myHostName).HostName
        LoginAuditSqlDataSource.InsertParameters("HostName").DefaultValue = myHostName
        LoginAuditSqlDataSource.InsertParameters("HostIP").DefaultValue = myHostIP
        LoginAuditSqlDataSource.InsertParameters("SuccessfulLogin").DefaultValue = False
        LoginAuditSqlDataSource.InsertParameters("Program").DefaultValue = "MedicalTreatment"
        LoginAuditSqlDataSource.InsertParameters("Time").DefaultValue = Now()
        LoginAuditSqlDataSource.Insert()
    End Sub
    Protected Sub LoginAuditSqlDataSource_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles LoginAuditSqlDataSource.Inserted
        AuditID = Convert.ToInt32(e.Command.Parameters("@ID").Value)
    End Sub
End Class