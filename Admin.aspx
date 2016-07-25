<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="page">
		<div>
			<div id="body"> 
                <div>


                    <asp:SqlDataSource ID="SqlItemList" runat="server" ConnectionString="<%$ ConnectionStrings:myDB %>" 
                        DeleteCommand="DELETE FROM ListDetails WHERE itemID = @itemID" 
                        InsertCommand="INSERT INTO ListDetails (itemID, catName, items, ingredients, small, medium, large, images) VALUES (@itemID, @catName, @items, @ingredients, @small, @medium, @large, @images)" 
                        SelectCommand="SELECT * FROM [ListDetails] ORDER BY catName"
UpdateCommand="UPDATE ListDetails SET catName = @catName, items = @items, ingredients = @ingredients, small = @small, medium = @medium, large = @large, images = @images WHERE itemID = @itemID
   ">
                        <DeleteParameters>
                            <asp:Parameter Name="itemID" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="itemID" />
                            <asp:Parameter Name="catName" />
                            <asp:Parameter Name="items" />
                            <asp:Parameter Name="ingredients" />
                            <asp:Parameter Name="small" />
                            <asp:Parameter Name="medium" />
                            <asp:Parameter Name="large" />
                            <asp:Parameter Name="images" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="catName" />
                            <asp:Parameter Name="items" />
                            <asp:Parameter Name="ingredients" />
                            <asp:Parameter Name="small" />
                            <asp:Parameter Name="medium" />
                            <asp:Parameter Name="large" />
                            <asp:Parameter Name="images" />
                            <asp:Parameter Name="itemID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="true" Font-Italic="true" ForeColor="RosyBrown" OnClick="AddItemClick">ADD A NEW ITEM</asp:LinkButton>
                    <br />
                    <div>
                       <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlItemList" BorderColor="Chocolate" BorderWidth="5" AlternatingRowStyle-BackColor="Wheat"
                             AllowSorting="True" AllowPaging="True" DataKeyNames="itemID" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="itemID" HeaderText="ID" HeaderStyle-ForeColor="Chocolate" ReadOnly="True" SortExpression="itemID" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Medium" ItemStyle-ForeColor="Chocolate" />
                                <asp:BoundField DataField="catName" HeaderText="Category" HeaderStyle-ForeColor="Chocolate" SortExpression="catName" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Medium" ItemStyle-ForeColor="Chocolate" />
                                <asp:BoundField DataField="items" HeaderText="ITEM" HeaderStyle-ForeColor="Chocolate" SortExpression="items" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Medium" ItemStyle-ForeColor="Chocolate" />
                                <asp:BoundField DataField="small" HeaderText="PETIT" HeaderStyle-ForeColor="Chocolate" SortExpression="small" DataFormatString="{0:c}" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Medium" ItemStyle-ForeColor="Chocolate" />
                                <asp:BoundField DataField="medium" HeaderText="MOYEN" HeaderStyle-ForeColor="Chocolate" SortExpression="medium" DataFormatString="{0:c}" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Medium" ItemStyle-ForeColor="Chocolate" />
                                <asp:BoundField DataField="large" HeaderText="GRANDE'" HeaderStyle-ForeColor="Chocolate" SortExpression="large" DataFormatString="{0:c}" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Medium" ItemStyle-ForeColor="Chocolate" />
                                <asp:TemplateField HeaderText="IMAGE" HeaderStyle-ForeColor="Chocolate" SortExpression="images">
                                   <%--<EditItemTemplate>
                                      <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("itemID", "images/{0}.jpg" ) %>' />        
                                       </EditItemTemplate>--%>
                                <ItemTemplate>
                                  <%--<img src="images/'<%#Eval("images") %>'" alt="Image" width="220" height="208" />--%>
                         
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("itemID", "images/{0}.jpg" ) %>' Height="250" Width="250" />        
                                      
                              </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Edit" Font-Size="Medium"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?')" Font-Size="Medium"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
           </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlItemList1" runat="server" ConnectionString="<%$ ConnectionStrings:myDB %>" DeleteCommand="DELETE FROM ListDetails WHERE itemID = @itemID" InsertCommand="INSERT INTO ListDetails (itemID, catName, items, ingredients, small, medium, large, images) VALUES (@itemID, @catName, @items, @ingredients, @small, @medium, @large, @images)" SelectCommand="SELECT * FROM ListDetails WHERE itemID = @itemID" UpdateCommand="UPDATE [Products] SET [Prod_Name] = @Prod_Name, [Prod_Brand] = @Prod_Brand, [Prod_Price] = @Prod_Price, [Prod_Type] = @Prod_Type, [Prod_Image] = @Prod_Image, [Date_Added] = @Date_Added WHERE [Prod_ID] = @Prod_ID
        ">
                            <DeleteParameters>
                                <asp:Parameter Name="itemID" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="itemID" />
                                <asp:Parameter Name="catName" />
                                <asp:Parameter Name="items" />
                                <asp:Parameter Name="ingredients" />
                                <asp:Parameter Name="small" />
                                <asp:Parameter Name="medium" />
                                <asp:Parameter Name="large" />
                                <asp:Parameter Name="images" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" Name="itemID" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Prod_Name" />
                                <asp:Parameter Name="Prod_Brand" />
                                <asp:Parameter Name="Prod_Price" />
                                <asp:Parameter Name="Prod_Type" />
                                <asp:Parameter Name="Prod_Image" />
                                <asp:Parameter Name="Date_Added" />
                                <asp:Parameter Name="Prod_ID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="itemID" DataSourceID="SqlItemList1" onitemupdated="DetailsView1_ItemUpdated" 
        onitemupdating="DetailsView1_ItemUpdating" 
        onitemcommand="DetailsView1_ItemCommand" 
        oniteminserted="DetailsView1_ItemInserted"
        oniteminserting="DetailsView1_ItemInserting" EnableViewState="False">
                            <Fields>
                                <asp:BoundField DataField="itemID" HeaderText="itemID" ReadOnly="True" SortExpression="itemID" />
                                <asp:BoundField DataField="catName" HeaderText="catName" SortExpression="catName" />
                                <asp:BoundField DataField="items" HeaderText="items" SortExpression="items" />
                                <asp:TemplateField HeaderText="ingredients" SortExpression="ingredients">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ingredients") %>' TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ingredients") %>' TextMode="MultiLine"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                         <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("ingredients") %>' TextMode="MultiLine"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="small" SortExpression="small">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("small", "{0:f}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("small", "{0:c}") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("small", "{0:c}") %>'></asp:Label>
                                    </ItemTemplate>
                                     </asp:TemplateField>
                               
                                 <asp:TemplateField HeaderText="medium" SortExpression="medium">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("medium", "{0:f}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("medium", "{0:c}") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("medium", "{0:c}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                 <asp:TemplateField HeaderText="large" SortExpression="large">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("large", "{0:f}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("large", "{0:c}") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("large", "{0:c}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="images" SortExpression="images">
                                   
                                     <EditItemTemplate>

            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("itemID", "images/{0}.jpg" ) %>' />
                  <asp:Label ID="Label1" runat="server" >Current Image: <%# Eval("itemID", "images/{0}.jpg" ) %></asp:Label> <br />
            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("itemID", "images/{0}.jpg" ) %>' />        
                                   
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Label ID="lblUpload" runat="server" ></asp:Label>
                                                               
                                    </EditItemTemplate>
                                    
                                    <InsertItemTemplate>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                     </InsertItemTemplate>
                                    
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("itemID", "images/{0}.jpg" ) %>' />        
                               </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
    
                            </Fields>

    

                        </asp:DetailsView>               


                    </div>

                </div>
                </div>
            </div>
    </div>
</asp:Content>
