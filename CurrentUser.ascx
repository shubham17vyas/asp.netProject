<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CurrentUser.ascx.cs" Inherits="CurrentUser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:ChangePassword ID="ChangePassword1" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate" ChangePasswordButtonStyle-BackColor= "Navy" ChangePasswordButtonStyle-BorderColor="Navy" ChangePasswordButtonStyle-Font-Bold="true" ChangePasswordButtonStyle-ForeColor="Wheat" CancelButtonStyle-BackColor="Navy" CancelButtonStyle-BorderColor="Navy" CancelButtonStyle-Font-Bold="true" CancelButtonStyle-ForeColor="Wheat">
</asp:ChangePassword>

<asp:Label ID="Label1" runat="server" Text="Your Profile Information" Font-Bold="true" Font-Size="Large" ForeColor="Chocolate"></asp:Label>

<table>
    <tr>
        <td><asp:Label ID="Label2" runat="server" Text="First Name :" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label>
</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>
    </tr>

    <tr>
        <td><asp:Label ID="Label3" runat="server" Text="Last Name :" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label>
</td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </td>
    </tr>
<tr>
        <td><asp:Label ID="Label4" runat="server" Text="BirthDate :" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label>
</td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox6" />
        </td>
    </tr>
<tr>
        <td><asp:Label ID="Label5" runat="server" Text="Street :" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label>
</td>
        <td>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        </td>
    </tr>
<tr>
        <td><asp:Label ID="Label6" runat="server" Text="City :" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label>
</td>
        <td>
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        </td>
    </tr>
<tr>
        <td><asp:Label ID="Label7" runat="server" Text="State :" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label>
</td>
        <td>
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        </td>
    </tr>
<tr>
        <td><asp:Label ID="Label8" runat="server" Text="ZipCode :" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label>
</td>
        <td>
            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
        </td>
    </tr>

    
<tr>
        <td><asp:Label ID="Label9" runat="server" Text="Country :" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label>
</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
<p>
    <asp:Button ID="Button1" runat="server" Text="Update Profile" OnClick="Button1_Click" ForeColor="Wheat" BackColor="Navy" BorderColor="Navy" Font-Bold="true" Font-Size="Medium" />
</p>
