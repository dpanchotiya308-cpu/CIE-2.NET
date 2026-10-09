namespace KhedutPlus.Shop {
    
    public partial class EditInventory {
        
        protected global::System.Web.UI.WebControls.Label lblEditTitle;
        protected global::System.Web.UI.WebControls.Button btnCancel;
        protected global::System.Web.UI.WebControls.Button btnSaveChanges;
        protected global::System.Web.UI.WebControls.ValidationSummary valSummaryEditProduct;
        protected global::System.Web.UI.WebControls.Panel pnlEditSuccess;
        protected global::System.Web.UI.WebControls.Label lblEditSuccess;
        protected global::System.Web.UI.WebControls.TextBox txtProductName;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvProductName;
        protected global::System.Web.UI.WebControls.DropDownList ddlCategory;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvCategory;
        protected global::System.Web.UI.WebControls.TextBox txtSku;
        protected global::System.Web.UI.WebControls.TextBox txtProductDescription;
        protected global::System.Web.UI.WebControls.TextBox txtCurrentStock;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvCurrentStock;
        protected global::System.Web.UI.WebControls.RangeValidator rvCurrentStock;
        protected global::System.Web.UI.WebControls.TextBox txtReorderLevel;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvReorderLevel;
        protected global::System.Web.UI.WebControls.RangeValidator rvReorderLevel;
        protected global::System.Web.UI.WebControls.TextBox txtSellingPrice;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvSellingPrice;
        protected global::System.Web.UI.WebControls.RangeValidator rvSellingPrice;
        protected global::System.Web.UI.WebControls.CompareValidator cmpSellingVsCost;
        protected global::System.Web.UI.WebControls.TextBox txtCostPrice;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvCostPrice;
        protected global::System.Web.UI.WebControls.RangeValidator rvCostPrice;
        protected global::System.Web.UI.WebControls.FileUpload fuProductImage;
        protected global::System.Web.UI.WebControls.DropDownList ddlProductStatus;
    }
}
