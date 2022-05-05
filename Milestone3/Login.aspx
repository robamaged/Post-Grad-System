<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Milestone3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Please log in<br />
        Username:<p>
            <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        </p>
        <p>
            Password:</p>
        <p>
            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="signIn" runat="server" OnClick="login" Text="Login" />
        <br />
        <br />
        If you don&#39;t have an account, register.<br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Register as a Student" OnClick="Button1_Click1" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Register as a Supervisor" OnClick="Button1_Click2"/>
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="Register as an Examiner"  OnClick="Button1_Click3"/>
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" Text="Register as an Admin"  OnClick="Button1_Click4"/>
    </form>
</body>
</html>
