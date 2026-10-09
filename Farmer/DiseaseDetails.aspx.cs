using System;
using System.Linq;
using System.Web.UI;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class DiseaseDetails : System.Web.UI.Page
    {
        public DiseaseSolution CurrentDisease { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string diseaseId = Request.QueryString["id"] ?? "blast-paddy";
            CurrentDisease = DataStore.Diseases.FirstOrDefault(d => d.Id.Equals(diseaseId, StringComparison.OrdinalIgnoreCase));
            if (CurrentDisease == null)
            {
                CurrentDisease = DataStore.Diseases.FirstOrDefault(d => d.Id == "blast-paddy") ?? DataStore.Diseases.FirstOrDefault();
            }

            if (!IsPostBack)
            {
                if (CurrentDisease != null)
                {
                    bool isSaved = DataStore.SavedItems.Any(s => s.Id == "disease-" + CurrentDisease.Id);
                    if (isSaved)
                    {
                        btnSaveGuide.Text = "✓ Saved to My Guides";
                        btnSaveGuide.CssClass = "btn btn-success";
                    }
                }
            }
        }

        protected void btnSaveGuide_Click(object sender, EventArgs e)
        {
            if (CurrentDisease == null) return;

            string savedId = "disease-" + CurrentDisease.Id;
            var existing = DataStore.SavedItems.FirstOrDefault(s => s.Id == savedId);
            if (existing == null)
            {
                DataStore.SavedItems.Insert(0, new SavedItem
                {
                    Id = savedId,
                    Title = CurrentDisease.Name + " Treatment Guide",
                    Badge = "DISEASE GUIDE",
                    Category = "Disease Solutions",
                    Description = CurrentDisease.Symptom + " | Treatment: " + CurrentDisease.Treatment,
                    SavedAgo = "Just now",
                    ImageUrl = CurrentDisease.ImageUrl
                });
            }

            pnlFeedback.Visible = true;
            lblFeedback.Text = CurrentDisease.Name + " Treatment Guide has been successfully saved to your Saved Information!";
            btnSaveGuide.Text = "✓ Saved to My Guides";
            btnSaveGuide.CssClass = "btn btn-success";
        }
    }
}
