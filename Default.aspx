<%@ Page Title="Smart Farming Information, Made Simple" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KhedutPlus.Default" %>

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
                <span>⚡</span>
                <span>Empowering Modern Farmers</span>
            </div>
            
            <h1 class="hero-title">
                Smart Farming<br />
                Information, Made<br />
                <span style="color: #166534;">Simple.</span>
            </h1>

            <p class="hero-desc">
                Access real-time crop guides, disease solutions, government schemes, and find nearby agro stores all in one trusted platform designed for your success.
            </p>
        </div>

        <!-- Login Card -->
        <div class="login-card">
            <h2 style="font-size: 1.5rem; font-weight: 700; color: #0f172a; text-align: center; margin-bottom: 4px;">Get Started Free</h2>
            <p style="font-size: 0.875rem; color: #64748b; text-align: center; margin-bottom: 20px;">Join 100+ farmers improving their yield</p>

            <div style="font-size: 0.6875rem; font-weight: 700; text-transform: uppercase; color: #94a3b8; letter-spacing: 0.05em; margin-bottom: 10px; text-align: center;">
                LOGIN WITH REGISTER MOBILE NO
            </div>

            <!-- Role Selector -->
            <div class="role-toggle-group">
                <asp:Button ID="btnRoleFarmer" runat="server" Text="Farmer (ખેડૂત)" CssClass="role-btn active" OnClick="btnRoleFarmer_Click" CausesValidation="false" />
                <asp:Button ID="btnRoleShop" runat="server" Text="Agro Store Owner" CssClass="role-btn" OnClick="btnRoleShop_Click" CausesValidation="false" />
            </div>

            <!-- Validation Summary -->
            <asp:ValidationSummary ID="valSummaryLogin" runat="server" ValidationGroup="vgLogin" CssClass="validation-summary-box" HeaderText="Please correct the following errors:" DisplayMode="BulletList" />

            <asp:Label ID="lblLoginError" runat="server" Visible="false"
                style="display:block;background:#fef2f2;border:1px solid #fecaca;color:#dc2626;border-radius:8px;padding:10px 14px;font-size:0.875rem;margin-bottom:12px;"></asp:Label>

            <asp:Panel ID="pnlSuccessFeedback" runat="server" Visible="false" CssClass="alert-success">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label>
            </asp:Panel>

            <!-- Form -->
            <div class="form-group">
                <label class="form-label" for="txtMobileNumber">Mobile Number <span class="required">*</span></label>
                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" placeholder="eg. 9876543210" MaxLength="15"></asp:TextBox>
                
                <!-- Built-in RequiredFieldValidator -->
                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobileNumber" ValidationGroup="vgLogin" Display="Dynamic" CssClass="validation-error" ErrorMessage="Mobile number is required." />
                
                <!-- Built-in RegularExpressionValidator for 10-digit Indian Mobile -->
                <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobileNumber" ValidationGroup="vgLogin" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid 10-digit Indian mobile number." />
            </div>

            <div class="form-group">
                <label class="form-label" for="txtOtp">Password<span class="required">*</span></label>
                <asp:TextBox ID="txtOtp" runat="server" CssClass="form-control" placeholder="000000" MaxLength="6"></asp:TextBox>
                
                <!-- Built-in RequiredFieldValidator -->
                <asp:RequiredFieldValidator ID="rfvOtp" runat="server" ControlToValidate="txtOtp" ValidationGroup="vgLogin" Display="Dynamic" CssClass="validation-error" ErrorMessage="Password is required." />
                
                <!-- Built-in CustomValidator for OTP verification -->
                <asp:CustomValidator ID="cvOtp" runat="server" ControlToValidate="txtOtp" ValidationGroup="vgLogin" Display="Dynamic" CssClass="validation-error" ErrorMessage="enter a valid password." ClientValidationFunction="ValidateOtpFormat" OnServerValidate="cvOtp_ServerValidate" />
            </div>

            <div style="display: flex; justify-content: flex-end; align-items: center; margin-top: -6px; margin-bottom: 20px;">
                <a href="/ForgotPassword.aspx" style="color: #166534; font-size: 0.8125rem; font-weight: 600; text-decoration: none;">Forgot Password?</a>
            </div>

            <div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary w-full" ValidationGroup="vgLogin" OnClick="btnLogin_Click" />
            </div>

            <div style="text-align: center; margin-top: 20px; font-size: 0.8125rem; color: #64748b;">
                Don't have an account? <a href="/Register.aspx" style="color: #166534; font-weight: 700; text-decoration: none;">Register Now</a>
            </div>
        </div>
    </section>
</asp:Content>
