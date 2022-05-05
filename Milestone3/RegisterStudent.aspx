<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterStudent.aspx.cs" Inherits="Milestone3.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 640px">
            First name&nbsp;
            <asp:TextBox ID="firstname" runat="server" Height="31px" style="margin-top: 2px"></asp:TextBox>
            <br />
            <br />
            Last Name&nbsp;
            <asp:TextBox ID="lastname" runat="server"></asp:TextBox>
            <br />
            <br />
            Password&nbsp;
            <asp:TextBox ID="password" runat="server" Height="30px"></asp:TextBox>
            <br />
            <br />
            Faculty&nbsp;
            <asp:TextBox ID="faculty" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                <asp:ListItem>Gucian</asp:ListItem>
                <asp:ListItem>NonGucian</asp:ListItem>
            </asp:CheckBoxList>
            <br />
            Email&nbsp;
            <asp:TextBox ID="email" runat="server" Height="30px" Width="278px"></asp:TextBox>
            <br />
            <br />
            Address&nbsp; <asp:TextBox ID="address" runat="server" Height="34px" Width="380px"></asp:TextBox>
            &nbsp;<br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click3"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="go2login" runat="server" Text="Go to Login" OnClick="Button1_Click4" />
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="addphoneNo" runat="server" Text="Add phone number" OnClick="Button1_Click5" />
        </div>
    </form>
</body>
</html>
