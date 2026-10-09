using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class AgroShops : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindShops();
            }
        }

        private void BindShops()
        {
            var list = DataStore.AdminShops.AsEnumerable();
            string status = ddlStatusFilter.SelectedValue;
            if (status != "All")
            {
                list = list.Where(s => s.Verification.Equals(status, StringComparison.OrdinalIgnoreCase));
            }
            string q = txtSearchShops.Text;
            if (!string.IsNullOrWhiteSpace(q))
            {
                list = list.Where(s => s.Name.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 || s.Owner.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 || s.Location.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            rptShops.DataSource = list.ToList();
            rptShops.DataBind();
        }

        protected void FilterShops_Changed(object sender, EventArgs e)
        {
            BindShops();
        }
    }
}
