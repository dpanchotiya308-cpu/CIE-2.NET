using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace KhedutPlus
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFarmerName.Text   = "";
                txtFarmerMobile.Text = "";
                txtFarmerOtp.Text    = "";
                txtStoreName.Text    = "";
                txtOwnerName.Text    = "";
                txtStoreAddress.Text = "";
                txtLicenseId.Text    = "";
                txtStoreMobile.Text  = "";
                txtStoreOtp.Text     = "";
            }
        }

        protected void ValidateOtp_Server(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            if (string.IsNullOrWhiteSpace(args.Value)) { args.IsValid = false; return; }
            args.IsValid = Regex.IsMatch(args.Value.Trim(), @"^\d{6}$");
        }

        protected void btnFarmerSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate("vgFarmer");
            if (Page.IsValid)
            {
                pnlFarmerSuccess.Visible = true;
                Response.Redirect("/Farmer/Dashboard.aspx");
            }
        }

        protected void btnStoreSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate("vgStore");
            if (Page.IsValid)
            {
                pnlStoreSuccess.Visible = true;
                Response.Redirect("/Shop/Dashboard.aspx");
            }
        }
    }
}
