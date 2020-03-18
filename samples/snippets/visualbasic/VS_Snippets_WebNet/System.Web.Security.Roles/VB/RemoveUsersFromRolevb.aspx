<!-- <Snippet9> -->
<%@ Page Language="VB" %>
<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="System.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

Dim rolesArray() As String
Dim users() As String

Public Sub Page_Load()
  Msg.Text = ""

  If Not IsPostBack Then
    ' Bind roles to ListBox.

    rolesArray = Roles.GetAllRoles()
    RolesListBox.DataSource = rolesArray
    RolesListBox.DataBind()
  End If
End Sub

Public Sub RolesListBox_OnSelectedIndexChanged(sender As Object, args As EventArgs)
  ' Bind users to ListBox.

  users = Roles.GetUsersInRole(RolesListBox.SelectedItem.Value)
  UsersListBox.DataSource = users
  UsersListBox.DataBind()
End Sub

Public Sub RemoveUsers_OnClick(sender As Object, args As EventArgs)
  ' Verify that at least one user and a role are selected.

  Dim user_indices() As Integer = UsersListBox.GetSelectedIndices()

  If user_indices.Length = 0 Then
    Msg.Text = "Please select one or more users."
    Return
  End If

  If RolesListBox.SelectedItem Is Nothing Then
    Msg.Text = "Please select a role."
    Return
  End If


  ' Create list of users to be removed from the selected role.

  Dim usersList(user_indices.Length - 1) As String

  For i As Integer = 0 To usersList.Length - 1
    usersList(i) = UsersListBox.Items(user_indices(i)).Value
  Next


  ' Remove the users from the selected role.

  Try
    Roles.RemoveUsersFromRole(usersList, RolesListBox.SelectedItem.Value)  
    Msg.Text = "User(s) removed from Role."

    ' Rebind users to ListBox.

    users = Roles.GetUsersInRole(RolesListBox.SelectedItem.Value)
    UsersListBox.DataSource = users
    UsersListBox.DataBind()
  Catch e As HttpException
    Msg.Text = e.Message
  End Try
End Sub

</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>Sample: Role Membership</title>
</head>
<body>

<form runat="server" id="PageForm">
  <h3>Role Membership</h3>
  <asp:Label id="Msg" ForeColor="maroon" runat="server" /><br />
  <table cellpadding="3" border="0">
    <tr>
      <td valign="top">Roles:</td>
      <td valign="top"><asp:ListBox id="RolesListBox" AutoPostBack="true" 
                                    OnSelectedIndexChanged="RolesListBox_OnSelectedIndexChanged" 
                                    runat="server" Rows="8" /></td>
      <td valign="top">Users:</td>
      <td valign="top"><asp:ListBox id="UsersListBox" Rows="8" 
                                    SelectionMode="Multiple" runat="server" /></td>
      <td valign="top"><asp:Button Text="Remove User(s) from Role" id="RemoveUsersButton"
                                   runat="server" OnClick="RemoveUsers_OnClick" /></td>
    </tr>
  </table>
</form>

</body>
</html>
<!-- </Snippet9> -->