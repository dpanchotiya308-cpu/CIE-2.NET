<%@ Page Title="Forgot Password - Khedut Plus" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="KhedutPlus.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style>
    .hero-section {
        max-width: 1300px;
        margin: 0 auto;
        padding: 60px 24px 80px 24px;
        display: grid;
        grid-template-columns: 1.2fr 0.9fr;
        gap: 60px;
        align-items: center;
    }
    .badge-pill-yellow {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        background-color: #fef9c3;
        color: #854d0e;
        padding: 6px 14px;
        border-radius: 9999px;
        font-size: 0.8125rem;
        font-weight: 600;
        margin-bottom: 24px;
    }
    .hero-title {
        font-size: 3.5rem;
        font-weight: 800;
        line-height: 1.1;
        color: #0f172a;
        letter-spacing: -0.03em;
        margin-bottom: 20px;
    }
    .hero-desc {
        font-size: 1.125rem;
        color: #475569;
        line-height: 1.6;
        max-width: 520px;
    }
    .login-card {
        background-color: #ffffff;
        border-radius: 16px;
        border: 1px solid #e2e8f0;
        padding: 36px;
        box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
    }
    .role-toggle-group {
        display: flex;
        background-color: #f1f5f9;
        padding: 4px;
        border-radius: 10px;
        margin-bottom: 24px;
    }
    .role-btn {
        flex: 1;
        text-align: center;
        padding: 10px 14px;
        border-radius: 8px;
        font-size: 0.875rem;
        font-weight: 600;
        color: #475569;
        background: none;
        border: none;
        cursor: pointer;
        transition: all 0.2s;
    }
    .role-btn.active {
        background-color: #166534;
        color: #ffffff;
        box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    }
    @media (max-width: 1024px) {
        .hero-section {
            grid-template-columns: 1fr;
            padding: 40px 20px;
            gap: 40px;
        }
        .hero-title {
            font-size: 2.5rem;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="hero-section">
        <!-- Hero Text -->
        <div>
            <div class="badge-pill-yellow">
                <span>🔒</span>
                <span>Account Recovery</span>
            </div>
            
            <h1 class="hero-title">
                Forgot Your<br />
                Password?<br />
                <span style="color: #166534;">We've Got You.</span>
            </h1>

            <p class="hero-desc">
                Quickly reset your password using your registered mobile number and SMS verification code to regain access to KhedutPlus.
            </p>
        </div>

        <!-- Forgot Password Card -->
        <div class="login-card">
            <h2 style="font-size: 1.5rem; font-weight: 700; color: #0f172a; text-align: center; margin-bottom: 4px;">Reset Password</h2>
            <p style="font-size: 0.875rem; color: #64748b; text-align: center; margin-bottom: 20px;">Enter your registered mobile number below</p>

            <!-- Role Selector -->
            <div class="role-toggle-group">
                <asp:Button ID="btnRoleFarmer" runat="server" Text="Farmer (ખેડૂત)" CssClass="role-btn active" OnClick="btnRoleFarmer_Click" CausesValidation="false" />
                <asp:Button ID="btnRoleShop" runat="server" Text="Agro Store Owner" CssClass="role-btn" OnClick="btnRoleShop_Click" CausesValidation="false" />
            </div>

            <!-- Validation Summary -->
            <asp:ValidationSummary ID="valSummaryForgot" runat="server" ValidationGroup="vgForgot" CssClass="validation-summary-box" HeaderText="Please correct the following errors:" DisplayMode="BulletList" />

            <!-- Success Alert -->
            <asp:Panel ID="pnlSuccessReset" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom: 20px;">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                <div>
                    <strong>Success!</strong> Your password has been reset successfully.<br />
                    <a href="/Default.aspx" style="color: #166534; font-weight: 700; text-decoration: underline; margin-top: 6px; display: inline-block;">Click here to Login with your new password &rarr;</a>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlOtpSentInfo" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom: 16px; background-color: #f0fdf4; border-color: #bbf7d0; color: #166534;">
                <span>OTP verification code sent! Use demo code: <strong>123456</strong></span>
            </asp:Panel>

            <!-- Form -->
            <div class="form-group">
                <label class="form-label" for="txtMobileNumber">Registered Mobile Number <span class="required">*</span></label>
                <div style="display: flex; gap: 8px;">
                    <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" placeholder="eg. 9876543210" MaxLength="15"></asp:TextBox>
                    <asp:Button ID="btnSendOtp" runat="server" Text="Get OTP" CssClass="btn btn-secondary" OnClick="btnSendOtp_Click" CausesValidation="false" style="white-space: nowrap; padding: 10px 16px; font-weight: 600; color: #166534; border-color: #86efac;" />
                </div>
                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobileNumber" ValidationGroup="vgForgot" Display="Dynamic" CssClass="validation-error" ErrorMessage="Registered mobile number is required." />
                <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobileNumber" ValidationGroup="vgForgot" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid 10-digit Indian mobile number." />
            </div>

            <div class="form-group">
                <label class="form-label" for="txtOtpCode">Verification OTP <span class="required">*</span></label>
                <asp:TextBox ID="txtOtpCode" runat="server" CssClass="form-control" placeholder="Enter 6-digit OTP (e.g. 123456)" MaxLength="6"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvOtp" runat="server" ControlToValidate="txtOtpCode" ValidationGroup="vgForgot" Display="Dynamic" CssClass="validation-error" ErrorMessage="Verification OTP is required." />
                <asp:RegularExpressionValidator ID="revOtp" runat="server" ControlToValidate="txtOtpCode" ValidationGroup="vgForgot" ValidationExpression="^\d{6}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="OTP must be exactly 6 digits." />
            </div>

            <div class="form-group">
                <label class="form-label" for="txtNewPassword">New Password <span class="required">*</span></label>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter new password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword" ValidationGroup="vgForgot" Display="Dynamic" CssClass="validation-error" ErrorMessage="New password is required." />
                <asp:RegularExpressionValidator ID="revNewPassword" runat="server" ControlToValidate="txtNewPassword" ValidationGroup="vgForgot" ValidationExpression="^.{4,20}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Password must be between 4 and 20 characters." />
            </div>

            <div class="form-group">
                <label class="form-label" for="txtConfirmPassword">Confirm New Password <span class="required">*</span></label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Re-enter new password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ValidationGroup="vgForgot" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please confirm your new password." />
                <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword" ValidationGroup="vgForgot" Display="Dynamic" CssClass="validation-error" ErrorMessage="New password and confirm password do not match." />
            </div>

            <div style="margin-top: 24px;">
                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="btn btn-primary w-full" ValidationGroup="vgForgot" OnClick="btnResetPassword_Click" style="padding: 12px; font-weight: 600;" />
            </div>

            <div style="text-align: center; margin-top: 20px; font-size: 0.8125rem; color: #64748b;">
                Remembered your password? <a href="/Default.aspx" style="color: #166534; font-weight: 700; text-decoration: none;">Back to Login</a>
            </div>
        </div>
    </section>
</asp:Content>
