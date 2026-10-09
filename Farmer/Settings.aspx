<%@ Page Title="Settings (સેટિંગ્સ)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="KhedutPlus.Farmer.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .pref-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 20px 0;
        border-bottom: 1px solid #f1f5f9;
    }
    .pref-row:last-child {
        border-bottom: none;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Header -->
    <div style="margin-bottom: 24px;">
        <h1 class="page-title">Settings (સેટિંગ્સ)</h1>
        <p class="page-subtitle">Manage your account preferences, notifications, and security settings.</p>
    </div>

    <!-- Notification Preferences Card -->
    <div class="card" style="max-width: 900px; padding: 32px;">
        <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 20px; padding-bottom: 16px; border-bottom: 1px solid #e2e8f0;">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="color: #166534;"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
            <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a;">Notification Preferences</h2>
        </div>

        <!-- Row 1: SMS Alerts -->
        <div class="pref-row">
            <div>
                <div style="font-size: 0.9375rem; font-weight: 600; color: #0f172a;">SMS Alerts</div>
                <div style="font-size: 0.8125rem; color: #64748b; margin-top: 2px;">Receive important updates directly via SMS.</div>
            </div>
            <label class="toggle-switch">
                <input type="checkbox" checked="checked" />
                <span class="toggle-slider"></span>
            </label>
        </div>

        <!-- Row 2: Weather Updates -->
        <div class="pref-row">
            <div>
                <div style="font-size: 0.9375rem; font-weight: 600; color: #0f172a;">Weather Updates</div>
                <div style="font-size: 0.8125rem; color: #64748b; margin-top: 2px;">Daily forecasts and severe weather warnings.</div>
            </div>
            <label class="toggle-switch">
                <input type="checkbox" checked="checked" />
                <span class="toggle-slider"></span>
            </label>
        </div>

        <!-- Row 3: Government Schemes -->
        <div class="pref-row">
            <div>
                <div style="font-size: 0.9375rem; font-weight: 600; color: #0f172a;">Government Schemes</div>
                <div style="font-size: 0.8125rem; color: #64748b; margin-top: 2px;">Alerts for new subsidies and PM-Kisan installments.</div>
            </div>
            <label class="toggle-switch">
                <input type="checkbox" checked="checked" />
                <span class="toggle-slider"></span>
            </label>
        </div>
    </div>
</asp:Content>
