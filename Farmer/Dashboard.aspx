<%@ Page Title="Farmer Dashboard" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="KhedutPlus.Farmer.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .welcome-header {
        margin-bottom: 28px;
    }
    .welcome-title {
        font-size: 1.625rem;
        font-weight: 700;
        color: #0f172a;
    }
    .welcome-subtitle {
        color: #64748b;
        font-size: 0.875rem;
        margin-top: 4px;
    }
    .farmer-stats-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        margin-bottom: 36px;
    }
    .farmer-stat-card {
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 20px 24px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-shadow: 0 1px 3px rgba(0,0,0,0.02);
    }
    .farmer-stat-left {
        display: flex;
        align-items: center;
        gap: 16px;
    }
    .farmer-stat-icon {
        width: 48px;
        height: 48px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
    }
    .farmer-stat-title {
        font-size: 0.8125rem;
        color: #64748b;
        font-weight: 500;
        margin-bottom: 2px;
    }
    .farmer-stat-number {
        font-size: 1.75rem;
        font-weight: 700;
        color: #0f172a;
        line-height: 1.1;
    }
    .scheme-card {
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 24px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 16px;
        box-shadow: 0 1px 2px rgba(0,0,0,0.02);
    }
    .scheme-info {
        display: flex;
        align-items: center;
        gap: 20px;
    }
    .scheme-icon-box {
        width: 52px;
        height: 52px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    @media (max-width: 900px) {
        .farmer-stats-grid {
            grid-template-columns: 1fr;
        }
        .scheme-card {
            flex-direction: column;
            align-items: flex-start;
            gap: 16px;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Welcome Header -->
    <div class="welcome-header">
        <h1 class="welcome-title">Welcome back, Ramesh Patel!</h1>
        <p class="welcome-subtitle">Here's what's happening on your farm today.</p>
    </div>

    <!-- 6 Metric Cards -->
    <div class="farmer-stats-grid">
        <!-- 1. Total Saved Crops -->
        <div class="farmer-stat-card">
            <div class="farmer-stat-left">
                <div class="farmer-stat-icon" style="background-color: #ecfdf5; color: #166534;">🌾</div>
                <div>
                    <div class="farmer-stat-title">Total Saved Crops</div>
                    <div class="farmer-stat-number">12</div>
                </div>
            </div>
<%--            <a href="/Farmer/Saved.aspx" class="badge" style="background-color: #dcfce7; color: #15803d;">+2 new</a>--%>
        </div>

        <!-- 2. Active Schemes -->
        <div class="farmer-stat-card">
            <div class="farmer-stat-left">
                <div class="farmer-stat-icon" style="background-color: #fefce8; color: #ca8a04;">📜</div>
                <div>
                    <div class="farmer-stat-title">Active Schemes</div>
                    <div class="farmer-stat-number">04</div>
                </div>
            </div>
<%--            <a href="/Farmer/Schemes.aspx" class="badge" style="background-color: #fef9c3; color: #854d0e;">Update</a>--%>
        </div>

        <!-- 3. Nearby Stores -->
        <div class="farmer-stat-card">
            <div class="farmer-stat-left">
                <div class="farmer-stat-icon" style="background-color: #eff6ff; color: #2563eb;">🏪</div>
                <div>
                    <div class="farmer-stat-title">Nearby Stores</div>
                    <div class="farmer-stat-number">08</div>
                </div>
            </div>
<%--            <a href="/Farmer/AgroStores.aspx" class="badge" style="background-color: #dbeafe; color: #1e40af;">View</a>--%>
        </div>

        <!-- 4. My Crops -->
        <div class="farmer-stat-card">
            <div class="farmer-stat-left">
                <div class="farmer-stat-icon" style="background-color: #f0fdf4; color: #16a34a;">🌱</div>
                <div>
                    <div class="farmer-stat-title">My Crops</div>
                    <div class="farmer-stat-number">06</div>
                </div>
            </div>
<%--            <a href="/Farmer/Crops.aspx" class="badge" style="background-color: #dcfce7; color: #15803d;">Manage</a>--%>
        </div>

        <!-- 5. Fertilizers -->
        <div class="farmer-stat-card">
            <div class="farmer-stat-left">
                <div class="farmer-stat-icon" style="background-color: #fff7ed; color: #ea580c;">📦</div>
                <div>
                    <div class="farmer-stat-title">Fertilizers</div>
                    <div class="farmer-stat-number">15</div>
                </div>
            </div>
<%--            <a href="/Farmer/Fertilizers.aspx" class="badge" style="background-color: #ffedd5; color: #c2410c;">Check Stock</a>--%>
        </div>

        <!-- 6. Pesticides -->
        <div class="farmer-stat-card">
            <div class="farmer-stat-left">
                <div class="farmer-stat-icon" style="background-color: #fef2f2; color: #dc2626;">🧪</div>
                <div>
                    <div class="farmer-stat-title">Pesticides</div>
                    <div class="farmer-stat-number">03</div>
                </div>
            </div>
<%--            <a href="/Farmer/Pesticides.aspx" class="badge" style="background-color: #fee2e2; color: #b91c1c;">Alert</a>--%>
        </div>
    </div>

    <!-- Recommended Schemes Section -->
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
        <div>
            <h2 style="font-size: 1.25rem; font-weight: 700; color: #0f172a;">Recommended Schemes</h2>
            <p style="font-size: 0.8125rem; color: #64748b;">Government initiatives you qualify for</p>
        </div>
        <a href="/Farmer/Schemes.aspx" style="color: #166534; font-weight: 600; font-size: 0.875rem; display: flex; align-items: center; gap: 4px;">
            <span>See All Schemes</span>
            <span>&rarr;</span>
        </a>
    </div>

    <!-- Scheme 1: PM-Kisan Samman Nidhi -->
    <div class="scheme-card">
        <div class="scheme-info">
            <div class="scheme-icon-box" style="background-color: #fff7ed; color: #ea580c;">
                <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 21h18"></path><path d="M3 10h18"></path><path d="M5 6l7-3 7 3"></path><path d="M4 10v11"></path><path d="M20 10v11"></path><path d="M8 14v4"></path><path d="M12 14v4"></path><path d="M16 14v4"></path></svg>
            </div>
            <div>
                <h3 style="font-size: 1.0625rem; font-weight: 700; color: #0f172a; margin-bottom: 4px;">PM-Kisan Samman Nidhi</h3>
                <p style="font-size: 0.875rem; color: #64748b;">Direct benefit transfer of ₹6,000 per year to small and marginal farmers.</p>
            </div>
        </div>
        <div style="text-align: right;">
            <a href="/Farmer/Schemes.aspx" class="btn btn-sm" style="background-color: #dcfce7; color: #166534; border-radius: 8px; font-weight: 700;">APPLY NOW</a>
            <div style="font-size: 0.75rem; color: #94a3b8; margin-top: 6px;">Deadline: 30 Dec 2026</div>
        </div>
    </div>

    <!-- Scheme 2: Pradhan Mantri Fasal Bima Yojana -->
    <div class="scheme-card">
        <div class="scheme-info">
            <div class="scheme-icon-box" style="background-color: #eff6ff; color: #2563eb;">
                <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
            </div>
            <div>
                <h3 style="font-size: 1.0625rem; font-weight: 700; color: #0f172a; margin-bottom: 4px;">Pradhan Mantri Fasal Bima Yojana</h3>
                <p style="font-size: 0.875rem; color: #64748b;">Comprehensive crop insurance against non-preventable natural risks.</p>
            </div>
        </div>
        <div style="text-align: right;">
            <span class="badge" style="background-color: #f1f5f9; color: #475569; padding: 6px 14px; border-radius: 8px; font-weight: 700;">Apply now</span>
            <div style="font-size: 0.75rem; color: #94a3b8; margin-top: 6px;">Active until July 2026</div>
        </div>
    </div>
</asp:Content>
