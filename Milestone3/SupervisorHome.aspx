﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupervisorHome.aspx.cs" Inherits="Milestone3.SupervisorHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 550px">
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Students names and years spent in thesis" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Publications" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Add defense" OnClick="Button3_Click" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Evaluate progress report" OnClick="Button4_Click" />
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" Text="Cancel thesis" OnClick="Button5_Click" />
        </div>
    </form>
</body>
</html>
