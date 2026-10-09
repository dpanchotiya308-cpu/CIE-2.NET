using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class DiseaseSolutions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDiseases();
            }
        }

        private void BindDiseases()
        {
            var list = DataStore.Diseases.AsEnumerable();
            string crop = ddlCropFilter.SelectedValue;
            if (crop != "All")
            {
                list = list.Where(d => d.AffectsCrop.IndexOf(crop, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            string cat = ddlCategoryFilter.SelectedValue;
            if (cat != "All")
            {
                list = list.Where(d => d.Category.Equals(cat, StringComparison.OrdinalIgnoreCase));
            }
            string q = txtSearchDisease.Text;
            if (!string.IsNullOrWhiteSpace(q))
            {
                list = list.Where(d => d.Name.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 || d.Description.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            rptDiseases.DataSource = list.ToList();
            rptDiseases.DataBind();
        }

        protected void Filter_Changed(object sender, EventArgs e)
        {
            BindDiseases();
        }
    }
}
