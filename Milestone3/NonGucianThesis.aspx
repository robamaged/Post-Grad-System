<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NonGucianThesis.aspx.cs" Inherits="Milestone3.NonGucianThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style2" style="z-index: 1" Text="student id"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="studentId" runat="server" CssClass="auto-style3" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style4" Style="z-index: 1" OnClick="Button1_Click" Text="view my Theses" />
            <asp:GridView ID="GridView1" runat="server" CssClass="auto-style2">
        </asp:GridView>
        </div>
    </form>
</body>
</html>
