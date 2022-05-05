<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterExaminer.aspx.cs" Inherits="Milestone3.RegisterExaminer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 558px">
    <form id="form1" runat="server">
        <div style="height: 630px">
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
        &nbsp;
            <asp:TextBox ID="examinername" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="field of work"></asp:Label>
        &nbsp;
            <asp:TextBox ID="fieldofwork" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="password"></asp:Label>
        &nbsp;
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                <asp:ListItem>National</asp:ListItem>
                <asp:ListItem>International</asp:ListItem>
            </asp:CheckBoxList>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Defense Date"></asp:Label>
        &nbsp;
            <asp:TextBox ID="defensedate" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Thesis serial number"></asp:Label>
        &nbsp;
            <asp:TextBox ID="thesisserialnumber" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Go to Login" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
