using System;
using System.Web.UI;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtCustomerId.Text = "#C-49" + (DataStore.Customers.Count + 26);
            }
        }

        protected void btnSaveCustomer_Click(object sender, EventArgs e)
        {
            Page.Validate("vgAddCustomer");
            if (Page.IsValid)
            {
                string custId = !string.IsNullOrEmpty(txtCustomerId.Text) 
                    ? txtCustomerId.Text.Trim() 
                    : (Request.Form[txtCustomerId.UniqueID] ?? ("#C-49" + (DataStore.Customers.Count + 26)));
                string name = txtCustomerName.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string email = !string.IsNullOrWhiteSpace(txtEmail.Text) 
                    ? txtEmail.Text.Trim() 
                    : (name.ToLower().Replace(" ", ".") + "@example.com");

                var newCust = new ShopCustomer
                {
                    Id = custId,
                    Name = name,
                    Phone = phone,
                    Email = email,
                    Location = ddlLocation.SelectedValue,
                    Address = txtAddress.Text.Trim(),
                    LandSize = txtLandSize.Text.Trim(),
                    Status = ddlStatus.SelectedValue,
                    LastOrderDate = DateTime.Now.ToString("MMM dd, yyyy"),
                    TotalSpent = 0.00m,
                    AvatarUrl = "/Images/avatars/rajesh_kumar_shop.jpg"
                };

                DataStore.Customers.Insert(0, newCust);

                pnlCustomerSuccess.Visible = true;
                lblCustomerSuccess.Text = "Customer '" + newCust.Name + "' (" + newCust.Id + ") registered successfully!";
            }
        }

        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Shop/Customers.aspx");
        }
    }
}
