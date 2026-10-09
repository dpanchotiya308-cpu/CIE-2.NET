using System;

namespace KhedutPlus.UserControls
{
    public partial class ShopSidebar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public string IsActive(params string[] filenames)
        {
            string current = Request.AppRelativeCurrentExecutionFilePath;
            if (filenames != null)
            {
                foreach (var f in filenames)
                {
                    if (!string.IsNullOrEmpty(f) && current.IndexOf(f, StringComparison.OrdinalIgnoreCase) >= 0)
                        return "active";
                }
            }
            return "";
        }
    }
}
