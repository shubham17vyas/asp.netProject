<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderSummary.aspx.cs" Inherits="OrderSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="label1" runat="server" Text="" ForeColor="Chocolate" Font-Bold="true" Font-Size="Large" ></asp:Label>
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="itemID" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" OnDataBound="GridView1_DataBound" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:BoundField DataField="itemID" HeaderText="ID" SortExpression="itemID" />
            
            <asp:BoundField DataField="items" HeaderText="ITEM" SortExpression="items" />
            <asp:BoundField DataField="Price" HeaderText="PRICE" SortExpression="Price" />
            <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="quantitytxt" runat="server" Text='<%# Bind("Quantity") %>' ></asp:TextBox>
                   </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="quantitytxt" runat="server" Text='<%# Bind("Quantity") %>' ></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Enter only numbers greater than 0" ControlToValidate="quantitytxt" ValueToCompare="0" Display="Dynamic" Operator="GreaterThan" Type="Integer" ></asp:CompareValidator>
                

                </EditItemTemplate>
            </asp:TemplateField>

            <asp:ButtonField CommandName="Edit" Text="Update" />
            
            <asp:TemplateField>
            
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="btnRem" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("ITEMID") %>'></asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                Total: $<asp:Label ID="lblTotal" runat="server"></asp:Label>
                </FooterTemplate>
            
            </asp:TemplateField>
            
        </Columns>

    </asp:GridView>
    <br />
    <asp:LoginView
         ID="LoginView1" runat="server"  >
        <AnonymousTemplate>
            To place your order, please <asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="LOGIN"/>
             <br />
             <a href="CreateUser.aspx">
                REGISTER for a new account</a>.
        </AnonymousTemplate>
        <LoggedInTemplate>
            <asp:ImageButton ID="btnCheckoutWithPaypal" runat="server" ImageUrl="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" OnClick="btnCheckoutWithPaypal_Click" />
              
        </LoggedInTemplate>
     </asp:LoginView>
    
    <br />
    <br />
<asp:Label ID="lblStatus" runat="server" ></asp:Label>
    
    <asp:Label ID="Label2" runat="server" Text="Your Order will be Ready in the Next Twenty Minutes at the Latest. Please stop-by and Pick-up or Dine-In" Font-Bold="true" Font-Size="XX-Large" ForeColor="Navy"></asp:Label>
</asp:Content>

