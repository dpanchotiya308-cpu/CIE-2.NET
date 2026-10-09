using System;
using System.Linq;
using System.Web.UI;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class PesticideDetails : System.Web.UI.Page
    {
        public Pesticide CurrentPesticide { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string pestId = Request.QueryString["id"] ?? "chlorpyrifos";
            CurrentPesticide = DataStore.Pesticides.FirstOrDefault(p => p.Id.Equals(pestId, StringComparison.OrdinalIgnoreCase));
            if (CurrentPesticide == null)
            {
                CurrentPesticide = DataStore.Pesticides.FirstOrDefault(p => p.Id == "chlorpyrifos") ?? DataStore.Pesticides.FirstOrDefault();
            }

            if (!IsPostBack)
            {
                if (CurrentPesticide != null)
                {
                    bool isSaved = DataStore.SavedItems.Any(s => s.Id == "pest-" + CurrentPesticide.Id);
                    if (isSaved)
                    {
                        btnSaveGuide.Text = "✓ Saved Safety Guide";
                        btnSaveGuide.CssClass = "btn btn-success";
                    }
                }
            }
        }

        protected void btnSaveGuide_Click(object sender, EventArgs e)
        {
            if (CurrentPesticide == null) return;

            string savedId = "pest-" + CurrentPesticide.Id;
            var existing = DataStore.SavedItems.FirstOrDefault(s => s.Id == savedId);
            if (existing == null)
            {
                DataStore.SavedItems.Insert(0, new SavedItem
                {
                    Id = savedId,
                    Title = CurrentPesticide.Name + " Safety & Details Guide",
                    Badge = "PESTICIDE SAFETY",
                    Category = "Pesticides",
                    Description = "Targets: " + CurrentPesticide.Targets + " | Dosage: " + CurrentPesticide.Dosage,
                    SavedAgo = "Just now",
                    ImageUrl = CurrentPesticide.ImageUrl
                });
            }

            pnlFeedback.Visible = true;
            lblFeedback.Text = CurrentPesticide.Name + " Safety Guide has been successfully saved to your Saved Information!";
            btnSaveGuide.Text = "✓ Saved Safety Guide";
            btnSaveGuide.CssClass = "btn btn-success";
        }
    }
}
