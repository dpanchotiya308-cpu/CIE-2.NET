<%@ Page Title="Notifications & Store Alerts" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="KhedutPlus.Shop.Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .notif-header {
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
    .notif-card-item {
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 20px 24px;
        margin-bottom: 16px;
        display: flex;
        align-items: flex-start;
        gap: 20px;
        box-shadow: 0 1px 2px rgba(0,0,0,0.02);
        transition: transform 0.15s, box-shadow 0.15s;
    }
    .notif-card-item:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
    }
    .notif-icon-circle {
        width: 44px;
        height: 44px;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.25rem;
        flex-shrink: 0;
    }
    .notif-content {
        flex: 1;
    }
    .kpi-card {
        background-color: #ffffff;
        border-radius: 14px;
        border: 1px solid #e2e8f0;
        padding: 24px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        box-shadow: 0 1px 3px rgba(0,0,0,0.04);
        transition: transform 0.15s, box-shadow 0.15s;
    }
    .kpi-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(0,0,0,0.07);
    }
    .kpi-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 12px;
    }
    .kpi-title {
        font-size: 0.85rem;
        font-weight: 600;
        color: #64748b;
        text-transform: uppercase;
        letter-spacing: 0.04em;
    }
    .kpi-value {
        font-size: 2rem;
        font-weight: 700;
        color: #0f172a;
        line-height: 1.1;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Header -->
    <div class="notif-header">
        <div>
            <h1 class="page-title">Notifications &amp; Store Alerts (સૂચનાઓ)</h1>
            <p class="page-subtitle">Monitor inventory stock warnings, incoming farmer orders, stock transactions, and regulatory reminders.</p>
        </div>

        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
            <asp:Button ID="btnMarkAllRead" runat="server" Text="Mark All as Read" CssClass="btn btn-secondary btn-sm" OnClick="btnMarkAllRead_Click" />
            <a href="#alertConfigSection" class="btn btn-primary btn-sm" style="background-color: #166534; text-decoration: none;">+ Configure Alert</a>
        </div>
    </div>

    <!-- Alert Banner -->
    <asp:Panel ID="pnlNotifAlert" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblNotifAlert" runat="server"></asp:Label>
    </asp:Panel>

    <!-- 4 KPI Stats Cards -->
    <div class="kpi-grid-4">
        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Total Store Alerts</span>
<%--                <span class="badge" style="background-color: #ecfdf5; color: #166534;">Live</span>--%>
            </div>
            <div class="kpi-value"><asp:Label ID="lblTotalAlerts" runat="server">5</asp:Label></div>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Inventory Warnings</span>
<%--                <span class="badge" style="background-color: #fef2f2; color: #ef4444;">Action Req</span>--%>
            </div>
            <div class="kpi-value" style="color: #dc2626;"><asp:Label ID="lblInventoryAlerts" runat="server">2</asp:Label></div>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Order Updates</span>
<%--                <span class="badge" style="background-color: #eff6ff; color: #3b82f6;">Orders</span>--%>
            </div>
            <div class="kpi-value"><asp:Label ID="lblOrderAlerts" runat="server">1</asp:Label></div>
        </div>

        <div class="kpi-card">
            <div class="kpi-header">
                <span class="kpi-title">Customer Activity</span>
<%--                <span class="badge" style="background-color: #f5f3ff; color: #7c3aed;">Farmers</span>--%>
            </div>
            <div class="kpi-value"><asp:Label ID="lblCustomerAlerts" runat="server">1</asp:Label></div>
        </div>
    </div>

    <!-- Filter Tabs -->
    <div class="filter-tabs">
        <asp:LinkButton ID="btnTabAll" runat="server" CssClass="filter-tab active" OnClick="FilterNotif_Click" CommandArgument="All">All Alerts</asp:LinkButton>
        <asp:LinkButton ID="btnTabInventory" runat="server" CssClass="filter-tab" OnClick="FilterNotif_Click" CommandArgument="Inventory">Inventory Alerts</asp:LinkButton>
        <asp:LinkButton ID="btnTabOrders" runat="server" CssClass="filter-tab" OnClick="FilterNotif_Click" CommandArgument="Orders">Orders</asp:LinkButton>
        <asp:LinkButton ID="btnTabCustomers" runat="server" CssClass="filter-tab" OnClick="FilterNotif_Click" CommandArgument="Customers">Customer Activity</asp:LinkButton>
        <asp:LinkButton ID="btnTabSystem" runat="server" CssClass="filter-tab" OnClick="FilterNotif_Click" CommandArgument="System">System &amp; Regulatory</asp:LinkButton>
    </div>

    <!-- Notification Cards List -->
    <div style="margin-bottom: 32px;">
        <asp:Repeater ID="rptNotifications" runat="server">
            <ItemTemplate>
                <div class="notif-card-item">
                    <div class="notif-icon-circle" style='<%# GetIconBg(Eval("Category") as string) %>'>
                        <%# GetIconEmoji(Eval("Category") as string) %>
                    </div>
                    <div class="notif-content">
                        <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 6px; flex-wrap: wrap; gap: 8px;">
                            <div style="display: flex; align-items: center; gap: 10px;">
                                <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 0;"><%# Eval("Title") %></h3>
                                <span class="badge" style='<%# GetBadgeStyle(Eval("Category") as string) %>'><%# Eval("Category") %></span>
                            </div>
                            <span style="font-size: 0.75rem; color: #94a3b8;"><%# Eval("TimeAgo") %></span>
                        </div>
                        <p style="font-size: 0.875rem; color: #64748b; line-height: 1.5; margin-bottom: 12px;"><%# Eval("Description") %></p>
                        <a href='<%# Eval("ActionUrl") %>' style="color: #166534; font-weight: 600; font-size: 0.8125rem; text-decoration: none;">
                            <%# Eval("ActionText") %>
                        </a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Alert Configuration Section with Pure .NET Server Validators -->
    <div id="alertConfigSection" class="card" style="margin-top: 36px; padding: 32px;">
        <div style="margin-bottom: 20px;">
            <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 4px;">
                <span style="font-size: 1.25rem;">⚙️</span>
                <h2 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin: 0;">Create Custom Alert &amp; Reorder Notification (કસ્ટમ સ્ટોક એલર્ટ રૂપરેખા)</h2>
            </div>
            <p style="color: #64748b; font-size: 0.875rem; margin: 0;">
                Configure stock safety reorder thresholds or alert your staff when farm supply quantities fall below critical limits.
            </p>
        </div>

        <!-- 1. ValidationSummary -->
        <asp:ValidationSummary ID="valSummaryAlert" runat="server" ValidationGroup="vgShopAlert" CssClass="validation-summary-box" HeaderText="Please correct the following input errors:" DisplayMode="BulletList" />

        <!-- Alert Success Message -->
        <asp:Panel ID="pnlAlertCreated" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom: 20px;">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
            <asp:Label ID="lblAlertCreated" runat="server"></asp:Label>
        </asp:Panel>

        <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 20px;">
            <!-- 2. RequiredFieldValidator on Alert Title -->
            <div class="form-group">
                <label class="form-label" for="txtAlertTitle">Alert Title / Topic (એલર્ટ શીર્ષક) <span class="required">*</span></label>
                <asp:TextBox ID="txtAlertTitle" runat="server" CssClass="form-control" placeholder="e.g., Urgent Urea Buffer Stock Warning"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAlertTitle" runat="server" ControlToValidate="txtAlertTitle" ValidationGroup="vgShopAlert" Display="Dynamic" CssClass="validation-error" ErrorMessage="Alert title is required." />
            </div>

            <!-- Alert Category Dropdown -->
            <div class="form-group">
                <label class="form-label" for="ddlAlertCategory">Category (શ્રેણી) <span class="required">*</span></label>
                <asp:DropDownList ID="ddlAlertCategory" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Inventory" Text="📦 Inventory Stock Warning" />
                    <asp:ListItem Value="Orders" Text="🛒 Customer Order Follow-up" />
                    <asp:ListItem Value="Customers" Text="👥 Farmer Registration Alert" />
                    <asp:ListItem Value="System" Text="📜 Regulatory &amp; Subsidy Alert" />
                </asp:DropDownList>
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 20px;">
            <!-- 3. RangeValidator & RequiredFieldValidator on Threshold Quantity -->
            <div class="form-group">
                <label class="form-label" for="txtThresholdQty">Stock Threshold Limit (ન્યૂનતમ સ્ટોક મર્યાદા) <span class="required">*</span></label>
                <asp:TextBox ID="txtThresholdQty" runat="server" CssClass="form-control" placeholder="e.g., 25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvThresholdQty" runat="server" ControlToValidate="txtThresholdQty" ValidationGroup="vgShopAlert" Display="Dynamic" CssClass="validation-error" ErrorMessage="Stock threshold quantity is required." />
                <asp:RangeValidator ID="rvThresholdQty" runat="server" ControlToValidate="txtThresholdQty" ValidationGroup="vgShopAlert" Type="Integer" MinimumValue="1" MaximumValue="50000" Display="Dynamic" CssClass="validation-error" ErrorMessage="Threshold quantity must be a positive integer between 1 and 50,000 units." />
            </div>

            <!-- 4. RegularExpressionValidator & RequiredFieldValidator on Contact Mobile -->
            <div class="form-group">
                <label class="form-label" for="txtContactMobile">Alert Mobile Number (મોબાઈલ નંબર) <span class="required">*</span></label>
                <asp:TextBox ID="txtContactMobile" runat="server" CssClass="form-control" placeholder="e.g., 9876543210"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContactMobile" runat="server" ControlToValidate="txtContactMobile" ValidationGroup="vgShopAlert" Display="Dynamic" CssClass="validation-error" ErrorMessage="Mobile phone number is required." />
                <asp:RegularExpressionValidator ID="revContactMobile" runat="server" ControlToValidate="txtContactMobile" ValidationGroup="vgShopAlert" ValidationExpression="^(\+91[\-\s]?)?[0]?[6789][0-9\s\-]{8,12}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid 10-digit Indian mobile number." />
            </div>

            <!-- 5. CompareValidator on Confirm Mobile -->
            <div class="form-group">
                <label class="form-label" for="txtConfirmMobile">Confirm Mobile Number (મોબાઈલ કન્ફર્મ કરો) <span class="required">*</span></label>
                <asp:TextBox ID="txtConfirmMobile" runat="server" CssClass="form-control" placeholder="Re-enter mobile number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirmMobile" runat="server" ControlToValidate="txtConfirmMobile" ValidationGroup="vgShopAlert" Display="Dynamic" CssClass="validation-error" ErrorMessage="Mobile confirmation is required." />
                <asp:CompareValidator ID="cvConfirmMobile" runat="server" ControlToValidate="txtConfirmMobile" ControlToCompare="txtContactMobile" Operator="Equal" ValidationGroup="vgShopAlert" Display="Dynamic" CssClass="validation-error" ErrorMessage="Confirmation mobile number must match the primary mobile number." />
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 2fr; gap: 20px;">
            <!-- 6. CustomValidator on Batch Code -->
            <div class="form-group">
                <label class="form-label" for="txtBatchCode">Warehouse Batch Code (બેચ કોડ) <span class="required">*</span></label>
                <asp:TextBox ID="txtBatchCode" runat="server" CssClass="form-control" placeholder="e.g., BT-2026 or STK-105"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvBatchCode" runat="server" ControlToValidate="txtBatchCode" ValidationGroup="vgShopAlert" Display="Dynamic" CssClass="validation-error" ErrorMessage="Batch code is required." />
                <asp:CustomValidator ID="cvBatchCode" runat="server" ControlToValidate="txtBatchCode" ValidationGroup="vgShopAlert" OnServerValidate="cvBatchCode_ServerValidate" Display="Dynamic" CssClass="validation-error" ErrorMessage="Batch code must start with 'BT-' or 'STK-' followed by numbers (e.g. BT-2026)." />
            </div>

            <!-- Description Field -->
            <div class="form-group">
                <label class="form-label" for="txtAlertDescription">Alert Instructions &amp; Action Notes (વિગત) <span class="required">*</span></label>
                <asp:TextBox ID="txtAlertDescription" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Describe the trigger condition or reminder note..."></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAlertDesc" runat="server" ControlToValidate="txtAlertDescription" ValidationGroup="vgShopAlert" Display="Dynamic" CssClass="validation-error" ErrorMessage="Alert instructions cannot be empty." />
            </div>
        </div>

        <div style="margin-top: 14px; display: flex; align-items: center; justify-content: flex-end; gap: 12px;">
            <asp:Button ID="btnResetAlertForm" runat="server" Text="Reset Form" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnResetAlertForm_Click" />
            <asp:Button ID="btnCreateAlert" runat="server" Text="Save Store Alert (એલર્ટ સાચવો)" CssClass="btn btn-primary" ValidationGroup="vgShopAlert" OnClick="btnCreateAlert_Click" style="background-color: #166534; padding: 10px 24px; font-weight: 600;" />
        </div>
    </div>
</asp:Content>
