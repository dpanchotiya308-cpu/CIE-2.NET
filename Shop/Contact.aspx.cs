using System;
using System.Web.UI;

namespace KhedutPlus.Shop
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlContactSuccess.Visible = true;
                lblContactSuccess.Text = "Thank you, " + txtShopName.Text + "! Your support inquiry has been received. Our merchant desk will contact you at " + txtContactPhone.Text + " shortly.";
                txtShopName.Text = "";
                txtContactPhone.Text = "";
                txtContactEmail.Text = "";
                txtContactSubject.Text = "";
                txtContactMessage.Text = "";
            }
        }
    }
}
