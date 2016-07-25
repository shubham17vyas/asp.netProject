using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfileInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        //get a collection of MembershipUser objectcs using the Membership Provider Class
        GridView1.DataSource = Membership.GetAllUsers();
        if (!IsPostBack)
        {
            // we use this if so that the data is bound only when the page loads but not when page is posted back
            GridView1.DataBind();
            
        }
        if (Roles.IsUserInRole(User.Identity.Name, "Admin"))
        {
            GridView1.Visible = true;
        }
       
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //make sure the row being bound is the data row and not the title row
        //use the e object to chekc for the rowtype

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

           
            string Username = e.Row.Cells[0].Text;
            
            CheckBox cb1 = (CheckBox)e.Row.FindControl("CheckBox1");
            if (Roles.IsUserInRole(Username, "Admin"))
            {
                cb1.Checked = true;
            }
            else
            {
                cb1.Checked = false;
            }
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //set the edit index of the GridView and rebind
        //this is so that the new data is rebound after we finish editing
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataBind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //reset the EditIndex of the gridview to -1
        GridView1.EditIndex = -1;
        GridView1.DataBind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string username = GridView1.DataKeys[e.RowIndex].Value.ToString();

        //if we try to add a user to a role if hes already in that role, it gives an error
        //add or remove user from the admin role depending on their current role and status of the checkbox
        //get the checkbox that will be set
        CheckBox cb1 = (CheckBox)GridView1.Rows[e.RowIndex].FindControl("CheckBox1");
        if (Roles.IsUserInRole(username, "Admin"))
        {
            if (cb1.Checked == false)
            {
                //remove user from role
                Roles.RemoveUserFromRole(username, "Admin");
            }

        }
        else //the user is not an admin
        {
            if (cb1.Checked == true)
            {
                //add user to role
                Roles.AddUserToRole(username, "Admin");
            }
        }
        //reset the edit index of the EditIndex of the gridview and rebind
        GridView1.EditIndex = -1;

        GridView1.DataBind();

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //retrieve the profile inofrmation for the selected user
        //use the getProfile method of the profile page property
        //change all the textboxes to label in the profile inofrmation part
        Label1.Visible = true;
        Label2.Visible = true;
        Label3.Visible = true;
        Label4.Visible = true;
        Label5.Visible = true;
        Label6.Visible = true;
        Label7.Visible = true;
        Label8.Visible = true;
        Label9.Visible = true;
        Label10.Visible = true;
        Label11.Visible = true;
        Label12.Visible = true;
        Label13.Visible = true;
        Label14.Visible = true;
        Label15.Visible = true;
        Label16.Visible = true;
        Label17.Visible = true;


        string username = GridView1.SelectedDataKey.Value.ToString();
        ProfileCommon pc = Profile.GetProfile(username);
        //pc is the selected users profile
        //put the profile values in the labels
        Label4.Text = pc.FirstName;
        Label5.Text = pc.LastName;
        Label6.Text = pc.BirthDate.ToShortDateString();
        Label7.Text = pc.Address.Street;
        Label8.Text = pc.Address.City;
        Label9.Text = pc.Address.State;
        Label10.Text = pc.Address.Zip;
        Label1.Text = pc.Address.Country;

       
    }
}