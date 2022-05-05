<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewMyProfile.aspx.cs" Inherits="Milestone3.ViewMyProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" CssClass="auto-style1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="z-index: 1">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
