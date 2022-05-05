<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewExaminerProfile.aspx.cs" Inherits="Milestone3.ViewExaminerProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 546px">
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            
            <br />
            <asp:Label ID="Label4" runat="server" Text="Edit Profile:"></asp:Label>
            <br />
            <br />
            
            <asp:Label ID="Label1" runat="server" Text="Edit name"></asp:Label>
            <br />
            <asp:TextBox ID="newName" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Edit field of work"></asp:Label>
            <br />
            <asp:TextBox ID="newFOW" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Change password"></asp:Label>
            <br />
            <asp:TextBox ID="newPassword" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="editProfile" runat="server" Text="Submit" OnClick="editProfile_Click" />
        </div>
    </form>
</body>
</html>
