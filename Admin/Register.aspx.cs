using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace KhedutPlus.Admin
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void cvOfficialEmail_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            if (string.IsNullOrWhiteSpace(args.Value)) { args.IsValid = false; return; }
            args.IsValid = Regex.IsMatch(args.Value.Trim(), @"^[\w\.-]+@[\w\.-]+\.\w{2,4}$");
        }

        protected void btnCreateAdminAccount_Click(object sender, EventArgs e)
        {
            Page.Validate("vgAdminReg");
            if (Page.IsValid)
            {
                pnlRegSuccess.Visible = true;
                Response.Redirect("/Admin/Dashboard.aspx");
            }
        }
    }
}
