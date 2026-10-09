<%@ Page Title="Fertilizer Usage Guide" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="FertilizerDetails.aspx.cs" Inherits="KhedutPlus.Farmer.FertilizerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .fert-hero-banner {
        position: relative;
        width: 100%;
        height: 300px;
        border-radius: 16px;
        overflow: hidden;
        margin-bottom: 24px;
        box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
        background-color: #f8fafc;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 24px;
    }
    .fert-hero-img {
        max-height: 240px;
        width: auto;
        object-fit: contain;
    }
    .fert-status-floating {
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
    .fert-stats-strip {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 16px;
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 20px;
        margin-bottom: 28px;
    }
    .fert-stat-box {
        text-align: center;
        border-right: 1px solid #f1f5f9;
    }
    .fert-stat-box:last-child {
        border-right: none;
    }
    .fert-stat-lbl {
        font-size: 0.6875rem;
        font-weight: 700;
        text-transform: uppercase;
        color: #94a3b8;
        letter-spacing: 0.05em;
        margin-bottom: 4px;
    }
    .fert-stat-val {
        font-size: 1.125rem;
        font-weight: 700;
        color: #0f172a;
    }
    .fert-detail-grid {
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
        margin-bottom: 6px;
        display: flex;
        align-items: center;
        gap: 8px;
    }
    .guide-item-text {
        font-size: 0.875rem;
        color: #64748b;
        line-height: 1.6;
    }
    @media (max-width: 900px) {
        .fert-stats-strip {
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
        }
        .fert-detail-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Top Action Bar -->
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; flex-wrap: wrap; gap: 16px;">
        <div style="display: flex; align-items: center; gap: 12px;">
            <a href="/Farmer/Fertilizers.aspx" style="color: #64748b; display: flex; align-items: center; font-size: 1.125rem; text-decoration: none;">&larr;</a>
            <h1 style="font-size: 1.5rem; font-weight: 700; color: #0f172a;"><%= CurrentFertilizer != null ? CurrentFertilizer.Name : "Fertilizer Guide" %></h1>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:Button ID="btnSaveGuide" runat="server" Text="Save Usage Guide" CssClass="btn btn-secondary" OnClick="btnSaveGuide_Click" />
        </div>
    </div>

    <!-- Breadcrumb -->
    <div style="font-size: 0.8125rem; color: #94a3b8; margin-bottom: 20px;">
        <a href="/Farmer/Fertilizers.aspx" style="color: #64748b; text-decoration: none;">Fertilizers</a> &gt; <span><%= CurrentFertilizer != null ? CurrentFertilizer.Name : "Usage Guide" %></span>
    </div>

    <!-- Alert Feedback -->
    <asp:Panel ID="pnlFeedback" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom: 20px;">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblFeedback" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Banner Image -->
    <div class="fert-hero-banner">
        <img src='<%= CurrentFertilizer != null ? CurrentFertilizer.ImageUrl : "/Images/fertilizers/urea.jpg" %>' alt='<%= CurrentFertilizer != null ? CurrentFertilizer.Name : "Fertilizer" %>' class="fert-hero-img" />
        <div class="fert-status-floating">
            <span>● Status: Available in Stock</span>
        </div>
    </div>

    <!-- Title & Description -->
    <div style="margin-bottom: 24px;">
        <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 8px;">
            <span class="badge" style="background-color: #dcfce7; color: #166534; font-weight: 700;"><%= CurrentFertilizer != null ? CurrentFertilizer.Category : "Fertilizer" %></span>
            <span class="badge" style="background-color: #f1f5f9; color: #475569; font-weight: 600;">Price: <%= CurrentFertilizer != null ? ("₹" + CurrentFertilizer.Price.ToString("F2")) : "Standard Subsidy Rate" %></span>
        </div>
        <h2 style="font-size: 1.75rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;"><%= CurrentFertilizer != null ? CurrentFertilizer.Name : "" %></h2>
        <p style="font-size: 0.9375rem; color: #64748b; line-height: 1.6; max-width: 900px;">
            <%= CurrentFertilizer != null ? CurrentFertilizer.Description : "" %>
        </p>
    </div>

    <!-- Stats Strip -->
    <div class="fert-stats-strip">
        <div class="fert-stat-box">
            <div class="fert-stat-lbl">Composition</div>
            <div class="fert-stat-val"><%= CurrentFertilizer != null ? CurrentFertilizer.KeyFeature1 : "Standard NPK" %></div>
        </div>
        <div class="fert-stat-box">
            <div class="fert-stat-lbl">Category</div>
            <div class="fert-stat-val"><%= CurrentFertilizer != null ? CurrentFertilizer.Category : "Granular" %></div>
        </div>
        <div class="fert-stat-box">
            <div class="fert-stat-lbl">Est. Price</div>
            <div class="fert-stat-val"><%= CurrentFertilizer != null ? ("₹" + CurrentFertilizer.Price.ToString("F2")) : "₹266 / Bag" %></div>
        </div>
        <div class="fert-stat-box">
            <div class="fert-stat-lbl">Soil Compatibility</div>
            <div class="fert-stat-val">All Soil Types</div>
        </div>
    </div>

    <!-- 2 Column Details -->
    <div class="fert-detail-grid">
        <!-- Left Column -->
        <div>
            <!-- Key Features & Nutrient Profile -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🌾</span>
                    <span>Key Features & Profile</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>⚡</span>
                        <span>Primary Benefit</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentFertilizer != null ? CurrentFertilizer.KeyFeature1 : "Provides high concentration of active nutrients for foliage expansion." %>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>💧</span>
                        <span>Secondary Feature</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentFertilizer != null ? CurrentFertilizer.KeyFeature2 : "Quick release formulation ideal for critical growth phases." %>
                    </div>
                </div>
            </div>

            <!-- Application Method & Dosage -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🧪</span>
                    <span>Dosage & Application Protocol</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>⚖️</span>
                        <span>Recommended Dosage</span>
                    </div>
                    <div class="guide-item-text" style="color: #166534; font-weight: 600; background-color: #f0fdf4; padding: 12px; border-radius: 8px; border: 1px solid #bbf7d0;">
                        <%= CurrentFertilizer != null && !string.IsNullOrEmpty(CurrentFertilizer.RecommendedDosage) ? CurrentFertilizer.RecommendedDosage : "Apply 45-50 kg per acre in split doses (Basal + Top dressing at 30 & 60 DAS)." %>
                    </div>
                </div>
                <div class="guide-item" style="margin-top: 14px;">
                    <div class="guide-item-title">
                        <span>🚜</span>
                        <span>Application Technique</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentFertilizer != null && !string.IsNullOrEmpty(CurrentFertilizer.ApplicationMethod) ? CurrentFertilizer.ApplicationMethod : "Broadcast evenly near root zones before irrigation or incorporate into soil during land preparation." %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div>
            <!-- Suitable Crops -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🌱</span>
                    <span>Suitable Crops</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>🌾</span>
                        <span>Compatible Crops</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentFertilizer != null && !string.IsNullOrEmpty(CurrentFertilizer.SuitableCrops) ? CurrentFertilizer.SuitableCrops : "Wheat, Paddy, Maize, Sugarcane, Cotton, Mustard, Vegetables and Fruit Crops." %>
                    </div>
                </div>
            </div>

            <!-- Safety & Storage Tips -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🛡️</span>
                    <span>Safety & Storage Guidelines</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>🔒</span>
                        <span>Storage Instructions</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentFertilizer != null && !string.IsNullOrEmpty(CurrentFertilizer.SafetyTips) ? CurrentFertilizer.SafetyTips : "Store in a cool, dry place away from direct moisture and humidity. Wear gloves and protective eyewear during field application." %>
                    </div>
                </div>
<%--                <div class="guide-item" style="margin-top: 14px;">
                    <a href="/Farmer/AgroStores.aspx" class="btn btn-primary w-full" style="text-align: center; display: block; font-weight: 600; text-decoration: none;">
                        🏬 Locate Fertilizer Dealers near you &rarr;
                    </a>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
