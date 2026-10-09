using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class Fertilizers : System.Web.UI.Page
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
            var list = DataStore.Fertilizers.AsQueryable();

            string search = (txtSearch.Text ?? "").Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(f => (f.Name != null && f.Name.ToLower().Contains(search)) ||
                                       (f.Sku != null && f.Sku.ToLower().Contains(search)) ||
                                       (f.Category != null && f.Category.ToLower().Contains(search)));
            }

            string cat = ddlCategoryFilter.SelectedValue;
            if (cat != "All")
            {
                list = list.Where(f => f.Category != null && f.Category.Equals(cat, StringComparison.OrdinalIgnoreCase));
            }

            rptFertilizers.DataSource = list.ToList();
            rptFertilizers.DataBind();
        }

        protected void Filter_Changed(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btnAddFertilizer_Click(object sender, EventArgs e)
        {
            lblModalTitle.Text = "Add Fertilizer";
            hfEditId.Value = "";
            txtFertName.Text = "";
            txtSku.Text = "FERT-" + Guid.NewGuid().ToString().Substring(0, 5).ToUpper();
            ddlCategory.SelectedIndex = 0;
            txtNpkRatio.Text = "";
            txtPrice.Text = "0.00";
            txtKeyFeature1.Text = "";
            txtKeyFeature2.Text = "";
            txtRecommendedDosage.Text = "";
            txtApplicationMethod.Text = "";
            txtSuitableCrops.Text = "";
            txtSafetyTips.Text = "";
            txtImageUrl.Text = "/Images/fertilizers/urea.jpg";
            txtDescription.Text = "";

            pnlModal.Visible = true;
        }

        protected void rptFertilizers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string id = e.CommandArgument as string;

            if (e.CommandName == "EditItem")
            {
                var item = DataStore.Fertilizers.FirstOrDefault(f => f.Id == id);
                if (item != null)
                {
                    lblModalTitle.Text = "Edit Fertilizer - " + item.Name;
                    hfEditId.Value = item.Id;
                    txtFertName.Text = item.Name;
                    txtSku.Text = item.Sku;
                    if (ddlCategory.Items.FindByValue(item.Category) != null)
                    {
                        ddlCategory.SelectedValue = item.Category;
                    }
                    txtNpkRatio.Text = item.NpkRatio;
                    txtPrice.Text = item.Price.ToString("F2");
                    txtKeyFeature1.Text = item.KeyFeature1;
                    txtKeyFeature2.Text = item.KeyFeature2;
                    txtRecommendedDosage.Text = item.RecommendedDosage;
                    txtApplicationMethod.Text = item.ApplicationMethod;
                    txtSuitableCrops.Text = item.SuitableCrops;
                    txtSafetyTips.Text = item.SafetyTips;
                    txtImageUrl.Text = item.ImageUrl;
                    txtDescription.Text = item.Description;

                    pnlModal.Visible = true;
                }
            }
            else if (e.CommandName == "DeleteItem")
            {
                var item = DataStore.Fertilizers.FirstOrDefault(f => f.Id == id);
                if (item != null)
                {
                    DataStore.Fertilizers.Remove(item);
                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Fertilizer '" + item.Name + "' deleted successfully!";
                    BindGrid();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string editId = hfEditId.Value;
            if (string.IsNullOrEmpty(txtFertName.Text.Trim()))
            {
                return;
            }

            decimal price = 0;
            decimal.TryParse(txtPrice.Text.Trim(), out price);

            if (string.IsNullOrEmpty(editId))
            {
                // New item
                string newId = txtFertName.Text.Trim().ToLower().Replace(" ", "-");
                var newItem = new Fertilizer
                {
                    Id = newId,
                    Name = txtFertName.Text.Trim(),
                    Sku = string.IsNullOrEmpty(txtSku.Text.Trim()) ? "FERT-" + newId.ToUpper() : txtSku.Text.Trim(),
                    Category = ddlCategory.SelectedValue,
                    NpkRatio = txtNpkRatio.Text.Trim(),
                    Price = price,
                    KeyFeature1 = txtKeyFeature1.Text.Trim(),
                    KeyFeature2 = txtKeyFeature2.Text.Trim(),
                    RecommendedDosage = txtRecommendedDosage.Text.Trim(),
                    ApplicationMethod = txtApplicationMethod.Text.Trim(),
                    SuitableCrops = txtSuitableCrops.Text.Trim(),
                    SafetyTips = txtSafetyTips.Text.Trim(),
                    ImageUrl = string.IsNullOrEmpty(txtImageUrl.Text.Trim()) ? "/Images/fertilizers/urea.jpg" : txtImageUrl.Text.Trim(),
                    Description = txtDescription.Text.Trim(),
                    StockCurrent = 100,
                    Status = "In Stock"
                };

                DataStore.Fertilizers.Insert(0, newItem);
                pnlFeedback.Visible = true;
                lblFeedback.Text = "Fertilizer '" + newItem.Name + "' created successfully!";
            }
            else
            {
                // Edit existing
                var existing = DataStore.Fertilizers.FirstOrDefault(f => f.Id == editId);
                if (existing != null)
                {
                    existing.Name = txtFertName.Text.Trim();
                    existing.Sku = txtSku.Text.Trim();
                    existing.Category = ddlCategory.SelectedValue;
                    existing.NpkRatio = txtNpkRatio.Text.Trim();
                    existing.Price = price;
                    existing.KeyFeature1 = txtKeyFeature1.Text.Trim();
                    existing.KeyFeature2 = txtKeyFeature2.Text.Trim();
                    existing.RecommendedDosage = txtRecommendedDosage.Text.Trim();
                    existing.ApplicationMethod = txtApplicationMethod.Text.Trim();
                    existing.SuitableCrops = txtSuitableCrops.Text.Trim();
                    existing.SafetyTips = txtSafetyTips.Text.Trim();
                    existing.ImageUrl = txtImageUrl.Text.Trim();
                    existing.Description = txtDescription.Text.Trim();

                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Fertilizer '" + existing.Name + "' updated successfully!";
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
