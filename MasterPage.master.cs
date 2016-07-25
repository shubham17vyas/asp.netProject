using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
        protected void Page_Load(object sender, EventArgs e)
    {
        //Show Welcome message if user is logged in
        if (Page.User.Identity.IsAuthenticated)
            WelcomeLabel.InnerHtml = "Welcome, " + Page.User.Identity.Name + "!"; ;

        //If the user is an admin, show the link to the Admin page
        if (Roles.IsUserInRole(Page.User.Identity.Name, "Admin"))
        {
            AdminLabel.InnerHtml = "<a href='Admin.aspx'>Admin</a>";
        }
        if (Roles.IsUserInRole(Page.User.Identity.Name, "User"))
        {
            UserLabel.InnerHtml = "<a href='ProfileInfo.aspx'>View Profile</a>";
        }

       
    }
        protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
        {
            //abandon shopping cart when user logs out
            Session["ShoppingCart"] = null;
        }

        
}
