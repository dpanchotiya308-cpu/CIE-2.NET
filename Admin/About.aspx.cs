using System;
using System.Web.UI;
using KhedutPlus.Models;

namespace KhedutPlus.Admin
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStats();
            }
        }

        private void LoadStats()
        {
            lblFarmerCount.Text = DataStore.AdminFarmers.Count.ToString();
            lblShopCount.Text   = DataStore.Stores.Count.ToString();
            lblProductCount.Text = DataStore.ShopProducts.Count.ToString();
            lblSchemeCount.Text  = DataStore.Schemes.Count.ToString();
        }
    }
}
