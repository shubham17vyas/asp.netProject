<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="blended.aspx.cs" Inherits="blended" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page">
		<div>
			<div id="body">
				<div>          <a href="menu.aspx" class="whatshot">What&#39;s Hot</a> 
                    <div>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <LayoutTemplate>
                <table>
                <tr id="groupPlaceHolder" runat="server"></tr>
            </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <td id="itemPlaceHolder" runat="server"></td>
            </tr>
            </GroupTemplate>
           <ItemTemplate>


               <td>
                    <table>
                        <tr>
                            <td>
           <%-- to show the details for each item, we add the hyperrlink below to navigate to the details page --%>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("itemID", "ItemDetail.aspx?id={0}") %>' >
           
                 <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("itemID","images/{0}.jpg") %>' Height="300" />
             <%-- in the imageurl above, we are defining the format too ..t{0}.jpg...t for thumbnails...in the folder 'images' --%>
                            </asp:HyperLink>
                                    </td>

                            <td> <br />
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("items") %>' Font-Bold="true" Font-Size="XX-Large" ForeColor="Turquoise"></asp:Label>
                           

                                </td>
                        </tr>
                    </table>
                </td>
            


                
            </ItemTemplate>
                 
            </asp:ListView>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDB %>" SelectCommand="SELECT itemID, items, ingredients, small, medium, large, images FROM ListDetails WHERE catName = 'blended'"></asp:SqlDataSource>
    


                   </div>
                    
				</div>
                </div>
		</div>

</asp:Content>

