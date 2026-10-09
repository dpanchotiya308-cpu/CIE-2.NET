<%@ Page Title="About Us" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="KhedutPlus.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .about-portal-header {
        background: linear-gradient(135deg, #f0fdf4 0%, #ecfdf5 100%);
        border: 1px solid #bbf7d0;
        border-radius: 16px;
        padding: 32px 28px;
        margin-bottom: 28px;
        position: relative;
        overflow: hidden;
    }
    .about-portal-header::after {
        content: "🌱";
        position: absolute;
        right: 24px;
        bottom: 10px;
        font-size: 5rem;
        opacity: 0.15;
    }
    .portal-role-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 24px;
        margin-bottom: 32px;
    }
    .portal-role-card {
        background-color: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 16px;
        padding: 28px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.02);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        transition: transform 0.2s, box-shadow 0.2s;
    }
    .portal-role-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 16px -4px rgba(0,0,0,0.06);
    }
    .role-icon-box {
        width: 50px;
        height: 50px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.6rem;
        margin-bottom: 16px;
    }
    .stats-strip {
        background: linear-gradient(135deg, #14532d 0%, #166534 100%);
        color: #ffffff;
        border-radius: 16px;
        padding: 32px 24px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        text-align: center;
        margin-bottom: 32px;
        box-shadow: 0 4px 12px rgba(22, 101, 52, 0.15);
    }
    .stat-number {
        font-size: 2rem;
        font-weight: 800;
        color: #86efac;
        margin-bottom: 4px;
    }
    .stat-label {
        font-size: 0.8125rem;
        color: #cbd5e1;
        font-weight: 500;
    }
    .values-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        margin-bottom: 32px;
    }
    .value-card {
        background-color: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 14px;
        padding: 24px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.02);
    }
    @media (max-width: 900px) {
        .portal-role-grid { grid-template-columns: 1fr; }
        .stats-strip { grid-template-columns: repeat(2, 1fr); }
        .values-grid { grid-template-columns: 1fr; }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Header Banner in Dashboard Style -->
    <div class="about-portal-header">
        <span class="badge" style="background-color: #dcfce7; color: #166534; font-weight: 700; margin-bottom: 12px; display: inline-block;">
            🌱 ABOUT KHEDUTPLUS • ખેડૂત પ્લસ પરિચય
        </span>
        <h1 style="font-size: 1.85rem; font-weight: 800; color: #0f172a; margin-bottom: 10px;">
            Empowering Farmers &amp; Agro Retailers Across Gujarat
        </h1>
        <p style="color: #475569; font-size: 0.9375rem; line-height: 1.6; max-width: 820px; margin: 0 0 16px 0;">
            KhedutPlus is an all-in-one agricultural technology platform designed to bridge the gap between farmers needing scientifically-backed crop solutions and certified local agro stores offering authentic fertilizers, seeds, and farm supplies.
        </p>
        <div style="display: flex; gap: 12px; flex-wrap: wrap;">
            <a href="/Contact.aspx" class="btn btn-primary" style="background-color: #166534; padding: 9px 20px; font-weight: 600; font-size: 0.875rem;">Contact Support / સંપર્ક કરો</a>
            <a href="/Farmer/Dashboard.aspx" class="btn btn-secondary" style="padding: 9px 20px; font-weight: 600; font-size: 0.875rem;">Go to Dashboard</a>
        </div>
    </div>

    <!-- Dual Role Portals Gateway -->
    <div class="portal-role-grid">
        <!-- Farmer Gateway -->
        <div class="portal-role-card" style="border-top: 4px solid #16a34a;">
            <div>
                <div class="role-icon-box" style="background-color: #dcfce7; color: #166534;">🌾</div>
                <h2 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;">For Farmers (ખેડૂતો માટે)</h2>
                <p style="color: #64748b; font-size: 0.875rem; line-height: 1.6; margin-bottom: 16px;">
                    Access seasonal crop advisories, diagnose leaf and stem diseases with tailored remedies, check verified government subsidies, and find registered agro supply shops in your district.
                </p>
                <ul style="color: #334155; font-size: 0.8125rem; line-height: 1.8; margin-bottom: 20px; padding-left: 20px;">
                    <li>Crop disease diagnostic guides &amp; dosage calculators</li>
                    <li>Certified local agro store directory with contact numbers</li>
                    <li>Direct link to PM-Kisan, solar pump, and state subsidy schemes</li>
                    <li>Bookmark and save your preferred crop advisory</li>
                </ul>
            </div>
            <div>
                <a href="/Farmer/Dashboard.aspx" class="btn btn-primary" style="background-color: #166534; width: 100%; text-align: center; display: block; text-decoration: none; font-weight: 600; font-size: 0.875rem; padding: 10px;">
                    Open Farmer Portal &rarr;
                </a>
            </div>
        </div>

        <!-- Agro Store Gateway -->
        <div class="portal-role-card" style="border-top: 4px solid #0284c7;">
            <div>
                <div class="role-icon-box" style="background-color: #e0f2fe; color: #0284c7;">🏪</div>
                <h2 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;">For AgroStore Owners (એગ્રો વેપારીઓ માટે)</h2>
                <p style="color: #64748b; font-size: 0.875rem; line-height: 1.6; margin-bottom: 16px;">
                    Manage your agro-input inventory, log warehouse stock replenishment, maintain transparent customer farmer records, and process orders smoothly with zero complex software.
                </p>
                <ul style="color: #334155; font-size: 0.8125rem; line-height: 1.8; margin-bottom: 20px; padding-left: 20px;">
                    <li>Real-time inventory and SKU level stock tracking</li>
                    <li>Stock movement logs (Restock, Sales, Adjustments)</li>
                    <li>Customer records &amp; purchasing history management</li>
                    <li>Fulfillment status: Pending, Delivered, or Cancelled</li>
                </ul>
            </div>
            <div>
                <a href="/Shop/Dashboard.aspx" class="btn btn-primary" style="background-color: #0284c7; width: 100%; text-align: center; display: block; text-decoration: none; font-weight: 600; font-size: 0.875rem; padding: 10px;">
                    Open AgroShop Portal &rarr;
                </a>
            </div>
        </div>
    </div>

    <!-- Stats Strip -->
    <div class="stats-strip">
        <div>
            <div class="stat-number">10,000+</div>
            <div class="stat-label">Active Farmers Supported</div>
        </div>
        <div>
            <div class="stat-number">250+</div>
            <div class="stat-label">Certified Agro Stores</div>
        </div>
        <div>
            <div class="stat-number">45+</div>
            <div class="stat-label">Crop Disease Guides</div>
        </div>
        <div>
            <div class="stat-number">100%</div>
            <div class="stat-label">Verified Subsidy Information</div>
        </div>
    </div>

    <!-- Core Commitments Section -->
    <div style="margin-bottom: 16px;">
        <h2 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 4px;">Our Core Commitments</h2>
        <p style="color: #64748b; font-size: 0.875rem; margin-bottom: 18px;">Dedicated to making agriculture smarter, more profitable, and sustainable for every Indian grower.</p>
    </div>

    <div class="values-grid">
        <div class="value-card">
            <div style="font-size: 1.5rem; margin-bottom: 10px;">🔬</div>
            <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;">Scientifically Verified Advice</h3>
            <p style="color: #64748b; font-size: 0.8125rem; line-height: 1.6; margin: 0;">
                All disease diagnostics and dosage recommendations conform to the Indian Council of Agricultural Research (ICAR) and state agriculture university protocols.
            </p>
        </div>

        <div class="value-card">
            <div style="font-size: 1.5rem; margin-bottom: 10px;">🛡️</div>
            <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;">Genuine Agro Inputs Only</h3>
            <p style="color: #64748b; font-size: 0.8125rem; line-height: 1.6; margin: 0;">
                We connect farmers strictly with registered and certified dealers to protect against spurious fertilizers, seeds, or adulterated pesticides.
            </p>
        </div>

        <div class="value-card">
            <div style="font-size: 1.5rem; margin-bottom: 10px;">🇮🇳</div>
            <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;">Bilingual &amp; Rural-First</h3>
            <p style="color: #64748b; font-size: 0.8125rem; line-height: 1.6; margin: 0;">
                Built with clean Gujarati and English typography, fast page loading on rural mobile connections, and zero unnecessary complexity.
            </p>
        </div>
    </div>

    <!-- Helpline Strip -->
    <div class="card" style="background-color: #f8fafc; border: 1px solid #e2e8f0; padding: 24px 28px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px;">
        <div>
            <h3 style="font-size: 1.1rem; font-weight: 700; color: #0f172a; margin-bottom: 4px;">Have questions or want to partner with us?</h3>
            <p style="color: #64748b; font-size: 0.8125rem; margin: 0;">Our agricultural helpline team is stationed at Rajkot, Gujarat to assist you.</p>
        </div>
        <div style="display: flex; gap: 10px;">
            <a href="/Contact.aspx" class="btn btn-primary" style="background-color: #166534; font-weight: 600; padding: 9px 20px; font-size: 0.875rem;">Contact Team</a>
            <a href="tel:+919601104603" class="btn btn-secondary" style="font-weight: 600; padding: 9px 20px; font-size: 0.875rem;">📞 +91 96011 04603</a>
        </div>
    </div>
</asp:Content>
