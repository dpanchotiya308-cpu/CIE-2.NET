using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            var list = DataStore.ShopProducts.AsQueryable();

            string search = (txtSearchProducts.Text ?? "").Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(p => (p.Name != null && p.Name.ToLower().Contains(search)) ||
                                       (p.Sku != null && p.Sku.ToLower().Contains(search)) ||
                                       (p.Category != null && p.Category.ToLower().Contains(search)));
            }

            string cat = ddlCategoryFilter.SelectedValue;
            if (cat != "All")
            {
                list = list.Where(p => p.Category != null && p.Category.Equals(cat, StringComparison.OrdinalIgnoreCase));
            }

            rptAdminProducts.DataSource = list.ToList();
            rptAdminProducts.DataBind();
        }

        protected void FilterProducts_Changed(object sender, EventArgs e)
        {
            BindGrid();
        }

        public string GetStatusBg(string status)
        {
            if (status == "In Stock") return "#dcfce7";
            if (status == "Low Stock") return "#fef9c3";
            return "#fee2e2";
        }

        public string GetStatusColor(string status)
        {
            if (status == "In Stock") return "#166534";
            if (status == "Low Stock") return "#854d0e";
            return "#991b1b";
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            lblModalTitle.Text = "Add Product";
            hfEditId.Value = "";
            txtProdName.Text = "";
            txtSku.Text = "PROD-" + Guid.NewGuid().ToString().Substring(0, 5).ToUpper();
            ddlCategory.SelectedIndex = 0;
            txtType.Text = "";
            txtNpkRatio.Text = "";
            txtTargetPest.Text = "";
            txtPrice.Text = "0.00";
            txtStockLevel.Text = "100 Bags";
            ddlStatus.SelectedIndex = 0;
            txtImageUrl.Text = "/Images/products/urea_nitrogen.jpg";
            txtDescription.Text = "";

            pnlModal.Visible = true;
        }

        protected void rptAdminProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string sku = e.CommandArgument as string;

            if (e.CommandName == "EditItem")
            {
                var item = DataStore.ShopProducts.FirstOrDefault(p => p.Sku == sku);
                if (item != null)
                {
                    lblModalTitle.Text = "Edit Product - " + item.Name;
                    hfEditId.Value = item.Sku;
                    txtProdName.Text = item.Name;
                    txtSku.Text = item.Sku;
                    if (ddlCategory.Items.FindByValue(item.Category) != null)
                    {
                        ddlCategory.SelectedValue = item.Category;
                    }
                    txtType.Text = item.Type;
                    txtNpkRatio.Text = item.NpkRatio;
                    txtTargetPest.Text = item.TargetPest;
                    txtPrice.Text = item.Price.ToString("F2");
                    txtStockLevel.Text = item.StockLevel;
                    if (ddlStatus.Items.FindByValue(item.Status) != null)
                    {
                        ddlStatus.SelectedValue = item.Status;
                    }
                    txtImageUrl.Text = item.ImageUrl;
                    txtDescription.Text = item.Description;

                    pnlModal.Visible = true;
                }
            }
            else if (e.CommandName == "DeleteItem")
            {
                var item = DataStore.ShopProducts.FirstOrDefault(p => p.Sku == sku);
                if (item != null)
                {
                    DataStore.ShopProducts.Remove(item);
                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Product '" + item.Name + "' deleted successfully!";
                    BindGrid();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string editSku = hfEditId.Value;
            if (string.IsNullOrEmpty(txtProdName.Text.Trim()))
            {
                return;
            }

            decimal price = 0;
            decimal.TryParse(txtPrice.Text.Trim(), out price);

            if (string.IsNullOrEmpty(editSku))
            {
                // New item
                string sku = string.IsNullOrEmpty(txtSku.Text.Trim()) ? "PROD-" + Guid.NewGuid().ToString().Substring(0, 5).ToUpper() : txtSku.Text.Trim();
                var newItem = new ShopProduct
                {
                    Sku = sku,
                    Name = txtProdName.Text.Trim(),
                    Category = ddlCategory.SelectedValue,
                    Type = txtType.Text.Trim(),
                    NpkRatio = txtNpkRatio.Text.Trim(),
                    TargetPest = txtTargetPest.Text.Trim(),
                    Price = price,
                    StockLevel = string.IsNullOrEmpty(txtStockLevel.Text.Trim()) ? "100 Bags" : txtStockLevel.Text.Trim(),
                    StockCurrent = 100,
                    StockMax = 500,
                    Status = ddlStatus.SelectedValue,
                    ImageUrl = string.IsNullOrEmpty(txtImageUrl.Text.Trim()) ? "/Images/products/urea_nitrogen.jpg" : txtImageUrl.Text.Trim(),
                    Description = txtDescription.Text.Trim(),
                    StoreId = "kisan-agro"
                };

                DataStore.ShopProducts.Insert(0, newItem);
                pnlFeedback.Visible = true;
                lblFeedback.Text = "Product '" + newItem.Name + "' created successfully!";
            }
            else
            {
                // Edit existing
                var existing = DataStore.ShopProducts.FirstOrDefault(p => p.Sku == editSku);
                if (existing != null)
                {
                    existing.Name = txtProdName.Text.Trim();
                    existing.Sku = txtSku.Text.Trim();
                    existing.Category = ddlCategory.SelectedValue;
                    existing.Type = txtType.Text.Trim();
                    existing.NpkRatio = txtNpkRatio.Text.Trim();
                    existing.TargetPest = txtTargetPest.Text.Trim();
                    existing.Price = price;
                    existing.StockLevel = txtStockLevel.Text.Trim();
                    existing.Status = ddlStatus.SelectedValue;
                    existing.ImageUrl = txtImageUrl.Text.Trim();
                    existing.Description = txtDescription.Text.Trim();

                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Product '" + existing.Name + "' updated successfully!";
                }
            }

            pnlModal.Visible = false;
            BindGrid();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pnlModal.Visible = false;
        }
    }
}
