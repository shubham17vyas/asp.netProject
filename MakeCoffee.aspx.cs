using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class MakeCoffee : System.Web.UI.Page
{
    decimal price;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //this variable ct is to count the number of selections in checkboxes
        //the ID of the selected items is combined to make the final ID for the Order placement
        //the DataBase is designed so as to facilitate this transaction
        //We know that itemID is integer type, if the final ID results in a number(more than 10 digits) beyond the range of int it will be a problem
        //So we make sure to consider only the first 9 selected items
        int ct = 0;
        string itemID = "";
      string items = "";
      int qty = 1;
    
        if (e.CommandName == "order")
        {
            foreach (GridViewRow rw in GridView1.Rows)
            {
                if (((CheckBox)GridView1.Rows[rw.RowIndex].FindControl("checkbox1")).Checked)
                {
                    ct++;
                    if ((ct <= 9))
                    {

                        itemID = itemID + ((Label)(rw.FindControl("Label1"))).Text;
                        items = items + "," + ((Label)(rw.FindControl("Label5"))).Text;
                        price = price + Convert.ToDecimal(((Label)rw.FindControl("Label2")).Text);
                    }
                    else break;
                }
            }
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
        
        
        }
    }


