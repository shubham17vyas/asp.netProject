<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
		<div>
			<div id="body">
				
                <div id="figure">
					<img src="images/headline-home.jpg" alt="Image" /> 
                    <span id="home">It's   COFFEE   O'Clock!
                        <br /> <br /> <br /><br /><br /> 
                         </span>
                    
                    
                    <asp:Login ID="Login1" runat="server" LoginButtonStyle-BackColor="Navy" LoginButtonStyle-BorderColor="Navy" LoginButtonStyle-Font-Bold="true" LoginButtonStyle-ForeColor="Wheat" CreateUserText="Register" PasswordRecoveryText="Forgot Password?" CreateUserUrl="~/CreateUser.aspx" PasswordRecoveryUrl="~/RecoverPassword.aspx" DestinationPageUrl="~/Default.aspx" Font-Bold="true" Font-Size="Medium" ForeColor="Chocolate" ></asp:Login>
                   <h3>Admin<br />
                                        username: admin<br />
                                        password: admin123!<br />
                                        <br />
                                        Customer<br />
                                        username: kelly<br />
                                        password: kelly123!</h3> 
				</div>
					</div>
				
			</div>
		
    
</asp:Content>
