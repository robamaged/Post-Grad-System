<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHomePage.aspx.cs" Inherits="Milestone3.StudentHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Button ID="Button1" runat="server" CssClass="auto-style2" style="z-index: 1" OnClick="Button1_Click1" Text="view my profile" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="auto-style3" style="z-index: 1" OnClick="Button2_Click2" Text="thesis" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" CssClass="auto-style4" style="z-index: 1" OnClick="Button3_Click3" Text="add progress report" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" CssClass="auto-style5" style="z-index: 1" OnClick="Button4_Click4" Text="fill progress report" />
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" CssClass="auto-style6" style="z-index: 1" OnClick="Button5_Click5" Text="add publication" />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
