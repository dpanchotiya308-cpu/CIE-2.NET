<%@ Page Title="Shop Settings" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="KhedutPlus.Shop.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .portal-topbar .search-box {
        display: none !important;
    }
    /* Push notification + profile to the far right when search is hidden */
    .portal-topbar > div:last-child {
        margin-left: auto;
    }
    .shop-logo-box {
        display: flex;
        align-items: center;
        gap: 20px;
        margin-bottom: 24px;
        padding-bottom: 20px;
        border-bottom: 1px solid #f1f5f9;
    }
    .shop-logo-img {
        width: 64px;
        height: 64px;
        border-radius: 12px;
        background-color: #166534;
        padding: 8px;
        object-fit: contain;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Header -->
    <div style="margin-bottom: 24px;">
        <h1 class="page-title">Settings</h1>
        <p class="page-subtitle">Manage your shop profile, account security, and preferences.</p>
    </div>

    <!-- Tabs -->
    <div style="display: flex; gap: 24px; border-bottom: 1px solid #e2e8f0; margin-bottom: 28px;">
        <a href="#" style="padding: 10px 4px; font-weight: 600; color: #166534; border-bottom: 2px solid #166534;">Shop Profile</a>
        <!--<a href="#" style="padding: 10px 4px; font-weight: 500; color: #64748b;">Account Settings</a>-->
    </div>

    <!-- Validation Summary -->
    <asp:ValidationSummary ID="valSummaryShopSettings" runat="server" ValidationGroup="vgShopSettings" CssClass="validation-summary-box" HeaderText="Please correct the following errors:" DisplayMode="BulletList" />

    <asp:Panel ID="pnlShopSuccess" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblShopSuccess" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Basic Information Card -->
    <div class="card" style="margin-bottom: 24px;">
        <div style="margin-bottom: 20px;">
            <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a;">Basic Information</h2>
            <p style="font-size: 0.8125rem; color: #64748b;">Public information about your store</p>
        </div>

        <!-- Shop Logo -->
        <div class="shop-logo-box">
            <asp:Image ID="imgShopLogo" runat="server" ImageUrl="/Images/icons/logo_card.png" alt="Shop Logo" ClientIDMode="Static" CssClass="shop-logo-img" />
            <div>
                <div style="font-weight: 600; color: #0f172a; font-size: 0.875rem;">Shop Logo / Profile Photo</div>
                <div style="font-size: 0.75rem; color: #94a3b8; margin: 2px 0 10px 0;">Upload a square logo or photo for your shop. Recommended size: 512x512px. PNG or JPG.</div>
                <div style="display: flex; gap: 10px; align-items: center;">
                    <label for="<%= fuShopLogo.ClientID %>" class="btn btn-secondary btn-sm" style="font-weight: 600; cursor: pointer;">Upload New Photo</label>
                    <asp:FileUpload ID="fuShopLogo" runat="server" style="display: none;" onchange="previewShopLogo(this);" />
                    <span id="shopLogoStatus" style="font-size: 0.75rem; color: #166534; font-weight: 600; display: none;">New logo selected</span>
                </div>
            </div>
        </div>

        <!-- Fields -->
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 16px;">
            <div class="form-group">
                <label class="form-label" for="txtShopName">Shop Name <span class="required">*</span></label>
                <asp:TextBox ID="txtShopName" runat="server" CssClass="form-control" Text="Green Harvest Organics"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvShopName" runat="server" ControlToValidate="txtShopName" ValidationGroup="vgShopSettings" Display="Dynamic" CssClass="validation-error" ErrorMessage="Shop name is required." />
            </div>

            <div class="form-group">
                <label class="form-label" for="txtShopOwner">Owner Name <span class="required">*</span></label>
                <asp:TextBox ID="txtShopOwner" runat="server" CssClass="form-control" Text="Rajesh Patel"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvShopOwner" runat="server" ControlToValidate="txtShopOwner" ValidationGroup="vgShopSettings" Display="Dynamic" CssClass="validation-error" ErrorMessage="Owner name is required." />
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 16px;">
            <div class="form-group">
                <label class="form-label" for="txtContactPhone">Contact Number <span class="required">*</span></label>
                <asp:TextBox ID="txtContactPhone" runat="server" CssClass="form-control" Text="+91 98765 43210"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContactPhone" runat="server" ControlToValidate="txtContactPhone" ValidationGroup="vgShopSettings" Display="Dynamic" CssClass="validation-error" ErrorMessage="Contact number is required." />
                <asp:RegularExpressionValidator ID="revContactPhone" runat="server" ControlToValidate="txtContactPhone" ValidationGroup="vgShopSettings" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid phone number." />
            </div>

            <div class="form-group">
                <label class="form-label" for="txtBusinessEmail">Business Email <span class="required">*</span></label>
                <asp:TextBox ID="txtBusinessEmail" runat="server" CssClass="form-control" Text="contact@greenharvest.co"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBusinessEmail" runat="server" ControlToValidate="txtBusinessEmail" ValidationGroup="vgShopSettings" Display="Dynamic" CssClass="validation-error" ErrorMessage="Business email is required." />
                <asp:RegularExpressionValidator ID="revBusinessEmail" runat="server" ControlToValidate="txtBusinessEmail" ValidationGroup="vgShopSettings" ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid business email." />
            </div>
        </div>

        <div class="form-group">
            <label class="form-label" for="txtStoreAddress">Store Address <span class="required">*</span></label>
            <asp:TextBox ID="txtStoreAddress" runat="server" CssClass="form-control" Text="824 Organic Way, North Harvest Fields, CA 90210"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvStoreAddress" runat="server" ControlToValidate="txtStoreAddress" ValidationGroup="vgShopSettings" Display="Dynamic" CssClass="validation-error" ErrorMessage="Store address is required." />
        </div>

        <div class="form-group">
            <label class="form-label" for="txtShopDescription">Shop Description</label>
            <asp:TextBox ID="txtShopDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" Text="Premium organic vegetables and fruits sourced directly from local regenerative farms. We specialize in heirloom varieties and seasonal harvest baskets delivered to your door."></asp:TextBox>
        </div>

        <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 24px; padding-top: 16px; border-top: 1px solid #f1f5f9;">
            <button type="button" class="btn btn-secondary">Discard</button>
            <asp:Button ID="btnSaveSettings" runat="server" Text="Save Changes" CssClass="btn btn-primary" ValidationGroup="vgShopSettings" OnClick="btnSaveSettings_Click" style="background-color: #166534;" />
        </div>
    </div>

    <!-- Preferences Card -->
    <div class="card">
        <div class="form-group" style="margin-bottom: 24px;">
            <label class="form-label" for="ddlDefaultLanguage">Default Language</label>
            <span style="font-size: 0.75rem; color: #94a3b8; display: block; margin-bottom: 6px;">System interface and reports language.</span>
            <asp:DropDownList ID="ddlDefaultLanguage" runat="server" CssClass="form-control" style="max-width: 320px;">
                <asp:ListItem Value="en-US" Text="English (United States)" Selected="True" />
                <asp:ListItem Value="gu-IN" Text="Gujarati (ગુજરાતી)" />
                <asp:ListItem Value="hi-IN" Text="Hindi (हिन्दी)" />
            </asp:DropDownList>
        </div>

        <div>
            <h3 style="font-size: 0.9375rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Email Notifications</h3>

            <div style="display: flex; align-items: center; justify-content: space-between; padding: 12px 0; border-bottom: 1px solid #f1f5f9;">
                <div style="font-size: 0.875rem; color: #334155;">New order alerts</div>
                <label class="toggle-switch">
                    <input type="checkbox" checked="checked" />
                    <span class="toggle-slider"></span>
                </label>
            </div>

            <div style="display: flex; align-items: center; justify-content: space-between; padding: 12px 0;">
                <div style="font-size: 0.875rem; color: #334155;">Inventory stock warnings</div>
                <label class="toggle-switch">
                    <input type="checkbox" checked="checked" />
                    <span class="toggle-slider"></span>
                </label>
            </div>
        </div>
    </div>

    <script>
        function previewShopLogo(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = document.getElementById('imgShopLogo');
                    if (img) {
                        img.src = e.target.result;
                    }
                    var status = document.getElementById('shopLogoStatus');
                    if (status) {
                        status.style.display = 'inline';
                        status.textContent = 'Selected: ' + input.files[0].name;
                    }
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
