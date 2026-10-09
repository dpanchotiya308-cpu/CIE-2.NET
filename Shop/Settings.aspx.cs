using System;
using System.IO;
using System.Web.UI;

namespace KhedutPlus.Shop
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ShopOwnerName"] != null && !string.IsNullOrWhiteSpace(Session["ShopOwnerName"].ToString()))
                {
                    txtShopOwner.Text = Session["ShopOwnerName"].ToString();
                }
                if (Session["ShopName"] != null && !string.IsNullOrWhiteSpace(Session["ShopName"].ToString()))
                {
                    txtShopName.Text = Session["ShopName"].ToString();
                }
                if (Session["ShopLogo"] != null)
                {
                    imgShopLogo.ImageUrl = Session["ShopLogo"].ToString();
                }
            }
        }

        protected void btnSaveSettings_Click(object sender, EventArgs e)
        {
            Page.Validate("vgShopSettings");
            if (Page.IsValid)
            {
                if (!string.IsNullOrWhiteSpace(txtShopOwner.Text))
                {
                    Session["ShopOwnerName"] = txtShopOwner.Text.Trim();
                }
                if (!string.IsNullOrWhiteSpace(txtShopName.Text))
                {
                    Session["ShopName"] = txtShopName.Text.Trim();
                }

                if (fuShopLogo.HasFile)
                {
                    try
                    {
                        string ext = Path.GetExtension(fuShopLogo.FileName).ToLower();
                        if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".webp")
                        {
                            string fileName = "shop_" + DateTime.Now.Ticks + ext;
                            string folderPath = Server.MapPath("~/Images/icons/");
                            if (!Directory.Exists(folderPath))
                            {
                                Directory.CreateDirectory(folderPath);
                            }
                            string savePath = Path.Combine(folderPath, fileName);
                            fuShopLogo.SaveAs(savePath);
                            string relPath = "/Images/icons/" + fileName;
                            imgShopLogo.ImageUrl = relPath;
                            Session["ShopLogo"] = relPath;
                        }
                    }
                    catch { }
                }

                pnlShopSuccess.Visible = true;
                lblShopSuccess.Text = "Shop Profile and preferences updated successfully!";
            }
        }
    }
}
