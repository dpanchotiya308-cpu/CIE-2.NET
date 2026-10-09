using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCustomers();
            }
        }

        private void BindCustomers()
        {
            var list = DataStore.Customers.AsEnumerable();
            string status = ddlStatusFilter.SelectedValue;
            if (status != "All")
            {
                list = list.Where(c => c.Status.Equals(status, StringComparison.OrdinalIgnoreCase));
            }
            string loc = ddlLocationFilter.SelectedValue;
            if (loc != "All")
            {
                list = list.Where(c => c.Location.Equals(loc, StringComparison.OrdinalIgnoreCase));
            }
            string q = txtSearchCustomer.Text != null ? txtSearchCustomer.Text.Trim() : "";
            if (!string.IsNullOrWhiteSpace(q))
            {
                list = list.Where(c => 
                    (c.Name != null && c.Name.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (c.Id != null && c.Id.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (c.Email != null && c.Email.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (c.Phone != null && c.Phone.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0) ||
                    (c.Location != null && c.Location.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0)
                );
            }
            rptCustomers.DataSource = list.ToList();
            rptCustomers.DataBind();
        }

        protected void FilterCustomer_Changed(object sender, EventArgs e)
        {
            BindCustomers();
        }

        protected void btnSearchCustomer_Click(object sender, EventArgs e)
        {
            BindCustomers();
        }
    }
}
