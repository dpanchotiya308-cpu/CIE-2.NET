<%@ Page Title="About KhedutPlus" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="KhedutPlus.Admin.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .about-card {
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        padding: 28px 32px;
        margin-bottom: 24px;
    }
    .mission-card {
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-left: 5px solid #166534;
        border-radius: 0 12px 12px 0;
        padding: 24px 28px;
        margin-bottom: 24px;
    }
    .kpi-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        margin-bottom: 24px;
    }
    .kpi-card {
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        padding: 24px 20px;
        text-align: center;
    }
    .kpi-value {
        font-size: 2rem;
        font-weight: 700;
        color: #166534;
    }
    .kpi-label {
        font-size: 0.8125rem;
        color: #64748b;
        margin-top: 4px;
    }
    .feature-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        margin-bottom: 24px;
    }
    .feature-card {
        background: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        padding: 20px;
    }
    .feature-icon {
        font-size: 2rem;
        margin-bottom: 10px;
    }
    @media(max-width:900px) {
        .kpi-grid { grid-template-columns: repeat(2,1fr); }
        .feature-grid { grid-template-columns: 1fr; }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">About KhedutPlus</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Platform information, mission, and team details.</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="AdminContent" runat="server">

    <!-- Mission Statement -->
    <div class="mission-card">
        <h2 style="font-size: 1.125rem; font-weight: 700; color: #166534; margin-bottom: 10px;">🌿 Our Mission</h2>
        <p style="color: #334155; line-height: 1.7; font-size: 0.9375rem;">
            KhedutPlus is a unified digital agro-management platform designed to empower farmers, agro shop owners, and government bodies across Gujarat.
            Our mission is to bridge the information gap between farmers and agricultural resources — providing real-time crop data, disease solutions,
            government scheme access, and verified AgroShop network connectivity in one platform.
        </p>
    </div>

    <!-- Stats KPI Grid -->
    <h3 style="font-size: 0.875rem; font-weight: 700; text-transform: uppercase; color: #94a3b8; letter-spacing: 0.05em; margin-bottom: 16px;">PLATFORM STATISTICS</h3>
    <div class="kpi-grid">
        <div class="kpi-card">
            <div class="kpi-value">
                <asp:Label ID="lblFarmerCount" runat="server">0</asp:Label>
            </div>
            <div class="kpi-label">Total Farmers</div>
        </div>
        <div class="kpi-card">
            <div class="kpi-value">
                <asp:Label ID="lblShopCount" runat="server">0</asp:Label>
            </div>
            <div class="kpi-label">AgroShops</div>
        </div>
        <div class="kpi-card">
            <div class="kpi-value">
                <asp:Label ID="lblProductCount" runat="server">0</asp:Label>
            </div>
            <div class="kpi-label">Products Listed</div>
        </div>
        <div class="kpi-card">
            <div class="kpi-value">
                <asp:Label ID="lblSchemeCount" runat="server">0</asp:Label>
            </div>
            <div class="kpi-label">Active Schemes</div>
        </div>
    </div>

    <!-- Features -->
    <h3 style="font-size: 0.875rem; font-weight: 700; text-transform: uppercase; color: #94a3b8; letter-spacing: 0.05em; margin-bottom: 16px;">OUR FEATURES</h3>
    <div class="feature-grid">
        <div class="feature-card">
            <div class="feature-icon">🌾</div>
            <h4 style="font-weight: 700; color: #0f172a; margin-bottom: 8px;">Crop Information</h4>
            <p style="color: #64748b; font-size: 0.875rem; line-height: 1.6;">Detailed crop cultivation guides covering sowing season, water management, harvesting methods, and variety comparisons.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">🦠</div>
            <h4 style="font-weight: 700; color: #0f172a; margin-bottom: 8px;">Disease Solutions</h4>
            <p style="color: #64748b; font-size: 0.875rem; line-height: 1.6;">Comprehensive database of crop diseases, pests, fungal and viral infections with treatment protocols and prevention guidelines.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">🏛️</div>
            <h4 style="font-weight: 700; color: #0f172a; margin-bottom: 8px;">Government Schemes</h4>
            <p style="color: #64748b; font-size: 0.875rem; line-height: 1.6;">Access to all active farmer welfare schemes including PM-Kisan, PM-KUSUM, PMFBY, and Gujarat state subsidies with direct application portals.</p>
        </div>
    </div>

    <!-- Technology Stack -->
    <div class="about-card">
        <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">🛠 Technology Stack</h3>
        <ul style="list-style: disc; padding-left: 20px; color: #475569; font-size: 0.9rem; line-height: 2;">
            <li><strong>Frontend:</strong> ASP.NET Web Forms, HTML5, CSS3</li>
            <li><strong>Backend:</strong> C# (.NET Framework 4.8), ASP.NET</li>
            <li><strong>Data Layer:</strong> In-memory static DataStore (upgradeable to SQL Server)</li>
            <li><strong>Server:</strong> IIS Express (Development), IIS (Production)</li>
            <li><strong>Platform:</strong> Windows Server 2019 / Windows 10+</li>
        </ul>
    </div>

    <!-- Contact / Developer Info -->
    <div class="about-card">
        <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">📞 Developer &amp; Contact</h3>
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; font-size: 0.9rem; color: #475569;">
            <div>
                <div style="font-weight: 600; color: #0f172a; margin-bottom: 4px;">System Administrator</div>
                <div>Sanjay Patel</div>
                <div>sanjay.p@khedutplus.in</div>
                <div>+91 98765 00001</div>
            </div>
            <div>
                <div style="font-weight: 600; color: #0f172a; margin-bottom: 4px;">Organisation</div>
                <div>Department of Agriculture, Gujarat</div>
                <div>Gandhinagar, Gujarat — 382010</div>
                <div><a href="https://agri.gujarat.gov.in/" target="_blank" style="color:#166534;">agri.gujarat.gov.in</a></div>
            </div>
        </div>
    </div>

</asp:Content>
