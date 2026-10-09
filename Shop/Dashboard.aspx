<%@ Page Title="Store Overview" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="KhedutPlus.Shop.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .overview-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 28px;
        flex-wrap: wrap;
        gap: 16px;
    }
    .kpi-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        margin-bottom: 32px;
    }
    .kpi-card {
        background-color: #ffffff;
        border-radius: 14px;
        border: 1px solid #e2e8f0;
        padding: 24px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        box-shadow: 0 1px 3px rgba(0,0,0,0.02);
    }
    .kpi-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 12px;
    }
    .kpi-title {
        font-size: 0.8125rem;
        color: #64748b;
        font-weight: 500;
    }
    .kpi-value {
        font-size: 1.875rem;
        font-weight: 800;
        color: #0f172a;
        line-height: 1.1;
    }
    .customer-cell {
        display: flex;
        align-items: center;
        gap: 12px;
    }
    .customer-avatar {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        object-fit: cover;
    }
    @media (max-width: 1024px) {
        .kpi-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }
    @media (max-width: 640px) {
        .kpi-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Header -->
    <div class="overview-header">
        <div>
            <h1 class="page-title">Store Overview</h1>
            <p class="page-subtitle">Welcome back, Rajesh patel. Here's what's happening with your farm today.</p>
        </div>

<%--        <div style="display: flex; align-items: center; gap: 12px;">
            <button type="button" class="btn btn-secondary btn-sm" style="border-radius: 8px; height: 38px;">
                <span>📅 Last 30 Days</span>
            </button>
            <asp:Button ID="btnExportReport" runat="server" Text="Export Report" CssClass="btn btn-primary btn-sm" style="border-radius: 8px; height: 38px; background-color: #166534;" OnClick="btnExportReport_Click" />
        </div>--%>
    </div>

    <!-- Alert -->
    <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblAlert" runat="server"></asp:Label>
    </asp:Panel>

    <!-- 4 KPI Cards -->
    <div class="kpi-grid">
        <!-- 1. Total Sales -->
        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Total Sales</span>
<%--                <span class="badge" style="background-color: #ecfdf5; color: #10b981;">+12.5%</span>--%>
            </div>
            <div class="kpi-value">42,850.00</div>
        </div>

        <!-- 2. Total Orders -->
        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Total Orders</span>
                <!--<span class="badge" style="background-color: #eff6ff; color: #3b82f6;">+8.2%</span>-->
            </div>
            <div class="kpi-value">1,248</div>
        </div>

        <!-- 3. New Customers -->
        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">New Customers</span>
                <!--<span class="badge" style="background-color: #faf5ff; color: #a855f7;">+4.1%</span>-->
            </div>
            <div class="kpi-value">312</div>
        </div>

        <!-- 4. Low Stock Alerts -->
        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Low Stock Alerts</span>
<%--                <span class="badge" style="background-color: #fff1f2; color: #e11d48;">High Priority</span>--%>
            </div>
            <div class="kpi-value" style="color: #0f172a;">12 Items</div>
        </div>
    </div>

    <!-- Recent Orders Section -->
    <div class="card" style="padding: 24px;">
        <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
            <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a;">Recent Orders</h2>
            <a href="/Shop/Orders.aspx" style="color: #64748b; font-size: 0.875rem; font-weight: 600;">Manage Orders</a>
        </div>

        <div class="table-container" style="box-shadow: none; border: none;">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ORDER ID</th>
                        <th>CUSTOMER</th>
                        <th>DATE</th>
                        <th>AMOUNT</th>
                        <th>STATUS</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="font-weight: 600; color: #0f172a;">#ORD-94210</td>
                        <td>
                            <div class="customer-cell">
                                <img src="/Images/avatars/anjali_sharma.jpg" alt="Anjali" class="customer-avatar" />
                                <span style="font-weight: 600;">Anjali Sharma</span>
                            </div>
                        </td>
                        <td style="color: #64748b;">Oct 24, 2023</td>
                        <td style="font-weight: 600;">84.20</td>
                        <td><span class="badge badge-gray" style="font-size: 0.6875rem;">DELIVERED</span></td>
                        <td style="color: #94a3b8; font-size: 1.25rem; cursor: pointer;">&hellip;</td>
                    </tr>
                    <tr>
                        <td style="font-weight: 600; color: #0f172a;">#ORD-94211</td>
                        <td>
                            <div class="customer-cell">
                                <img src="/Images/avatars/vikram_singh_shop.jpg" alt="Vikram" class="customer-avatar" />
                                <span style="font-weight: 600;">Vikram Singh</span>
                            </div>
                        </td>
                        <td style="color: #64748b;">Oct 24, 2023</td>
                        <td style="font-weight: 600;">126.50</td>
                        <td><span class="badge badge-gray" style="font-size: 0.6875rem;">PROCESSING</span></td>
                        <td style="color: #94a3b8; font-size: 1.25rem; cursor: pointer;">&hellip;</td>
                    </tr>
                    <tr>
                        <td style="font-weight: 600; color: #0f172a;">#ORD-94212</td>
                        <td>
                            <div class="customer-cell">
                                <img src="/Images/avatars/rajesh_kumar_shop.jpg" alt="Rajesh" class="customer-avatar" />
                                <span style="font-weight: 600;">Rajesh Kumar</span>
                            </div>
                        </td>
                        <td style="color: #64748b;">Oct 23, 2023</td>
                        <td style="font-weight: 600;">45.00</td>
                        <td><span class="badge badge-gray" style="font-size: 0.6875rem;">PENDING</span></td>
                        <td style="color: #94a3b8; font-size: 1.25rem; cursor: pointer;">&hellip;</td>
                    </tr>
                    <tr>
                        <td style="font-weight: 600; color: #0f172a;">#ORD-94213</td>
                        <td>
                            <div class="customer-cell">
                                <img src="/Images/avatars/meera_devi.jpg" alt="Meera" class="customer-avatar" />
                                <span style="font-weight: 600;">Meera Devi</span>
                            </div>
                        </td>
                        <td style="color: #64748b;">Oct 23, 2023</td>
                        <td style="font-weight: 600;">322.15</td>
                        <td><span class="badge badge-gray" style="font-size: 0.6875rem;">DELIVERED</span></td>
                        <td style="color: #94a3b8; font-size: 1.25rem; cursor: pointer;">&hellip;</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
