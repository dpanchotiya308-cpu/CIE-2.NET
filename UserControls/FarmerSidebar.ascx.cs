using System;

namespace KhedutPlus.UserControls
{
    public partial class FarmerSidebar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public string IsActive(string filename, string filename2 = null)
        {
            string current = Request.AppRelativeCurrentExecutionFilePath;
            if (!string.IsNullOrEmpty(filename) && current.IndexOf(filename, StringComparison.OrdinalIgnoreCase) >= 0)
                return "active";
            if (!string.IsNullOrEmpty(filename2) && current.IndexOf(filename2, StringComparison.OrdinalIgnoreCase) >= 0)
                return "active";
            return "";
        }
    }
}
