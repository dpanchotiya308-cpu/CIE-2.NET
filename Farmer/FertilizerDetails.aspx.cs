using System;
using System.Linq;
using System.Web.UI;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class FertilizerDetails : System.Web.UI.Page
    {
        public Fertilizer CurrentFertilizer { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string fertId = Request.QueryString["id"] ?? "urea-46";
            CurrentFertilizer = DataStore.Fertilizers.FirstOrDefault(f => f.Id.Equals(fertId, StringComparison.OrdinalIgnoreCase));
            if (CurrentFertilizer == null)
            {
                CurrentFertilizer = DataStore.Fertilizers.FirstOrDefault(f => f.Id == "urea-46") ?? DataStore.Fertilizers.FirstOrDefault();
            }

            if (!IsPostBack)
            {
                if (CurrentFertilizer != null)
                {
                    bool isSaved = DataStore.SavedItems.Any(s => s.Id == "fert-" + CurrentFertilizer.Id);
                    if (isSaved)
                    {
                        btnSaveGuide.Text = "✓ Saved Usage Guide";
                        btnSaveGuide.CssClass = "btn btn-success";
                    }
                }
            }
        }

        protected void btnSaveGuide_Click(object sender, EventArgs e)
        {
            if (CurrentFertilizer == null) return;

            string savedId = "fert-" + CurrentFertilizer.Id;
            var existing = DataStore.SavedItems.FirstOrDefault(s => s.Id == savedId);
            if (existing == null)
            {
                DataStore.SavedItems.Insert(0, new SavedItem
                {
                    Id = savedId,
                    Title = CurrentFertilizer.Name + " Usage Guide",
                    Badge = "FERTILIZER GUIDE",
                    Category = "Fertilizers",
                    Description = CurrentFertilizer.KeyFeature1 + " | " + CurrentFertilizer.KeyFeature2 + " (Price: " + CurrentFertilizer.Price + ")",
                    SavedAgo = "Just now",
                    ImageUrl = CurrentFertilizer.ImageUrl
                });
            }

            pnlFeedback.Visible = true;
            lblFeedback.Text = CurrentFertilizer.Name + " Usage Guide has been successfully saved to your Saved Information!";
            btnSaveGuide.Text = "✓ Saved Usage Guide";
            btnSaveGuide.CssClass = "btn btn-success";
        }
    }
}
