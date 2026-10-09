using System;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Shop
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtProductName.Text = "Urea Nitrogen 46%";
                ddlCategory.SelectedValue = "Fertilizers";
                txtSku.Text = "FERT-UR-46";
                txtProductDescription.Text = "Agricultural prilled urea fertilizer for soil enrichment.";
                txtInitialStock.Text = "100";
                txtReorderLevel.Text = "10";
                txtSellingPrice.Text = "840.00";
                txtCostPrice.Text = "650.00";
            }
        }

        protected void cvSku_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrWhiteSpace(args.Value))
            {
                args.IsValid = false;
                return;
            }

            // Must match SKU format pattern
            args.IsValid = Regex.IsMatch(args.Value.Trim().ToUpper(), @"^[A-Z0-9]{3,5}-[A-Z0-9]{2,5}-\d{2,4}$");
        }

        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            Page.Validate("vgAddProduct");
            if (Page.IsValid)
            {
                int stock;
                int.TryParse(txtInitialStock.Text, out stock);
                decimal price;
                decimal.TryParse(txtSellingPrice.Text, out price);
                decimal cost;
                decimal.TryParse(txtCostPrice.Text, out cost);

                // Add to in-memory store
                var newProd = new ShopProduct
                {
                    Name = txtProductName.Text.Trim(),
                    Category = ddlCategory.SelectedValue,
                    Sku = txtSku.Text.Trim().ToUpper(),
                    Description = txtProductDescription.Text.Trim(),
                    StockCurrent = stock,
                    StockMax = 500,
                    StockLevel = txtInitialStock.Text + " / 500",
                    Price = price,
                    CostPrice = cost,
                    Status = ddlProductStatus.SelectedValue == "Active" ? "In Stock" : "Low Stock",
                    ImageUrl = "/Images/products/urea_nitrogen.jpg"
                };

                DataStore.ShopProducts.Insert(0, newProd);

                pnlAddSuccess.Visible = true;
                lblAddSuccess.Text = "Product '" + newProd.Name + "' with SKU [" + newProd.Sku + "] saved successfully!";
                
                // Redirect back to inventory
                Response.Redirect("/Shop/Inventory.aspx");
            }
        }

        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Shop/Inventory.aspx");
        }
    }
}
