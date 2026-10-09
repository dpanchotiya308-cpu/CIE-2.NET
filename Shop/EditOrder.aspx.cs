using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class EditOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string orderId = Request.QueryString["id"] ?? "#ORD-9921";
                LoadOrder(orderId);
            }
        }

        private void LoadOrder(string id)
        {
            var ord = DataStore.ShopOrders.FirstOrDefault(o => o.OrderId.Equals(id, StringComparison.OrdinalIgnoreCase))
                      ?? DataStore.ShopOrders.FirstOrDefault(o => o.OrderId.Replace("#", "").Equals(id.Replace("#", ""), StringComparison.OrdinalIgnoreCase))
                      ?? DataStore.ShopOrders.FirstOrDefault();

            if (ord != null)
            {
                lblOrderTitle.Text = "Edit Order: " + ord.OrderId;
                txtOrderId.Text = ord.OrderId;
                txtCustomerName.Text = ord.CustomerName;
                txtCustomerPhone.Text = !string.IsNullOrEmpty(ord.CustomerPhone) ? ord.CustomerPhone : "+91 98765 43210";
                txtCustomerEmail.Text = !string.IsNullOrEmpty(ord.CustomerEmail) ? ord.CustomerEmail : (ord.CustomerName.ToLower().Replace(" ", ".") + "@example.com");
                txtDeliveryAddress.Text = !string.IsNullOrEmpty(ord.DeliveryAddress) ? ord.DeliveryAddress : "Plot 42, Farm Road, Sector 3, Gujarat";
                txtItemsCount.Text = ord.ItemsCount;
                txtTotalAmount.Text = ord.TotalAmount.ToString("F2");
                txtOrderNotes.Text = ord.Notes ?? "Standard counter pickup and farm request.";

                if (ddlOrderStatus.Items.FindByValue(ord.OrderStatus) != null)
                {
                    ddlOrderStatus.SelectedValue = ord.OrderStatus;
                }
                if (ddlPaymentStatus.Items.FindByValue(ord.PaymentStatus) != null)
                {
                    ddlPaymentStatus.SelectedValue = ord.PaymentStatus;
                }
            }
        }

        protected void btnSaveOrder_Click(object sender, EventArgs e)
        {
            Page.Validate("vgEditOrder");
            if (Page.IsValid)
            {
                string id = !string.IsNullOrEmpty(txtOrderId.Text) ? txtOrderId.Text.Trim() : (Request.QueryString["id"] ?? Request.Form[txtOrderId.UniqueID] ?? "#ORD-9921");
                var ord = DataStore.ShopOrders.FirstOrDefault(o => o.OrderId.Equals(id, StringComparison.OrdinalIgnoreCase))
                          ?? DataStore.ShopOrders.FirstOrDefault(o => o.OrderId.Replace("#", "").Equals(id.Replace("#", ""), StringComparison.OrdinalIgnoreCase))
                          ?? DataStore.ShopOrders.FirstOrDefault();
                if (ord != null)
                {
                    decimal amt;
                    decimal.TryParse(txtTotalAmount.Text, out amt);

                    ord.CustomerName = txtCustomerName.Text.Trim();
                    ord.CustomerPhone = txtCustomerPhone.Text.Trim();
                    ord.CustomerEmail = txtCustomerEmail.Text.Trim();
                    ord.DeliveryAddress = txtDeliveryAddress.Text.Trim();
                    ord.ItemsCount = txtItemsCount.Text.Trim();
                    ord.TotalAmount = amt;
                    ord.OrderStatus = ddlOrderStatus.SelectedValue;
                    ord.PaymentStatus = ddlPaymentStatus.SelectedValue;
                    ord.Notes = txtOrderNotes.Text.Trim();

                    pnlOrderSuccess.Visible = true;
                    lblOrderSuccess.Text = "Order " + ord.OrderId + " has been successfully updated!";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Shop/Orders.aspx");
        }
    }
}
