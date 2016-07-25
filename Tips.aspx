<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tips.aspx.cs" Inherits="Tips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDB %>" DeleteCommand="DELETE FROM tips where Id = @Id" InsertCommand="INSERT INTO Tips(Id, tips, posted, section) values(@Id, @tips, @posted, @section)" SelectCommand="select * from Tips" UpdateCommand="UPDATE Tips SET tips = @tips, posted = @posted, section = @section WHERE Id=@Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" />
            <asp:Parameter Name="tips" />
            <asp:Parameter Name="posted" />
            <asp:Parameter Name="section" />
            
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tips" />
            <asp:Parameter Name="posted" />
            <asp:Parameter Name="section" />
            
            <asp:Parameter Name="Id" />
        </UpdateParameters>
    </asp:SqlDataSource>
     <asp:LinkButton ID="LinkButton1" runat="server" Text="Add Tip" Font-Bold="true" ForeColor="Navy" OnClick="LinkButton1_Click" Visible="false" Font-Size="Large"></asp:LinkButton>                      
       
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Id" AutoGenerateColumns="False" GridLines="None" BorderColor="Wheat" AlternatingRowStyle-BackColor="Wheat">
        <Columns>
            <asp:TemplateField HeaderText="Tips &amp; Tricks" SortExpression="tips" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="Olive" HeaderStyle-Font-Size="Large">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tips") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("tips") %>' Font-Bold="true" ForeColor="Chocolate" Font-Size="Medium"></asp:Label>
                </ItemTemplate>

<HeaderStyle Font-Bold="True" Font-Size="Large" ForeColor="Olive"></HeaderStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date Posted" SortExpression="posted" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="Olive" HeaderStyle-Font-Size="Large">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("posted") %>' ></asp:TextBox>
                    </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("posted") %>' Font-Bold="true" ForeColor="Chocolate" Font-Size="Medium"></asp:Label>
                </ItemTemplate>


<HeaderStyle Font-Bold="True" Font-Size="Large" ForeColor="Olive"></HeaderStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="***" SortExpression="section" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="Olive" HeaderStyle-Font-Size="Large">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("section") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("section") %>' Font-Bold="true" ForeColor="Chocolate" Font-Size="Medium"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

<RowStyle BorderColor="Navy" BorderWidth="3px"></RowStyle>
    </asp:GridView>
     <asp:DetailsView ID="DetailsView1" runat="server" OnItemCommand="DetailsView1_ItemCommand" 
         OnItemInserted="DetailsView1_ItemInserted" DefaultMode="Insert" Visible="False" OnModeChanging="DetailsView1_ModeChanging"
         AutoGenerateRows="False" DataSourceID="SqlDataSource1" DataKeyNames="Id" BorderColor="Navy" BorderWidth="3px" EnableViewState="False" GridLines="Horizontal" RowStyle-BorderColor="Tan" RowStyle-BorderWidth="5" OnItemInserting="DetailsView1_ItemInserting">
       
         <Fields>
                                    <asp:TemplateField HeaderText="Tips & Tricks" SortExpression="tips" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Medium">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tips") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>

                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tips") %>' TextMode="MultiLine" ></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Field Required" ControlToValidate="TextBox1" Display="Dynamic"></asp:RequiredFieldValidator>
                                        
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("tips") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date Posted" SortExpression="posted" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Medium" >
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("posted") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("posted") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Field Required" ControlToValidate="TextBox2" Display="Dynamic"></asp:RequiredFieldValidator>
                               
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("posted") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
             
                             <asp:TemplateField HeaderText="Type" SortExpression="section" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Medium">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("section") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("section") %>'></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Field Required" ControlToValidate="TextBox3" Display="Dynamic"></asp:RequiredFieldValidator>
                                        
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("section") %>'></asp:Label>
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



</asp:Content>

