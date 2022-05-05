<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseGrades.aspx.cs" Inherits="Milestone3.CourseGrades" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:GridView ID="GridView1" runat="server" CssClass="auto-style2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="z-index: 1">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
