using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CurrentUser : System.Web.UI.UserControl
{
    //changing the page load to page pre render so that the values are shown after the button is clicked but before page load
    protected void Page_PreRender(object sender, EventArgs e)
    {
        TextBox4.Text = Profile.FirstName;
        TextBox5.Text = Profile.LastName;
        TextBox6.Text = Profile.BirthDate.ToShortDateString();
        TextBox7.Text = Profile.Address.Street;
        TextBox8.Text = Profile.Address.City;
        TextBox9.Text = Profile.Address.State;
        TextBox10.Text = Profile.Address.Zip;
        TextBox1.Text = Profile.Address.Country;


    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        //now if use this and use page load above it does not show the values
        //update profile variables with values entered in textboxes
        Profile.FirstName = TextBox4.Text;
        Profile.LastName = TextBox5.Text;
        Profile.BirthDate = Convert.ToDateTime(TextBox6.Text);
        Profile.Address.Street = TextBox7.Text;
        Profile.Address.City = TextBox8.Text;
        Profile.Address.State = TextBox9.Text;
        Profile.Address.Zip = TextBox10.Text;
        Profile.Address.Country = TextBox1.Text;


    }
}