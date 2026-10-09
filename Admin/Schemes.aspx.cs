using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class Schemes : System.Web.UI.Page
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
            var list = DataStore.Schemes.AsQueryable();

            string search = (txtSearchSchemesAdmin.Text ?? "").Trim().ToLower();
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(s => (s.Name != null && s.Name.ToLower().Contains(search)) ||
                                       (s.Ministry != null && s.Ministry.ToLower().Contains(search)) ||
                                       (s.Category != null && s.Category.ToLower().Contains(search)));
            }

            string cat = ddlAdminCategoryFilter.SelectedValue;
            if (cat != "All")
            {
                list = list.Where(s => s.Category != null && s.Category.Equals(cat, StringComparison.OrdinalIgnoreCase));
            }

            rptAdminSchemes.DataSource = list.ToList();
            rptAdminSchemes.DataBind();
        }

        protected void FilterSchemesAdmin_Changed(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btnAddScheme_Click(object sender, EventArgs e)
        {
            lblModalTitle.Text = "Add Government Scheme";
            hfEditId.Value = "";
            txtSchemeTitle.Text = "";
            txtMinistry.Text = "Ministry of Agriculture";
            ddlCategory.SelectedIndex = 0;
            txtSubsidyPercentage.Text = "";
            txtEligibility.Text = "";
            txtRequiredDocuments.Text = "";
            txtApplyUrl.Text = "https://ikhedut.gujarat.gov.in";
            ddlStatus.SelectedIndex = 0;
            txtDescription.Text = "";

            pnlModal.Visible = true;
        }

        protected void rptAdminSchemes_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string id = e.CommandArgument as string;

            if (e.CommandName == "EditItem")
            {
                var item = DataStore.Schemes.FirstOrDefault(s => s.Id == id);
                if (item != null)
                {
                    lblModalTitle.Text = "Edit Government Scheme - " + item.Name;
                    hfEditId.Value = item.Id;
                    txtSchemeTitle.Text = item.Name;
                    txtMinistry.Text = item.Ministry;
                    if (ddlCategory.Items.FindByValue(item.Category) != null)
                    {
                        ddlCategory.SelectedValue = item.Category;
                    }
                    txtSubsidyPercentage.Text = item.BenefitBadge;
                    txtEligibility.Text = item.Eligibility;
                    txtRequiredDocuments.Text = item.RequiredDocuments;
                    txtApplyUrl.Text = item.PortalUrl;
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
                var item = DataStore.Schemes.FirstOrDefault(s => s.Id == id);
                if (item != null)
                {
                    DataStore.Schemes.Remove(item);
                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Government scheme '" + item.Name + "' deleted successfully!";
                    BindGrid();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string editId = hfEditId.Value;
            if (string.IsNullOrEmpty(txtSchemeTitle.Text.Trim()))
            {
                return;
            }

            if (string.IsNullOrEmpty(editId))
            {
                // New item
                string newId = txtSchemeTitle.Text.Trim().ToLower().Replace(" ", "-");
                var newItem = new Scheme
                {
                    Id = newId,
                    Name = txtSchemeTitle.Text.Trim(),
                    Ministry = txtMinistry.Text.Trim(),
                    Category = ddlCategory.SelectedValue,
                    BenefitBadge = txtSubsidyPercentage.Text.Trim(),
                    Eligibility = txtEligibility.Text.Trim(),
                    RequiredDocuments = txtRequiredDocuments.Text.Trim(),
                    PortalUrl = string.IsNullOrEmpty(txtApplyUrl.Text.Trim()) ? "https://ikhedut.gujarat.gov.in" : txtApplyUrl.Text.Trim(),
                    PortalName = "iKhedut Portal",
                    Status = ddlStatus.SelectedValue,
                    Description = txtDescription.Text.Trim(),
                    Icon = "🏛️",
                    Deadline = "31 Dec 2026",
                    ActiveApps = "12,450",
                    FundsAllocated = "₹500 Cr"
                };

                DataStore.Schemes.Insert(0, newItem);
                pnlFeedback.Visible = true;
                lblFeedback.Text = "Government scheme '" + newItem.Name + "' created successfully!";
            }
            else
            {
                // Edit existing
                var existing = DataStore.Schemes.FirstOrDefault(s => s.Id == editId);
                if (existing != null)
                {
                    existing.Name = txtSchemeTitle.Text.Trim();
                    existing.Ministry = txtMinistry.Text.Trim();
                    existing.Category = ddlCategory.SelectedValue;
                    existing.BenefitBadge = txtSubsidyPercentage.Text.Trim();
                    existing.Eligibility = txtEligibility.Text.Trim();
                    existing.RequiredDocuments = txtRequiredDocuments.Text.Trim();
                    existing.PortalUrl = txtApplyUrl.Text.Trim();
                    existing.Status = ddlStatus.SelectedValue;
                    existing.Description = txtDescription.Text.Trim();

                    pnlFeedback.Visible = true;
                    lblFeedback.Text = "Government scheme '" + existing.Name + "' updated successfully!";
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
