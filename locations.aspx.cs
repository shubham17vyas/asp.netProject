using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Web.Security;
using System.Globalization;

public partial class locations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Roles.IsUserInRole(User.Identity.Name, "Admin"))
        {
            //only admin can add locations here 
            AddClick.Visible = true;
        }
        else
        { AddClick.Visible = false; }
     
    }

    protected void Add_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        DetailsView1.Visible = true;
        DetailsView1.DefaultMode = DetailsViewMode.Insert;

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        DetailsView1.Visible = true;
        DetailsView1.DefaultMode = DetailsViewMode.ReadOnly;
          
        if (Roles.IsUserInRole(User.Identity.Name, "Admin"))
        {
            DetailsView1.DefaultMode = DetailsViewMode.Edit;
            
            
            DetailsView1.DataBind();
            
        }
    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        SqlDataSource2.Update();
        SqlDataSource1.Update();
        GridView1.DataBind();
        GridView1.Visible = true;
        DetailsView1.Visible = false;
    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataBind();
        GridView1.Visible = true;
        DetailsView1.Visible = false;
    }
    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            GridView1.Visible = true;
            DetailsView1.Visible = false;
        }
    }


    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        //setting the ID of the new location
        //new ID is number of rows in the table + 1
        int num = this.GridView1.Rows.Count;
        SqlDataSource2.InsertParameters["ID"].DefaultValue = Convert.ToString(num + (int.Parse("1")));
        
    }
}