using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class Pesticides : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPesticides("All", "");
            }
        }

        private void BindPesticides(string category, string query)
        {
            var list = DataStore.Pesticides.AsEnumerable();
            if (category != "All" && !string.IsNullOrEmpty(category))
            {
                list = list.Where(p => p.Category.Equals(category, StringComparison.OrdinalIgnoreCase));
            }
            if (!string.IsNullOrWhiteSpace(query))
            {
                list = list.Where(p => p.Name.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0 || p.Description.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0 || p.Targets.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            rptPesticides.DataSource = list.ToList();
            rptPesticides.DataBind();
        }

        protected void FilterPesticide_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            string category = btn.CommandArgument;

            btnTabAll.CssClass = "filter-tab";
            btnTabInsecticides.CssClass = "filter-tab";
            btnTabFungicides.CssClass = "filter-tab";
            btnTabHerbicides.CssClass = "filter-tab";
            btnTabBio.CssClass = "filter-tab";

            btn.CssClass = "filter-tab active";
            BindPesticides(category, txtSearchPesticides.Text);
        }

        protected void btnSearchPesticides_Click(object sender, EventArgs e)
        {
            BindPesticides("All", txtSearchPesticides.Text);
        }
    }
}
