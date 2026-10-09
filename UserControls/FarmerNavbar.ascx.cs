using System;

namespace KhedutPlus.UserControls
{
    public partial class FarmerNavbar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public bool IsAuthPage
        {
            get
            {
                string path = Request.AppRelativeCurrentExecutionFilePath.ToLowerInvariant();
                return path.Contains("default.aspx") || path.Contains("register.aspx") || path.Contains("forgotpassword.aspx");
            }
        }

        public bool IsRegisterPage
        {
            get
            {
                string path = Request.AppRelativeCurrentExecutionFilePath.ToLowerInvariant();
                return path.Contains("register.aspx");
            }
        }

        public string IsActive(string path)
        {
            string current = Request.AppRelativeCurrentExecutionFilePath;
            return current.IndexOf(path, StringComparison.OrdinalIgnoreCase) >= 0 ? "active" : "";
        }
    }
}
