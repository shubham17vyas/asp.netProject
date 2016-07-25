<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ItemDetail.aspx.cs" Inherits="ItemDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDB %>" SelectCommand="SELECT * FROM ListDetails WHERE (itemID = @itemID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="itemID" QueryStringField="id" Type="String" />
                
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="itemID" DataSourceID="SqlDataSource1" OnItemCommand="FormView1_ItemCommand">
            <%-- we can remove all the other insert, edit, delete item templates --%>
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("itemID") %>' />
            
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("itemID","images/{0}.jpg") %>' Height="500" Width="500" /></td>
                        </td>
                        <td>
                   </tr>
                </table>
                <asp:Label ID="Label1" runat="server" Text='CATEGORY:' Font-Bold="true" Font-Size="Large" ForeColor="Brown" />
               
               <asp:Label ID="catLabel" runat="server" Text='<%# Bind("catName") %>' Font-Bold="true" Font-Size="X-Large" ForeColor="Chocolate" />
                <br />
                
                <asp:Label ID="Label2" runat="server" Text='ITEM:' Font-Bold="true" Font-Size="Large" ForeColor="Brown" />
               
                <asp:Label ID="itemLabel" runat="server" Text='<%# Bind("items") %>' Font-Bold="true" Font-Size="X-Large" ForeColor="Chocolate" />
                               <br />
                <asp:Label ID="Label3" runat="server" Text='INGREDIENTS:' Font-Bold="true" Font-Size="Large" ForeColor="Brown" />
                <asp:Label ID="inLabel" runat="server" Text='<%# Bind("ingredients") %>' Font-Bold="true" Font-Size="X-Large" ForeColor="Chocolate" />
                <br />
               <asp:Label ID="Label4" runat="server" Text='Price :' Font-Bold="true" Font-Size="Large" ForeColor="Brown" />
                
                <br /> 
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource2" Font-Bold="true" Font-Size="Large" ForeColor="Chocolate" DataTextField= "price" DataValueField="price" RepeatDirection="Horizontal">
                </asp:RadioButtonList> <br />
           <asp:Label ID="Label5" runat="server" Text='(PETIT)' Font-Bold="true" Font-Size="Medium" ForeColor="Brown" /> &nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label6" runat="server" Text='(MOYEN)' Font-Bold="true" Font-Size="Medium" ForeColor="Brown" /> &nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label7" runat="server" Text="(GRANDE' )" Font-Bold="true" Font-Size="Medium" ForeColor="Brown" />
     
                
                <br />
                </td>
                </tr>
                
                <asp:Button ID="addToCartButton" runat="server"  BackColor="Chocolate" Font-Bold="true" Font-Size="X-Large" ForeColor="Wheat" BorderColor="Olive"
                    Text="Add to Cart" />
                <asp:Label ID="Label8" runat="server" Text="Please choose a size for the item below and add to cart ^.^" Font-Bold="true" Font-Size="Large" ForeColor="Olive"></asp:Label>
            
            </ItemTemplate>
        </asp:FormView>
   
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myDB %>" SelectCommand="SELECT itemID, price FROM [PriceList] WHERE ([itemID] = @itemID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="FormView1" Name="itemID" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
    </asp:SqlDataSource>
                


</asp:Content>

