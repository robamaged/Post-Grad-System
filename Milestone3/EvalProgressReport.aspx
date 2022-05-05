<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EvalProgressReport.aspx.cs" Inherits="Milestone3.EvalProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" style="z-index: 1" Text="supervisor id"></asp:Label>
            <br />
            <asp:TextBox ID="supId" runat="server" CssClass="auto-style2" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="auto-style3" style="z-index: 1" Text="thesis serial no"></asp:Label>
            <br />
            <asp:TextBox ID="thesisserialno" runat="server" CssClass="auto-style4" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" CssClass="auto-style5" style="z-index: 1" Text="progress report no"></asp:Label>
            <br />
            <asp:TextBox ID="progressreportno" runat="server" CssClass="auto-style6" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" CssClass="auto-style7" style="z-index: 1" Text="evaluation"></asp:Label>
            <br />
            <asp:TextBox ID="eval" runat="server" CssClass="auto-style8" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style9" style="z-index: 1" Text="add evaluation" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
