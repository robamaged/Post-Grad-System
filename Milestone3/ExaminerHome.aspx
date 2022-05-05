<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExaminerHome.aspx.cs" Inherits="Milestone3.ExaminerHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 924px">
    <form id="form1" runat="server">
        <div style="height: 911px">
            <asp:Label ID="Label1" runat="server" Text="View my account"></asp:Label>
        &nbsp;
        <asp:Button ID="Button2" runat="server" Text="Go to account" Height="32px" Width="182px" OnClick="ViewAccount" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Defenses Details"></asp:Label>
        &nbsp;
        <asp:Button ID="Button3" runat="server" Text="Go to defenses" OnClick="Defenses"/>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Add comments for a defense:"></asp:Label>
        &nbsp;<br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Thesis serial number"></asp:Label>
            &nbsp;
            <asp:TextBox ID="serialNo" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label7" runat="server" Text="Defence Date"></asp:Label>
            &nbsp;
            <asp:TextBox ID="defDate" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label8" runat="server" Text="Comments"></asp:Label>
            &nbsp;
            <asp:TextBox ID="comments" runat="server"></asp:TextBox>
            <br />
            <br />
&nbsp;<asp:Button ID="Button4" runat="server" Text="Add comments" OnClick="AddComments"/>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Add grade for a defense"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Thesis serial number"></asp:Label>
            &nbsp;
            <asp:TextBox ID="thSerialNo" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label10" runat="server" Text="Defence Date"></asp:Label>
            &nbsp;
            <asp:TextBox ID="DDate" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label11" runat="server" Text="Grade"></asp:Label>
            &nbsp;
            <asp:TextBox ID="grade" runat="server"></asp:TextBox>
            <br />
            <br />
        &nbsp;
        <asp:Button ID="Button5" runat="server" Text="Grade defense" OnClick="GradeDefense"/>
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Search for thesis"></asp:Label>
            &nbsp;
            <asp:TextBox ID="thesisTitle" runat="server"></asp:TextBox>
            <br />
            <br />
        &nbsp;
            <asp:Button ID="Button6" runat="server" Text="Search" OnClick="ThesisPage"/>
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            
            <br />
            <asp:Button ID="Button1" runat="server"  OnClick="Button6_Click" Text="Back To Login Page" />
        </div>
    </form>
</body>
</html>
