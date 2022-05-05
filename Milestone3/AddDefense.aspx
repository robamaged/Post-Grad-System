<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDefense.aspx.cs" Inherits="Milestone3.AddDefense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <div class="auto-style8">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style1" style="z-index: 1" Text="thesis serial no."></asp:Label>
            <br />
            <asp:TextBox ID="thesisserialno" runat="server" CssClass="auto-style2" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="auto-style3" style="z-index: 1" Text="defense date"></asp:Label>
            <br />
            <asp:TextBox ID="defensedate" runat="server" CssClass="auto-style4" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" CssClass="auto-style5" style="z-index: 1" Text="defense location"></asp:Label>
            <br />
            <asp:TextBox ID="defenseloc" runat="server" CssClass="auto-style6" style="z-index: 1"></asp:TextBox>
            <br />
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                <asp:ListItem>Gucian</asp:ListItem>
                <asp:ListItem>NonGucian</asp:ListItem>
            </asp:CheckBoxList>
            <br />

            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style9" Style="z-index: 1" OnClick="Button1_Click" Text="add" />

            <br />
            
        </div>
    </form>
</body>
</html>
