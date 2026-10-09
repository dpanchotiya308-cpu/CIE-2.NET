using System;

namespace KhedutPlus.MasterPages
{
    public partial class Shop : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public string GetShopOwnerName()
        {
            if (Session["ShopOwnerName"] != null && !string.IsNullOrWhiteSpace(Session["ShopOwnerName"].ToString()))
            {
                return Session["ShopOwnerName"].ToString();
            }
            if (Session["OwnerName"] != null && !string.IsNullOrWhiteSpace(Session["OwnerName"].ToString()))
            {
                return Session["OwnerName"].ToString();
            }
            return "Rajesh Patel";
        }

        public string GetShopAvatar()
        {
            if (Session["ShopLogo"] != null && !string.IsNullOrWhiteSpace(Session["ShopLogo"].ToString()))
            {
                return Session["ShopLogo"].ToString();
            }
            return "/Images/avatars/rajesh_patel.jpg";
        }
    }
}
