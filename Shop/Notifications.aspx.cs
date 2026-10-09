using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class Notifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindNotifications("All");
                UpdateStats();
            }
        }

        private void UpdateStats()
        {
            var list = DataStore.ShopNotifications;
            lblTotalAlerts.Text = list.Count.ToString();
            lblInventoryAlerts.Text = list.Count(n => n.Category.Equals("Inventory", StringComparison.OrdinalIgnoreCase)).ToString();
            lblOrderAlerts.Text = list.Count(n => n.Category.Equals("Orders", StringComparison.OrdinalIgnoreCase)).ToString();
            lblCustomerAlerts.Text = list.Count(n => n.Category.Equals("Customers", StringComparison.OrdinalIgnoreCase)).ToString();
        }

        private void BindNotifications(string category)
        {
            var list = DataStore.ShopNotifications.AsEnumerable();
            if (!string.IsNullOrEmpty(category) && category != "All")
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
            btnTabInventory.CssClass = "filter-tab";
            btnTabOrders.CssClass = "filter-tab";
            btnTabCustomers.CssClass = "filter-tab";
            btnTabSystem.CssClass = "filter-tab";

            btn.CssClass = "filter-tab active";
            BindNotifications(category);
        }

        protected void btnMarkAllRead_Click(object sender, EventArgs e)
        {
            pnlNotifAlert.Visible = true;
            lblNotifAlert.Text = "All store alerts and notifications marked as read.";
        }

        protected void cvBatchCode_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string val = args.Value != null ? args.Value.Trim() : "";
            if (string.IsNullOrEmpty(val))
            {
                args.IsValid = false;
                return;
            }

            // Must start with BT- or STK- followed by alphanumeric characters
            args.IsValid = Regex.IsMatch(val, @"^(BT|STK)-[A-Za-z0-9_-]+$", RegexOptions.IgnoreCase);
        }

        protected void btnCreateAlert_Click(object sender, EventArgs e)
        {
            Page.Validate("vgShopAlert");
            if (Page.IsValid)
            {
                string title = txtAlertTitle.Text.Trim();
                string category = ddlAlertCategory.SelectedValue;
                string qty = txtThresholdQty.Text.Trim();
                string mobile = txtContactMobile.Text.Trim();
                string batch = txtBatchCode.Text.Trim().ToUpper();
                string desc = txtAlertDescription.Text.Trim();

                string iconClass = "alert-triangle";
                string actionText = "Manage Inventory →";
                string actionUrl = "/Shop/Inventory.aspx";

                if (category == "Orders")
                {
                    iconClass = "shopping-bag";
                    actionText = "View Orders →";
                    actionUrl = "/Shop/Orders.aspx";
                }
                else if (category == "Customers")
                {
                    iconClass = "user-plus";
                    actionText = "View Customers →";
                    actionUrl = "/Shop/Customers.aspx";
                }
                else if (category == "System")
                {
                    iconClass = "shield";
                    actionText = "Store Settings →";
                    actionUrl = "/Shop/Settings.aspx";
                }

                // Add to DataStore notifications
                var newAlert = new NotificationItem
                {
                    Id = "SN-" + (DataStore.ShopNotifications.Count + 101),
                    Title = title + " (Batch: " + batch + ")",
                    Description = desc + " [Threshold: " + qty + " units | Contact: " + mobile + "]",
                    TimeAgo = "Just now",
                    Category = category,
                    IconClass = iconClass,
                    ActionText = actionText,
                    ActionUrl = actionUrl
                };

                DataStore.ShopNotifications.Insert(0, newAlert);

                pnlAlertCreated.Visible = true;
                lblAlertCreated.Text = "Alert '" + title + "' (Batch: " + batch + ") saved successfully. Reorder trigger set at " + qty + " units.";

                // Clear input fields
                txtAlertTitle.Text = "";
                txtThresholdQty.Text = "";
                txtContactMobile.Text = "";
                txtConfirmMobile.Text = "";
                txtBatchCode.Text = "";
                txtAlertDescription.Text = "";

                // Rebind list and KPI counters
                BindNotifications("All");
                UpdateStats();

                btnTabAll.CssClass = "filter-tab active";
                btnTabInventory.CssClass = "filter-tab";
                btnTabOrders.CssClass = "filter-tab";
                btnTabCustomers.CssClass = "filter-tab";
                btnTabSystem.CssClass = "filter-tab";
            }
        }

        protected void btnResetAlertForm_Click(object sender, EventArgs e)
        {
            txtAlertTitle.Text = "";
            txtThresholdQty.Text = "";
            txtContactMobile.Text = "";
            txtConfirmMobile.Text = "";
            txtBatchCode.Text = "";
            txtAlertDescription.Text = "";
            pnlAlertCreated.Visible = false;
        }

        public string GetIconEmoji(string category)
        {
            if (string.IsNullOrEmpty(category)) return "🔔";
            switch (category.ToLower())
            {
                case "inventory": return "📦";
                case "orders": return "🛒";
                case "customers": return "👥";
                case "system": return "📜";
                default: return "🔔";
            }
        }

        public string GetIconBg(string category)
        {
            if (string.IsNullOrEmpty(category)) return "background-color: #ecfdf5; color: #166534;";
            switch (category.ToLower())
            {
                case "inventory": return "background-color: #fef2f2; color: #dc2626;";
                case "orders": return "background-color: #eff6ff; color: #2563eb;";
                case "customers": return "background-color: #f5f3ff; color: #7c3aed;";
                case "system": return "background-color: #ecfdf5; color: #166534;";
                default: return "background-color: #f1f5f9; color: #475569;";
            }
        }

        public string GetBadgeStyle(string category)
        {
            if (string.IsNullOrEmpty(category)) return "background-color: #f1f5f9; color: #475569;";
            switch (category.ToLower())
            {
                case "inventory": return "background-color: #fef2f2; color: #dc2626;";
                case "orders": return "background-color: #eff6ff; color: #2563eb;";
                case "customers": return "background-color: #f5f3ff; color: #7c3aed;";
                case "system": return "background-color: #ecfdf5; color: #166534;";
                default: return "background-color: #f1f5f9; color: #475569;";
            }
        }
    }
}
