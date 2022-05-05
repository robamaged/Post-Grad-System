<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NonGucianStudentHomePage.aspx.cs" Inherits="Milestone3.NonGucianStudentHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
  <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Button ID="Button1" runat="server" CssClass="auto-style2" Style="z-index: 1" OnClick="Button1_Click1" Text="View my profile" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="auto-style3" Style="z-index: 1" OnClick="Button2_Click2" Text="View my Theses" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" CssClass="auto-style4" Style="z-index: 1" OnClick="Button3_Click3" Text="Add Progress Report" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" CssClass="auto-style5" Style="z-index: 1" OnClick="Button4_Click4" Text="Fill Progress Report" />
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" CssClass="auto-style6" Style="z-index: 1" OnClick="Button5_Click5" Text="Add Publication" />
            <br />
            <br />
            <asp:Button ID="Button6" runat="server" CssClass="auto-style7" Style="z-index: 1" OnClick="Button6_Click6" Text="View my Courses and their grades" />
        </div>
    </form>
</body>
</html>
