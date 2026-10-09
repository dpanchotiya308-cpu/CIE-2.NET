using System;
using System.Drawing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class NewStockUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductDropdown();
                txtQuantity.Text = "50";
                txtBatchNumber.Text = "BATCH-" + DateTime.Now.ToString("yyyy") + "-0" + (DataStore.StockUpdates.Count + 10);
                UpdateSummaryPreview();
            }
        }

        private void BindProductDropdown()
        {
            ddlProduct.Items.Clear();
            ddlProduct.Items.Add(new ListItem("-- Select Product to Update --", ""));
            foreach (var p in DataStore.ShopProducts)
            {
                int currentQty = p.StockCurrent > 0 ? p.StockCurrent : (p.StockLevel != null ? int.Parse(p.StockLevel.Split('/')[0].Trim()) : 100);
                string text = p.Name + " [SKU: " + p.Sku + "] (Current: " + currentQty + ")";
                ddlProduct.Items.Add(new ListItem(text, p.Sku));
            }

            if (ddlProduct.Items.Count > 1)
            {
                ddlProduct.SelectedIndex = 1;
            }
        }

        private void UpdateSummaryPreview()
        {
            string sku = ddlProduct.SelectedValue;
            var prod = DataStore.ShopProducts.FirstOrDefault(p => p.Sku == sku) ?? DataStore.ShopProducts.FirstOrDefault();
            int currentStock = 0;
            if (prod != null)
            {
                currentStock = prod.StockCurrent > 0 ? prod.StockCurrent : (prod.StockLevel != null ? int.Parse(prod.StockLevel.Split('/')[0].Trim()) : 100);
            }
            lblCurrentStock.Text = currentStock.ToString();

            int qty = 0;
            int.TryParse(txtQuantity.Text, out qty);

            string type = ddlUpdateType.SelectedValue;
            int signedQty = (type == "RESTOCK" || type == "ADJUSTMENT") ? qty : -qty;

            if (signedQty >= 0)
            {
                lblMovementPreview.Text = "+" + signedQty;
                lblMovementPreview.ForeColor = Color.FromArgb(22, 163, 74);
            }
            else
            {
                lblMovementPreview.Text = signedQty.ToString();
                lblMovementPreview.ForeColor = Color.FromArgb(220, 38, 38);
            }

            int newStock = Math.Max(0, currentStock + signedQty);
            lblNewStockPreview.Text = newStock + " units";
        }

        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateSummaryPreview();
        }

        protected void ddlUpdateType_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateSummaryPreview();
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            UpdateSummaryPreview();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            Page.Validate("vgStockUpdate");
            if (Page.IsValid)
            {
                string sku = ddlProduct.SelectedValue;
                var prod = DataStore.ShopProducts.FirstOrDefault(p => p.Sku == sku);
                if (prod != null)
                {
                    int qty;
                    int.TryParse(txtQuantity.Text, out qty);
                    string type = ddlUpdateType.SelectedValue;
                    int signedQty = (type == "RESTOCK" || type == "ADJUSTMENT") ? qty : -qty;

                    int currentStock = prod.StockCurrent > 0 ? prod.StockCurrent : (prod.StockLevel != null ? int.Parse(prod.StockLevel.Split('/')[0].Trim()) : 100);
                    int newStock = Math.Max(0, currentStock + signedQty);

                    prod.StockCurrent = newStock;
                    prod.StockLevel = newStock + " / " + (prod.StockMax > 0 ? prod.StockMax : 500);
                    prod.Status = newStock > 20 ? "In Stock" : (newStock > 0 ? "Low Stock" : "Out of Stock");

                    var rec = new StockUpdateRecord
                    {
                        DateTimeFormatted = DateTime.Now.ToString("MMM dd, yyyy") + "\n" + DateTime.Now.ToString("hh:mm tt"),
                        ProductName = prod.Name,
                        Sku = prod.Sku,
                        UpdateType = type,
                        QtyChange = signedQty,
                        NewStock = newStock,
                        UpdatedBy = ddlStaff.SelectedValue,
                        UpdatedByAvatar = "/Images/avatars/rajesh_kumar_shop.jpg",
                        ProductImage = !string.IsNullOrEmpty(prod.ImageUrl) ? prod.ImageUrl : "/Images/products/urea_nitrogen.jpg"
                    };

                    DataStore.StockUpdates.Insert(0, rec);

                    pnlStockSuccess.Visible = true;
                    lblStockSuccess.Text = "Stock movement for '" + prod.Name + "' (" + (signedQty >= 0 ? "+" + signedQty : signedQty.ToString()) + ") recorded successfully! New stock is " + newStock + " units.";
                    UpdateSummaryPreview();
                }
            }
        }

        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Shop/StockUpdates.aspx");
        }
    }
}
