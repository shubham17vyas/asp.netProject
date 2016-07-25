using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Class representing a product that can be ordered on the site
/// </summary>
public class Product
{
    public Product(string itemID, string items, decimal price, int qty)
    {
        this.itemID = itemID;
        this.items = items;
        this.price = price;
        this.qty = qty;
    }

    private string items;
    private decimal price;
    private int qty;
    private string itemID;

    public string ITEMID
    {
        get
        { return itemID; }

    }

    public string Items
    {
        get
        { return items; }

    }


    public decimal Price
    {
        get
        { return price; }

    }

    public int Quantity
    {
        get
        { return qty; }
        set { qty = value; }
    }



}
