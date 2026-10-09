using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class Crops : System.Web.UI.Page
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
            var crops = DataStore.Crops.AsQueryable();

            string search = (txtSearch.Text ?? "").Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                crops = crops.Where(c => (c.Name != null && c.Name.ToLower().Contains(search)) ||
                                         (c.LocalName != null && c.LocalName.ToLower().Contains(search)) ||
                                         (c.Category != null && c.Category.ToLower().Contains(search)));
            }

            string cat = ddlCategoryFilter.SelectedValue;
            if (cat != "All")
            {
                crops = crops.Where(c => c.Category != null && c.Category.Equals(cat, StringComparison.OrdinalIgnoreCase));
            }

            rptCrops.DataSource = crops.ToList();
            rptCrops.DataBind();
        }

        protected void Filter_Changed(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btnAddCrop_Click(object sender, EventArgs e)
        {
            lblModalTitle.Text = "Add New Crop";
            hfEditCropId.Value = "";
            txtCropName.Text = "";
            txtLocalName.Text = "";
            txtScientificName.Text = "";
            ddlCropCategory.SelectedIndex = 0;
            txtDuration.Text = "";
            txtAvgYield.Text = "";
            txtMarketRate.Text = "";
            txtClimate.Text = "";
            txtSowingSeason.Text = "";
            txtWater.Text = "";
            txtSoil.Text = "";
            txtImageUrl.Text = "/Images/crops/wheat_banner.jpg";
            txtDescription.Text = "";

            pnlModal.Visible = true;
        }

        protected void rptCrops_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string cropId = e.CommandArgument as string;

            if (e.CommandName == "EditItem")
            {
                var crop = DataStore.Crops.FirstOrDefault(c => c.Id == cropId);
                if (crop != null)
                {
                    lblModalTitle.Text = "Edit Crop - " + crop.Name;
                    hfEditCropId.Value = crop.Id;
                    txtCropName.Text = crop.Name;
                    txtLocalName.Text = crop.LocalName;
                    txtScientificName.Text = crop.ScientificName;
                    if (ddlCropCategory.Items.FindByValue(crop.Category) != null)
                    {
                        ddlCropCategory.SelectedValue = crop.Category;
                    }
                    txtDuration.Text = crop.Duration;
                    txtAvgYield.Text = crop.AvgYield;
                    txtMarketRate.Text = crop.MarketRate;
                    txtClimate.Text = crop.Climate;
                    txtSowingSeason.Text = crop.SowingSeason;
                    txtWater.Text = crop.Water;
                    txtSoil.Text = crop.Soil;
                    txtImageUrl.Text = crop.ImageUrl;
                    txtDescription.Text = crop.Description;

                    pnlModal.Visible = true;
                }
            }
            else if (e.CommandName == "DeleteItem")
            {
                var crop = DataStore.Crops.FirstOrDefault(c => c.Id == cropId);
                if (crop != null)
                {
                    DataStore.Crops.Remove(crop);
                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Crop '" + crop.Name + "' deleted successfully!";
                    BindGrid();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string editId = hfEditCropId.Value;
            if (string.IsNullOrEmpty(txtCropName.Text.Trim()))
            {
                return;
            }

            if (string.IsNullOrEmpty(editId))
            {
                // New Crop
                string newId = txtCropName.Text.Trim().ToLower().Replace(" ", "-");
                var newCrop = new Crop
                {
                    Id = newId,
                    Name = txtCropName.Text.Trim(),
                    LocalName = txtLocalName.Text.Trim(),
                    ScientificName = txtScientificName.Text.Trim(),
                    Category = ddlCropCategory.SelectedValue,
                    Duration = txtDuration.Text.Trim(),
                    AvgYield = txtAvgYield.Text.Trim(),
                    MarketRate = txtMarketRate.Text.Trim(),
                    Climate = txtClimate.Text.Trim(),
                    SowingSeason = txtSowingSeason.Text.Trim(),
                    Water = txtWater.Text.Trim(),
                    Soil = txtSoil.Text.Trim(),
                    ImageUrl = string.IsNullOrEmpty(txtImageUrl.Text.Trim()) ? "/Images/crops/wheat_banner.jpg" : txtImageUrl.Text.Trim(),
                    Description = txtDescription.Text.Trim()
                };

                DataStore.Crops.Insert(0, newCrop);
                pnlFeedback.Visible = true;
                lblFeedback.Text = "New crop '" + newCrop.Name + "' created successfully!";
            }
            else
            {
                // Edit existing crop
                var existing = DataStore.Crops.FirstOrDefault(c => c.Id == editId);
                if (existing != null)
                {
                    existing.Name = txtCropName.Text.Trim();
                    existing.LocalName = txtLocalName.Text.Trim();
                    existing.ScientificName = txtScientificName.Text.Trim();
                    existing.Category = ddlCropCategory.SelectedValue;
                    existing.Duration = txtDuration.Text.Trim();
                    existing.AvgYield = txtAvgYield.Text.Trim();
                    existing.MarketRate = txtMarketRate.Text.Trim();
                    existing.Climate = txtClimate.Text.Trim();
                    existing.SowingSeason = txtSowingSeason.Text.Trim();
                    existing.Water = txtWater.Text.Trim();
                    existing.Soil = txtSoil.Text.Trim();
                    existing.ImageUrl = txtImageUrl.Text.Trim();
                    existing.Description = txtDescription.Text.Trim();

                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Crop '" + existing.Name + "' updated successfully!";
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
