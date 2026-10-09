using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KhedutPlus.Admin
{
    public partial class Announcements : System.Web.UI.Page
    {
        private class AnnouncementRow
        {
            public string Title { get; set; }
            public string Target { get; set; }
            public string PostedDate { get; set; }
            public string Priority { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSampleAnnouncements();
            }
        }

        private void LoadSampleAnnouncements()
        {
            var list = new List<AnnouncementRow>
            {
                new AnnouncementRow { Title = "Kharif 2026 Subsidy Scheme Open for Applications", Target = "Farmers Only",         PostedDate = "Sep 28, 2026", Priority = "Important" },
                new AnnouncementRow { Title = "System Maintenance Scheduled – Oct 5, 2026",        Target = "All Users",           PostedDate = "Sep 25, 2026", Priority = "Urgent" },
                new AnnouncementRow { Title = "New Organic Pesticide Regulations Effective Nov 1",  Target = "Agro Shop Owners Only", PostedDate = "Sep 20, 2026", Priority = "Important" },
                new AnnouncementRow { Title = "Pest Alert: Fall Armyworm Spotted in North Gujarat", Target = "Farmers Only",        PostedDate = "Sep 15, 2026", Priority = "Normal" },
            };
            rptAnnouncements.DataSource = list;
            rptAnnouncements.DataBind();
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            // In a real app, persist to database here.
            pnlSuccess.Visible = true;
            txtTitle.Text = "";
            txtMessage.Text = "";
            ddlAudience.SelectedIndex = 0;
            ddlPriority.SelectedIndex = 0;

            LoadSampleAnnouncements();
        }

        protected string GetPriorityCss(string priority)
        {
            if (priority == null) return "priority-normal";
            switch (priority)
            {
                case "Urgent":    return "priority-urgent";
                case "Important": return "priority-important";
                default:          return "priority-normal";
            }
        }
    }
}
