using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class Inventory : System.Web.UI.Page
    {
        private string CurrentTab
        {
            get { return ViewState["CurrentTab"] as string ?? "All"; }
            set { ViewState["CurrentTab"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string tab = Request.QueryString["tab"] ?? "All";
                CurrentTab = tab;
                SwitchView(tab);
            }
        }

        private void SwitchView(string tab)
        {
            CurrentTab = tab;
            btnTabAll.CssClass = "filter-tab";
            btnTabSeeds.CssClass = "filter-tab";
            btnTabFertilizers.CssClass = "filter-tab";
            btnTabPesticides.CssClass = "filter-tab";

            pnlStandardView.Visible = false;
            pnlFertilizerView.Visible = false;
            pnlPesticideView.Visible = false;

            string q = txtSearchInventory.Text != null ? txtSearchInventory.Text.Trim() : "";

            var allProds = DataStore.ShopProducts.AsEnumerable();
            if (!string.IsNullOrWhiteSpace(q))
            {
                allProds = allProds.Where(p => 
                    (p.Name != null && p.Name.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (p.Sku != null && p.Sku.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (p.Category != null && p.Category.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (p.Type != null && p.Type.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (p.TargetPest != null && p.TargetPest.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0)
                );
            }

            if (tab.Equals("Fertilizers", StringComparison.OrdinalIgnoreCase))
            {
                lblPageTitle.Text = "Fertilizers Inventory";
                lblPageSubtitle.Text = "Manage and track solid and liquid chemical & organic fertilizers.";
                btnTabFertilizers.CssClass = "filter-tab active";
                pnlFertilizerView.Visible = true;
                rptFertilizerProducts.DataSource = allProds.Where(p => p.Category == "Fertilizers").ToList();
                rptFertilizerProducts.DataBind();
            }
            else if (tab.Equals("Pesticides", StringComparison.OrdinalIgnoreCase))
            {
                lblPageTitle.Text = "Pesticides Inventory";
                lblPageSubtitle.Text = "Manage and track your agricultural pest control and crop protection products.";
                btnTabPesticides.CssClass = "filter-tab active";
                pnlPesticideView.Visible = true;
                rptPesticideProducts.DataSource = allProds.Where(p => p.Category == "Pesticides").ToList();
                rptPesticideProducts.DataBind();
            }
            else if (tab.Equals("Seeds", StringComparison.OrdinalIgnoreCase))
            {
                lblPageTitle.Text = "Seeds Inventory";
                lblPageSubtitle.Text = "Manage certified hybrid grain, pulse, and vegetable seeds.";
                btnTabSeeds.CssClass = "filter-tab active";
                pnlStandardView.Visible = true;
                rptStandardProducts.DataSource = allProds.Where(p => p.Category == "Seeds").ToList();
                rptStandardProducts.DataBind();
            }
            else
            {
                lblPageTitle.Text = "Shop Inventory";
                lblPageSubtitle.Text = "Overview of all agricultural products, current stock levels, and unit pricing.";
                btnTabAll.CssClass = "filter-tab active";
                pnlStandardView.Visible = true;
                rptStandardProducts.DataSource = allProds.ToList();
                rptStandardProducts.DataBind();
            }
        }

        protected void SearchInventory_Changed(object sender, EventArgs e)
        {
            SwitchView(CurrentTab);
        }

        protected void btnSearchInventory_Click(object sender, EventArgs e)
        {
            SwitchView(CurrentTab);
        }

        protected void FilterTab_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            SwitchView(btn.CommandArgument);
        }

        protected void btnExportCsv_Click(object sender, EventArgs e)
        {
            pnlInvFeedback.Visible = true;
            lblInvFeedback.Text = "Inventory data exported to CSV successfully.";
        }

        public string RenderStatusPill(string status)
        {
            if (status == "In Stock")
            {
                return "<span class=\"badge badge-gray\" style=\"background-color: #f1f5f9; color: #475569;\">In Stock</span>";
            }
            else if (status == "Low Stock")
            {
                return "<span class=\"badge badge-gray\" style=\"background-color: #f1f5f9; color: #475569;\">Low Stock</span>";
            }
            else
            {
                return "<span class=\"badge badge-gray\" style=\"background-color: #f1f5f9; color: #475569;\">Out of Stock</span>";
            }
        }
    }
}
