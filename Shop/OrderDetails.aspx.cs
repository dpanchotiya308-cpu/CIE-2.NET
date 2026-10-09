using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public class OrderLineItem
    {
        public string Name { get; set; }
        public string Category { get; set; }
        public string Sku { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public decimal LineTotal { get { return Price * Quantity; } }
        public string ImageUrl { get; set; }
    }

    public partial class OrderDetails : System.Web.UI.Page
    {
        public ShopOrderItem CurrentOrder { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string orderId = Request.QueryString["id"] ?? "#ORD-9921";
            LoadOrder(orderId);
        }

        private void LoadOrder(string id)
        {
            CurrentOrder = DataStore.ShopOrders.FirstOrDefault(o => o.OrderId.Equals(id, StringComparison.OrdinalIgnoreCase))
                           ?? DataStore.ShopOrders.FirstOrDefault(o => o.OrderId.Replace("#", "").Equals(id.Replace("#", ""), StringComparison.OrdinalIgnoreCase))
                           ?? DataStore.ShopOrders.FirstOrDefault();

            if (CurrentOrder != null)
            {
                lblOrderId.Text = CurrentOrder.OrderId;
                lblOrderStatusBadge.Text = CurrentOrder.OrderStatus;
                lblPaymentBadge.Text = CurrentOrder.PaymentStatus;
                lblPlacedDate.Text = CurrentOrder.DateFormatted;
                lblPlacedTime.Text = CurrentOrder.TimeFormatted;

                lnkEditOrder.NavigateUrl = "/Shop/EditOrder.aspx?id=" + Server.UrlEncode(CurrentOrder.OrderId);

                // Customer info
                lblCustomerName.Text = CurrentOrder.CustomerName;
                lblCustomerPhone.Text = !string.IsNullOrEmpty(CurrentOrder.CustomerPhone) ? CurrentOrder.CustomerPhone : "+91 98765 43210";
                lblCustomerEmail.Text = !string.IsNullOrEmpty(CurrentOrder.CustomerEmail) ? CurrentOrder.CustomerEmail : (CurrentOrder.CustomerName.ToLower().Replace(" ", ".") + "@example.com");
                lblDeliveryAddress.Text = !string.IsNullOrEmpty(CurrentOrder.DeliveryAddress) ? CurrentOrder.DeliveryAddress : "Plot 42, Farm Road, Sector 3, Anand, Gujarat - 388001";
                if (!string.IsNullOrEmpty(CurrentOrder.CustomerAvatar))
                {
                    imgCustomerAvatar.Src = CurrentOrder.CustomerAvatar;
                }

                // Financials
                decimal subtotal = Math.Round(CurrentOrder.TotalAmount / 1.05m, 2);
                decimal tax = CurrentOrder.TotalAmount - subtotal;
                lblSubtotal.Text = subtotal.ToString("N2");
                lblTax.Text = tax.ToString("N2");
                lblGrandTotal.Text = CurrentOrder.TotalAmount.ToString("N2");
                lblTxnStatus.Text = CurrentOrder.PaymentStatus == "PAID" ? "Settled (Ref #TXN-778210)" : "Pending Receipt";

                // Bind mock items list
                var items = new List<OrderLineItem>();
                var p1 = DataStore.ShopProducts.FirstOrDefault(p => p.Sku == "FRT-URE-22") ?? DataStore.ShopProducts.FirstOrDefault();
                if (p1 != null)
                {
                    items.Add(new OrderLineItem { Name = p1.Name, Category = p1.Category, Sku = p1.Sku, Price = p1.Price, Quantity = 2, ImageUrl = p1.ImageUrl });
                }
                var p2 = DataStore.ShopProducts.FirstOrDefault(p => p.Sku == "SEED-CRN-01") ?? DataStore.ShopProducts.Skip(1).FirstOrDefault();
                if (p2 != null)
                {
                    items.Add(new OrderLineItem { Name = p2.Name, Category = p2.Category, Sku = p2.Sku, Price = p2.Price, Quantity = 1, ImageUrl = p2.ImageUrl });
                }

                lblItemCountHeader.Text = items.Count + " Items";
                rptOrderItems.DataSource = items;
                rptOrderItems.DataBind();
            }
        }

        protected void btnMarkDelivered_Click(object sender, EventArgs e)
        {
            if (CurrentOrder != null)
            {
                CurrentOrder.OrderStatus = "DELIVERED";
                CurrentOrder.PaymentStatus = "PAID";
                pnlStatusUpdateSuccess.Visible = true;
                lblStatusUpdateSuccess.Text = "Order " + CurrentOrder.OrderId + " marked as DELIVERED successfully.";
                LoadOrder(CurrentOrder.OrderId);
            }
        }

        protected void btnCancelOrder_Click(object sender, EventArgs e)
        {
            if (CurrentOrder != null)
            {
                CurrentOrder.OrderStatus = "CANCELLED";
                pnlStatusUpdateSuccess.Visible = true;
                lblStatusUpdateSuccess.Text = "Order " + CurrentOrder.OrderId + " has been CANCELLED.";
                LoadOrder(CurrentOrder.OrderId);
            }
        }
    }
}
