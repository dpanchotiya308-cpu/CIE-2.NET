<%@ Page Title="Crop Details" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="CropDetails.aspx.cs" Inherits="KhedutPlus.Farmer.CropDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .crop-hero-banner {
        position: relative;
        width: 100%;
        height: 320px;
        border-radius: 16px;
        overflow: hidden;
        margin-bottom: 24px;
        box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
        background-color: #f1f5f9;
    }
    .crop-hero-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .crop-status-floating {
        position: absolute;
        top: 20px;
        right: 20px;
        background-color: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(4px);
        padding: 8px 16px;
        border-radius: 9999px;
        font-size: 0.8125rem;
        font-weight: 600;
        color: #166534;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .crop-stats-strip {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 16px;
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 20px;
        margin-bottom: 28px;
    }
    .crop-stat-box {
        text-align: center;
        border-right: 1px solid #f1f5f9;
    }
    .crop-stat-box:last-child {
        border-right: none;
    }
    .crop-stat-lbl {
        font-size: 0.6875rem;
        font-weight: 700;
        text-transform: uppercase;
        color: #94a3b8;
        letter-spacing: 0.05em;
        margin-bottom: 4px;
    }
    .crop-stat-val {
        font-size: 1.125rem;
        font-weight: 700;
        color: #0f172a;
    }
    .crop-detail-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 28px;
    }
    .guide-card {
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 24px;
        margin-bottom: 24px;
    }
    .guide-card-header {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 1.125rem;
        font-weight: 700;
        color: #0f172a;
        margin-bottom: 18px;
        padding-bottom: 12px;
        border-bottom: 1px solid #f1f5f9;
    }
    .guide-item {
        margin-bottom: 18px;
    }
    .guide-item:last-child {
        margin-bottom: 0;
    }
    .guide-item-title {
        font-weight: 600;
        font-size: 0.9375rem;
        color: #1e293b;
        margin-bottom: 4px;
        display: flex;
        align-items: center;
        gap: 8px;
    }
    .guide-item-text {
        font-size: 0.875rem;
        color: #64748b;
        line-height: 1.6;
    }
    .variety-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 12px 0;
        border-bottom: 1px solid #f1f5f9;
    }
    .variety-row:last-child {
        border-bottom: none;
    }
    @media (max-width: 900px) {
        .crop-stats-strip {
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
        }
        .crop-detail-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Top Action Bar -->
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; flex-wrap: wrap; gap: 16px;">
        <div style="display: flex; align-items: center; gap: 12px;">
            <a href="/Farmer/Crops.aspx" style="color: #64748b; display: flex; align-items: center; font-size: 1.125rem;">&larr;</a>
            <h1 style="font-size: 1.5rem; font-weight: 700; color: #0f172a;"><%= CurrentCrop != null ? CurrentCrop.Name + " (" + CurrentCrop.LocalName + ")" : "Crop Information" %></h1>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:Button ID="btnSaveCrop" runat="server" Text="Save to My Crops" CssClass="btn btn-secondary" OnClick="btnSaveCrop_Click" />
        </div>
    </div>

    <!-- Breadcrumb -->
    <div style="font-size: 0.8125rem; color: #94a3b8; margin-bottom: 20px;">
        <a href="/Farmer/Crops.aspx" style="color: #64748b;">Crops</a> &gt; <span><%= CurrentCrop != null ? CurrentCrop.Name : "Crop" %> Information</span>
    </div>

    <!-- Alert Feedback -->
    <asp:Panel ID="pnlFeedback" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom: 20px;">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblFeedback" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Banner Image -->
    <div class="crop-hero-banner">
        <img src='<%= GetCropBannerUrl() %>' alt='<%= CurrentCrop != null ? CurrentCrop.Name : "Crop" %>' class="crop-hero-img" />
        <div class="crop-status-floating">
            <span>● Status: Ideal for Sowing</span>
        </div>
    </div>

    <!-- Title & Description -->
    <div style="margin-bottom: 24px;">
        <h2 style="font-size: 1.75rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;"><%= CurrentCrop != null ? CurrentCrop.Name + " (" + (string.IsNullOrEmpty(CurrentCrop.ScientificName) ? CurrentCrop.LocalName : CurrentCrop.ScientificName) + ")" : "" %></h2>
        <p style="font-size: 0.9375rem; color: #64748b; line-height: 1.6; max-width: 900px;">
            <%= CurrentCrop != null ? CurrentCrop.Description : "" %>
        </p>
    </div>

    <!-- Stats Strip -->
    <div class="crop-stats-strip">
        <div class="crop-stat-box">
            <div class="crop-stat-lbl">Duration</div>
            <div class="crop-stat-val"><%= CurrentCrop != null && !string.IsNullOrEmpty(CurrentCrop.Duration) ? CurrentCrop.Duration : "90-120 Days" %></div>
        </div>
        <div class="crop-stat-box">
            <div class="crop-stat-lbl">Avg. Yield</div>
            <div class="crop-stat-val"><%= CurrentCrop != null && !string.IsNullOrEmpty(CurrentCrop.AvgYield) ? CurrentCrop.AvgYield : "3.0 - 5.0 t/ha" %></div>
        </div>
        <div class="crop-stat-box">
            <div class="crop-stat-lbl">Market Rate</div>
            <div class="crop-stat-val"><%= CurrentCrop != null && !string.IsNullOrEmpty(CurrentCrop.MarketRate) ? CurrentCrop.MarketRate : "₹2,000 / Qtl" %></div>
        </div>
        <div class="crop-stat-box">
            <div class="crop-stat-lbl">Climate</div>
            <div class="crop-stat-val"><%= CurrentCrop != null && !string.IsNullOrEmpty(CurrentCrop.Climate) ? CurrentCrop.Climate : "Warm & Sunny" %></div>
        </div>
    </div>

    <!-- 2 Column Details -->
    <div class="crop-detail-grid">
        <!-- Left Column -->
        <div>
            <!-- Cultivation Guide -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🌱</span>
                    <span>Cultivation Guide</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>📅</span>
                        <span>Sowing Season</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentCrop != null && !string.IsNullOrEmpty(CurrentCrop.SowingSeason) ? CurrentCrop.SowingSeason : "Sow according to regional Kharif/Rabi cycle with early monsoon or pre-winter preparation." %>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>💧</span>
                        <span>Water Management</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentCrop != null && !string.IsNullOrEmpty(CurrentCrop.WaterManagement) ? CurrentCrop.WaterManagement : (CurrentCrop != null ? CurrentCrop.Water : "Maintain regular irrigation during critical flowering and fruiting stages.") %>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>🌾</span>
                        <span>Soil Requirement</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentCrop != null && !string.IsNullOrEmpty(CurrentCrop.SoilRequirement) ? CurrentCrop.SoilRequirement : (CurrentCrop != null ? CurrentCrop.Soil : "Well-drained fertile loam with good organic content and neutral pH.") %>
                    </div>
                </div>
            </div>

            <!-- Harvesting & Storage -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🌾</span>
                    <span>Harvesting & Storage</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">Timing</div>
                    <div class="guide-item-text">
                        <%= CurrentCrop != null && !string.IsNullOrEmpty(CurrentCrop.HarvestTiming) ? CurrentCrop.HarvestTiming : "Harvest when mature grains/fruits reach full firmness and foliage shows natural drying." %>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">Method</div>
                    <div class="guide-item-text">
                        <%= CurrentCrop != null && !string.IsNullOrEmpty(CurrentCrop.HarvestMethod) ? CurrentCrop.HarvestMethod : "Careful hand picking or calibrated mechanical harvesting to prevent kernel damage." %>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">Safe Storage</div>
                    <div class="guide-item-text">
                        <%= CurrentCrop != null && !string.IsNullOrEmpty(CurrentCrop.SafeStorage) ? CurrentCrop.SafeStorage : "Store in ventilated, moisture-controlled bins protected from rodent and weevil infestation." %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div>
            <!-- Pest & Disease Management -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🧪</span>
                    <span>Pest & Disease Management</span>
                </div>
                <asp:Repeater ID="rptPestDiseases" runat="server">
                    <ItemTemplate>
                        <div class="guide-item" style="background-color: #fef2f2; border: 1px solid #fecaca; border-radius: 8px; padding: 12px 16px; margin-bottom: 12px;">
                            <div class="guide-item-title" style="color: #991b1b; font-weight: 700;">
                                <%# Eval("Name") %> (<%# Eval("Kind") %>)
                            </div>
                            <div class="guide-item-text" style="color: #7f1d1d; font-size: 0.8125rem; margin-bottom: 6px;">
                                <%# Eval("Subtitle") %>
                            </div>
                            <div style="font-size: 0.75rem; font-weight: 600; color: #166534;">
                                Treatment: <span style="font-weight: 400; color: #334155;"><%# Eval("Treatment") %></span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- High-Yield Varieties -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>📋</span>
                    <span>High-Yield Varieties</span>
                </div>
                <asp:Repeater ID="rptVarieties" runat="server">
                    <ItemTemplate>
                        <div class="variety-row">
                            <div>
                                <div style="font-weight: 700; color: #0f172a;"><%# Eval("Name") %></div>
                                <div style="font-size: 0.8125rem; color: #64748b;"><%# Eval("Notes") %></div>
                            </div>
                            <span class="badge" style="background-color: #dcfce7; color: #166534; font-size: 0.8125rem; font-weight: 700;"><%# Eval("Yield") %></span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
