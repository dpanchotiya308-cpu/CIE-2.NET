using System;

namespace KhedutPlus.Shop
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnExportReport_Click(object sender, EventArgs e)
        {
            pnlAlert.Visible = true;
            lblAlert.Text = "Store Performance Report (Last 30 Days) generated and ready for download.";
        }
    }
}
