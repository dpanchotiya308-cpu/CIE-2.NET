<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="KhedutPlus.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .admin-kpi-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        margin-bottom: 32px;
    }
    .admin-kpi-card {
        background-color: #ffffff;
        border-radius: 14px;
        border: 1px solid #e2e8f0;
        padding: 24px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.02);
    }
    .activity-row {
        display: flex;
        align-items: center;
        gap: 16px;
        padding: 16px 0;
        border-bottom: 1px solid #f1f5f9;
    }
    .activity-row:last-child {
        border-bottom: none;
    }
    @media (max-width: 1024px) {
        .admin-kpi-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }
    @media (max-width: 600px) {
        .admin-kpi-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Agro Dashboard</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Overview of your agro management ecosystem and active registrations.</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="AdminContent" runat="server">
    <!-- 4 KPI Cards -->
    <div class="admin-kpi-grid">
        <!-- 1. Registered Farmers -->
        <div class="admin-kpi-card">
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 12px;">
                <span style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; color: #64748b; letter-spacing: 0.05em;">REGISTERED FARMERS</span>
                <div style="width: 32px; height: 32px; border-radius: 8px; background-color: #ecfdf5; color: #166534; display: flex; align-items: center; justify-content: center; font-size: 1.125rem;">
                    👨‍🌾
                </div>
            </div>
            <div style="font-size: 2rem; font-weight: 800; color: #0f172a; line-height: 1.1; margin-bottom: 8px;">1,248</div>
            <div style="display: flex; align-items: center; gap: 4px; font-size: 0.75rem; color: #10b981; font-weight: 600;">
<%--                <span>↗</span>--%>
<%--                <span>+14.2% from last month</span>--%>
            </div>
        </div>

        <!-- 2. Total Agro Shops -->
        <div class="admin-kpi-card">
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 12px;">
                <span style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; color: #64748b; letter-spacing: 0.05em;">TOTAL AGRO SHOPS</span>
                <div style="width: 32px; height: 32px; border-radius: 8px; background-color: #ecfdf5; color: #166534; display: flex; align-items: center; justify-content: center; font-size: 1.125rem;">
                    🏪
                </div>
            </div>
            <div style="font-size: 2rem; font-weight: 800; color: #0f172a; line-height: 1.1; margin-bottom: 8px;">356</div>
            <div style="display: flex; align-items: center; gap: 4px; font-size: 0.75rem; color: #10b981; font-weight: 600;">
<%--                <span>↗</span>
                <span>+4.8% from last month</span>--%>
            </div>
        </div>

        <!-- 3. Total Products Listed -->
        <div class="admin-kpi-card">
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 12px;">
                <span style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; color: #64748b; letter-spacing: 0.05em;">TOTAL PRODUCTS LISTED</span>
                <div style="width: 32px; height: 32px; border-radius: 8px; background-color: #ecfdf5; color: #166534; display: flex; align-items: center; justify-content: center; font-size: 1.125rem;">
                    📦
                </div>
            </div>
            <div style="font-size: 2rem; font-weight: 800; color: #0f172a; line-height: 1.1; margin-bottom: 8px;">2,890</div>
            <div style="display: flex; align-items: center; gap: 4px; font-size: 0.75rem; color: #10b981; font-weight: 600;">
<%--                <span>↗</span>
                <span>+28.4% from last month</span>--%>
            </div>
        </div>

        <!-- 4. Active Gov Schemes -->
        <div class="admin-kpi-card">
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 12px;">
                <span style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; color: #64748b; letter-spacing: 0.05em;">ACTIVE GOV SCHEMES</span>
                <div style="width: 32px; height: 32px; border-radius: 8px; background-color: #ecfdf5; color: #166534; display: flex; align-items: center; justify-content: center; font-size: 1.125rem;">
                    🏛️
                </div>
            </div>
            <div style="font-size: 2rem; font-weight: 800; color: #0f172a; line-height: 1.1; margin-bottom: 8px;">12</div>
            <div style="display: flex; align-items: center; gap: 4px; font-size: 0.75rem; color: #64748b; font-weight: 600;">
<%--                <span>↗</span>
                <span>Stable from last month</span>--%>
            </div>
        </div>
    </div>

    <!-- Recent Activities Card -->
    <div class="card" style="padding: 28px;">
        <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px;">
            <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a;">Recent Activities</h2>
            <a href="#" style="font-size: 0.875rem; font-weight: 600; color: #166534;">View All</a>
        </div>

        <div>
            <asp:Repeater ID="rptActivities" runat="server">
                <ItemTemplate>
                    <div class="activity-row">
                        <img src='<%# Eval("AvatarUrl") %>' alt="User" style="width: 38px; height: 38px; border-radius: 50%; object-fit: cover;" />
                        <div style="flex: 1;">
                            <div style="font-weight: 600; color: #1e293b; font-size: 0.875rem;"><%# Eval("Title") %></div>
                            <div style="font-size: 0.75rem; color: #94a3b8; margin-top: 2px;"><%# Eval("TimeAgo") %></div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
