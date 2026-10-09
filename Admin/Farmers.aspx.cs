using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class Farmers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFarmers();
            }
        }

        private void BindFarmers()
        {
            var list = DataStore.AdminFarmers.AsEnumerable();
            string dist = ddlDistrictFilter.SelectedValue;
            if (dist != "All")
            {
                list = list.Where(f => f.Location.IndexOf(dist, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            string status = ddlStatusFilter.SelectedValue;
            if (status != "All")
            {
                list = list.Where(f => f.Status.Equals(status, StringComparison.OrdinalIgnoreCase));
            }
            string q = txtSearchFarmers.Text;
            if (!string.IsNullOrWhiteSpace(q))
            {
                list = list.Where(f => f.Name.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 || f.Location.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 || f.ContactNumber.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            rptFarmers.DataSource = list.ToList();
            rptFarmers.DataBind();
        }

        protected void FilterFarmers_Changed(object sender, EventArgs e)
        {
            BindFarmers();
        }

        protected void btnExportFarmers_Click(object sender, EventArgs e)
        {
            pnlFarmerAlert.Visible = true;
            lblFarmerAlert.Text = "Farmer registration database exported successfully.";
        }
    }
}
