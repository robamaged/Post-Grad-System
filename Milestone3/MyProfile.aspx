<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="Milestone3.MyProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 546px">
            <asp:Label ID="Label1" runat="server" Text="student id"></asp:Label>
            <br />
            <asp:TextBox ID="studid" runat="server" CssClass="auto-style1" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style2" Style="z-index: 1; height: 26px;" OnClick="Button1_Click1" Text="view" />
        </div>
    </form>
</body>
</html>
