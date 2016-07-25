<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProfileInfo.aspx.cs" Inherits="ProfileInfo" %>

<%@ Register Src="~/CurrentUser.ascx" TagPrefix="uc1" TagName="CurrentUser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CurrentUser runat="server" id="CurrentUser" />
     
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserName" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                
                <asp:BoundField DataField="UserName" HeaderText="User  Name" ReadOnly="True" SortExpression="UserName" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor="Navy" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Medium" ItemStyle-ForeColor="Chocolate" />
                <asp:BoundField DataField="Email" HeaderText="Email Address" ReadOnly="True" SortExpression="Email" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor="Navy" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Medium" ItemStyle-ForeColor="Chocolate" />
                <asp:BoundField DataField="LastLoginDate" HeaderText=" Last Login" ReadOnly="True" SortExpression="LastLoginDate" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor="Navy" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Medium" ItemStyle-ForeColor="Chocolate" />
                <asp:TemplateField HeaderText="Is Admin?" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor="Navy">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" />
                        <%-- set enabled to false here --%>
                    </ItemTemplate>
                </asp:TemplateField>
                <%-- convertt the change admin  role field to template.. so that we can edit it the roles there  --%>
                <asp:TemplateField HeaderText="Change Admin Role" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor="Navy">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" ForeColor="Navy" CommandName="Edit" Text="Change Role"></asp:LinkButton>
                    </ItemTemplate>
                    <%-- add the edit item template here and two buttons to update and cancle the update --%>
                    <EditItemTemplate>
                        <%-- change the below buttons to link buttons --%>
                        <asp:LinkButton ID="Button1" runat="server" Text="Update" CommandName="Update" ForeColor="Navy"/>
                        <asp:LinkButton ID="Button2" runat="server" Text="Cancel" CommandName="Cancel" ForeColor="Navy"/>

                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField CommandName="Select" Text="View Profile" ControlStyle-ForeColor="Navy"  />
            </Columns>
        </asp:GridView>

        <asp:Label ID="Label17" runat="server" Text="Profile Information for the Selected User" Visible="false" Font-Bold="true" Font-Size="X-Large" ForeColor="Olive"></asp:Label>

        <table>
    <tr>
        <td> <asp:Label ID="Label15" runat="server" Text="First Name:" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label></td>
        <td>
            <asp:Label ID="Label4" runat="server" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Navy"></asp:Label>
        </td>
    </tr>

    <tr>
        <td> <asp:Label ID="Label14" runat="server" Text="Last Name:" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label></td>
        <td>
            <asp:Label ID="Label5" runat="server" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Navy"></asp:Label>
        </td>
    </tr>
<tr>
        <td> <asp:Label ID="Label13" runat="server" Text="BirthDate:" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label></td>
        <td>
            <asp:Label ID="Label6" runat="server" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Navy"></asp:Label>
        </td>
    </tr>
<tr>
        <td> <asp:Label ID="Label12" runat="server" Text="Street Address:" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label></td>
        <td>
            <asp:Label ID="Label7" runat="server" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Navy"></asp:Label>
        </td>
    </tr>
<tr>
        <td> <asp:Label ID="Label11" runat="server" Text="City:" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label></td>
        <td>
            <asp:Label ID="Label8" runat="server" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Navy"></asp:Label>
        </td>
    </tr>
<tr>
        <td><asp:Label ID="Label3" runat="server" Text="State:" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label></td>
        <td>
            <asp:Label ID="Label9" runat="server" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Navy" ></asp:Label>
        </td>
    </tr>
<tr>
        <td><asp:Label ID="Label2" runat="server" Text="ZipCode:" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label></td>
        <td>
            <asp:Label ID="Label10" runat="server" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Navy"></asp:Label>
        </td>
    </tr>

    
<tr>
        <td> <asp:Label ID="Label16" runat="server" Text="Country:" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate"></asp:Label></td>
        <td>
            <asp:Label ID="Label1" runat="server" Visible="false" Font-Bold="true" Font-Size="Medium" ForeColor="Navy"></asp:Label>
        </td>
    </tr>
</table>
    
       
</asp:Content>

