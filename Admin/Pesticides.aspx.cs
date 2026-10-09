using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class Pesticides : System.Web.UI.Page
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
            var list = DataStore.Pesticides.AsQueryable();

            string search = (txtSearch.Text ?? "").Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(p => (p.Name != null && p.Name.ToLower().Contains(search)) ||
                                       (p.Targets != null && p.Targets.ToLower().Contains(search)) ||
                                       (p.Category != null && p.Category.ToLower().Contains(search)));
            }

            string cat = ddlTypeFilter.SelectedValue;
            if (cat != "All")
            {
                list = list.Where(p => p.Category != null && p.Category.Equals(cat, StringComparison.OrdinalIgnoreCase));
            }

            rptPesticides.DataSource = list.ToList();
            rptPesticides.DataBind();
        }

        protected void Filter_Changed(object sender, EventArgs e)
        {
            BindGrid();
        }

        public string GetToxicityCss(string tox)
        {
            if (string.IsNullOrEmpty(tox)) return "toxicity-moderate";
            tox = tox.ToLower();
            if (tox.Contains("high")) return "toxicity-high";
            if (tox.Contains("safe") || tox.Contains("organic")) return "toxicity-safe";
            return "toxicity-moderate";
        }

        protected void btnAddPesticide_Click(object sender, EventArgs e)
        {
            lblModalTitle.Text = "Add Pesticide";
            hfEditId.Value = "";
            txtPestName.Text = "";
            txtSku.Text = "PEST-" + Guid.NewGuid().ToString().Substring(0, 5).ToUpper();
            ddlCategory.SelectedIndex = 0;
            ddlToxicityLevel.SelectedIndex = 0;
            txtTargets.Text = "";
            txtDosage.Text = "";
            txtApplicationMethod.Text = "";
            txtSuitableCrops.Text = "";
            txtSafetyPrecautions.Text = "";
            txtAntidoteFirstAid.Text = "";
            txtImageUrl.Text = "/Images/pesticides/chlorpyrifos.jpg";
            ddlStatus.SelectedIndex = 0;
            txtDescription.Text = "";

            pnlModal.Visible = true;
        }

        protected void rptPesticides_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string id = e.CommandArgument as string;

            if (e.CommandName == "EditItem")
            {
                var item = DataStore.Pesticides.FirstOrDefault(p => p.Id == id);
                if (item != null)
                {
                    lblModalTitle.Text = "Edit Pesticide - " + item.Name;
                    hfEditId.Value = item.Id;
                    txtPestName.Text = item.Name;
                    txtSku.Text = item.Sku;
                    if (ddlCategory.Items.FindByValue(item.Category) != null)
                    {
                        ddlCategory.SelectedValue = item.Category;
                    }
                    if (ddlToxicityLevel.Items.FindByValue(item.ToxicityLevel) != null)
                    {
                        ddlToxicityLevel.SelectedValue = item.ToxicityLevel;
                    }
                    txtTargets.Text = item.Targets;
                    txtDosage.Text = item.Dosage;
                    txtApplicationMethod.Text = item.ApplicationMethod;
                    txtSuitableCrops.Text = item.SuitableCrops;
                    txtSafetyPrecautions.Text = item.SafetyPrecautions;
                    txtAntidoteFirstAid.Text = item.AntidoteFirstAid;
                    txtImageUrl.Text = item.ImageUrl;
                    if (ddlStatus.Items.FindByValue(item.Status) != null)
                    {
                        ddlStatus.SelectedValue = item.Status;
                    }
                    txtDescription.Text = item.Description;

                    pnlModal.Visible = true;
                }
            }
            else if (e.CommandName == "DeleteItem")
            {
                var item = DataStore.Pesticides.FirstOrDefault(p => p.Id == id);
                if (item != null)
                {
                    DataStore.Pesticides.Remove(item);
                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Pesticide '" + item.Name + "' deleted successfully!";
                    BindGrid();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string editId = hfEditId.Value;
            if (string.IsNullOrEmpty(txtPestName.Text.Trim()))
            {
                return;
            }

            if (string.IsNullOrEmpty(editId))
            {
                // New item
                string newId = txtPestName.Text.Trim().ToLower().Replace(" ", "-");
                var newItem = new Pesticide
                {
                    Id = newId,
                    Name = txtPestName.Text.Trim(),
                    Sku = string.IsNullOrEmpty(txtSku.Text.Trim()) ? "PEST-" + newId.ToUpper() : txtSku.Text.Trim(),
                    Category = ddlCategory.SelectedValue,
                    ToxicityLevel = ddlToxicityLevel.SelectedValue,
                    Targets = txtTargets.Text.Trim(),
                    Dosage = txtDosage.Text.Trim(),
                    ApplicationMethod = txtApplicationMethod.Text.Trim(),
                    SuitableCrops = txtSuitableCrops.Text.Trim(),
                    SafetyPrecautions = txtSafetyPrecautions.Text.Trim(),
                    AntidoteFirstAid = txtAntidoteFirstAid.Text.Trim(),
                    ImageUrl = string.IsNullOrEmpty(txtImageUrl.Text.Trim()) ? "/Images/pesticides/chlorpyrifos.jpg" : txtImageUrl.Text.Trim(),
                    Status = ddlStatus.SelectedValue,
                    Description = txtDescription.Text.Trim(),
                    StockLevel = "100 In Stock"
                };

                DataStore.Pesticides.Insert(0, newItem);
                pnlFeedback.Visible = true;
                lblFeedback.Text = "Pesticide '" + newItem.Name + "' created successfully!";
            }
            else
            {
                // Edit existing
                var existing = DataStore.Pesticides.FirstOrDefault(p => p.Id == editId);
                if (existing != null)
                {
                    existing.Name = txtPestName.Text.Trim();
                    existing.Sku = txtSku.Text.Trim();
                    existing.Category = ddlCategory.SelectedValue;
                    existing.ToxicityLevel = ddlToxicityLevel.SelectedValue;
                    existing.Targets = txtTargets.Text.Trim();
                    existing.Dosage = txtDosage.Text.Trim();
                    existing.ApplicationMethod = txtApplicationMethod.Text.Trim();
                    existing.SuitableCrops = txtSuitableCrops.Text.Trim();
                    existing.SafetyPrecautions = txtSafetyPrecautions.Text.Trim();
                    existing.AntidoteFirstAid = txtAntidoteFirstAid.Text.Trim();
                    existing.ImageUrl = txtImageUrl.Text.Trim();
                    existing.Status = ddlStatus.SelectedValue;
                    existing.Description = txtDescription.Text.Trim();

                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Pesticide '" + existing.Name + "' updated successfully!";
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
