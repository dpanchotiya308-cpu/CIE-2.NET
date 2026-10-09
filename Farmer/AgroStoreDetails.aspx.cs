using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class AgroStoreDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStore();
            }
        }

        private void LoadStore()
        {
            string id = Request.QueryString["id"];
            if (string.IsNullOrWhiteSpace(id))
            {
                id = "kisan-agro";
            }

            var store = DataStore.Stores.FirstOrDefault(s => s.Id == id);
            if (store == null)
            {
                pnlNotFound.Visible = true;
                pnlStoreDetail.Visible = false;
                return;
            }

            pnlStoreDetail.Visible = true;
            pnlNotFound.Visible = false;

            // Page title
            lblPageTitle.Text = System.Web.HttpUtility.HtmlEncode(store.Name);

            // Store logo / photo
            string logoUrl = !string.IsNullOrEmpty(store.ImageUrl) ? store.ImageUrl : "/Images/stores/kisan_agro.jpg";
            imgStoreLogo.ImageUrl = logoUrl;

            // Verified badge
            pnlVerified.Visible = store.Verified;

            // Store info
            lblStoreName.Text = System.Web.HttpUtility.HtmlEncode(store.Name);
            lblRating.Text = store.Rating.ToString("0.0");
            lblReviews.Text = store.ReviewsCount.ToString();
            lblAddress.Text = System.Web.HttpUtility.HtmlEncode(store.Address);
            lblPhone.Text = System.Web.HttpUtility.HtmlEncode(store.Phone);
            lblTimings.Text = System.Web.HttpUtility.HtmlEncode(store.Timings);
            lblDistrict.Text = System.Web.HttpUtility.HtmlEncode(store.District);
            lblVerifiedStatus.Text = store.Verified ? "✔ Verified Partner" : "Unverified";

            // Service tags
            var sb = new StringBuilder();
            var serviceEmojis = new Dictionary<string, string>
            {
                {"Seeds", "🌱"}, {"Fertilizers", "📦"}, {"Pesticides", "🧪"},
                {"Machinery", "🚜"}, {"Tools", "🔧"}, {"Irrigation", "💧"},
                {"Organic", "🍃"}, {"Bulk", "📦"}
            };
            if (store.Services != null)
            {
                foreach (var svc in store.Services)
                {
                    string emoji = serviceEmojis.ContainsKey(svc) ? serviceEmojis[svc] : "🏪";
                    sb.AppendFormat("<span class=\"service-tag\">{0} {1}</span> ", emoji, System.Web.HttpUtility.HtmlEncode(svc));
                }
            }
            lblServiceTags.Text = sb.ToString();

            // Call link
            lnkCall.NavigateUrl = "tel:" + store.Phone.Replace(" ", "").Replace("+", "+");

            // Products
            var products = DataStore.ShopProducts.Where(p => p.StoreId == store.Id).ToList();
            if (products.Count > 0)
            {
                rptProducts.DataSource = products;
                rptProducts.DataBind();
                pnlProducts.Visible = true;
                pnlNoProducts.Visible = false;
            }
            else
            {
                pnlProducts.Visible = false;
                pnlNoProducts.Visible = true;
            }
        }

        protected string TruncateDesc(string desc, int maxLen)
        {
            if (string.IsNullOrEmpty(desc)) return "";
            return desc.Length > maxLen
                ? System.Web.HttpUtility.HtmlEncode(desc.Substring(0, maxLen)) + "…"
                : System.Web.HttpUtility.HtmlEncode(desc);
        }

        protected string GetStatusBg(string status)
        {
            if (status == "In Stock") return "#f0fdf4";
            if (status == "Low Stock") return "#fff7ed";
            return "#fef2f2";
        }

        protected string GetStatusColor(string status)
        {
            if (status == "In Stock") return "#166534";
            if (status == "Low Stock") return "#c2410c";
            return "#dc2626";
        }

        protected string RenderExtraInfo(string npk, string pest, string type)
        {
            if (!string.IsNullOrWhiteSpace(npk) && npk != "N/A")
                return string.Format("<span style=\"font-size:0.75rem;color:#64748b;\">NPK: {0}</span>", System.Web.HttpUtility.HtmlEncode(npk));
            if (!string.IsNullOrWhiteSpace(pest))
                return string.Format("<span style=\"font-size:0.75rem;color:#64748b;\">For: {0}</span>", System.Web.HttpUtility.HtmlEncode(pest));
            if (!string.IsNullOrWhiteSpace(type))
                return string.Format("<span style=\"font-size:0.75rem;color:#64748b;\">Type: {0}</span>", System.Web.HttpUtility.HtmlEncode(type));
            return "";
        }
    }
}
