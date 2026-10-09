<%@ Page Title="Admin Sign In" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KhedutPlus.Admin.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome Back - Khedut Plus Agro Management</title>
    <link rel="stylesheet" href="/Content/css/site.css" />
</head>
<body>
    <form id="adminLoginForm" runat="server">
        <div class="split-auth-container">
            <!-- Left Hero -->
            <div class="split-auth-left">
                <div class="brand-box">
                    <img src="/Images/icons/logo_leaf.png" alt="Khedut Plus" />
                </div>
                
                <h1>Khedut Plus</h1>
                <div class="admin-tag">AGRO MANAGEMENT</div>
                <div class="divider-line"></div>
                
                <p>
                    Empowering agricultural administrators with a stable, high-performance ecosystem to seamlessly manage farmers, agro shops, and vital resources.
                </p>
            </div>

            <!-- Right Form -->
            <div class="split-auth-right">
                <div class="auth-card">
                    <div class="auth-header">
                        <h2>Welcome Back</h2>
                        <p>Please sign in to access the administrator dashboard.</p>
                    </div>

                    <!-- Validation Summary -->
                    <asp:ValidationSummary ID="valSummaryAdminLogin" runat="server" ValidationGroup="vgAdminLogin" CssClass="validation-summary-box" HeaderText="Please correct the following:" DisplayMode="BulletList" />

                    <asp:Label ID="lblLoginError" runat="server" Visible="false"
                        style="display:block;background:#fef2f2;border:1px solid #fecaca;color:#dc2626;border-radius:8px;padding:10px 14px;font-size:0.875rem;margin-bottom:16px;"></asp:Label>

                    <div class="form-group">
                        <label class="form-label" for="txtAdminEmail">EMAIL ADDRESS <span class="required">*</span></label>
                        <div style="position: relative;">
                            <span style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: #94a3b8;">✉</span>
                            <asp:TextBox ID="txtAdminEmail" runat="server" CssClass="form-control" style="padding-left: 36px;" placeholder="admin@khedutplus.com" Text="admin@khedutplus.com"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvAdminEmail" runat="server" ControlToValidate="txtAdminEmail" ValidationGroup="vgAdminLogin" Display="Dynamic" CssClass="validation-error" ErrorMessage="Email address is required." />
                        <asp:RegularExpressionValidator ID="revAdminEmail" runat="server" ControlToValidate="txtAdminEmail" ValidationGroup="vgAdminLogin" ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid email format." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtAdminPassword">PASSWORD <span class="required">*</span></label>
                        <div style="position: relative;">
                            <span style="position: absolute; left: 12px; top: 50%; transform: translateY(-50%); color: #94a3b8;">🔒</span>
                            <asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password" CssClass="form-control" style="padding-left: 36px;" placeholder="••••••••" Text="Admin@123"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvAdminPassword" runat="server" ControlToValidate="txtAdminPassword" ValidationGroup="vgAdminLogin" Display="Dynamic" CssClass="validation-error" ErrorMessage="Password is required." />
                    </div>

                    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px; font-size: 0.8125rem;">
                        <label style="display: flex; align-items: center; gap: 8px; color: #475569; cursor: pointer;">
                            <asp:CheckBox ID="chkRememberMe" runat="server" />
                            <span>Remember me</span>
                        </label>
                        <asp:LinkButton ID="lnkForgotPassword" runat="server" OnClick="lnkForgotPassword_Click" CausesValidation="false" style="color: #166534; font-weight: 600; text-decoration: none;">Forgot Password?</asp:LinkButton>
                    </div>

                    <div style="margin-bottom: 24px;">
                        <asp:Button ID="btnAdminSignIn" runat="server" Text="SIGN IN &rarr;" CssClass="btn btn-primary w-full" ValidationGroup="vgAdminLogin" OnClick="btnAdminSignIn_Click" style="background-color: #166534; padding: 12px;" />
                    </div>

                    <div style="text-align: center; font-size: 0.8125rem; color: #64748b;">
                        Don't have an account? <a href="/Admin/Register.aspx" style="color: #166534; font-weight: 700;">REGISTER</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Forgot Password Modal Overlay -->
        <asp:Panel ID="pnlForgotModal" runat="server" Visible="false" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(15, 23, 42, 0.6); backdrop-filter: blur(4px); display: flex; align-items: center; justify-content: center; z-index: 9999; padding: 20px;">
            <div style="background-color: #ffffff; border-radius: 16px; width: 100%; max-width: 480px; padding: 28px; box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);">
                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; padding-bottom: 12px; border-bottom: 1px solid #e2e8f0;">
                    <h3 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin: 0;">🔒 Reset Admin Password</h3>
                    <asp:LinkButton ID="btnCloseForgot" runat="server" OnClick="btnCloseForgot_Click" CausesValidation="false" style="color: #64748b; font-size: 1.25rem; text-decoration: none; font-weight: 700;">✕</asp:LinkButton>
                </div>

                <asp:Panel ID="pnlForgotSuccess" runat="server" Visible="false" style="background:#f0fdf4; border:1px solid #bbf7d0; color:#166534; border-radius:8px; padding:12px; margin-bottom:16px; font-size:0.875rem;">
                    <span>Verification code sent! Demo OTP: <strong>123456</strong></span>
                </asp:Panel>

                <asp:Panel ID="pnlForgotResetSuccess" runat="server" Visible="false" style="background:#f0fdf4; border:1px solid #bbf7d0; color:#166534; border-radius:8px; padding:12px; margin-bottom:16px; font-size:0.875rem;">
                    <span><strong>Success!</strong> Password updated successfully. You can now sign in with your new password.</span>
                </asp:Panel>

                <div class="form-group" style="margin-bottom: 16px;">
                    <label class="form-label">Registered Admin Email <span class="required">*</span></label>
                    <asp:TextBox ID="txtForgotEmail" runat="server" CssClass="form-control" placeholder="admin@khedutplus.com" Text="admin@khedutplus.com"></asp:TextBox>
                </div>

                <div class="form-group" style="margin-bottom: 16px;">
                    <label class="form-label">Verification OTP</label>
                    <div style="display: flex; gap: 8px;">
                        <asp:TextBox ID="txtForgotOtp" runat="server" CssClass="form-control" placeholder="Enter 6-digit OTP"></asp:TextBox>
                        <asp:Button ID="btnSendForgotOtp" runat="server" Text="Get OTP" CssClass="btn btn-secondary" OnClick="btnSendForgotOtp_Click" CausesValidation="false" style="white-space: nowrap; color: #166534; font-weight: 600;" />
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 20px;">
                    <label class="form-label">New Password</label>
                    <asp:TextBox ID="txtForgotNewPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="••••••••"></asp:TextBox>
                </div>

                <div style="display: flex; justify-content: flex-end; gap: 12px;">
                    <asp:Button ID="btnCancelForgotModal" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCloseForgot_Click" CausesValidation="false" />
                    <asp:Button ID="btnSubmitAdminReset" runat="server" Text="Reset Password" CssClass="btn btn-primary" OnClick="btnSubmitAdminReset_Click" CausesValidation="false" style="background-color: #166534; font-weight: 600;" />
                </div>
            </div>
        </asp:Panel>
    </form>
    <script src="/Scripts/js/site.js"></script>
</body>
</html>
