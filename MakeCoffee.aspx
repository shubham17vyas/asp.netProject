<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MakeCoffee.aspx.cs" Inherits="MakeCoffee" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page">
		<div>
			<div id="body">
				<div>          <a href="menu.aspx" class="whatshot">What&#39;s Hot</a> 
                    <div>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDB %>" SelectCommand="SELECT * FROM [ingred]"></asp:SqlDataSource>
                        <asp:Label ID="Label6" runat="server" Text="Please Choose Only 9 Or Less Ingredients <br/>--the Extra Ingredients Will Not Be Considered for the Order" Font-Bold="true" Font-Italic="true" Font-Size="Medium" ForeColor="Navy"></asp:Label>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" GridLines="None" BorderWidth="3" BorderColor="Olive" OnRowCommand="GridView1_RowCommand" ShowFooter="true" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ingred" EnableViewState="false">
                            <Columns>
                                                                    
                                <asp:TemplateField HeaderText="INGREDIENTS" SortExpression="ingred" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="Chocolate">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ingred") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("ingred") %>'  Font-Bold="true" Font-Size="Medium" ForeColor="SaddleBrown"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="$$" SortExpression="price"  HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Large" HeaderStyle-ForeColor="Chocolate">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("price") %>' Font-Bold="true" Font-Size="Medium" ForeColor="SaddleBrown"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                            <ItemTemplate>
                             <%-- checkbox to choose the ingredients --%>                              
                                <asp:CheckBox runat="server" ID="checkbox1" EnableViewState="false" />
                                         
                            
                            </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="order" Text="ADD TO ORDER" Font-Bold="true" Font-Size="X-Large" ForeColor="SaddleBrown" /></linkbutton>
                                    </FooterTemplate>
                                
                            </asp:TemplateField>
                                <asp:TemplateField SortExpression="id" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                    
                                    </EditItemTemplate>
                                    
                                    </asp:TemplateField>

                            </Columns>
            


                        </asp:GridView>       


				</div>
        </div>        
        </div>
		</div>

    </div>
</asp:Content>

