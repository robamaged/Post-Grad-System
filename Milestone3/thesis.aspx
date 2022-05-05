<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thesis.aspx.cs" Inherits="Milestone3.thesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style2" style="z-index: 1" Text="Student id"></asp:Label>
            <br />
            <asp:TextBox ID="studentID" runat="server" CssClass="auto-style3" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style4" style="z-index: 1" Text="view theses" OnClick="Button1_Click" />
              <asp:GridView ID="GridView1" runat="server" CssClass="auto-style2">
        </asp:GridView>
        </div>
    </form>
</body>
</html>
