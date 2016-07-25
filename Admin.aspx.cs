using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.PageSize = 5;
        GridView1.DataBind();
    }
     protected void AddItemClick(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        DetailsView1.Visible = true;
        DetailsView1.DefaultMode = DetailsViewMode.Insert;

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        DetailsView1.Visible = true;
        DetailsView1.DefaultMode = DetailsViewMode.Edit;
        DetailsView1.DataBind();
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!UploadFile(true))
        {
            e.Cancel = true;
        }

    }

    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        
        GridView1.DataBind();
        GridView1.Visible = true;
        DetailsView1.Visible = false;
    }

    protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!UploadFile(false))
        {
            e.Cancel = true;
        }
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
    private bool UploadFile(bool isUpdate) 
    {

        FileUpload uploader = (FileUpload)DetailsView1.FindControl("FileUpload1");
        Label uploadLabel = (Label)DetailsView1.FindControl("lblUpload");

        
        string uploadDirectory = Path.Combine(Request.PhysicalApplicationPath, "images");
        string serverFileName = Path.GetFileName(uploader.PostedFile.FileName);
        string fullUploadPath = Path.Combine(uploadDirectory, serverFileName);

        if (uploader.PostedFile.FileName == "" && isUpdate)
        {            
            HiddenField origfilename = (HiddenField)DetailsView1.FindControl("HiddenField1");
            SqlItemList1.UpdateParameters["images"].DefaultValue = origfilename.Value;

            return true;
        }

        else
        {
            string extension = Path.GetExtension(uploader.PostedFile.FileName);
            switch (extension.ToLower())
            {
                case ".bmp":
                case ".gif":
                case ".jpg":
                    break;
                default:
                    uploadLabel.Text = "This file type is not allowed.";

                    return false; ;
            }

            try
            {
                
                uploader.PostedFile.SaveAs(fullUploadPath);
                SqlItemList1.UpdateParameters["images"].DefaultValue = serverFileName;
                SqlItemList1.InsertParameters["images"].DefaultValue = serverFileName;
                return true;
                                
            }
            catch (Exception err)
            {
                uploadLabel.Text = err.Message;
                return false;
                
            }


        }
    }
}
