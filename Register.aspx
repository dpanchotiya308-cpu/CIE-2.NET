<%@ Page Title="Create Your Khedut Plus Account" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KhedutPlus.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style>
    .register-container {
        max-width: 1200px;
        margin: 40px auto 80px auto;
        padding: 0 24px;
    }
    .register-header {
        text-align: center;
        margin-bottom: 36px;
    }
    .register-header h1 {
        font-size: 2.25rem;
        font-weight: 800;
        color: #0f172a;
        margin-bottom: 8px;
    }
    .register-header p {
        font-size: 1rem;
        color: #64748b;
    }
    .register-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 32px;
    }
    .reg-card {
        background-color: #ffffff;
        border-radius: 16px;
        border: 1px solid #e2e8f0;
        padding: 36px;
        box-shadow: 0 4px 6px -1px rgba(0,0,0,0.03);
    }
    .reg-card-title {
        font-size: 1.25rem;
        font-weight: 700;
        color: #0f172a;
        margin-bottom: 24px;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    @media (max-width: 900px) {
        .register-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="register-container">
        <div class="register-header">
            <h1>Create Your Khedut Plus Account</h1>
            <p>Select your role and fill the registration details below.</p>
            
<%--            <div style="display: inline-flex; background-color: #f1f5f9; padding: 4px; border-radius: 10px; margin-top: 20px;">
                <span style="padding: 8px 20px; font-weight: 600; font-size: 0.875rem; border-radius: 8px; background-color: #ffffff; color: #0f172a; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">Farmer Registration</span>
                <span style="padding: 8px 20px; font-weight: 600; font-size: 0.875rem; border-radius: 8px; color: #64748b;">Agro Store Registration</span>
            </div>--%>
        </div>

        <div class="register-grid">
            <!-- Left Card: Farmer Personal Details -->
            <div class="reg-card">
                <div class="reg-card-title">
                    <span>🌾</span>
                    <span>Farmer Personal Details</span>
                </div>

                <asp:ValidationSummary ID="valSummaryFarmer" runat="server" ValidationGroup="vgFarmer" CssClass="validation-summary-box" HeaderText="Please correct the following errors:" DisplayMode="BulletList" />

                <asp:Panel ID="pnlFarmerSuccess" runat="server" Visible="false" CssClass="alert-success">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                    <span>Farmer account created successfully! Welcome to KhedutPlus.</span>
                </asp:Panel>

                <asp:Label ID="lblFarmerDbError" runat="server" Visible="false"
                    style="display:block;background:#fef2f2;border:1px solid #fecaca;color:#dc2626;border-radius:8px;padding:10px 14px;font-size:0.875rem;margin-bottom:16px;"></asp:Label>

                <div class="form-group">
                    <label class="form-label" for="txtFarmerName">Full Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtFarmerName" runat="server" CssClass="form-control" placeholder="eg. Ramesh Patel"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFarmerName" runat="server" ControlToValidate="txtFarmerName" ValidationGroup="vgFarmer" Display="Dynamic" CssClass="validation-error" ErrorMessage="Full name is required." />
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtFarmerMobile">Mobile Number <span class="required">*</span></label>
                    <asp:TextBox ID="txtFarmerMobile" runat="server" CssClass="form-control" placeholder="eg. +91 9876543210"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFarmerMobile" runat="server" ControlToValidate="txtFarmerMobile" ValidationGroup="vgFarmer" Display="Dynamic" CssClass="validation-error" ErrorMessage="Mobile number is required." />
                    <asp:RegularExpressionValidator ID="revFarmerMobile" runat="server" ControlToValidate="txtFarmerMobile" ValidationGroup="vgFarmer" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid 10-digit mobile number." />
                </div>

                <div class="form-group">
                    <label class="form-label" for="ddlFarmerLang">Preferred Language <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlFarmerLang" runat="server" CssClass="form-control">
                        <asp:ListItem Value="" Text="-- Select Preferred Language --" />
                        <asp:ListItem Value="gu" Text="Gujarati (ગુજરાતી)" Selected="True" />
                        <asp:ListItem Value="hi" Text="Hindi (हिन्दी)" />
                        <asp:ListItem Value="en" Text="English" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvFarmerLang" runat="server" ControlToValidate="ddlFarmerLang" InitialValue="" ValidationGroup="vgFarmer" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please select a preferred language." />
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtFarmerOtp">Password<span class="required">*</span></label>
                    <asp:TextBox ID="txtFarmerOtp" runat="server" CssClass="form-control" placeholder="000000" MaxLength="6" Text="123456"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFarmerOtp" runat="server" ControlToValidate="txtFarmerOtp" ValidationGroup="vgFarmer" Display="Dynamic" CssClass="validation-error" ErrorMessage="password is required." />
                    <asp:CustomValidator ID="cvFarmerOtp" runat="server" ControlToValidate="txtFarmerOtp" ValidationGroup="vgFarmer" Display="Dynamic" CssClass="validation-error" ErrorMessage="enter a strong password." ClientValidationFunction="ValidateOtpFormat" OnServerValidate="ValidateOtp_Server" />
                </div>

                <div style="margin-top: 24px;">
                    <asp:Button ID="btnFarmerSubmit" runat="server" Text="Create Account" CssClass="btn w-full" style="background-color: #334155; color: #ffffff;" ValidationGroup="vgFarmer" OnClick="btnFarmerSubmit_Click" />
                </div>
            </div>

            <!-- Right Card: Agro Store Business Details -->
            <div class="reg-card">
                <div class="reg-card-title">
                    <span>🏪</span>
                    <span>Agro Store Business Details</span>
                </div>

                <asp:ValidationSummary ID="valSummaryStore" runat="server" ValidationGroup="vgStore" CssClass="validation-summary-box" HeaderText="Please correct the following errors:" DisplayMode="BulletList" />

                <asp:Panel ID="pnlStoreSuccess" runat="server" Visible="false" CssClass="alert-success">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                    <span>Agro Store registered successfully! Welcome to AgroShop.</span>
                </asp:Panel>

                <asp:Label ID="lblStoreDbError" runat="server" Visible="false"
                    style="display:block;background:#fef2f2;border:1px solid #fecaca;color:#dc2626;border-radius:8px;padding:10px 14px;font-size:0.875rem;margin-bottom:16px;"></asp:Label>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtStoreName">Store Name <span class="required">*</span></label>
                        <asp:TextBox ID="txtStoreName" runat="server" CssClass="form-control" placeholder="eg. Patel Fertilizer Co."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStoreName" runat="server" ControlToValidate="txtStoreName" ValidationGroup="vgStore" Display="Dynamic" CssClass="validation-error" ErrorMessage="Store name is required." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtOwnerName">Owner Name <span class="required">*</span></label>
                        <asp:TextBox ID="txtOwnerName" runat="server" CssClass="form-control" placeholder="eg. Harish Patel"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOwnerName" runat="server" ControlToValidate="txtOwnerName" ValidationGroup="vgStore" Display="Dynamic" CssClass="validation-error" ErrorMessage="Owner name is required." />
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtStoreAddress">Store Full Address <span class="required">*</span></label>
                    <asp:TextBox ID="txtStoreAddress" runat="server" CssClass="form-control" placeholder="Shop 4, Market Yard, Rajkot, Gujarat"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStoreAddress" runat="server" ControlToValidate="txtStoreAddress" ValidationGroup="vgStore" Display="Dynamic" CssClass="validation-error" ErrorMessage="Store full address is required." />
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtLicenseId">License / Registration ID <span class="required">*</span></label>
                    <asp:TextBox ID="txtLicenseId" runat="server" CssClass="form-control" placeholder="eg. LIC1029302"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLicenseId" runat="server" ControlToValidate="txtLicenseId" ValidationGroup="vgStore" Display="Dynamic" CssClass="validation-error" ErrorMessage="License / Registration ID is required." />
                    <asp:RegularExpressionValidator ID="revLicenseId" runat="server" ControlToValidate="txtLicenseId" ValidationGroup="vgStore" ValidationExpression="^[A-Za-z0-9\-]{6,20}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="License ID must be 6-20 alphanumeric characters." />
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtStoreMobile">Mobile Number <span class="required">*</span></label>
                    <asp:TextBox ID="txtStoreMobile" runat="server" CssClass="form-control" placeholder="eg. +91 9876543210"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStoreMobile" runat="server" ControlToValidate="txtStoreMobile" ValidationGroup="vgStore" Display="Dynamic" CssClass="validation-error" ErrorMessage="Mobile number is required." />
                    <asp:RegularExpressionValidator ID="revStoreMobile" runat="server" ControlToValidate="txtStoreMobile" ValidationGroup="vgStore" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid 10-digit mobile number." />
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtStoreOtp">Password <span class="required">*</span></label>
                    <asp:TextBox ID="txtStoreOtp" runat="server" CssClass="form-control" placeholder="000000" MaxLength="6" Text="123456"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStoreOtp" runat="server" ControlToValidate="txtStoreOtp" ValidationGroup="vgStore" Display="Dynamic" CssClass="validation-error" ErrorMessage="password is required." />
                    <asp:CustomValidator ID="cvStoreOtp" runat="server" ControlToValidate="txtStoreOtp" ValidationGroup="vgStore" Display="Dynamic" CssClass="validation-error" ErrorMessage="enter a strong password." ClientValidationFunction="ValidateOtpFormat" OnServerValidate="ValidateOtp_Server" />
                </div>

                <div style="margin-top: 24px;">
                    <asp:Button ID="btnStoreSubmit" runat="server" Text="Register Store" CssClass="btn w-full" style="background-color: #475569; color: #ffffff;" ValidationGroup="vgStore" OnClick="btnStoreSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
