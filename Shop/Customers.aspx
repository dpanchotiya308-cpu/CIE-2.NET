<%@ Page Title="Customers" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="KhedutPlus.Shop.Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .cust-header {
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
    .kpi-card {
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 20px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .kpi-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 12px;
    }
    .kpi-title {
        font-size: 0.8125rem;
        font-weight: 600;
        color: #64748b;
        text-transform: uppercase;
        letter-spacing: 0.04em;
    }
    .kpi-value {
        font-size: 1.75rem;
        font-weight: 700;
        color: #0f172a;
    }
    .status-pill-active {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 4px 12px;
        border-radius: 9999px;
        background-color: #dcfce7;
        color: #15803d;
        font-size: 0.75rem;
        font-weight: 600;
    }
    .status-pill-inactive {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 4px 12px;
        border-radius: 9999px;
        background-color: #f1f5f9;
        color: #64748b;
        font-size: 0.75rem;
        font-weight: 600;
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
    <div class="cust-header">
        <div>
            <h1 class="page-title">Customers</h1>
        </div>

        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
            <div class="search-box" style="max-width: 280px;">
                <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                <asp:TextBox ID="txtSearchCustomer" runat="server" CssClass="form-control" placeholder="Search customers..." AutoPostBack="true" OnTextChanged="FilterCustomer_Changed" data-search-table="tblCustomers"></asp:TextBox>
            </div>
            <asp:Button ID="btnSearchCustomer" runat="server" Text="Search" CssClass="btn btn-secondary btn-sm" OnClick="btnSearchCustomer_Click" />
        </div>
    </div>

    <!-- 4 KPI Cards -->
    <div class="kpi-grid-4">
        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Total Customers</span>
<%--                <span class="badge" style="background-color: #ecfdf5; color: #10b981;">+12%</span>--%>
            </div>
            <div class="kpi-value">1,284</div>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Active Customers</span>
<%--                <span class="badge" style="background-color: #ecfdf5; color: #10b981;">+5%</span>--%>
            </div>
            <div class="kpi-value">942</div>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">New Today</span>
<%--                <span class="badge" style="background-color: #fef2f2; color: #ef4444;">-2%</span>--%>
            </div>
            <div class="kpi-value">24</div>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Service Areas</span>
                <span style="font-size: 1.125rem;">📍</span>
            </div>
            <div class="kpi-value">18</div>
        </div>
    </div>

    <!-- Filters Row -->
    <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; margin-bottom: 24px;">
        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="form-control" style="width: auto; height: 38px; padding: 4px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterCustomer_Changed">
                <asp:ListItem Value="All" Text="Status: All" Selected="True" />
                <asp:ListItem Value="Active" Text="Status: Active" />
                <asp:ListItem Value="Inactive" Text="Status: Inactive" />
            </asp:DropDownList>

            <asp:DropDownList ID="ddlLocationFilter" runat="server" CssClass="form-control" style="width: auto; height: 38px; padding: 4px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterCustomer_Changed">
                <asp:ListItem Value="All" Text="Location: All Locations" Selected="True" />
                <asp:ListItem Value="Anand" Text="Anand" />
                <asp:ListItem Value="Mehsana" Text="Mehsana" />
                <asp:ListItem Value="Rajkot" Text="Rajkot" />
                <asp:ListItem Value="Sanand" Text="Sanand" />
                <asp:ListItem Value="Bavla" Text="Bavla" />
            </asp:DropDownList>
        </div>

        <div>
            <a href="/Shop/AddCustomer.aspx" class="btn btn-primary btn-sm" style="background-color: #166534; padding: 8px 18px; border-radius: 8px; display: inline-flex; align-items: center; gap: 6px; text-decoration: none;">
                <span>+</span>
                <span>Add New Customer</span>
            </a>
        </div>
    </div>

    <!-- Table -->
    <div class="table-container">
        <table id="tblCustomers" class="data-table">
            <thead>
                <tr>
                    <th>CUSTOMER NAME</th>
                    <th>CONTACT</th>
                    <th>LAST ORDER DATE</th>
                    <th>TOTAL SPENT</th>
                    <th>STATUS</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptCustomers" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <img src='<%# Eval("AvatarUrl") %>' alt='<%# Eval("Name") %>' style="width: 36px; height: 36px; border-radius: 50%; object-fit: cover;" />
                                    <div>
                                        <div style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></div>
                                        <div style="font-size: 0.6875rem; color: #94a3b8; font-family: monospace;">ID: <%# Eval("Id") %></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div style="font-size: 0.8125rem; color: #0f172a;"><%# Eval("Email") %></div>
                                <div style="font-size: 0.75rem; color: #64748b;"><%# Eval("Phone") %></div>
                            </td>
                            <td style="color: #64748b;"><%# Eval("LastOrderDate") %></td>
                            <td style="font-weight: 600; color: #0f172a;">₹<%# Eval("TotalSpent", "{0:N2}") %></td>
                            <td>
                                <span class='<%# (Eval("Status") as string) == "Active" ? "status-pill-active" : "status-pill-inactive" %>'>
                                    ● <%# Eval("Status") %>
                                </span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 8px; align-items: center;">
                                    <a href='/Shop/EditCustomer.aspx?id=<%# System.Web.HttpUtility.UrlEncode(Eval("Id") as string) %>' class="btn btn-secondary btn-sm" style="padding: 4px 10px; font-size: 0.75rem; color: #166534; font-weight: 600; text-decoration: none;">✎ Edit</a>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <div class="table-pagination">
            <div>Showing 1 to 6 of 1,284 entries</div>
            <div class="pagination-controls">
                <span class="page-btn">&lt;</span>
                <span class="page-btn active">1</span>
                <span class="page-btn">2</span>
                <span class="page-btn">3</span>
                <span>...</span>
                <span class="page-btn">48</span>
                <span class="page-btn">&gt;</span>
            </div>
        </div>
    </div>
</asp:Content>
