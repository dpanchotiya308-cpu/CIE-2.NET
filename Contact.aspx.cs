using System;
using System.Web.UI;

namespace KhedutPlus
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            Page.Validate("vgContact");
            if (Page.IsValid)
            {
                string name = txtContactName.Text.Trim();
                string phone = txtContactPhone.Text.Trim();
                string role = ddlUserRole.SelectedValue;

                pnlContactSuccess.Visible = true;
                lblContactSuccess.Text = "Thank you, " + name + "! Your inquiry has been received. Our agriculture support team will contact you on " + phone + " shortly.";

                // Clear input fields
                txtContactName.Text = "";
                txtContactPhone.Text = "";
                txtContactEmail.Text = "";
                txtContactSubject.Text = "";
                txtContactMessage.Text = "";
            }
        }
    }
}
