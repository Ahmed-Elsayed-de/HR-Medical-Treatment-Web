Imports System.Data.SqlClient
Imports System.Security.Principal

Partial Class Pages_WebUserSecurityManager
    Inherits System.Web.UI.UserControl

    Public Event btnNewClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event btnEditClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event btnDeleteClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private _connectionString As String
    Public WriteOnly Property ConnectionString() As String
        Set(ByVal value As String)
            _connectionString = value
        End Set
    End Property
    Dim _NewBtnVisable As Boolean = True
    Public Property NewBtnVisable As Boolean
        Set(ByVal value As Boolean)
            _NewBtnVisable = value
            ViewState("NewBtnVisable") = value
        End Set
        Get
            _NewBtnVisable = CType(ViewState("NewBtnVisable"), Boolean)
            Return _NewBtnVisable
        End Get
    End Property
    Dim _EditBtnVisable As Boolean = True
    Public Property EditBtnVisable As Boolean
        Set(ByVal value As Boolean)
            _EditBtnVisable = value
            ViewState("EditBtnVisable") = value
        End Set
        Get
            _EditBtnVisable = CType(ViewState("EditBtnVisable"), Boolean)
            Return _EditBtnVisable
        End Get
    End Property
    Dim _DeleteBtnVisable As Boolean = True
    Public Property DeleteBtnVisable As Boolean
        Set(ByVal value As Boolean)
            _DeleteBtnVisable = value
            ViewState("DeleteBtnVisable") = value
        End Set
        Get
            _DeleteBtnVisable = CType(ViewState("DeleteBtnVisable"), Boolean)
            Return _DeleteBtnVisable
        End Get
    End Property
    Private _applicationName As String
    Public WriteOnly Property ApplicationName() As String
        Set(ByVal value As String)
            If value = "" Then
                Throw New Exception("Application Name in Web User Control in Page " + Request.RawUrl + " Is required")
            Else
                _applicationName = value
            End If
        End Set
    End Property

    Private _RoleName As String
    Public Property RoleName() As String
        Get
            Return _RoleName
        End Get
        Set(ByVal value As String)
            _RoleName = value
        End Set
    End Property

    Private _PermissionError As String
    Public Property PermissionError() As String
        Get
            Return _PermissionError
        End Get
        Set(ByVal value As String)
            If value = "" Then
                Throw New Exception("Permission Error Page in Web User Control in Page " + Request.RawUrl + " Is required")
            Else
                _PermissionError = value
            End If
        End Set
    End Property
    Private _Login As String
    Public Property Login() As String
        Get
            Return _Login
        End Get
        Set(ByVal value As String)
            _Login = value
        End Set
    End Property
    Private _read As Boolean
    Public ReadOnly Property Read() As Boolean
        Get
            Return _read
        End Get
    End Property

    Private _delete As Boolean
    Public ReadOnly Property Delete() As Boolean
        Get
            Return _delete
        End Get

    End Property
    Private _audit As Boolean
    Public ReadOnly Property Audit() As Boolean
        Get
            Return _audit
        End Get

    End Property
    Private _edit As Boolean
    Public ReadOnly Property Edit() As Boolean
        Get
            Return _edit
        End Get

    End Property

    Private _insert As Boolean
    Public ReadOnly Property Insert() As Boolean
        Get
            Return _insert
        End Get

    End Property
    Private _Control As String
    Public Property DataControlID() As String
        Get
            Return _Control
        End Get
        Set(ByVal value As String)
            _Control = value
        End Set
    End Property
    Private _ControlParent As String
    Public Property DataControlParent() As String
        Get
            Return _ControlParent
        End Get
        Set(ByVal value As String)
            _ControlParent = value
        End Set
    End Property
    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As CommandEventArgs) Handles btnNew1.Command
        RaiseEvent btnNewClick(sender, e)
    End Sub
    Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As CommandEventArgs) Handles btnEdit1.Command
        RaiseEvent btnEditClick(sender, e)
    End Sub
    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As CommandEventArgs) Handles btnDelete1.Command
        RaiseEvent btnDeleteClick(sender, e)
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        Try

            Session("ApplicationName") = _applicationName
            If RoleName = "" Then
                RoleName = _applicationName + System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath)

                If Session("NewRole") IsNot Nothing Then
                    Session("OldRole") = Session("NewRole")
                End If
                Session("NewRole") = RoleName
            End If

            If Page.User.Identity.IsAuthenticated Then
                Session("UserName") = Page.User.Identity.Name
                If Page.User.IsInRole(RoleName) Then
                    If Session("InRole") Is Nothing Or Session("NewRole") <> Session("OldRole") Then
                        Session("InRole") = True
                        Dim cn As New SqlConnection
                        cn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings(_connectionString).ConnectionString
                        Dim cmd As New SqlCommand("SELECT ProgramName, LoweredRoleName, LoweredUserName, [Read], Edit, [Insert], Audit, [Delete] FROM UsersPermissionsByAppView WHERE (ProgramName = @ProgramName ) AND (LoweredUserName = @LoweredUserName) AND (LoweredRoleName = @LoweredRoleName ) ", cn)

                        cmd.Parameters.AddWithValue("@ProgramName", _applicationName)
                        cmd.Parameters.AddWithValue("@LoweredUserName", Page.User.Identity.Name.ToLower())
                        cmd.Parameters.AddWithValue("@LoweredRoleName", RoleName.ToLower())
                        cn.Open()

                        Dim dr As SqlDataReader = cmd.ExecuteReader()
                        If dr.Read() Then
                            _read = dr.Item("Read")
                            _edit = dr.Item("Edit")
                            _insert = dr.Item("Insert")
                            _audit = dr.Item("Audit")
                            _delete = dr.Item("Delete")


                            '   Session("_read") = _read
                            Session("_edit") = _edit
                            Session("_insert") = _insert
                            ' Session("_audit") = _audit
                            Session("_delete") = _delete


                            If NewBtnVisable Then
                                btnNew1.Visible = _insert
                            Else
                                btnNew1.Visible = NewBtnVisable
                            End If
                            If EditBtnVisable Then
                                btnEdit1.Visible = _edit
                            Else
                                btnEdit1.Visible = EditBtnVisable
                            End If
                            If DeleteBtnVisable Then
                                btnDelete1.Visible = _delete
                            Else
                                btnDelete1.Visible = DeleteBtnVisable
                            End If
                        End If
                        dr.Close()
                        cn.Close()
                    Else ''''''''''''''''''''''
                        If NewBtnVisable Then
                            btnNew1.Visible = Session("_insert")
                        Else
                            btnNew1.Visible = NewBtnVisable
                        End If
                        If EditBtnVisable Then
                            btnEdit1.Visible = Session("_edit")
                        Else
                            btnEdit1.Visible = EditBtnVisable
                        End If
                        If DeleteBtnVisable Then
                            btnDelete1.Visible = Session("_delete")
                        Else
                            btnDelete1.Visible = DeleteBtnVisable
                        End If


                    End If
                Else
                    Response.Redirect(PermissionError)
                End If


            Else
                If Login = "" Then
                    System.Web.Security.FormsAuthentication.RedirectToLoginPage()
                Else
                    Response.Redirect(Login + "?ReturnUrl=" + Request.Path)
                End If
            End If


        Catch ex As Exception
            Dim myHostName As String = Request.UserHostName
            Dim pcName As String = System.Net.Dns.GetHostEntry(myHostName).HostName
            Dim user As WindowsIdentity = WindowsIdentity.GetCurrent()
            ExceptionHelper.HandleException(Server.MapPath("~/Logs/Log.log"), Request.Url.AbsoluteUri, Request.Url.AbsolutePath, Session("pcName"), Session("UserName"), Page.User.Identity.Name, ex, Page)

        End Try
    End Sub
End Class
