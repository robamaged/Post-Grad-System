<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPublication.aspx.cs" Inherits="Milestone3.AddPublication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" style="z-index: 1" Text="title"></asp:Label>
            <br />
            <asp:TextBox ID="title" runat="server" CssClass="auto-style2" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="auto-style3" style="z-index: 1" Text="publication date"></asp:Label>
            <br />
            <asp:TextBox ID="publicationdate" runat="server" CssClass="auto-style4" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" CssClass="auto-style5" style="z-index: 1" Text="host"></asp:Label>
            <br />
            <asp:TextBox ID="host" runat="server" CssClass="auto-style6" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" CssClass="auto-style7" style="z-index: 1" Text="place"></asp:Label>
            <br />
            <asp:TextBox ID="place" runat="server" CssClass="auto-style8" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                <asp:ListItem>accepted</asp:ListItem>
                <asp:ListItem>notaccepted</asp:ListItem>
            </asp:CheckBoxList>
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style9" style="z-index: 1" Text="Add" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
</body>
</html>
