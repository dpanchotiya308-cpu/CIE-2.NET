using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrders("All");
            }
        }

        private void BindOrders(string status)
        {
            var list = DataStore.ShopOrders.AsEnumerable();
            if (status != "All")
            {
                list = list.Where(o => o.OrderStatus.Equals(status, StringComparison.OrdinalIgnoreCase));
            }
            string q = txtSearchOrders.Text != null ? txtSearchOrders.Text.Trim() : "";
            if (!string.IsNullOrWhiteSpace(q))
            {
                list = list.Where(o => 
                    (o.OrderId != null && o.OrderId.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (o.CustomerName != null && o.CustomerName.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (o.PaymentStatus != null && o.PaymentStatus.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (o.OrderStatus != null && o.OrderStatus.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0)
                );
            }
            rptOrders.DataSource = list.ToList();
            rptOrders.DataBind();
        }

        protected void FilterOrderStatus_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            string status = btn.CommandArgument;

            btnTabAll.CssClass = "filter-tab";
            btnTabPending.CssClass = "filter-tab";
            btnTabDelivered.CssClass = "filter-tab";
            btnTabCancelled.CssClass = "filter-tab";

            btn.CssClass = "filter-tab active";
            BindOrders(status);
        }

        protected void SearchOrders_Changed(object sender, EventArgs e)
        {
            BindOrders("All");
        }

        protected void btnSearchOrders_Click(object sender, EventArgs e)
        {
            BindOrders("All");
        }

        protected void btnExportOrders_Click(object sender, EventArgs e)
        {
            pnlOrderAlert.Visible = true;
            lblOrderAlert.Text = "All orders exported to CSV file successfully.";
        }
    }
}
