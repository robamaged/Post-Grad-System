<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GucianNonGucian.aspx.cs" Inherits="Milestone3.GucianNonGucian" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style1" Style="z-index: 1" OnClick="Button1_Click1" Text="Gucian" />
            <asp:Button ID="Button2" runat="server" CssClass="auto-style2" OnClick="Button2_Click2" Text="NonGucian" />
        </div>
    </form>
</body>
</html>
