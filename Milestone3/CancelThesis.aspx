<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelThesis.aspx.cs" Inherits="Milestone3.CancelThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" style="z-index: 1" Text="thesis serial no"></asp:Label>
            <br />
            <asp:TextBox ID="thesisserialno" runat="server" CssClass="auto-style2" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style3" Style="z-index: 1" OnClick="Button1_Click" Text="cancel" />
        </div>
    </form>
</body>
</html>
