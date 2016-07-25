using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class ItemDetail : System.Web.UI.Page
{
    decimal price;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //fires when the 'Add to Cart' button is clicked
    protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        string itemID = ((HiddenField)(FormView1.FindControl("HiddenField1"))).Value;
        string items = ((Label)FormView1.FindControl("itemLabel")).Text;
        int qty = 1;
        var rdbList = FormView1.FindControl("RadioButtonList1") as RadioButtonList;
        
        price = Convert.ToDecimal(rdbList.SelectedItem.Text);
       
        
//decimal price = decimal.Parse(((RadioButtonList)FormView1.FindControl("RadioButtonList1")).Text);
        
        //decimal price = RadioButtonList1.SelectedValue;
       
        //creatingt he cart, else retrievint it from the session and add item to it
        if (Session["ShoppingCart"] == null)
        {
            Shopping_Cart c = new Shopping_Cart();
            c.AddProduct(itemID, items, price, qty);
            Session["ShoppingCart"] = c;
        }
        else
        {
            Shopping_Cart c = (Shopping_Cart)Session["ShoppingCart"];
            c.AddProduct(itemID, items, price, qty);
            Session["ShoppingCart"] = c;
        }
        

            Response.Redirect("OrderSummary.aspx");
        
        

    }
    //protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    var rdbList = FormView1.FindControl("RadioButtonList1") as RadioButtonList;

    //        price = Convert.ToDecimal(rdbList.SelectedItem.Text);
        
       
    //   // price = Convert.ToDecimal(rdbList.DataTextField);
        
    //}
}
