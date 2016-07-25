using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaymentPayPal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
//Here, we simply bind the list of products in the cart to the repeater control to generate the necessary form fields.
        //Then, reset the cart by setting the session variable to null.
        
        if (!IsPostBack)
        {

            if (Session["ShoppingCart"] != null)
            {
                Shopping_Cart c = (Shopping_Cart)Session["ShoppingCart"];

                rptItems.DataSource = c.Products;
                rptItems.DataBind();

                Session["ShoppingCart"] = null;

            }
        }

            
      
    }
}