<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page">
		<div>
			<div id="body">
				<div id="figure">
					<img src="images/headline-menu.jpg" alt="Image"/>
					<span>Carpe Diem with our Caffeum</span>
				</div>
                <div>          <a href="menu.aspx" class="whatshot">What&#39;s Hot</a> 
                    <div>
                   <ul>
                       <li>
                                <a href="coffee.aspx"><img src="images/11.jpg" alt="Image" width="220" height="208" /></a>
								<div>
                       <a href="coffee.aspx">GOURMET COFFEE</a>
						</div>
							</li>
                       
						<li>
                                <a href="Espresso.aspx"><img src="images/22.jpg" alt="Image" width="220" height="208" /></a>
								<div>
                       <a href="Espresso.aspx">ESPRESSO</a>
						</div>
							</li>
                       
                       	<li>
                               <a href="Teas.aspx"><img src="images/33.jpg" alt="Image" width="220" height="208" /></a>
								<div>
                       <a href="Teas.aspx">TEA</a>
						</div>
							</li>
	                     
                        <li>
                                <a href="Blended.aspx"><img src="images/44.jpg" alt="Image" width="220" height="208" /></a>
								<div>
                       <a href="Blended.aspx">Blended/Special Crossings</a>
						</div>
							</li>
                       <li>
                           <a href="MakeCoffee.aspx"><img src="images/55.jpg" alt="Image" width="220" height="208" /></a>
                           <div>
                               <a href="MakeCoffee.aspx">Make Your Own Coffee</a>
                           </div>
                       </li>

                       </ul>
                         </div>
                </div>
                    
				</div>
		</div>
	</div>
</asp:Content>

