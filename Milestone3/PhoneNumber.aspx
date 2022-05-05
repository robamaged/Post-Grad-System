<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhoneNumber.aspx.cs" Inherits="Milestone3.PhoneNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 593px">
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
        &nbsp;
            <asp:TextBox ID="id" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Phone Number"></asp:Label>
        &nbsp;
            <asp:TextBox ID="PhoneNo" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
