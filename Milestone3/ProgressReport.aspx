<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProgressReport.aspx.cs" Inherits="Milestone3.ProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style2" style="z-index: 1" Text="thesis serial number"></asp:Label>
            <br />
            <asp:TextBox ID="thesisserialnumber" runat="server" CssClass="auto-style3" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="auto-style4" style="z-index: 1" Text="Progress report date"></asp:Label>
            <br />
            <asp:TextBox ID="progressreportdate" runat="server" CssClass="auto-style5" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" CssClass="auto-style6" style="z-index: 1" Text="student id"></asp:Label>
            <br />
            <asp:TextBox ID="studentid" runat="server" CssClass="auto-style7" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" CssClass="auto-style8" style="z-index: 1" Text="progress report number"></asp:Label>
            <br />
            <asp:TextBox ID="progressreportnumber" runat="server" CssClass="auto-style9" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style10" style="z-index: 1" OnClick="Button1_Click" Text="Add" />
        </div>
    </form>
</body>
</html>
