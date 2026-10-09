using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class Crops : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCrops("All");
            }
        }

        private void BindCrops(string category)
        {
            var list = DataStore.Crops;
            if (category != "All" && !string.IsNullOrEmpty(category))
            {
                list = list.Where(c => c.Category.Equals(category, StringComparison.OrdinalIgnoreCase)).ToList();
            }
            rptCrops.DataSource = list;
            rptCrops.DataBind();
        }

        protected void FilterCategory_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            string category = btn.CommandArgument;

            btnCatAll.CssClass = "filter-tab";
            btnCatGrains.CssClass = "filter-tab";
            btnCatVegetables.CssClass = "filter-tab";
            btnCatFruits.CssClass = "filter-tab";
            btnCatSpices.CssClass = "filter-tab";
            btnCatPulses.CssClass = "filter-tab";

            btn.CssClass = "filter-tab active";
            BindCrops(category);
        }
    }
}
