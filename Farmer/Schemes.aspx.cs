using System;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Farmer
{
    public partial class Schemes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSchemes();
            }
        }

        private void BindSchemes()
        {
            var list = DataStore.Schemes.AsEnumerable();

            string auth = ddlAuthority.SelectedValue;
            if (auth == "Central")
                list = list.Where(s => s.Ministry.IndexOf("MINISTRY", StringComparison.OrdinalIgnoreCase) >= 0);
            else if (auth == "Gujarat")
                list = list.Where(s => s.Ministry.IndexOf("GUJARAT", StringComparison.OrdinalIgnoreCase) >= 0
                                    || s.Ministry.IndexOf("State", StringComparison.OrdinalIgnoreCase) >= 0
                                    || s.Ministry.IndexOf("NABARD", StringComparison.OrdinalIgnoreCase) >= 0);

            string cat = ddlCategory.SelectedValue;
            if (cat != "All")
                list = list.Where(s => s.Category.Equals(cat, StringComparison.OrdinalIgnoreCase));

            string q = txtSearchSchemes.Text;
            if (!string.IsNullOrWhiteSpace(q))
                list = list.Where(s => s.Name.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0
                                    || s.Description.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0
                                    || s.Ministry.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0);

            var result = list.ToList();
            rptSchemes.DataSource = result;
            rptSchemes.DataBind();
            lblSchemeCount.Text = result.Count.ToString();
        }

        protected void FilterSchemes_Changed(object sender, EventArgs e)
        {
            BindSchemes();
        }

        // Helper: returns CSS class for status badge
        protected string GetStatusClass(string status)
        {
            if (status == null) return "status-badge-active";
            if (status.Contains("APPLY")) return "status-badge-apply";
            if (status.Contains("ENROLLED")) return "status-badge-enrolled";
            return "status-badge-active";
        }

        // Helper: renders comma-separated documents as doc-tag spans
        protected string RenderDocTags(string docs)
        {
            if (string.IsNullOrWhiteSpace(docs)) return "";
            var sb = new StringBuilder();
            foreach (var doc in docs.Split(','))
            {
                string d = doc.Trim();
                if (!string.IsNullOrEmpty(d))
                    sb.AppendFormat("<span class=\"doc-tag\">{0}</span>", System.Web.HttpUtility.HtmlEncode(d));
            }
            return sb.ToString();
        }

        // Helper: renders numbered step list from newline-separated steps
        protected string RenderHowSteps(string steps)
        {
            if (string.IsNullOrWhiteSpace(steps)) return "";
            var sb = new StringBuilder();
            sb.Append("<ol class=\"how-steps\">");
            int stepNum = 1;
            foreach (var line in steps.Split('\n'))
            {
                // Remove leading "1. " numbers if present
                string text = System.Text.RegularExpressions.Regex.Replace(line.Trim(), @"^\d+\.\s*", "");
                if (!string.IsNullOrEmpty(text))
                {
                    sb.AppendFormat("<li data-step=\"{0}\">{1}</li>", stepNum, System.Web.HttpUtility.HtmlEncode(text));
                    stepNum++;
                }
            }
            sb.Append("</ol>");
            return sb.ToString();
        }
    }
}
