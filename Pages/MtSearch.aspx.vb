
Partial Class Pages_MtSearch
    Inherits System.Web.UI.Page

    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, Session("pcName"), Session("UserName"), Me.User.Identity.Name, Server.GetLastError(), Me)
        Server.ClearError()
        Response.Redirect("Error.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtSearchWord.Focus()
        Page.Form.DefaultButton = btnSearch.UniqueID
        wuc1.NewBtnVisable = False
        wuc1.EditBtnVisable = False
        wuc1.DeleteBtnVisable = False

    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        SqlDataSourceHrData.DataBind()
        GridView1.DataBind()
    End Sub

    Protected Sub txtSearchWord_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSearchWord.TextChanged
        SqlDataSourceHrData.DataBind()
        GridView1.DataBind()
    End Sub
End Class
