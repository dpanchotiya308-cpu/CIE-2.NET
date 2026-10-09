using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class StockUpdates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUpdates("All");
            }
        }

        private void BindUpdates(string type)
        {
            var list = DataStore.StockUpdates.AsEnumerable();
            if (type != "All")
            {
                list = list.Where(u => u.UpdateType.Equals(type, StringComparison.OrdinalIgnoreCase));
            }
            string q = txtSearchUpdates.Text != null ? txtSearchUpdates.Text.Trim() : "";
            if (!string.IsNullOrWhiteSpace(q))
            {
                list = list.Where(u => 
                    (u.ProductName != null && u.ProductName.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (u.Sku != null && u.Sku.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (u.UpdatedBy != null && u.UpdatedBy.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (u.UpdateType != null && u.UpdateType.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0)
                );
            }
            rptStockUpdates.DataSource = list.ToList();
            rptStockUpdates.DataBind();
        }

        protected void FilterType_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            string type = btn.CommandArgument;

            btnTabAll.CssClass = "filter-tab";
            btnTabRestock.CssClass = "filter-tab";
            btnTabSale.CssClass = "filter-tab";
            btnTabAdjustment.CssClass = "filter-tab";
            btnTabDamage.CssClass = "filter-tab";

            btn.CssClass = "filter-tab active";
            BindUpdates(type);
        }

        protected void SearchUpdates_Changed(object sender, EventArgs e)
        {
            BindUpdates("All");
        }

        protected void btnSearchUpdates_Click(object sender, EventArgs e)
        {
            BindUpdates("All");
        }
    }
}
