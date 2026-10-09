using System;
using System.Web.UI;

namespace KhedutPlus
{
    public partial class ForgotPassword : System.Web.UI.Page
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
            if (!string.IsNullOrWhiteSpace(txtMobileNumber.Text))
            {
                pnlOtpSentInfo.Visible = true;
                txtOtpCode.Text = "123456";
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            Page.Validate("vgForgot");
            if (Page.IsValid)
            {
                pnlSuccessReset.Visible = true;
                pnlOtpSentInfo.Visible = false;

                // Clear input fields
                txtMobileNumber.Text = "";
                txtOtpCode.Text = "";
                txtNewPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
        }
    }
}
