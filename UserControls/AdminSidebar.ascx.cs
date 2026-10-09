using System;

namespace KhedutPlus.UserControls
{
    public partial class AdminSidebar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public string IsActive(string filename)
        {
            string current = Request.AppRelativeCurrentExecutionFilePath;
            return current.IndexOf(filename, StringComparison.OrdinalIgnoreCase) >= 0 ? "active" : "";
        }

        public string GetAdminName()
        {
            if (Session["AdminName"] != null && !string.IsNullOrWhiteSpace(Session["AdminName"].ToString()))
            {
                return Session["AdminName"].ToString();
            }
            return "Sanjay Patel";
        }

        public string GetAdminInitials()
        {
            string name = GetAdminName();
            string[] parts = name.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length >= 2)
            {
                return (parts[0][0].ToString() + parts[1][0].ToString()).ToUpper();
            }
            return name.Length >= 2 ? name.Substring(0, 2).ToUpper() : name.ToUpper();
        }

        public string GetAdminAvatar()
        {
            if (Session["AdminAvatar"] != null && !string.IsNullOrWhiteSpace(Session["AdminAvatar"].ToString()))
            {
                return Session["AdminAvatar"].ToString();
            }
            return "";
        }
    }
}
