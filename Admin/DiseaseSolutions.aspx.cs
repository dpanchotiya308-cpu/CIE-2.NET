using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class DiseaseSolutions : System.Web.UI.Page
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
            var list = DataStore.Diseases.AsQueryable();

            string search = (txtSearch.Text ?? "").Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(d => (d.Name != null && d.Name.ToLower().Contains(search)) ||
                                       (d.AffectsCrop != null && d.AffectsCrop.ToLower().Contains(search)) ||
                                       (d.Category != null && d.Category.ToLower().Contains(search)));
            }

            string cat = ddlTypeFilter.SelectedValue;
            if (cat != "All")
            {
                list = list.Where(d => d.Category != null && d.Category.Equals(cat, StringComparison.OrdinalIgnoreCase));
            }

            rptDiseases.DataSource = list.ToList();
            rptDiseases.DataBind();
        }

        protected void Filter_Changed(object sender, EventArgs e)
        {
            BindGrid();
        }

        public string GetTypeCss(string cat)
        {
            if (string.IsNullOrEmpty(cat)) return "severity-fungal";
            cat = cat.ToLower();
            if (cat.Contains("viral")) return "severity-viral";
            if (cat.Contains("bacteri")) return "severity-bacterial";
            return "severity-fungal";
        }

        public string GetSeverity(string cat)
        {
            if (string.IsNullOrEmpty(cat)) return "Moderate";
            cat = cat.ToLower();
            if (cat.Contains("viral")) return "High Priority";
            if (cat.Contains("bacteri")) return "High";
            return "Moderate";
        }

        public string TruncateText(string input, int maxLen)
        {
            if (string.IsNullOrEmpty(input)) return "";
            return input.Length <= maxLen ? input : input.Substring(0, maxLen) + "...";
        }

        protected void btnAddDisease_Click(object sender, EventArgs e)
        {
            lblModalTitle.Text = "Add Disease Solution";
            hfEditId.Value = "";
            txtDiseaseName.Text = "";
            txtAffectsCrop.Text = "";
            ddlCategory.SelectedIndex = 0;
            ddlSeverity.SelectedIndex = 0;
            txtSymptom.Text = "";
            txtTreatment.Text = "";
            txtPrevention.Text = "";
            txtRecommendedProducts.Text = "";
            txtImageUrl.Text = "/Images/diseases/paddy_blast.jpg";
            txtDescription.Text = "";

            pnlModal.Visible = true;
        }

        protected void rptDiseases_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string id = e.CommandArgument as string;

            if (e.CommandName == "EditItem")
            {
                var item = DataStore.Diseases.FirstOrDefault(d => d.Id == id);
                if (item != null)
                {
                    lblModalTitle.Text = "Edit Disease Solution - " + item.Name;
                    hfEditId.Value = item.Id;
                    txtDiseaseName.Text = item.Name;
                    txtAffectsCrop.Text = item.AffectsCrop;
                    if (ddlCategory.Items.FindByValue(item.Category) != null)
                    {
                        ddlCategory.SelectedValue = item.Category;
                    }
                    if (ddlSeverity.Items.FindByValue(item.Severity) != null)
                    {
                        ddlSeverity.SelectedValue = item.Severity;
                    }
                    txtSymptom.Text = item.Symptom;
                    txtTreatment.Text = item.Treatment;
                    txtPrevention.Text = item.Prevention;
                    txtRecommendedProducts.Text = item.RecommendedProducts;
                    txtImageUrl.Text = item.ImageUrl;
                    txtDescription.Text = item.Description;

                    pnlModal.Visible = true;
                }
            }
            else if (e.CommandName == "DeleteItem")
            {
                var item = DataStore.Diseases.FirstOrDefault(d => d.Id == id);
                if (item != null)
                {
                    DataStore.Diseases.Remove(item);
                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Disease solution '" + item.Name + "' deleted successfully!";
                    BindGrid();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string editId = hfEditId.Value;
            if (string.IsNullOrEmpty(txtDiseaseName.Text.Trim()))
            {
                return;
            }

            if (string.IsNullOrEmpty(editId))
            {
                // New item
                string newId = txtDiseaseName.Text.Trim().ToLower().Replace(" ", "-");
                var newItem = new DiseaseSolution
                {
                    Id = newId,
                    Name = txtDiseaseName.Text.Trim(),
                    AffectsCrop = txtAffectsCrop.Text.Trim(),
                    Category = ddlCategory.SelectedValue,
                    Severity = ddlSeverity.SelectedValue,
                    Symptom = txtSymptom.Text.Trim(),
                    Treatment = txtTreatment.Text.Trim(),
                    Prevention = txtPrevention.Text.Trim(),
                    RecommendedProducts = txtRecommendedProducts.Text.Trim(),
                    ImageUrl = string.IsNullOrEmpty(txtImageUrl.Text.Trim()) ? "/Images/diseases/paddy_blast.jpg" : txtImageUrl.Text.Trim(),
                    Description = txtDescription.Text.Trim()
                };

                DataStore.Diseases.Insert(0, newItem);
                pnlFeedback.Visible = true;
                lblFeedback.Text = "Disease solution '" + newItem.Name + "' created successfully!";
            }
            else
            {
                // Edit existing
                var existing = DataStore.Diseases.FirstOrDefault(d => d.Id == editId);
                if (existing != null)
                {
                    existing.Name = txtDiseaseName.Text.Trim();
                    existing.AffectsCrop = txtAffectsCrop.Text.Trim();
                    existing.Category = ddlCategory.SelectedValue;
                    existing.Severity = ddlSeverity.SelectedValue;
                    existing.Symptom = txtSymptom.Text.Trim();
                    existing.Treatment = txtTreatment.Text.Trim();
                    existing.Prevention = txtPrevention.Text.Trim();
                    existing.RecommendedProducts = txtRecommendedProducts.Text.Trim();
                    existing.ImageUrl = txtImageUrl.Text.Trim();
                    existing.Description = txtDescription.Text.Trim();

                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Disease solution '" + existing.Name + "' updated successfully!";
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
