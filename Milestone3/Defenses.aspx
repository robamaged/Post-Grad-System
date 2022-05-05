<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Defenses.aspx.cs" Inherits="Milestone3.Defenses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 432px">
            <asp:Label ID="Label1" runat="server" Text="Attending Defenses:"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
