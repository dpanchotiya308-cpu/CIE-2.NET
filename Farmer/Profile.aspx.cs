using System;
using System.IO;
using System.Web.UI;

namespace KhedutPlus.Farmer
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string currentName = Session["FarmerName"] != null && !string.IsNullOrWhiteSpace(Session["FarmerName"].ToString())
                    ? Session["FarmerName"].ToString()
                    : "Ramesh Kumar";

                txtFullName.Text = currentName;
                lblHeroFarmerName.Text = currentName;

                if (Session["FarmerAvatar"] != null)
                {
                    imgFarmerAvatar.ImageUrl = Session["FarmerAvatar"].ToString();
                }
            }
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            Page.Validate("vgProfile");
            if (Page.IsValid)
            {
                string newName = txtFullName.Text.Trim();
                if (!string.IsNullOrEmpty(newName))
                {
                    Session["FarmerName"] = newName;
                    lblHeroFarmerName.Text = newName;
                }

                if (fuProfilePhoto.HasFile)
                {
                    try
                    {
                        string ext = Path.GetExtension(fuProfilePhoto.FileName).ToLower();
                        if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".webp")
                        {
                            string fileName = "farmer_" + DateTime.Now.Ticks + ext;
                            string folderPath = Server.MapPath("~/Images/avatars/");
                            if (!Directory.Exists(folderPath))
                            {
                                Directory.CreateDirectory(folderPath);
                            }
                            string savePath = Path.Combine(folderPath, fileName);
                            fuProfilePhoto.SaveAs(savePath);
                            string relPath = "/Images/avatars/" + fileName;
                            imgFarmerAvatar.ImageUrl = relPath;
                            Session["FarmerAvatar"] = relPath;
                        }
                    }
                    catch { }
                }

                pnlProfileSuccess.Visible = true;
                lblProfileMessage.Text = "Farmer profile for " + newName + " updated successfully!";
            }
        }
    }
}
