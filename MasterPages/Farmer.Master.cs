using System;

namespace KhedutPlus.MasterPages
{
    public partial class Farmer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public string GetFarmerName()
        {
            if (Session["FarmerName"] != null && !string.IsNullOrWhiteSpace(Session["FarmerName"].ToString()))
            {
                return Session["FarmerName"].ToString();
            }
            return "Ramesh Kumar";
        }

        public string GetFarmerAvatar()
        {
            if (Session["FarmerAvatar"] != null && !string.IsNullOrWhiteSpace(Session["FarmerAvatar"].ToString()))
            {
                return Session["FarmerAvatar"].ToString();
            }
            return "/Images/avatars/ramesh_kumar.jpg";
        }
    }
}
