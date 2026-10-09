<%@ Page Title="Farmer Profile (પ્રોફાઇલ)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="KhedutPlus.Farmer.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .profile-hero-card {
        background-color: #ffffff;
        border-radius: 16px;
        border: 1px solid #e2e8f0;
        padding: 28px;
        margin-bottom: 28px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-shadow: 0 1px 3px rgba(0,0,0,0.02);
    }
    .profile-user-left {
        display: flex;
        align-items: center;
        gap: 20px;
    }
    .profile-avatar-wrap {
        position: relative;
        width: 80px;
        height: 80px;
    }
    .profile-avatar-wrap img {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        object-fit: cover;
        border: 3px solid #22c55e;
    }
    .profile-cam-btn {
        position: absolute;
        bottom: 0;
        right: 0;
        width: 26px;
        height: 26px;
        border-radius: 50%;
        background-color: #166534;
        color: #ffffff;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 0.75rem;
        border: 2px solid #ffffff;
    }
    .profile-sections-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 28px;
    }
    .crop-pill-tag {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 6px 12px;
        background-color: #f1f5f9;
        border-radius: 9999px;
        font-size: 0.8125rem;
        font-weight: 500;
        color: #334155;
    }
    .crop-pill-tag .remove-crop {
        cursor: pointer;
        color: #94a3b8;
    }
    @media (max-width: 900px) {
        .profile-hero-card {
            flex-direction: column;
            align-items: flex-start;
            gap: 20px;
        }
        .profile-sections-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Header -->
    <div style="margin-bottom: 24px;">
        <h1 class="page-title">Farmer Profile (પ્રોફાઇલ)</h1>
        <p class="page-subtitle">Manage your personal information and farm preferences.</p>
    </div>

    <!-- Validation Summary -->
    <asp:ValidationSummary ID="valSummaryProfile" runat="server" ValidationGroup="vgProfile" CssClass="validation-summary-box" HeaderText="Please resolve the following validation errors:" DisplayMode="BulletList" />

    <asp:Panel ID="pnlProfileSuccess" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblProfileMessage" runat="server" Text="Profile changes saved successfully!"></asp:Label>
    </asp:Panel>

    <!-- Profile Hero Card -->
    <div class="profile-hero-card">
        <div class="profile-user-left">
            <div class="profile-avatar-wrap">
                <asp:Image ID="imgFarmerAvatar" runat="server" ImageUrl="/Images/avatars/ramesh_kumar.jpg" alt="Ramesh Kumar" ClientIDMode="Static" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover; border: 3px solid #22c55e;" />
                <label for="<%= fuProfilePhoto.ClientID %>" class="profile-cam-btn" title="Edit Profile Photo" style="cursor: pointer;">📷</label>
                <asp:FileUpload ID="fuProfilePhoto" runat="server" style="display: none;" onchange="previewFarmerAvatar(this);" />
            </div>
            <div>
                <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 4px;">
                    <h2 style="font-size: 1.375rem; font-weight: 700; color: #0f172a;">
                        <asp:Label ID="lblHeroFarmerName" runat="server">Ramesh Kumar</asp:Label>
                    </h2>
                    <span class="badge" style="background-color: #eff6ff; color: #2563eb; font-size: 0.6875rem;">VERIFIED FARMER</span>
                </div>
                <div style="display: flex; align-items: center; gap: 16px; font-size: 0.8125rem; color: #64748b; margin-bottom: 8px;">
                    <span>📍 Anand, Gujarat, India</span>
                    <span>📅 Member since May 2021</span>
                </div>
                <div>
                    <label for="<%= fuProfilePhoto.ClientID %>" class="btn btn-secondary btn-sm" style="font-size: 0.75rem; padding: 4px 12px; cursor: pointer; display: inline-flex; align-items: center; gap: 6px; border-radius: 6px; font-weight: 600;">
                        📷 Edit Photo
                    </label>
                    <span id="photoStatusText" style="font-size: 0.75rem; color: #166534; font-weight: 600; margin-left: 8px; display: none;">New photo selected</span>
                </div>
            </div>
        </div>

        <div style="text-align: right;">
            <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="btn btn-primary" ValidationGroup="vgProfile" OnClick="btnSaveChanges_Click" style="border-radius: 8px; padding: 10px 24px;" />
            <div style="font-size: 0.75rem; color: #94a3b8; margin-top: 6px;">Last login: Today, 08:30 AM</div>
        </div>
    </div>

    <!-- 2 Column Forms -->
    <div class="profile-sections-grid">
        <!-- Left Column -->
        <div>
            <!-- Personal Information -->
            <div class="card" style="margin-bottom: 24px;">
                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
                    <h3 style="font-size: 1.125rem; font-weight: 700; color: #0f172a;">Personal Information</h3>
                    <span style="color: #94a3b8; font-size: 1rem;">✎</span>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtFullName">Full Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" Text="Ramesh Kumar"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ValidationGroup="vgProfile" Display="Dynamic" CssClass="validation-error" ErrorMessage="Full name is mandatory." />
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtEmailAddress">Email Address <span class="required">*</span></label>
                    <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control" Text="ramesh.patel@agrimail.in"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmailAddress" ValidationGroup="vgProfile" Display="Dynamic" CssClass="validation-error" ErrorMessage="Email address is mandatory." />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmailAddress" ValidationGroup="vgProfile" ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid email address." />
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtPhoneNumber">Phone Number <span class="required">*</span></label>
                    <div style="display: flex; gap: 8px;">
                        <input type="text" class="form-control" value="+91" disabled style="width: 70px; text-align: center; background-color: #f8fafc;" />
                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" Text="9876543210"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhoneNumber" ValidationGroup="vgProfile" Display="Dynamic" CssClass="validation-error" ErrorMessage="Phone number is mandatory." />
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhoneNumber" ValidationGroup="vgProfile" ValidationExpression="^[6789]\d{9}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid 10-digit mobile number." />
                </div>
            </div>

            <!-- Danger Zone -->
            <div class="card" style="border-color: #fecaca; background-color: #ffffff;">
                <h3 style="font-size: 1.0625rem; font-weight: 700; color: #dc2626; margin-bottom: 6px;">Danger Zone</h3>
                <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px;">
                    <p style="font-size: 0.8125rem; color: #64748b; line-height: 1.4; max-width: 280px;">
                        Deleting your account is permanent and cannot be undone.
                    </p>
                    <button type="button" class="btn btn-danger btn-sm" onclick="alert('Account deactivation requested. Customer service will verify identity.');">Deactivate Account</button>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div>
            <!-- Farm Details -->
            <div class="card" style="margin-bottom: 24px;">
                <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
                    <h3 style="font-size: 1.125rem; font-weight: 700; color: #0f172a;">Farm Details</h3>
                    <span style="color: #166534; font-size: 1.25rem;">🚜</span>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtFarmSize">Farm Size (Acres) <span class="required">*</span></label>
                    <div style="position: relative;">
                        <asp:TextBox ID="txtFarmSize" runat="server" CssClass="form-control" Text="12.5"></asp:TextBox>
                        <span style="position: absolute; right: 14px; top: 50%; transform: translateY(-50%); color: #94a3b8; font-size: 0.875rem;">Acres</span>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvFarmSize" runat="server" ControlToValidate="txtFarmSize" ValidationGroup="vgProfile" Display="Dynamic" CssClass="validation-error" ErrorMessage="Farm size is mandatory." />
                    <!-- Built-in RangeValidator for numeric limits -->
                    <asp:RangeValidator ID="rvFarmSize" runat="server" ControlToValidate="txtFarmSize" ValidationGroup="vgProfile" Type="Double" MinimumValue="0.1" MaximumValue="1000.0" Display="Dynamic" CssClass="validation-error" ErrorMessage="Farm size must be between 0.1 and 1000.0 acres." />
                </div>

                <div class="form-group">
                    <label class="form-label">Primary Crops</label>
                    <div style="display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 10px;">
                        <span class="crop-pill-tag">Wheat <span class="remove-crop">&times;</span></span>
                        <span class="crop-pill-tag">Cotton <span class="remove-crop">&times;</span></span>
                        <span class="crop-pill-tag">Potato <span class="remove-crop">&times;</span></span>
                        <button type="button" class="btn btn-secondary btn-sm" style="border-radius: 9999px; font-weight: 600;">+ Add Crop</button>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="ddlSoilType">Soil Type <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlSoilType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="" Text="-- Select Soil Type --" />
                        <asp:ListItem Value="Black Soil (Regur)" Text="Black Soil (Regur)" Selected="True" />
                        <asp:ListItem Value="Alluvial Soil" Text="Alluvial Soil" />
                        <asp:ListItem Value="Red Soil" Text="Red Soil" />
                        <asp:ListItem Value="Sandy Loam" Text="Sandy Loam" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSoilType" runat="server" ControlToValidate="ddlSoilType" InitialValue="" ValidationGroup="vgProfile" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please select your farm soil type." />
                </div>
            </div>

            <!-- Notification Preferences -->
            <div class="card">
                <h3 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 20px;">Notification Preferences</h3>

                <div style="display: flex; align-items: center; justify-content: space-between; padding-bottom: 16px; border-bottom: 1px solid #f1f5f9; margin-bottom: 16px;">
                    <div>
                        <div style="font-weight: 600; color: #0f172a; font-size: 0.875rem;">New Stock Available</div>
                        <div style="font-size: 0.8125rem; color: #64748b;">Get new stock updates every morning</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" checked="checked" />
                        <span class="toggle-slider"></span>
                    </label>
                </div>

                <div style="display: flex; align-items: center; justify-content: space-between;">
                    <div>
                        <div style="font-weight: 600; color: #0f172a; font-size: 0.875rem;">Government Schemes</div>
                        <div style="font-size: 0.8125rem; color: #64748b;">New scheme notifications matching your profile</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" checked="checked" />
                        <span class="toggle-slider"></span>
                    </label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FarmerScripts" runat="server">
<script>
    function previewFarmerAvatar(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var img = document.getElementById('imgFarmerAvatar');
                if (img) {
                    img.src = e.target.result;
                }
                var status = document.getElementById('photoStatusText');
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
