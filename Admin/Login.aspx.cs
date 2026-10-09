using System;
using System.Web.UI;

namespace KhedutPlus.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdminSignIn_Click(object sender, EventArgs e)
        {
            Page.Validate("vgAdminLogin");
            if (Page.IsValid)
            {
                Response.Redirect("/Admin/Dashboard.aspx");
            }
        }

        protected void lnkForgotPassword_Click(object sender, EventArgs e)
        {
            pnlForgotModal.Visible = true;
            pnlForgotSuccess.Visible = false;
            pnlForgotResetSuccess.Visible = false;
        }

        protected void btnCloseForgot_Click(object sender, EventArgs e)
        {
            pnlForgotModal.Visible = false;
        }

        protected void btnSendForgotOtp_Click(object sender, EventArgs e)
        {
            pnlForgotSuccess.Visible = true;
            pnlForgotResetSuccess.Visible = false;
            txtForgotOtp.Text = "123456";
        }

        protected void btnSubmitAdminReset_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtForgotNewPassword.Text))
            {
                txtAdminPassword.Text = txtForgotNewPassword.Text;
            }
            pnlForgotResetSuccess.Visible = true;
            pnlForgotSuccess.Visible = false;
        }
    }
}
