using System;
using System.IO;
using System.Web.UI;

namespace KhedutPlus.Admin
{
    public partial class Profile_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string adminName = Session["AdminName"] != null && !string.IsNullOrWhiteSpace(Session["AdminName"].ToString())
                    ? Session["AdminName"].ToString()
                    : "Sanjay Patel";

                txtFullName.Text = adminName;
                lblAdminHeroName.Text = adminName;

                if (Session["AdminAvatar"] != null)
                {
                    imgAdminAvatar.ImageUrl = Session["AdminAvatar"].ToString();
                    imgAdminAvatar.Visible = true;
                    divAdminInitials.Visible = false;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            if (!string.IsNullOrWhiteSpace(txtFullName.Text))
            {
                Session["AdminName"] = txtFullName.Text.Trim();
                lblAdminHeroName.Text = txtFullName.Text.Trim();
            }

            if (fuAdminPhoto.HasFile)
            {
                try
                {
                    string ext = Path.GetExtension(fuAdminPhoto.FileName).ToLower();
                    if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".webp")
                    {
                        string fileName = "admin_" + DateTime.Now.Ticks + ext;
                        string folderPath = Server.MapPath("~/Images/avatars/");
                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }
                        string savePath = Path.Combine(folderPath, fileName);
                        fuAdminPhoto.SaveAs(savePath);
                        string relPath = "/Images/avatars/" + fileName;
                        imgAdminAvatar.ImageUrl = relPath;
                        imgAdminAvatar.Visible = true;
                        divAdminInitials.Visible = false;
                        Session["AdminAvatar"] = relPath;
                    }
                }
                catch { }
            }

            pnlSuccess.Visible = true;

            // Reset password fields
            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}
