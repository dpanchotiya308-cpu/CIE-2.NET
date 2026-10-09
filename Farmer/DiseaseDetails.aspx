<%@ Page Title="Disease Solution Details" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="DiseaseDetails.aspx.cs" Inherits="KhedutPlus.Farmer.DiseaseDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .disease-hero-banner {
        position: relative;
        width: 100%;
        height: 320px;
        border-radius: 16px;
        overflow: hidden;
        margin-bottom: 24px;
        box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
        background-color: #f1f5f9;
    }
    .disease-hero-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .disease-status-floating {
        position: absolute;
        top: 20px;
        right: 20px;
        background-color: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(4px);
        padding: 8px 16px;
        border-radius: 9999px;
        font-size: 0.8125rem;
        font-weight: 600;
        color: #b91c1c;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .disease-stats-strip {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 16px;
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 20px;
        margin-bottom: 28px;
    }
    .disease-stat-box {
        text-align: center;
        border-right: 1px solid #f1f5f9;
    }
    .disease-stat-box:last-child {
        border-right: none;
    }
    .disease-stat-lbl {
        font-size: 0.6875rem;
        font-weight: 700;
        text-transform: uppercase;
        color: #94a3b8;
        letter-spacing: 0.05em;
        margin-bottom: 4px;
    }
    .disease-stat-val {
        font-size: 1.125rem;
        font-weight: 700;
        color: #0f172a;
    }
    .disease-detail-grid {
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
        .disease-stats-strip {
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
        }
        .disease-detail-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Top Action Bar -->
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; flex-wrap: wrap; gap: 16px;">
        <div style="display: flex; align-items: center; gap: 12px;">
            <a href="/Farmer/DiseaseSolutions.aspx" style="color: #64748b; display: flex; align-items: center; font-size: 1.125rem; text-decoration: none;">&larr;</a>
            <h1 style="font-size: 1.5rem; font-weight: 700; color: #0f172a;"><%= CurrentDisease != null ? CurrentDisease.Name : "Disease Solution" %></h1>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:Button ID="btnSaveGuide" runat="server" Text="Save to My Guides" CssClass="btn btn-secondary" OnClick="btnSaveGuide_Click" />
        </div>
    </div>

    <!-- Breadcrumb -->
    <div style="font-size: 0.8125rem; color: #94a3b8; margin-bottom: 20px;">
        <a href="/Farmer/DiseaseSolutions.aspx" style="color: #64748b; text-decoration: none;">Disease Solutions</a> &gt; <span><%= CurrentDisease != null ? CurrentDisease.Name : "Treatment Guide" %></span>
    </div>

    <!-- Alert Feedback -->
    <asp:Panel ID="pnlFeedback" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom: 20px;">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblFeedback" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Banner Image -->
    <div class="disease-hero-banner">
        <img src='<%= CurrentDisease != null ? CurrentDisease.ImageUrl : "/Images/diseases/paddy_blast.jpg" %>' alt='<%= CurrentDisease != null ? CurrentDisease.Name : "Disease" %>' class="disease-hero-img" />
        <div class="disease-status-floating">
            <span>● Severity: <%= CurrentDisease != null && !string.IsNullOrEmpty(CurrentDisease.Severity) ? CurrentDisease.Severity : "High Priority" %></span>
        </div>
    </div>

    <!-- Title & Description -->
    <div style="margin-bottom: 24px;">
        <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 8px;">
            <span class="badge" style="background-color: #fee2e2; color: #991b1b; font-weight: 700;"><%= CurrentDisease != null ? CurrentDisease.Category : "Fungal" %></span>
            <span class="badge" style="background-color: #f1f5f9; color: #475569; font-weight: 600;">Target: <%= CurrentDisease != null ? CurrentDisease.AffectsCrop : "Crops" %></span>
        </div>
        <h2 style="font-size: 1.75rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;"><%= CurrentDisease != null ? CurrentDisease.Name : "" %></h2>
        <p style="font-size: 0.9375rem; color: #64748b; line-height: 1.6; max-width: 900px;">
            <%= CurrentDisease != null ? CurrentDisease.Description : "" %>
        </p>
    </div>

    <!-- Stats Strip -->
    <div class="disease-stats-strip">
        <div class="disease-stat-box">
            <div class="disease-stat-lbl">Category</div>
            <div class="disease-stat-val"><%= CurrentDisease != null ? CurrentDisease.Category : "Fungal" %></div>
        </div>
        <div class="disease-stat-box">
            <div class="disease-stat-lbl">Affected Crop</div>
            <div class="disease-stat-val"><%= CurrentDisease != null ? CurrentDisease.AffectsCrop : "Multiple" %></div>
        </div>
        <div class="disease-stat-box">
            <div class="disease-stat-lbl">Severity Level</div>
            <div class="disease-stat-val"><%= CurrentDisease != null && !string.IsNullOrEmpty(CurrentDisease.Severity) ? CurrentDisease.Severity : "Moderate - High" %></div>
        </div>
        <div class="disease-stat-box">
            <div class="disease-stat-lbl">Treatment Type</div>
            <div class="disease-stat-val">Fungicide & Bio</div>
        </div>
    </div>

    <!-- 2 Column Details -->
    <div class="disease-detail-grid">
        <!-- Left Column -->
        <div>
            <!-- Symptoms & Identification -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🔬</span>
                    <span>Symptoms & Identification</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>🔍</span>
                        <span>Key Symptoms</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentDisease != null ? CurrentDisease.Symptom : "Spindle-shaped lesions on leaves with grayish centers and dark reddish margins." %>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>🌡️</span>
                        <span>Favorable Conditions</span>
                    </div>
                    <div class="guide-item-text">
                        High relative humidity (>90%), leaf wetness, cool night temperatures (20-25°C), and excessive nitrogenous fertilizer application.
                    </div>
                </div>
            </div>

            <!-- Chemical & Organic Treatment -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>💊</span>
                    <span>Recommended Treatment Guide</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>🧪</span>
                        <span>Chemical Spray Protocol</span>
                    </div>
                    <div class="guide-item-text" style="color: #166534; font-weight: 600; background-color: #f0fdf4; padding: 12px; border-radius: 8px; border: 1px solid #bbf7d0;">
                        <%= CurrentDisease != null && !string.IsNullOrEmpty(CurrentDisease.Treatment) ? CurrentDisease.Treatment : "Spray Tricyclazole 75% WP @ 0.6 g/L or Isoprothiolane 40% EC @ 1.5 ml/L of water at initial appearance of symptoms." %>
                    </div>
                </div>
                <div class="guide-item" style="margin-top: 14px;">
                    <div class="guide-item-title">
                        <span>🌿</span>
                        <span>Organic / Biological Control</span>
                    </div>
                    <div class="guide-item-text">
                        Foliar spray of Pseudomonas fluorescens @ 10 g/L or Trichoderma viride @ 5 g/L of water at 15-day intervals during cloud cover.
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div>
            <!-- Prevention & Cultural Control -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🛡️</span>
                    <span>Prevention & Management</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>🌱</span>
                        <span>Preventive Measures</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentDisease != null && !string.IsNullOrEmpty(CurrentDisease.Prevention) ? CurrentDisease.Prevention : "Use certified disease-resistant seed varieties. Avoid excessive nitrogen applications and practice crop rotation with non-host legumes." %>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>💧</span>
                        <span>Water & Field Hygiene</span>
                    </div>
                    <div class="guide-item-text">
                        Maintain proper water depth, avoid prolonged flooding or severe drought stress, and clear infected stubble post-harvest.
                    </div>
                </div>
            </div>

            <!-- Recommended Products -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🛒</span>
                    <span>Recommended Products & Stores</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>📦</span>
                        <span>Commercial Formulations</span>
                    </div>
                    <div class="guide-item-text" style="margin-bottom: 12px;">
                        <%= CurrentDisease != null && !string.IsNullOrEmpty(CurrentDisease.RecommendedProducts) ? CurrentDisease.RecommendedProducts : "Tricyclazole 75% WP, Carbendazim 50% WP, Azoxystrobin 23% SC" %>
                    </div>
<%--                    <a href="/Farmer/AgroStores.aspx" class="btn btn-secondary" style="font-size: 0.8125rem; font-weight: 600; text-decoration: none; display: inline-block;">
                        🏬 Find Nearby Agro Stores &rarr;
                    </a>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
