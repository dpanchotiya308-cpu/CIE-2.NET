namespace KhedutPlus.Shop {
    
    public partial class EditOrder {
        
        protected global::System.Web.UI.WebControls.Label lblOrderTitle;
        protected global::System.Web.UI.WebControls.Button btnCancel;
        protected global::System.Web.UI.WebControls.Button btnSaveOrder;
        protected global::System.Web.UI.WebControls.ValidationSummary valSummaryOrder;
        protected global::System.Web.UI.WebControls.Panel pnlOrderSuccess;
        protected global::System.Web.UI.WebControls.Label lblOrderSuccess;
        protected global::System.Web.UI.WebControls.TextBox txtOrderId;
        protected global::System.Web.UI.WebControls.TextBox txtCustomerName;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvCustomerName;
        protected global::System.Web.UI.WebControls.TextBox txtCustomerPhone;
        protected global::System.Web.UI.WebControls.TextBox txtCustomerEmail;
        protected global::System.Web.UI.WebControls.TextBox txtDeliveryAddress;
        protected global::System.Web.UI.WebControls.TextBox txtItemsCount;
        protected global::System.Web.UI.WebControls.TextBox txtTotalAmount;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvTotalAmount;
        protected global::System.Web.UI.WebControls.RangeValidator rvTotalAmount;
        protected global::System.Web.UI.WebControls.TextBox txtOrderNotes;
        protected global::System.Web.UI.WebControls.DropDownList ddlOrderStatus;
        protected global::System.Web.UI.WebControls.DropDownList ddlPaymentStatus;
    }
}
