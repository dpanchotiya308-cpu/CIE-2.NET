using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class CropDetails : System.Web.UI.Page
    {
        public Crop CurrentCrop { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            string cropId = Request.QueryString["id"] ?? "wheat";
            CurrentCrop = DataStore.Crops.FirstOrDefault(c => c.Id.Equals(cropId, StringComparison.OrdinalIgnoreCase));
            if (CurrentCrop == null)
            {
                CurrentCrop = DataStore.Crops.FirstOrDefault(c => c.Id == "wheat") ?? DataStore.Crops.FirstOrDefault();
            }

            if (!IsPostBack)
            {
                if (CurrentCrop != null)
                {
                    bool isSaved = DataStore.SavedItems.Any(s => s.Id == "crop-" + CurrentCrop.Id);
                    if (isSaved)
                    {
                        btnSaveCrop.Text = "✓ Saved to My Crops";
                        btnSaveCrop.CssClass = "btn btn-success";
                    }
                }

                BindLists();
            }
        }

        private void BindLists()
        {
            if (CurrentCrop == null) return;

            if (CurrentCrop.Varieties == null || CurrentCrop.Varieties.Count == 0)
            {
                CurrentCrop.Varieties = new List<CropVariety>
                {
                    new CropVariety { Name = "Standard Certified Variety", Yield = CurrentCrop.AvgYield ?? "High Yield", Notes = "Widely adaptable, certified high-germination seed." },
                    new CropVariety { Name = "Improved Hybrid F1", Yield = "Superior", Notes = "Enhanced disease resistance and climate resilience." }
                };
            }

            if (CurrentCrop.PestDiseases == null || CurrentCrop.PestDiseases.Count == 0)
            {
                CurrentCrop.PestDiseases = new List<CropPestDisease>
                {
                    new CropPestDisease { Name = "Common Blight / Rot", Kind = "Disease", Subtitle = "Fungal infection during high humidity periods.", Treatment = "Spray Mancozeb @ 2.5g/L or copper oxychloride." },
                    new CropPestDisease { Name = "Sucking Pests / Aphids", Kind = "Pest", Subtitle = "Insects feeding on tender foliage and shoots.", Treatment = "Apply Neem oil @ 5ml/L or Imidacloprid @ 0.3ml/L." }
                };
            }

            rptVarieties.DataSource = CurrentCrop.Varieties;
            rptVarieties.DataBind();

            rptPestDiseases.DataSource = CurrentCrop.PestDiseases;
            rptPestDiseases.DataBind();
        }

        public string GetCropBannerUrl()
        {
            if (CurrentCrop == null) return "/Images/crops/wheat_banner.jpg";
            if (CurrentCrop.Id.ToLower() == "wheat") return "/Images/crops/wheat_banner.jpg";
            return !string.IsNullOrEmpty(CurrentCrop.ImageUrl) ? CurrentCrop.ImageUrl : "/Images/crops/wheat_banner.jpg";
        }

        protected void btnSaveCrop_Click(object sender, EventArgs e)
        {
            if (CurrentCrop == null) return;

            string savedId = "crop-" + CurrentCrop.Id;
            var existing = DataStore.SavedItems.FirstOrDefault(s => s.Id == savedId);
            if (existing == null)
            {
                DataStore.SavedItems.Insert(0, new SavedItem
                {
                    Id = savedId,
                    Title = CurrentCrop.Name + " (" + (string.IsNullOrEmpty(CurrentCrop.LocalName) ? CurrentCrop.Name : CurrentCrop.LocalName) + ") Guide",
                    Badge = "MY CROPS",
                    Category = "Crops",
                    Description = CurrentCrop.Description,
                    SavedAgo = "Just now",
                    ImageUrl = GetCropBannerUrl()
                });
            }

            pnlFeedback.Visible = true;
            lblFeedback.Text = CurrentCrop.Name + " (" + (string.IsNullOrEmpty(CurrentCrop.LocalName) ? CurrentCrop.Name : CurrentCrop.LocalName) + ") has been successfully saved to your Saved Information!";
            btnSaveCrop.Text = "✓ Saved to My Crops";
            btnSaveCrop.CssClass = "btn btn-success";
        }
    }
}
