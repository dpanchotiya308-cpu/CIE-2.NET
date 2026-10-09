using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class EditInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sku = Request.QueryString["sku"] ?? Request.QueryString["id"] ?? "FRT-URE-22";
                LoadProduct(sku);
            }
        }

        private void LoadProduct(string sku)
        {
            var prod = DataStore.ShopProducts.FirstOrDefault(p => p.Sku.Equals(sku, StringComparison.OrdinalIgnoreCase))
                       ?? DataStore.ShopProducts.FirstOrDefault();

            if (prod != null)
            {
                lblEditTitle.Text = "Edit Product: " + prod.Name;
                txtProductName.Text = prod.Name;
                if (ddlCategory.Items.FindByValue(prod.Category) != null)
                {
                    ddlCategory.SelectedValue = prod.Category;
                }
                txtSku.Text = prod.Sku;
                txtProductDescription.Text = !string.IsNullOrEmpty(prod.Description) ? prod.Description : prod.Name + " standard agricultural product.";
                txtCurrentStock.Text = prod.StockCurrent > 0 ? prod.StockCurrent.ToString() : (prod.StockLevel != null ? prod.StockLevel.Split('/')[0].Trim() : "50");
                txtReorderLevel.Text = "15";
                txtSellingPrice.Text = prod.Price.ToString("F2");
                txtCostPrice.Text = prod.CostPrice > 0 ? prod.CostPrice.ToString("F2") : (prod.Price * 0.75m).ToString("F2");
                
                if (ddlProductStatus.Items.FindByValue(prod.Status) != null)
                {
                    ddlProductStatus.SelectedValue = prod.Status;
                }
            }
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            Page.Validate("vgEditProduct");
            if (Page.IsValid)
            {
                string sku = !string.IsNullOrEmpty(txtSku.Text) ? txtSku.Text.Trim() : (Request.QueryString["sku"] ?? Request.QueryString["id"] ?? Request.Form[txtSku.UniqueID] ?? "FRT-URE-22");
                var prod = DataStore.ShopProducts.FirstOrDefault(p => p.Sku.Equals(sku, StringComparison.OrdinalIgnoreCase))
                           ?? DataStore.ShopProducts.FirstOrDefault();
                if (prod != null)
                {
                    int stock;
                    int.TryParse(txtCurrentStock.Text, out stock);
                    decimal price;
                    decimal.TryParse(txtSellingPrice.Text, out price);
                    decimal cost;
                    decimal.TryParse(txtCostPrice.Text, out cost);

                    prod.Name = txtProductName.Text.Trim();
                    prod.Category = ddlCategory.SelectedValue;
                    prod.Description = txtProductDescription.Text.Trim();
                    prod.StockCurrent = stock;
                    prod.StockLevel = stock.ToString() + " / " + (prod.StockMax > 0 ? prod.StockMax : 500);
                    prod.Price = price;
                    prod.CostPrice = cost;
                    prod.Status = ddlProductStatus.SelectedValue;

                    pnlEditSuccess.Visible = true;
                    lblEditSuccess.Text = "Product '" + prod.Name + "' (SKU: " + prod.Sku + ") has been updated successfully!";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Shop/Inventory.aspx");
        }
    }
}
