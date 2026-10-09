using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class AgroStores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStores();
            }
        }

        private void BindStores()
        {
            var stores = DataStore.Stores.AsEnumerable();
            string dist = ddlDistrict.SelectedValue;
            if (!string.IsNullOrEmpty(dist) && dist != "All")
            {
                stores = stores.Where(s => s.District.Equals(dist, StringComparison.OrdinalIgnoreCase) || s.Address.IndexOf(dist, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            string q = txtSearchStores.Text;
            if (!string.IsNullOrWhiteSpace(q))
            {
                stores = stores.Where(s => s.Name.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 || s.Address.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            var list = stores.ToList();
            lblStoreCount.Text = list.Count.ToString();
            rptStores.DataSource = list;
            rptStores.DataBind();
        }

        protected void FilterStores_Changed(object sender, EventArgs e)
        {
            BindStores();
        }

        public string RenderTags(List<string> tags)
        {
            if (tags == null || tags.Count == 0) return "";
            var sb = new StringBuilder();
            foreach (var t in tags)
            {
                sb.AppendFormat("<span class=\"store-tag-pill\">{0}</span>", t);
            }
            return sb.ToString();
        }
    }
}
