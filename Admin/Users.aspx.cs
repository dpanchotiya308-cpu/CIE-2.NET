using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            var list = DataStore.AdminUsers.AsEnumerable();
            string role = ddlRoleFilter.SelectedValue;
            if (role != "All")
            {
                list = list.Where(u => u.Role.Equals(role, StringComparison.OrdinalIgnoreCase));
            }
            string q = txtSearchUsers.Text;
            if (!string.IsNullOrWhiteSpace(q))
            {
                list = list.Where(u => u.Name.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 || u.Email.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0 || u.Region.IndexOf(q, StringComparison.OrdinalIgnoreCase) >= 0);
            }
            rptUsers.DataSource = list.ToList();
            rptUsers.DataBind();
        }

        protected void FilterUsers_Changed(object sender, EventArgs e)
        {
            BindUsers();
        }

        public string RenderUserAvatar(string avatarUrl, string initials, string name)
        {
            if (!string.IsNullOrEmpty(avatarUrl))
            {
                return string.Format("<img src=\"{0}\" alt=\"{1}\" style=\"width: 36px; height: 36px; border-radius: 50%; object-fit: cover;\" />", avatarUrl, name);
            }
            else
            {
                return string.Format("<div class=\"user-avatar-initials\">{0}</div>", initials ?? "U");
            }
        }
    }
}
