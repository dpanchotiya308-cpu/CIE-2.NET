using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KhedutPlus.Admin
{
    public partial class Contact : System.Web.UI.Page
    {
        private class QueryRow
        {
            public string From    { get; set; }
            public string Type    { get; set; }
            public string Subject { get; set; }
            public string Date    { get; set; }
            public string Status  { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadQueries();
            }
        }

        private void LoadQueries()
        {
            var list = new List<QueryRow>
            {
                new QueryRow { From = "Raju Patel",        Type = "Farmer",    Subject = "Unable to apply for PM-Kisan scheme",          Date = "Sep 29, 2026", Status = "Open" },
                new QueryRow { From = "Patel Seeds & Tools", Type = "Shop",   Subject = "Inventory sync not working for MOP products",    Date = "Sep 28, 2026", Status = "Open" },
                new QueryRow { From = "Suresh Kumar",      Type = "Farmer",    Subject = "Disease solution page not loading images",       Date = "Sep 25, 2026", Status = "Resolved" },
                new QueryRow { From = "Bharat Krushi",     Type = "Shop",      Subject = "Request to add new pesticide category",          Date = "Sep 22, 2026", Status = "Resolved" },
                new QueryRow { From = "Vikram Singh",      Type = "Farmer",    Subject = "Wrong subsidy amount shown for PM-KUSUM",        Date = "Sep 20, 2026", Status = "Open" },
            };
            rptQueries.DataSource = list;
            rptQueries.DataBind();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            pnlSuccess.Visible = true;
            txtQueryRef.Text   = "";
            txtResponse.Text   = "";

            LoadQueries();
        }

        protected string GetStatusCss(string status)
        {
            return status == "Resolved" ? "status-resolved" : "status-open";
        }
    }
}
