using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class Saved : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSaved("All", "");
            }
        }

        private void BindSaved(string category, string query)
        {
            var items = DataStore.SavedItems.AsEnumerable();
            if (category != "All" && !string.IsNullOrEmpty(category))
            {
                items = items.Where(x => x.Category.Equals(category, StringComparison.OrdinalIgnoreCase));
            }
            if (!string.IsNullOrWhiteSpace(query))
            {
                items = items.Where(x => x.Title.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0 || x.Description.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            rptSavedItems.DataSource = items.ToList();
            rptSavedItems.DataBind();
        }

        protected void FilterSaved_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            string category = btn.CommandArgument;

            btnTabAll.CssClass = "filter-tab";
            btnTabCrops.CssClass = "filter-tab";
            btnTabArticles.CssClass = "filter-tab";
            btnTabGuides.CssClass = "filter-tab";
            btnTabDisease.CssClass = "filter-tab";

            btn.CssClass = "filter-tab active";
            BindSaved(category, txtSearchSaved.Text);
        }

        protected void btnSearchSaved_Click(object sender, EventArgs e)
        {
            BindSaved("All", txtSearchSaved.Text);
        }
    }
}
