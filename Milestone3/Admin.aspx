<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supervisors.aspx.cs" Inherits="Admin.Supervisors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 1086px;
            width: 901px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 1050px; width: 899px">
            <br />
            <asp:Button ID="Button1" runat="server" Text="Display Supervisors" OnClick="Button1_Click" />
            <br />
            <asp:GridView ID="GridView1" runat="server" BackColor="#006699">
            </asp:GridView>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Display Thesis" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" BackColor="#990099">
            </asp:GridView>
            
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            
            <br />
            <asp:Label ID="Label1" runat="server" Text="Thesis Serial Number:"></asp:Label>
            <asp:TextBox ID="Thesisno" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Amount:"></asp:Label>
            <asp:TextBox ID="amount" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Number of Installments:"></asp:Label>
            <asp:TextBox ID="installmentsno" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Fund Percentage:"></asp:Label>
            <asp:TextBox ID="fundpercent" runat="server"></asp:TextBox>
            <br />
            
            <br />
            <asp:Button ID="Button3" runat="server" Text="Issue Thesis Payment" OnClick="Button3_Click" />
            
            <br />
            <asp:Label ID="Label5" runat="server" Text="Payment ID:"></asp:Label>
            <asp:TextBox ID="paymentid" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" server="" Text="Installment Start Date:"></asp:Label>
            <asp:TextBox ID="startdate" runat="server"></asp:TextBox>
            <br />
            
            <br />
            <asp:Button ID="Button4" runat="server" Text="Issue Installment" OnClick="Button4_Click" style="height: 26px" />
            
            <br />
            <br />
            
            <br />
            <asp:Label ID="Label7" runat="server" Text="Thesis Serial Number:"></asp:Label>
            &nbsp;<asp:TextBox ID="thesis" runat="server"></asp:TextBox>
            <br />
            <br />
            
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Update Thesis Extension" />
            
            <br />

            
            <br />
            <asp:Button ID="Button6" runat="server"  OnClick="Button6_Click" Text="Back To Login Page" />
            
        </div>
    </form>
</body>
</html>
