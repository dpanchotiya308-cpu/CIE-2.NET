namespace KhedutPlus.Admin {
    
    public partial class Register {
        
        protected global::System.Web.UI.HtmlControls.HtmlForm adminRegForm;
        protected global::System.Web.UI.WebControls.ValidationSummary valSummaryAdminReg;
        protected global::System.Web.UI.WebControls.Panel pnlRegSuccess;
        protected global::System.Web.UI.WebControls.Label lblDbError;
        protected global::System.Web.UI.WebControls.TextBox txtAdminFullName;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvAdminFullName;
        protected global::System.Web.UI.WebControls.TextBox txtOfficialEmail;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvOfficialEmail;
        protected global::System.Web.UI.WebControls.RegularExpressionValidator revOfficialEmail;
        protected global::System.Web.UI.WebControls.CustomValidator cvOfficialEmail;
        protected global::System.Web.UI.WebControls.DropDownList ddlAdminRole;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvAdminRole;
        protected global::System.Web.UI.WebControls.TextBox txtRegPassword;
        protected global::System.Web.UI.WebControls.RequiredFieldValidator rfvRegPassword;
        protected global::System.Web.UI.WebControls.RegularExpressionValidator revRegPassword;
        protected global::System.Web.UI.WebControls.Button btnCreateAdminAccount;
    }
}
