using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class Fertilizers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFertilizers("All", "");
            }
        }

        private void BindFertilizers(string category, string query)
        {
            var list = DataStore.Fertilizers.AsEnumerable();
            if (category != "All" && !string.IsNullOrEmpty(category))
            {
                list = list.Where(f => f.Category.Equals(category, StringComparison.OrdinalIgnoreCase));
            }
            if (!string.IsNullOrWhiteSpace(query))
            {
                list = list.Where(f => f.Name.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0 || f.Description.IndexOf(query, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            rptFertilizers.DataSource = list.ToList();
            rptFertilizers.DataBind();
        }

        protected void FilterFertilizer_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            string category = btn.CommandArgument;

            btnTabAll.CssClass = "filter-tab";
            btnTabNitrogenous.CssClass = "filter-tab";
            btnTabPhosphatic.CssClass = "filter-tab";
            btnTabPotassic.CssClass = "filter-tab";
            btnTabComplex.CssClass = "filter-tab";
            btnTabOrganic.CssClass = "filter-tab";

            btn.CssClass = "filter-tab active";
            BindFertilizers(category, txtSearchFertilizer.Text);
        }

        protected void btnSearchFertilizer_Click(object sender, EventArgs e)
        {
            BindFertilizers("All", txtSearchFertilizer.Text);
        }
    }
}
