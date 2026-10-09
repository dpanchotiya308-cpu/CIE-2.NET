<%@ Page Title="Pesticide Details & Safety Guide" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="PesticideDetails.aspx.cs" Inherits="KhedutPlus.Farmer.PesticideDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .pest-hero-banner {
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
    .pest-hero-img {
        max-height: 240px;
        width: auto;
        object-fit: contain;
    }
    .pest-status-floating {
        position: absolute;
        top: 20px;
        right: 20px;
        background-color: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(4px);
        padding: 8px 16px;
        border-radius: 9999px;
        font-size: 0.8125rem;
        font-weight: 600;
        color: #991b1b;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .pest-stats-strip {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 16px;
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 20px;
        margin-bottom: 28px;
    }
    .pest-stat-box {
        text-align: center;
        border-right: 1px solid #f1f5f9;
    }
    .pest-stat-box:last-child {
        border-right: none;
    }
    .pest-stat-lbl {
        font-size: 0.6875rem;
        font-weight: 700;
        text-transform: uppercase;
        color: #94a3b8;
        letter-spacing: 0.05em;
        margin-bottom: 4px;
    }
    .pest-stat-val {
        font-size: 1.125rem;
        font-weight: 700;
        color: #0f172a;
    }
    .pest-detail-grid {
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
        .pest-stats-strip {
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
        }
        .pest-detail-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Top Action Bar -->
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; flex-wrap: wrap; gap: 16px;">
        <div style="display: flex; align-items: center; gap: 12px;">
            <a href="/Farmer/Pesticides.aspx" style="color: #64748b; display: flex; align-items: center; font-size: 1.125rem; text-decoration: none;">&larr;</a>
            <h1 style="font-size: 1.5rem; font-weight: 700; color: #0f172a;"><%= CurrentPesticide != null ? CurrentPesticide.Name : "Pesticide Safety Guide" %></h1>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:Button ID="btnSaveGuide" runat="server" Text="Save Safety Guide" CssClass="btn btn-secondary" OnClick="btnSaveGuide_Click" />
        </div>
    </div>

    <!-- Breadcrumb -->
    <div style="font-size: 0.8125rem; color: #94a3b8; margin-bottom: 20px;">
        <a href="/Farmer/Pesticides.aspx" style="color: #64748b; text-decoration: none;">Pesticides</a> &gt; <span><%= CurrentPesticide != null ? CurrentPesticide.Name : "Safety Guide" %></span>
    </div>

    <!-- Alert Feedback -->
    <asp:Panel ID="pnlFeedback" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom: 20px;">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblFeedback" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Banner Image -->
    <div class="pest-hero-banner">
        <img src='<%= CurrentPesticide != null ? CurrentPesticide.ImageUrl : "/Images/pesticides/chlorpyrifos.jpg" %>' alt='<%= CurrentPesticide != null ? CurrentPesticide.Name : "Pesticide" %>' class="pest-hero-img" />
        <div class="pest-status-floating">
            <span>⚠️ Toxicity: <%= CurrentPesticide != null ? CurrentPesticide.ToxicityLevel : "Moderate" %></span>
        </div>
    </div>

    <!-- Title & Description -->
    <div style="margin-bottom: 24px;">
        <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 8px;">
            <span class="badge" style="background-color: #fee2e2; color: #991b1b; font-weight: 700;"><%= CurrentPesticide != null ? CurrentPesticide.ToxicityLevel : "Moderate Toxicity" %></span>
            <span class="badge" style="background-color: #f1f5f9; color: #475569; font-weight: 600;"><%= CurrentPesticide != null ? CurrentPesticide.Category : "Insecticide" %></span>
        </div>
        <h2 style="font-size: 1.75rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;"><%= CurrentPesticide != null ? CurrentPesticide.Name : "" %></h2>
        <p style="font-size: 0.9375rem; color: #64748b; line-height: 1.6; max-width: 900px;">
            <%= CurrentPesticide != null ? CurrentPesticide.Description : "" %>
        </p>
    </div>

    <!-- Stats Strip -->
    <div class="pest-stats-strip">
        <div class="pest-stat-box">
            <div class="pest-stat-lbl">Toxicity Rating</div>
            <div class="pest-stat-val" style="color: #b91c1c;"><%= CurrentPesticide != null ? CurrentPesticide.ToxicityLevel : "Moderate" %></div>
        </div>
        <div class="pest-stat-box">
            <div class="pest-stat-lbl">Chemical Type</div>
            <div class="pest-stat-val"><%= CurrentPesticide != null ? CurrentPesticide.Category : "Insecticide" %></div>
        </div>
        <div class="pest-stat-box">
            <div class="pest-stat-lbl">Target Pests</div>
            <div class="pest-stat-val"><%= CurrentPesticide != null ? CurrentPesticide.Targets : "Insects" %></div>
        </div>
        <div class="pest-stat-box">
            <div class="pest-stat-lbl">Pre-Harvest Interval</div>
            <div class="pest-stat-val">14 - 21 Days</div>
        </div>
    </div>

    <!-- 2 Column Details -->
    <div class="pest-detail-grid">
        <!-- Left Column -->
        <div>
            <!-- Target Pests & Recommended Dosage -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🎯</span>
                    <span>Target Pests & Dosage</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>🐛</span>
                        <span>Controlled Pests & Insects</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentPesticide != null ? CurrentPesticide.Targets : "Effective against termites, stem borers, aphids, cutworms, and soil insects." %>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>🧪</span>
                        <span>Application Dosage</span>
                    </div>
                    <div class="guide-item-text" style="color: #166534; font-weight: 600; background-color: #f0fdf4; padding: 12px; border-radius: 8px; border: 1px solid #bbf7d0;">
                        <%= CurrentPesticide != null ? CurrentPesticide.Dosage : "2.0 ml per liter of water (approx 400-500 ml/acre)." %>
                    </div>
                </div>
            </div>

            <!-- Application Method -->
            <div class="guide-card">
                <div class="guide-card-header">
                    <span>🚜</span>
                    <span>Application Technique</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>💨</span>
                        <span>Spraying Protocol</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentPesticide != null && !string.IsNullOrEmpty(CurrentPesticide.ApplicationMethod) ? CurrentPesticide.ApplicationMethod : "Foliar spray during early morning or late evening hours. Avoid spraying during high winds, hot midday sun, or when rain is expected within 4 hours." %>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title">
                        <span>🌾</span>
                        <span>Suitable Crops</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentPesticide != null && !string.IsNullOrEmpty(CurrentPesticide.SuitableCrops) ? CurrentPesticide.SuitableCrops : "Paddy, Cotton, Sugarcane, Pulses, Vegetables, and Commercial Crops." %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div>
            <!-- Safety Precautions & PPE -->
            <div class="guide-card" style="border-left: 4px solid #ef4444;">
                <div class="guide-card-header">
                    <span style="color: #ef4444;">🛡️</span>
                    <span style="color: #991b1b;">Safety Precautions & PPE</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title" style="color: #991b1b;">
                        <span>🧤</span>
                        <span>Protective Equipment Required</span>
                    </div>
                    <div class="guide-item-text">
                        <%= CurrentPesticide != null && !string.IsNullOrEmpty(CurrentPesticide.SafetyPrecautions) ? CurrentPesticide.SafetyPrecautions : "Wear full protective gloves, face mask, protective goggles, and long-sleeved clothing. Wash thoroughly with soap and water after handling." %>
                    </div>
                </div>
            </div>

            <!-- Antidote & First Aid -->
            <div class="guide-card" style="border-left: 4px solid #dc2626; background-color: #fef2f2;">
                <div class="guide-card-header" style="border-bottom-color: #fecaca;">
                    <span style="color: #dc2626;">🚨</span>
                    <span style="color: #991b1b;">Antidote & Emergency First Aid</span>
                </div>
                <div class="guide-item">
                    <div class="guide-item-title" style="color: #991b1b;">
                        <span>🏥</span>
                        <span>Emergency Measures</span>
                    </div>
                    <div class="guide-item-text" style="color: #7f1d1d; font-weight: 500;">
                        <%= CurrentPesticide != null && !string.IsNullOrEmpty(CurrentPesticide.AntidoteFirstAid) ? CurrentPesticide.AntidoteFirstAid : "If swallowed, induce vomiting immediately and seek medical attention. In case of contact with eyes or skin, rinse with clean water for at least 15 minutes. Specific Antidote: Atropine sulfate under physician guidance." %>
                    </div>
                </div>
<%--                <div class="guide-item" style="margin-top: 14px;">
                    <a href="/Farmer/AgroStores.aspx" class="btn btn-secondary w-full" style="text-align: center; display: block; font-weight: 600; text-decoration: none;">
                        🏬 Locate Authorized Pesticide Dealers &rarr;
                    </a>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
