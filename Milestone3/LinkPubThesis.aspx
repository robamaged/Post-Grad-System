<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LinkPubThesis.aspx.cs" Inherits="Milestone3.LinkPubThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" style="z-index: 1" Text="publication id"></asp:Label>
            <br />
            <asp:TextBox ID="pubid" runat="server" CssClass="auto-style2" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="auto-style3" style="z-index: 1" Text="thesis serial no."></asp:Label>
            <br />
            <asp:TextBox ID="thesisserialno" runat="server" CssClass="auto-style4" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style5" Style="z-index: 1" OnClick="Button1_Click" Text="link" />
        </div>
    </form>
</body>
</html>
