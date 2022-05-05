<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterSupervisor.aspx.cs" Inherits="Milestone3.RegisterSupervisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 660px">
    <form id="form1" runat="server">
        <div style="height: 262px">
            <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
        &nbsp;
            <asp:TextBox ID="firstname" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
        &nbsp;
            <asp:TextBox ID="lastname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
        &nbsp;
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Faculty"></asp:Label>
        &nbsp;
            <asp:TextBox ID="faculty" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
        &nbsp;
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <br />
            <br />
<asp:Button runat="server" Text="Register" OnClick="Button1_Click3" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="go2login" runat="server" Text="Go to Login" OnClick="Button1_Click4" />
        </div>
    </form>
</body>

</html>
