<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddExaminer.aspx.cs" Inherits="Milestone3.AddExaminer" %>

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
            <asp:Label ID="Label2" runat="server" CssClass="auto-style3" style="z-index: 1" Text="defense date"></asp:Label>
            <br />
            <asp:TextBox ID="defensedate" runat="server" CssClass="auto-style4" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" CssClass="auto-style5" style="z-index: 1" Text="examiner name"></asp:Label>
            <br />
            <asp:TextBox ID="examinername" runat="server" CssClass="auto-style6" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" CssClass="auto-style7" style="z-index: 1" Text="password"></asp:Label>
            <br />
            <asp:TextBox ID="pass" runat="server" CssClass="auto-style8" style="z-index: 1"></asp:TextBox>
            <br />
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                <asp:ListItem>National</asp:ListItem>
                <asp:ListItem>International</asp:ListItem>
            </asp:CheckBoxList>
            <br />
            <asp:Label ID="Label5" runat="server" CssClass="auto-style9" style="z-index: 1" Text="field of work"></asp:Label>
            <br />
            <asp:TextBox ID="fieldofwork" runat="server" CssClass="auto-style10" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style11" Style="z-index: 1" OnClick="Button1_Click" Text="add" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
