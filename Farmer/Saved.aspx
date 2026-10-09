<%@ Page Title="Saved Information (સંગ્રહિત માહિતી)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="Saved.aspx.cs" Inherits="KhedutPlus.Farmer.Saved" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .saved-header {
        margin-bottom: 24px;
    }
    .saved-search-row {
        display: flex;
        gap: 12px;
        margin-bottom: 24px;
        max-width: 600px;
    }
    .saved-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 24px;
        margin-bottom: 36px;
    }
    .saved-card {
        background-color: #ffffff;
        border-radius: 14px;
        border: 1px solid #e2e8f0;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        box-shadow: 0 1px 3px rgba(0,0,0,0.02);
    }
    .saved-card-img-box {
        position: relative;
        height: 180px;
        background-color: #f1f5f9;
    }
    .saved-card-img-box img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .saved-card-badge {
        position: absolute;
        top: 12px;
        left: 12px;
        background-color: rgba(0,0,0,0.7);
        color: #ffffff;
        padding: 4px 10px;
        border-radius: 6px;
        font-size: 0.6875rem;
        font-weight: 700;
        letter-spacing: 0.05em;
    }
    .saved-bookmark-btn {
        position: absolute;
        top: 12px;
        right: 12px;
        width: 32px;
        height: 32px;
        border-radius: 50%;
        background-color: #ffffff;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #166534;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .saved-card-body {
        padding: 20px;
        display: flex;
        flex-direction: column;
        flex: 1;
    }
    .saved-card-title {
        font-size: 1.0625rem;
        font-weight: 700;
        color: #0f172a;
        margin-bottom: 8px;
        line-height: 1.35;
    }
    .saved-card-desc {
        font-size: 0.8125rem;
        color: #64748b;
        line-height: 1.5;
        margin-bottom: 16px;
        flex: 1;
    }
    .saved-card-footer {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding-top: 12px;
        border-top: 1px solid #f1f5f9;
        font-size: 0.8125rem;
    }
    .explore-dashed-card {
        border: 2px dashed #cbd5e1;
        border-radius: 14px;
        background-color: #f8fafc;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 40px 24px;
        text-align: center;
        min-height: 340px;
    }
    .storage-bar-card {
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 20px 24px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 16px;
    }
    .storage-stat-item {
        display: flex;
        flex-direction: column;
    }
    .storage-stat-label {
        font-size: 0.6875rem;
        font-weight: 700;
        text-transform: uppercase;
        color: #94a3b8;
        letter-spacing: 0.05em;
    }
    .storage-stat-value {
        font-size: 1.125rem;
        font-weight: 700;
        color: #0f172a;
    }
    @media (max-width: 900px) {
        .saved-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <div class="saved-header">
        <h1 class="page-title">Saved Information (સંગ્રહિત માહિતી)</h1>
        <p class="page-subtitle">Access your bookmarked guides, articles, and disease reports.</p>
    </div>

    <!-- Search Input -->
    <div class="saved-search-row">
        <asp:TextBox ID="txtSearchSaved" runat="server" CssClass="form-control" placeholder="Search in your saved information..."></asp:TextBox>
        <asp:Button ID="btnSearchSaved" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearchSaved_Click" />
    </div>

    <!-- Filter Tabs -->
    <div class="filter-tabs">
        <asp:LinkButton ID="btnTabAll" runat="server" CssClass="filter-tab active" OnClick="FilterSaved_Click" CommandArgument="All">All Items</asp:LinkButton>
        <asp:LinkButton ID="btnTabCrops" runat="server" CssClass="filter-tab" OnClick="FilterSaved_Click" CommandArgument="Crops">My Crops</asp:LinkButton>
        <asp:LinkButton ID="btnTabArticles" runat="server" CssClass="filter-tab" OnClick="FilterSaved_Click" CommandArgument="Articles">Articles</asp:LinkButton>
        <asp:LinkButton ID="btnTabGuides" runat="server" CssClass="filter-tab" OnClick="FilterSaved_Click" CommandArgument="Guides">Guides</asp:LinkButton>
        <asp:LinkButton ID="btnTabDisease" runat="server" CssClass="filter-tab" OnClick="FilterSaved_Click" CommandArgument="Disease Info">Disease Info</asp:LinkButton>
    </div>

    <!-- Saved Cards Grid -->
    <div class="saved-grid">
        <asp:Repeater ID="rptSavedItems" runat="server">
            <ItemTemplate>
                <div class="saved-card">
                    <div class="saved-card-img-box">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' />
                        <span class="saved-card-badge"><%# Eval("Badge") %></span>
                        <div class="saved-bookmark-btn">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path></svg>
                        </div>
                    </div>
                    <div class="saved-card-body">
                        <h3 class="saved-card-title"><%# Eval("Title") %></h3>
                        <p class="saved-card-desc"><%# Eval("Description") %></p>
                        <div class="saved-card-footer">
                            <span style="color: #94a3b8;"><%# Eval("SavedAgo") %></span>
<%--                            <a href="#" style="color: #166534; font-weight: 600;">Read Now &rarr;</a>--%>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <!-- Explore More dashed card -->
        <div class="explore-dashed-card">
            <div style="width: 48px; height: 48px; border-radius: 50%; background-color: #f1f5f9; display: flex; align-items: center; justify-content: center; font-size: 1.5rem; color: #64748b; margin-bottom: 16px;">
                +
            </div>
            <h4 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;">Explore More</h4>
            <p style="font-size: 0.875rem; color: #64748b; margin-bottom: 20px; max-width: 240px;">Discover more farming guides to save here.</p>
            <a href="/Farmer/Crops.aspx" class="btn btn-secondary" style="border-radius: 8px;">Browse Resources</a>
        </div>
    </div>

    <!-- Bottom Storage Status Bar -->
<%--    <div class="storage-bar-card">
        <div style="display: flex; gap: 40px; flex-wrap: wrap;">
            <div class="storage-stat-item">
                <span class="storage-stat-label">TOTAL SAVED</span>
                <span class="storage-stat-value"><%= KhedutPlus.Models.DataStore.SavedItems.Count %> Items</span>
            </div>
            <div class="storage-stat-item">
                <span class="storage-stat-label">SPACE USED</span>
                <span class="storage-stat-value">1.2 MB</span>
            </div>
            <div class="storage-stat-item">
                <span class="storage-stat-label">LAST UPDATED</span>
                <span class="storage-stat-value">Today, 10:45 AM</span>
            </div>
        </div>

        <div>
            <button type="button" class="btn btn-secondary" style="display: flex; align-items: center; gap: 8px;">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>
                <span>Download Offline</span>
            </button>
        </div>
    </div>--%>
</asp:Content>
