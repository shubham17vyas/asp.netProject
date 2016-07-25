<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="locations.aspx.cs" Inherits="locations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="page">
		<div>
			<div id="body">
				<div id="figure">
					<img src="images/headline-locations.jpg" alt="Image"/>
				</div>
				<div>
					<a href="locations.aspx" class="locations">Locations</a>
					<div>
						<dl>
							<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDB %>" SelectCommand="SELECT * FROM [location]" DeleteCommand="DELETE FROM [location] WHERE [ID] = @ID" InsertCommand="INSERT INTO [location] ([ID], [Country], [State], [City], [Street], [zip]) VALUES (@ID, @Country, @State, @City, @Street, @zip)" UpdateCommand="UPDATE [location] SET [Country] = @Country, [State] = @State, [City] = @City, [Street] = @Street, [zip] = @zip WHERE [ID] = @ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID" Type="Int32" />
                                    <asp:Parameter Name="Country" Type="String" />
                                    <asp:Parameter Name="State" Type="String" />
                                    <asp:Parameter Name="City" Type="String" />
                                    <asp:Parameter Name="Street" Type="String" />
                                    <asp:Parameter Name="zip" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Country" Type="String" />
                                    <asp:Parameter Name="State" Type="String" />
                                    <asp:Parameter Name="City" Type="String" />
                                    <asp:Parameter Name="Street" Type="String" />
                                    <asp:Parameter Name="zip" Type="String" />
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                           
                            
                            <asp:GridView ID="GridView1" runat="server" GridLines="None" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="ID" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="State" HeaderText="" SortExpression="State" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="X-Large" ItemStyle-ForeColor="Chocolate" />
                                   
                                                                    <asp:ButtonField CommandName="Select" Text="SELECT" ItemStyle-Font-Bold="true" ItemStyle-Font-Size="X-Large" ItemStyle-ForeColor="Navy" />
                                   
                                                                    </Columns>
                            </asp:GridView>


                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myDB %>" SelectCommand="SELECT * FROM location WHERE ID = @ID" DeleteCommand="DELETE FROM location WHERE ID = @ID" InsertCommand="INSERT INTO location (ID,Country,State,City,Street,Zip) VALUES (@ID,@Country,@State,@City,@Street,@Zip)" UpdateCommand="UPDATE location
SET Country=@Country, State = @State, City = @City, Street = @Street, Zip = @Zip WHERE ID = @ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID" />
                                    <asp:Parameter Name="Country" />
                                    <asp:Parameter Name="State" />
                                    <asp:Parameter Name="City" />
                                    <asp:Parameter Name="Street" />
                                    <asp:Parameter Name="Zip" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Country" />
                                    <asp:Parameter Name="State" />
                                    <asp:Parameter Name="City" />
                                    <asp:Parameter Name="Street" />
                                    <asp:Parameter Name="Zip" />
                                    <asp:Parameter Name="ID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <asp:Button ID="AddClick" runat="server" OnClick="Add_Click" Text="Add Location" Font-Bold="true" Font-Size="Medium" ForeColor="wheat" BackColor="Chocolate" />

                            <asp:DetailsView ID="DetailsView1" runat="server" OnItemCommand="DetailsView1_ItemCommand" 
         OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated"
         AutoGenerateRows="False" DataSourceID="SqlDataSource2" DataKeyNames="ID" EnableViewState="False" Width="250px" Height="250px" GridLines="None" OnItemInserting="DetailsView1_ItemInserting">
                                <Fields>
                                    <asp:TemplateField HeaderText="Country  :" SortExpression="Country" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="Chocolate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field Required" ControlToValidate="TextBox1" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Country") %>'  Font-Bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                     <asp:TemplateField HeaderText="State :" SortExpression="State" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="Chocolate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                                        
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field Required" ControlToValidate="TextBox2" Display="Dynamic"></asp:RequiredFieldValidator>
                                        
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("State") %>'  Font-Bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="City :" SortExpression="City" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="Chocolate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                                       
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field Required" ControlToValidate="TextBox3" Display="Dynamic"></asp:RequiredFieldValidator>
                                        
                                             </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("City") %>' Font-Bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                     <asp:TemplateField HeaderText="Street : " SortExpression="Street" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="Chocolate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Street") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Street") %>'></asp:TextBox>
                                        
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Field Required" ControlToValidate="TextBox4" Display="Dynamic"></asp:RequiredFieldValidator>
                                        
                                        
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Street") %>'  Font-Bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="ZipCode :" SortExpression="Zip" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="Chocolate">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                                           <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Enter only 5 digit numbers" ControlToValidate="TextBox5" Operator="GreaterThan" ValueToCompare="10000" Type="Integer"></asp:CompareValidator>         
                                           
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                                        
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Field Required" ControlToValidate="TextBox5" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Enter only 5 digit numbers" ControlToValidate="TextBox5" Operator="GreaterThan" ValueToCompare="10000" Type="Integer"></asp:CompareValidator>         
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Zip") %>' Font-Bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
    
                                    <asp:TemplateField ShowHeader="False">
                                        <InsertItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </InsertItemTemplate>
                                        <EditItemTemplate>
                                           <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        
                                        <ItemTemplate>
                                            </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>




                            </asp:DetailsView> 
                            
                            
                            
                            
                            
                            </dl>
						</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

