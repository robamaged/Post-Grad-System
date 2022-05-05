<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FillProgressReport.aspx.cs" Inherits="Milestone3.FillProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" style="z-index: 1" Text="thesis serial number"></asp:Label>
            <br />
            <asp:TextBox ID="thesisserialnumber" runat="server" CssClass="auto-style2" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="auto-style3" style="z-index: 1" Text="progress report number"></asp:Label>
            <br />
            <asp:TextBox ID="progressreportnumber" runat="server" CssClass="auto-style4" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" CssClass="auto-style5" style="z-index: 1" Text="state"></asp:Label>
            <br />
            <asp:TextBox ID="state" runat="server" CssClass="auto-style6" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" CssClass="auto-style7" style="z-index: 1" Text="description"></asp:Label>
            <br />
            <asp:TextBox ID="description" runat="server" CssClass="auto-style8"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" CssClass="auto-style9" style="z-index: 1" Text="student id"></asp:Label>
            <br />
            <asp:TextBox ID="studentid" runat="server" CssClass="auto-style10" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style11" style="z-index: 1" OnClick="Button1_Click" Text="Fill" />
        </div>
    </form>
</body>
</html>
