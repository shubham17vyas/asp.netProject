using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


/// <summary>
/// This class represents a shopping cart with a list of product objects
/// </summary>
public class Shopping_Cart
{
    private List<Product> products = new List<Product>();

    //public property to access (not modify) the products list
    public List<Product> Products
    {
        get { return products; }
    }

    //Boolean property indicating whether the cart has items in it
    public bool IfHasItems
    {
        get
        {
            return products.Count > 0;
        }
    }

    // Method to add product to the cart.  If the product already exists, just update the quantity by one 
    public void AddProduct(string itemID, string items, decimal price, int qty)
    {
        Product result = products.Find(
            delegate(Product tp)
            {
                return ((tp.ITEMID == itemID) && (tp.Price == price));
            }
            );

        if (result != null)
        {
            UpdateQuantity(result.Quantity + 1, result.ITEMID);
        }
        else
        {
            Product tp = new Product(itemID, items, price, qty);
            products.Add(tp);
        }

    }

    // Method to remove product from the cart
    public void RemoveProduct(string ProdID)
    {
        Product prodToRemove = null;

        foreach (Product p in products)
        {
            if (p.ITEMID == ProdID)
            {
                prodToRemove = p;
            }
        }


        products.Remove(prodToRemove);

    }

    // Method to update the  quantity of the product in the cart. 
    public void UpdateQuantity(int UpdateQty, string ID)
    {
        foreach (Product q in products)
        {
            if (q.ITEMID == ID)
            {
                q.Quantity = UpdateQty;
            }
        }
    }

    // Method to return the total dollar amount in the cart
    public decimal GetTotal()
    {
        decimal total = 0;
        foreach (Product p in products)
        {
            total += p.Price * p.Quantity;
        }
        return total;
    }

    // Method that saves the cart information as an order in the database (happens at checkout)
    public bool CreateOrder(string CustomerID)
    {

        //Create a data table for the order details that will be passed to the stored procedure
        //Created a user-defined type that looks like this:  CREATE TYPE OrderDetailUdt AS TABLE (ProductId int,  Quantity int,  Price money) 
        //Then insert the entire datatable as an instance of this type----taken from shopping cart golf site example

        DataTable details = new DataTable();

        details.Columns.Add("ProductId", typeof(int));
        details.Columns.Add("Quantity", typeof(int));
        details.Columns.Add("Price", typeof(decimal));

        //Add the products in the cart to the data table
        foreach (Product p in products)
        {
            details.Rows.Add(new object[] { p.ITEMID, p.Quantity, p.Price });
        }

        //Executing the ADO code
        //Returns true if it succeeds, false otherwise
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["myDB"].ConnectionString);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "InsertOrder";


        com.Parameters.AddWithValue("@CustomerID", CustomerID);
        com.Parameters.AddWithValue("@OrderedAt", System.DateTime.Now);
        com.Parameters.AddWithValue("@OrderDetails", details);

        try
        {
            con.Open();
            com.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            return false;
            throw ex;
        }

        finally
        {
            con.Close();

        }

    }

    // Empty constructor
    public Shopping_Cart()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}
