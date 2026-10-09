<%@ Page Title="Orders" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="KhedutPlus.Shop.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .orders-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 24px;
        flex-wrap: wrap;
        gap: 16px;
    }
    .kpi-grid-4 {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
        margin-bottom: 28px;
    }
    @media (max-width: 1024px) {
        .kpi-grid-4 {
            grid-template-columns: repeat(2, 1fr);
        }
    }
    @media (max-width: 600px) {
        .kpi-grid-4 {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Header -->
    <div class="orders-header">
        <div>
            <h1 class="page-title">Orders</h1>
            <p class="page-subtitle">Manage and track all customer purchases</p>
        </div>

        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
            <div class="search-box" style="max-width: 280px;">
                <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                <asp:TextBox ID="txtSearchOrders" runat="server" CssClass="form-control" placeholder="Search by Order ID or Customer..." AutoPostBack="true" OnTextChanged="SearchOrders_Changed" data-search-table="tblOrders"></asp:TextBox>
            </div>
            <asp:Button ID="btnSearchOrders" runat="server" Text="Search" CssClass="btn btn-secondary btn-sm" OnClick="btnSearchOrders_Click" />
        </div>
    </div>

    <!-- Alert -->
    <asp:Panel ID="pnlOrderAlert" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblOrderAlert" runat="server"></asp:Label>
    </asp:Panel>

    <!-- 4 KPI Cards -->
    <!--<div class="kpi-grid-4">
        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Total Orders Today</span>
                <span class="badge" style="background-color: #ecfdf5; color: #10b981;">+12%</span>
            </div>
            <div class="kpi-value">128</div>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Pending Orders</span>
                <span class="badge" style="background-color: #fef2f2; color: #ef4444;">-2%</span>
            </div>
            <div class="kpi-value">42</div>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Completed Today</span>
                <span class="badge" style="background-color: #ecfdf5; color: #10b981;">+18%</span>
            </div>
            <div class="kpi-value">86</div>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Cancelled Orders</span>
                <span class="badge badge-gray">0%</span>
            </div>
            <div class="kpi-value">5</div>
        </div>
    </div>-->

    <!-- Filter Tabs -->
    <div class="filter-tabs">
        <asp:LinkButton ID="btnTabAll" runat="server" CssClass="filter-tab active" OnClick="FilterOrderStatus_Click" CommandArgument="All">All Orders</asp:LinkButton>
        <asp:LinkButton ID="btnTabPending" runat="server" CssClass="filter-tab" OnClick="FilterOrderStatus_Click" CommandArgument="PENDING">Pending</asp:LinkButton>
        <asp:LinkButton ID="btnTabDelivered" runat="server" CssClass="filter-tab" OnClick="FilterOrderStatus_Click" CommandArgument="DELIVERED">Delivered</asp:LinkButton>
        <asp:LinkButton ID="btnTabCancelled" runat="server" CssClass="filter-tab" OnClick="FilterOrderStatus_Click" CommandArgument="CANCELLED">Cancelled</asp:LinkButton>
    </div>

    <!-- Orders Table -->
    <div class="table-container">
        <table id="tblOrders" class="data-table">
            <thead>
                <tr>
                    <th>ORDER ID</th>
                    <th>CUSTOMER NAME</th>
                    <th>DATE</th>
                    <th>ITEMS</th>
                    <th>TOTAL AMOUNT</th>
                    <th>PAYMENT STATUS</th>
                    <th>ORDER STATUS</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptOrders" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td style="font-weight: 600; color: #0f172a;"><%# Eval("OrderId") %></td>
                            <td>
                                <div style="display: flex; align-items: center; gap: 10px;">
                                    <img src='<%# Eval("CustomerAvatar") %>' alt='<%# Eval("CustomerName") %>' style="width: 32px; height: 32px; border-radius: 50%; object-fit: cover;" />
                                    <span style="font-weight: 600; color: #0f172a;"><%# Eval("CustomerName") %></span>
                                </div>
                            </td>
                            <td style="color: #64748b; font-size: 0.8125rem;">
                                <div><%# Eval("DateFormatted") %></div>
                                <div style="font-size: 0.75rem; color: #94a3b8;"><%# Eval("TimeFormatted") %></div>
                            </td>
                            <td style="color: #475569;"><%# Eval("ItemsCount") %></td>
                            <td style="font-weight: 700; color: #0f172a;">₹<%# Eval("TotalAmount", "{0:N2}") %></td>
                            <td>
                                <span class="badge badge-gray" style="font-size: 0.6875rem;"><%# Eval("PaymentStatus") %></span>
                            </td>
                            <td>
                                <span class="badge badge-gray" style="font-size: 0.6875rem;"><%# Eval("OrderStatus") %></span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 8px; align-items: center;">
                                    <a href='/Shop/OrderDetails.aspx?id=<%# System.Web.HttpUtility.UrlEncode(Eval("OrderId") as string) %>' class="btn btn-secondary btn-sm" style="padding: 4px 8px; font-size: 0.75rem; color: #166534; font-weight: 600; text-decoration: none;" title="Show Details">👁 Details</a>
                                    <a href='/Shop/EditOrder.aspx?id=<%# System.Web.HttpUtility.UrlEncode(Eval("OrderId") as string) %>' class="btn btn-secondary btn-sm" style="padding: 4px 8px; font-size: 0.75rem; color: #0284c7; font-weight: 600; text-decoration: none;" title="Edit Order">✎ Edit</a>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <div class="table-pagination">
            <div>Showing 5 of 1,248 orders</div>
            <div class="pagination-controls">
                <span class="page-btn">Previous</span>
                <span class="page-btn active">1</span>
                <span class="page-btn">2</span>
                <span class="page-btn">3</span>
                <span>...</span>
                <span class="page-btn">12</span>
                <span class="page-btn">Next</span>
            </div>
        </div>
    </div>
</asp:Content>
