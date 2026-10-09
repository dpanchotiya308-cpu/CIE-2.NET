using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace KhedutPlus
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["SelectedRole"] = "Farmer";
            }
        }

        protected void btnRoleFarmer_Click(object sender, EventArgs e)
        {
            ViewState["SelectedRole"] = "Farmer";
            btnRoleFarmer.CssClass = "role-btn active";
            btnRoleShop.CssClass = "role-btn";
        }

        protected void btnRoleShop_Click(object sender, EventArgs e)
        {
            ViewState["SelectedRole"] = "Shop";
            btnRoleFarmer.CssClass = "role-btn";
            btnRoleShop.CssClass = "role-btn active";
        }

        protected void btnSendOtp_Click(object sender, EventArgs e)
        {
            pnlSuccessFeedback.Visible = true;
            lblSuccessMessage.Text = "One-Time Password (OTP) sent successfully to your mobile number. (Demo OTP: 123456)";
        }

        protected void cvOtp_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            if (string.IsNullOrWhiteSpace(args.Value)) { args.IsValid = false; return; }
            args.IsValid = args.Value.Trim().Length >= 4;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Page.Validate("vgLogin");
            if (Page.IsValid)
            {
                string role = ViewState["SelectedRole"] as string ?? "Farmer";
                if (role == "Shop")
                {
                    Response.Redirect("/Shop/Dashboard.aspx");
                }
                else
                {
                    Response.Redirect("/Farmer/Dashboard.aspx");
                }
            }
        }
    }
}
