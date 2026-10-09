using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class EditCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"] ?? "#C-4920";
                LoadCustomer(id);
            }
        }

        private void LoadCustomer(string id)
        {
            var cust = DataStore.Customers.FirstOrDefault(c => c.Id.Equals(id, StringComparison.OrdinalIgnoreCase))
                       ?? DataStore.Customers.FirstOrDefault(c => c.Id.Replace("#", "").Equals(id.Replace("#", ""), StringComparison.OrdinalIgnoreCase))
                       ?? DataStore.Customers.FirstOrDefault();

            if (cust != null)
            {
                lblCustTitle.Text = "Edit Customer: " + cust.Name;
                txtCustomerId.Text = cust.Id;
                txtCustomerName.Text = cust.Name;
                txtPhone.Text = cust.Phone;
                txtEmail.Text = cust.Email;
                txtAddress.Text = !string.IsNullOrEmpty(cust.Address) ? cust.Address : "Village " + cust.Location + ", Taluka " + cust.Location + ", Gujarat";
                txtLandSize.Text = !string.IsNullOrEmpty(cust.LandSize) ? cust.LandSize : "12 Acres - Cotton & Groundnut";
                lblTotalSpent.Text = cust.TotalSpent.ToString("N2");
                lblLastOrderDate.Text = cust.LastOrderDate;

                if (ddlLocation.Items.FindByValue(cust.Location) != null)
                {
                    ddlLocation.SelectedValue = cust.Location;
                }
                if (ddlStatus.Items.FindByValue(cust.Status) != null)
                {
                    ddlStatus.SelectedValue = cust.Status;
                }
            }
        }

        protected void btnSaveCustomer_Click(object sender, EventArgs e)
        {
            Page.Validate("vgEditCustomer");
            if (Page.IsValid)
            {
                string id = !string.IsNullOrEmpty(txtCustomerId.Text) ? txtCustomerId.Text.Trim() : (Request.QueryString["id"] ?? Request.Form[txtCustomerId.UniqueID] ?? "#C-4920");
                var cust = DataStore.Customers.FirstOrDefault(c => c.Id.Equals(id, StringComparison.OrdinalIgnoreCase))
                           ?? DataStore.Customers.FirstOrDefault(c => c.Id.Replace("#", "").Equals(id.Replace("#", ""), StringComparison.OrdinalIgnoreCase))
                           ?? DataStore.Customers.FirstOrDefault();
                if (cust != null)
                {
                    cust.Name = txtCustomerName.Text.Trim();
                    cust.Phone = txtPhone.Text.Trim();
                    cust.Email = txtEmail.Text.Trim();
                    cust.Location = ddlLocation.SelectedValue;
                    cust.Address = txtAddress.Text.Trim();
                    cust.LandSize = txtLandSize.Text.Trim();
                    cust.Status = ddlStatus.SelectedValue;

                    pnlCustomerSuccess.Visible = true;
                    lblCustomerSuccess.Text = "Customer profile for '" + cust.Name + "' (" + cust.Id + ") updated successfully!";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Shop/Customers.aspx");
        }
    }
}
