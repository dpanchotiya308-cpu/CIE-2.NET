using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class Notifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindNotifs("All");
            }
        }

        private void BindNotifs(string category)
        {
            var list = DataStore.Notifications.AsEnumerable();
            if (category != "All")
            {
                list = list.Where(n => n.Category.Equals(category, StringComparison.OrdinalIgnoreCase));
            }
            rptNotifications.DataSource = list.ToList();
            rptNotifications.DataBind();
        }

        protected void FilterNotif_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            string category = btn.CommandArgument;

            btnTabAll.CssClass = "filter-tab";
            btnTabCrops.CssClass = "filter-tab";
            btnTabSchemes.CssClass = "filter-tab";
            btnTabDisease.CssClass = "filter-tab";

            btn.CssClass = "filter-tab active";
            BindNotifs(category);
        }

        public string GetIconBg(string category)
        {
            switch (category)
            {
                case "Schemes": return "background-color: #ecfdf5; color: #166534;";
                case "Disease Alerts": return "background-color: #fff7ed; color: #ea580c;";
                case "Crops": return "background-color: #eff6ff; color: #2563eb;";
                default: return "background-color: #f1f5f9; color: #475569;";
            }
        }

        public string GetIconEmoji(string category)
        {
            switch (category)
            {
                case "Schemes": return "🏛️";
                case "Disease Alerts": return "🐛";
                case "Crops": return "🌦️";
                default: return "🔔";
            }
        }
    }
}
