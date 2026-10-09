using System;
using System.Web.UI;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptActivities.DataSource = DataStore.AdminActivities;
                rptActivities.DataBind();
            }
        }
    }
}
