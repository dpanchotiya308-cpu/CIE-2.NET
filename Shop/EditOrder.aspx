<%@ Page Title="Edit Order" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="EditOrder.aspx.cs" Inherits="KhedutPlus.Shop.EditOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .order-edit-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 24px;
        flex-wrap: wrap;
        gap: 16px;
    }
    .order-form-grid {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 28px;
    }
    @media (max-width: 900px) {
        .order-form-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Header -->
    <div class="order-edit-header">
        <div>
            <a href="/Shop/Orders.aspx" style="color: #64748b; font-size: 0.875rem; display: inline-flex; align-items: center; gap: 6px; margin-bottom: 6px; text-decoration: none;">
                <span>&larr;</span>
                <span>Back to Orders</span>
            </a>
            <h1 class="page-title"><asp:Label ID="lblOrderTitle" runat="server" Text="Edit Order"></asp:Label></h1>
            <p class="page-subtitle">Update order fulfillment status, payment confirmation, and customer delivery details.</p>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnCancel_Click" />
            <asp:Button ID="btnSaveOrder" runat="server" Text="Save Order Changes" CssClass="btn btn-primary" ValidationGroup="vgEditOrder" OnClick="btnSaveOrder_Click" style="background-color: #166534;" />
        </div>
    </div>

    <!-- Validation Summary -->
    <asp:ValidationSummary ID="valSummaryOrder" runat="server" ValidationGroup="vgEditOrder" CssClass="validation-summary-box" HeaderText="Please correct the following errors:" DisplayMode="BulletList" />

    <!-- Feedback Message -->
    <asp:Panel ID="pnlOrderSuccess" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblOrderSuccess" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Two-Column Form -->
    <div class="order-form-grid">
        <!-- Left Column -->
        <div>
            <!-- Customer & Delivery Card -->
            <div class="card" style="margin-bottom: 24px;">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 20px;">Customer &amp; Shipping Details</h2>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtOrderId">Order ID</label>
                        <asp:TextBox ID="txtOrderId" runat="server" CssClass="form-control" ReadOnly="true" style="background-color: #f1f5f9; cursor: not-allowed; font-weight: 600;"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtCustomerName">Customer Name <span class="required">*</span></label>
                        <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control" placeholder="Customer full name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName" ValidationGroup="vgEditOrder" Display="Dynamic" CssClass="validation-error" ErrorMessage="Customer name is required." />
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtCustomerPhone">Contact Phone</label>
                        <asp:TextBox ID="txtCustomerPhone" runat="server" CssClass="form-control" placeholder="+91 98765 43210"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtCustomerEmail">Email Address</label>
                        <asp:TextBox ID="txtCustomerEmail" runat="server" CssClass="form-control" placeholder="customer@example.com"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtDeliveryAddress">Delivery / Shipping Address</label>
                    <asp:TextBox ID="txtDeliveryAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Farm / Village, Taluka, District, Gujarat"></asp:TextBox>
                </div>
            </div>

            <!-- Order Pricing & Notes Card -->
            <div class="card">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 20px;">Financials &amp; Items Summary</h2>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtItemsCount">Items Summary</label>
                        <asp:TextBox ID="txtItemsCount" runat="server" CssClass="form-control" placeholder="e.g. 3 Items"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtTotalAmount">Total Order Amount (₹) <span class="required">*</span></label>
                        <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTotalAmount" runat="server" ControlToValidate="txtTotalAmount" ValidationGroup="vgEditOrder" Display="Dynamic" CssClass="validation-error" ErrorMessage="Total amount is required." />
                        <asp:RangeValidator ID="rvTotalAmount" runat="server" ControlToValidate="txtTotalAmount" ValidationGroup="vgEditOrder" Type="Double" MinimumValue="0.00" MaximumValue="10000000.00" Display="Dynamic" CssClass="validation-error" ErrorMessage="Amount must be a valid positive number." />
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtOrderNotes">Fulfillment Notes</label>
                    <asp:TextBox ID="txtOrderNotes" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Special delivery instructions or farmer notes..."></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div>
            <!-- Status Card -->
            <div class="card">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Order &amp; Payment Status</h2>

                <div class="form-group">
                    <label class="form-label" for="ddlOrderStatus">Order Status <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlOrderStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="PENDING" Text="PENDING (In Progress / Ready)" />
                        <asp:ListItem Value="DELIVERED" Text="DELIVERED (Completed)" />
                        <asp:ListItem Value="CANCELLED" Text="CANCELLED" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label" for="ddlPaymentStatus">Payment Status <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlPaymentStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="PAID" Text="PAID (Payment Received)" />
                        <asp:ListItem Value="PENDING" Text="PENDING (Cash on Delivery)" />
                        <asp:ListItem Value="REFUNDED" Text="REFUNDED" />
                        <asp:ListItem Value="FAILED" Text="FAILED" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
