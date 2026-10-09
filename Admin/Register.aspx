<%@ Page Title="Create Admin Account" Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KhedutPlus.Admin.Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Admin Account - Khedut Plus</title>
    <link rel="stylesheet" href="/Content/css/site.css" />
</head>
<body>
    <form id="adminRegForm" runat="server">
        <div class="split-auth-container">
            <!-- Left Hero -->
            <div class="split-auth-left" style="background-image: linear-gradient(rgba(6, 78, 59, 0.88), rgba(6, 78, 59, 0.95)), url('/Images/admin/admin_register_bg.jpg');">
                <div class="brand-box">
                    <img src="/Images/icons/logo_leaf.png" alt="Khedut Plus" />
                </div>
                
                <h1 style="font-size: 2.5rem; line-height: 1.15;">Empowering Modern Agriculture</h1>
                <div class="divider-line"></div>
                
                <p>
                    Join Khedut Plus to manage and streamline your agro-ecosystem with unparalleled efficiency and insight.
                </p>
            </div>

            <!-- Right Form -->
            <div class="split-auth-right">
                <div class="auth-card">
                    <div style="text-align: center; margin-bottom: 20px;">
                        <div style="width: 48px; height: 48px; border-radius: 12px; background-color: #ecfdf5; display: inline-flex; align-items: center; justify-content: center; margin-bottom: 12px;">
                            <img src="/Images/icons/logo_leaf.png" alt="Leaf" style="width: 24px; height: 24px;" />
                        </div>
                        <h2 style="font-size: 1.5rem; font-weight: 700; color: #0f172a;">Create Admin Account</h2>
                        <p style="color: #64748b; font-size: 0.875rem; margin-top: 4px;">Register to access the Khedut Plus management platform.</p>
                    </div>

                    <!-- Validation Summary -->
                    <asp:ValidationSummary ID="valSummaryAdminReg" runat="server" ValidationGroup="vgAdminReg" CssClass="validation-summary-box" HeaderText="Please address the following validation errors:" DisplayMode="BulletList" />

                    <asp:Panel ID="pnlRegSuccess" runat="server" Visible="false" CssClass="alert-success">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        <span>Administrator registration completed! Redirecting to dashboard...</span>
                    </asp:Panel>

                    <asp:Label ID="lblDbError" runat="server" Visible="false"
                        style="display:block;background:#fef2f2;border:1px solid #fecaca;color:#dc2626;border-radius:8px;padding:10px 14px;font-size:0.875rem;margin-bottom:16px;"></asp:Label>

                    <div class="form-group">
                        <label class="form-label" for="txtAdminFullName">Full Name <span class="required">*</span></label>
                        <asp:TextBox ID="txtAdminFullName" runat="server" CssClass="form-control" placeholder="Enter your full name" Text="Sanjay Patel"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAdminFullName" runat="server" ControlToValidate="txtAdminFullName" ValidationGroup="vgAdminReg" Display="Dynamic" CssClass="validation-error" ErrorMessage="Full name is required." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtOfficialEmail">Official Email <span class="required">*</span></label>
                        <asp:TextBox ID="txtOfficialEmail" runat="server" CssClass="form-control" placeholder="name@organization.com" Text="sanjay.patel@khedutplus.gov.in"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOfficialEmail" runat="server" ControlToValidate="txtOfficialEmail" ValidationGroup="vgAdminReg" Display="Dynamic" CssClass="validation-error" ErrorMessage="Official email is required." />
                        <asp:RegularExpressionValidator ID="revOfficialEmail" runat="server" ControlToValidate="txtOfficialEmail" ValidationGroup="vgAdminReg" ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid email format." />
                        <asp:CustomValidator ID="cvOfficialEmail" runat="server" ControlToValidate="txtOfficialEmail" ValidationGroup="vgAdminReg" Display="Dynamic" CssClass="validation-error" ErrorMessage="Email must belong to a registered institutional or government organization." ClientValidationFunction="ValidateAdminOrgEmail" OnServerValidate="cvOfficialEmail_ServerValidate" />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="ddlAdminRole">Role <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlAdminRole" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Text="Select a role" />
                            <asp:ListItem Value="System Administrator" Text="System Administrator" Selected="True" />
                            <asp:ListItem Value="Field Officer" Text="Field Officer" />
                            <asp:ListItem Value="Agro Analyst" Text="Agro Analyst" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvAdminRole" runat="server" ControlToValidate="ddlAdminRole" InitialValue="" ValidationGroup="vgAdminReg" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please select an administrative role." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtRegPassword">Password <span class="required">*</span></label>
                        <asp:TextBox ID="txtRegPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Create a secure password" Text="SecurePass@2026"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRegPassword" runat="server" ControlToValidate="txtRegPassword" ValidationGroup="vgAdminReg" Display="Dynamic" CssClass="validation-error" ErrorMessage="Password is required." />
                        <asp:RegularExpressionValidator ID="revRegPassword" runat="server" ControlToValidate="txtRegPassword" ValidationGroup="vgAdminReg" ValidationExpression="^.{6,30}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Password must be at least 6 characters in length." />
                    </div>

                    <div style="margin-top: 24px; margin-bottom: 20px;">
                        <asp:Button ID="btnCreateAdminAccount" runat="server" Text="Create Admin Account" CssClass="btn btn-primary w-full" ValidationGroup="vgAdminReg" OnClick="btnCreateAdminAccount_Click" style="background-color: #166534; padding: 12px;" />
                    </div>

                    <div style="text-align: center; font-size: 0.8125rem; color: #64748b;">
                        Already have an account? <a href="/Admin/Login.aspx" style="color: #166534; font-weight: 700;">Login</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="/Scripts/js/site.js"></script>
</body>
</html>
