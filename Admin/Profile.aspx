<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="KhedutPlus.Admin.Profile_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .profile-layout {
        display: grid;
        grid-template-columns: 300px 1fr;
        gap: 28px;
        align-items: start;
    }
    .profile-card {
        background: #ffffff;
        border-radius: 16px;
        border: 1px solid #e2e8f0;
        padding: 32px 24px;
        text-align: center;
        box-shadow: 0 1px 3px rgba(0,0,0,0.02);
    }
    .admin-avatar-circle {
        width: 88px;
        height: 88px;
        border-radius: 50%;
        background: linear-gradient(135deg, #166534, #22c55e);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 2rem;
        font-weight: 800;
        color: #ffffff;
        margin: 0 auto 20px;
    }
    .profile-form-card {
        background: #ffffff;
        border-radius: 16px;
        border: 1px solid #e2e8f0;
        padding: 32px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.02);
    }
    .form-grid-2 {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }
    .section-divider {
        border: none;
        border-top: 1px solid #f1f5f9;
        margin: 24px 0;
    }
    @media (max-width: 900px) {
        .profile-layout { grid-template-columns: 1fr; }
        .form-grid-2 { grid-template-columns: 1fr; }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Admin Profile</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Manage your administrator account details and update your credentials.</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="AdminContent" runat="server">
    <div class="profile-layout">

        <!-- Left: Profile Card -->
        <div class="profile-card">
            <div style="position: relative; width: 88px; height: 88px; margin: 0 auto 12px;">
                <asp:Image ID="imgAdminAvatar" runat="server" ImageUrl="/Images/avatars/ramesh_profile.jpg" Visible="false" ClientIDMode="Static" style="width: 88px; height: 88px; border-radius: 50%; object-fit: cover; border: 3px solid #166534;" />
                <div id="divAdminInitials" runat="server" class="admin-avatar-circle" style="margin: 0;">SP</div>
                <label for="<%= fuAdminPhoto.ClientID %>" title="Edit Profile Photo" style="position: absolute; bottom: 0; right: 0; width: 26px; height: 26px; border-radius: 50%; background-color: #166534; color: #ffffff; display: flex; align-items: center; justify-content: center; font-size: 0.75rem; border: 2px solid #ffffff; cursor: pointer;">📷</label>
                <asp:FileUpload ID="fuAdminPhoto" runat="server" style="display: none;" onchange="previewAdminAvatar(this);" />
            </div>
            <div style="margin-bottom: 12px;">
                <label for="<%= fuAdminPhoto.ClientID %>" class="btn btn-secondary btn-sm" style="font-size: 0.75rem; padding: 4px 12px; cursor: pointer; border-radius: 6px; font-weight: 600; display: inline-block;">
                    📷 Edit Photo
                </label>
            </div>
            <h2 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 4px;">
                <asp:Label ID="lblAdminHeroName" runat="server">Sanjay Patel</asp:Label>
            </h2>
            <div class="badge" style="background-color: #f0fdf4; color: #166534; border: 1px solid #bbf7d0; margin-bottom: 16px; display: inline-block;">System Administrator</div>
            <hr class="section-divider" />
            <div style="text-align: left;">
                <div style="margin-bottom: 12px; display: flex; gap: 10px; align-items: center;">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#64748b" stroke-width="2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
                    <span style="font-size: 0.8125rem; color: #64748b;">sanjay.patel@khedutplus.gov.in</span>
                </div>
                <div style="margin-bottom: 12px; display: flex; gap: 10px; align-items: center;">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#64748b" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 12 19.79 19.79 0 0 1 1.61 3.18 2 2 0 0 1 3.6 1h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 8.91a16 16 0 0 0 6 6l.91-.91a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 21.71 16.92z"></path></svg>
                    <span style="font-size: 0.8125rem; color: #64748b;">+91 98765 00001</span>
                </div>
                <div style="display: flex; gap: 10px; align-items: center;">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#64748b" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    <span style="font-size: 0.8125rem; color: #64748b;">Member since Jan 2024</span>
                </div>
            </div>
            <hr class="section-divider" />
            <div style="background:#f0fdf4;border-radius:10px;padding:14px;text-align:left;">
                <div style="font-size:0.75rem;font-weight:700;color:#166534;margin-bottom:8px;">PERMISSIONS</div>
                <div style="font-size:0.8125rem;color:#334155;line-height:1.8;">
                    ✔ Manage Farmers<br/>
                    ✔ Manage AgroShops<br/>
                    ✔ View All Reports<br/>
                    ✔ Post Announcements<br/>
                    ✔ System Configuration
                </div>
            </div>
        </div>

        <!-- Right: Edit Form -->
        <div class="profile-form-card">
            <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 20px;">Update Profile Information</h3>

            <!-- Success Banner -->
            <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom:20px;">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                <span>Profile updated successfully!</span>
            </asp:Panel>

            <!-- Validation Summary -->
            <asp:ValidationSummary ID="valSummaryProfile" runat="server" ValidationGroup="vgAdminProfile"
                CssClass="validation-summary-box" HeaderText="Please correct the following errors:"
                DisplayMode="BulletList" style="margin-bottom:20px;" />

            <!-- Personal Info -->
            <div style="font-size:0.75rem;font-weight:700;text-transform:uppercase;letter-spacing:0.06em;color:#94a3b8;margin-bottom:16px;">Personal Information</div>

            <div class="form-grid-2" style="margin-bottom: 20px;">
                <div class="form-group">
                    <label class="form-label">Full Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter full name" Text="Sanjay Patel"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName"
                        ValidationGroup="vgAdminProfile" Display="Dynamic" CssClass="validation-error"
                        ErrorMessage="Full name is required." />
                </div>
                <div class="form-group">
                    <label class="form-label">Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="10-digit mobile" Text="+91 98765 00001"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone"
                        ValidationGroup="vgAdminProfile" Display="Dynamic" CssClass="validation-error"
                        ValidationExpression="^[6-9]\d{9}$"
                        ErrorMessage="Enter a valid 10-digit Indian mobile number." />
                </div>
            </div>

            <div class="form-group" style="margin-bottom: 20px;">
                <label class="form-label">Email Address <span class="required">*</span></label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email" Text="sanjay.patel@khedutplus.gov.in"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ValidationGroup="vgAdminProfile" Display="Dynamic" CssClass="validation-error"
                    ErrorMessage="Email address is required." />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    ValidationGroup="vgAdminProfile" Display="Dynamic" CssClass="validation-error"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    ErrorMessage="Enter a valid email address." />
            </div>

            <hr class="section-divider" />

            <!-- Change Password -->
            <div style="font-size:0.75rem;font-weight:700;text-transform:uppercase;letter-spacing:0.06em;color:#94a3b8;margin-bottom:16px;">Change Password (Optional)</div>

            <div class="form-grid-2" style="margin-bottom: 20px;">
                <div class="form-group">
                    <label class="form-label">Current Password</label>
                    <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Current password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">New Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="New password"></asp:TextBox>
                </div>
            </div>

            <div class="form-group" style="margin-bottom: 28px;">
                <label class="form-label">Confirm New Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Re-enter new password"></asp:TextBox>
                <asp:CompareValidator ID="cvConfirmPassword" runat="server"
                    ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword"
                    ValidationGroup="vgAdminProfile" Display="Dynamic" CssClass="validation-error"
                    ErrorMessage="New password and confirm password must match." />
            </div>

            <!-- Submit -->
            <div style="display: flex; gap: 12px; flex-wrap: wrap;">
                <asp:Button ID="btnSave" runat="server" Text="Save Profile Changes" ValidationGroup="vgAdminProfile"
                    CssClass="btn" OnClick="btnSave_Click"
                    style="background-color:#166534;color:#ffffff;padding:11px 28px;border-radius:9px;font-weight:700;" />
                <button type="button" class="btn btn-secondary" onclick="location.href='/Admin/Dashboard.aspx'">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        function previewAdminAvatar(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = document.getElementById('imgAdminAvatar');
                    var initDiv = document.getElementById('<%= divAdminInitials.ClientID %>');
                    if (img) {
                        img.src = e.target.result;
                        img.style.display = 'block';
                    }
                    if (initDiv) {
                        initDiv.style.display = 'none';
                    }
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
