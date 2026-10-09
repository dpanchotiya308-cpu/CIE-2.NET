<%@ Page Title="Order Details" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="KhedutPlus.Shop.OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .order-details-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 24px;
        flex-wrap: wrap;
        gap: 16px;
    }
    .order-details-grid {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 28px;
    }
    .order-timeline {
        display: flex;
        align-items: center;
        justify-content: space-between;
        position: relative;
        margin: 20px 0 28px 0;
        padding: 0 20px;
    }
    .order-timeline::before {
        content: '';
        position: absolute;
        top: 14px;
        left: 40px;
        right: 40px;
        height: 2px;
        background-color: #e2e8f0;
        z-index: 1;
    }
    .timeline-step {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 8px;
        position: relative;
        z-index: 2;
        background-color: #ffffff;
        padding: 0 10px;
    }
    .step-dot {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background-color: #e2e8f0;
        color: #64748b;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 0.75rem;
        font-weight: 700;
    }
    .step-dot.active {
        background-color: #166534;
        color: #ffffff;
    }
    .step-label {
        font-size: 0.75rem;
        font-weight: 600;
        color: #475569;
    }
    @media (max-width: 900px) {
        .order-details-grid {
            grid-template-columns: 1fr;
        }
        .order-timeline {
            flex-direction: column;
            gap: 16px;
            align-items: flex-start;
        }
        .order-timeline::before {
            display: none;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Top Action Bar -->
    <div class="order-details-header">
        <div>
            <a href="/Shop/Orders.aspx" style="color: #64748b; font-size: 0.875rem; display: inline-flex; align-items: center; gap: 6px; margin-bottom: 6px; text-decoration: none;">
                <span>&larr;</span>
                <span>Back to Orders</span>
            </a>
            <div style="display: flex; align-items: center; gap: 14px; flex-wrap: wrap;">
                <h1 class="page-title" style="margin-bottom: 0;">Order <asp:Label ID="lblOrderId" runat="server"></asp:Label></h1>
                <asp:Label ID="lblOrderStatusBadge" runat="server" CssClass="badge" style="background-color: #dcfce7; color: #166534; font-size: 0.8125rem; font-weight: 700;"></asp:Label>
                <asp:Label ID="lblPaymentBadge" runat="server" CssClass="badge" style="background-color: #f1f5f9; color: #475569; font-size: 0.8125rem; font-weight: 600;"></asp:Label>
            </div>
            <p class="page-subtitle" style="margin-top: 4px;">Placed on <asp:Label ID="lblPlacedDate" runat="server"></asp:Label> at <asp:Label ID="lblPlacedTime" runat="server"></asp:Label></p>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <%--<button type="button" class="btn btn-secondary" onclick="window.print();" style="display: inline-flex; align-items: center; gap: 6px;">
                <span>🖨️</span>
                <span>Print Invoice</span>
            </button>--%>
            <asp:HyperLink ID="lnkEditOrder" runat="server" CssClass="btn btn-primary" style="background-color: #166534; text-decoration: none;">
                ✎ Edit Order
            </asp:HyperLink>
        </div>
    </div>

    <!-- Alert Message -->
    <asp:Panel ID="pnlStatusUpdateSuccess" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblStatusUpdateSuccess" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Order Timeline Card -->
<%--    <div class="card" style="margin-bottom: 24px;">
        <h2 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 12px;">Order Fulfillment Status</h2>
        
        <div class="order-timeline">
            <div class="timeline-step">
                <div class="step-dot active">✓</div>
                <div class="step-label">Order Placed</div>
            </div>
            <div class="timeline-step">
                <div class="step-dot <%= CurrentOrder != null && CurrentOrder.OrderStatus != "CANCELLED" ? "active" : "" %>">
                    <%= CurrentOrder != null && CurrentOrder.OrderStatus != "CANCELLED" ? "✓" : "2" %>
                </div>
                <div class="step-label">Confirmed / Processing</div>
            </div>
            <div class="timeline-step">
                <div class="step-dot <%= CurrentOrder != null && CurrentOrder.OrderStatus == "DELIVERED" ? "active" : "" %>">
                    <%= CurrentOrder != null && CurrentOrder.OrderStatus == "DELIVERED" ? "✓" : "3" %>
                </div>
                <div class="step-label">Delivered</div>
            </div>
        </div>
    </div>--%>

    <!-- 2 Column Details Grid -->
    <div class="order-details-grid">
        <!-- Left Column: Items Table & Customer Info -->
        <div>
            <!-- Order Items Table -->
            <div class="card" style="margin-bottom: 24px; padding: 0; overflow: hidden;">
                <div style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                    <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a;">Items Ordered (<asp:Label ID="lblItemCountHeader" runat="server"></asp:Label>)</h2>
                </div>

                <table class="data-table" style="margin: 0;">
                    <thead>
                        <tr>
                            <th>PRODUCT</th>
                            <th>SKU</th>
                            <th>PRICE</th>
                            <th>QTY</th>
                            <th>TOTAL</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptOrderItems" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <div style="display: flex; align-items: center; gap: 12px;">
                                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' style="width: 40px; height: 40px; border-radius: 8px; object-fit: cover;" />
                                            <div>
                                                <div style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></div>
                                                <div style="font-size: 0.75rem; color: #64748b;"><%# Eval("Category") %></div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="font-family: monospace; font-size: 0.75rem; color: #94a3b8;"><%# Eval("Sku") %></td>
                                    <td style="font-weight: 500;">₹<%# Eval("Price", "{0:N2}") %></td>
                                    <td style="font-weight: 600;"><%# Eval("Quantity") %></td>
                                    <td style="font-weight: 700; color: #0f172a;">₹<%# Eval("LineTotal", "{0:N2}") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <!-- Customer & Shipping Information -->
            <div class="card">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 20px;">Customer &amp; Shipping Details</h2>

                <div style="display: flex; align-items: center; gap: 16px; margin-bottom: 20px; padding-bottom: 16px; border-bottom: 1px solid #f1f5f9;">
                    <img id="imgCustomerAvatar" runat="server" src="/Images/avatars/rajesh_kumar_shop.jpg" alt="Customer" style="width: 54px; height: 54px; border-radius: 50%; object-fit: cover;" />
                    <div>
                        <div style="font-weight: 700; color: #0f172a; font-size: 1.0625rem;"><asp:Label ID="lblCustomerName" runat="server"></asp:Label></div>
                        <div style="font-size: 0.8125rem; color: #64748b;">Farmer Customer</div>
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px; font-size: 0.875rem; margin-bottom: 16px;">
                    <div>
                        <div style="font-size: 0.75rem; color: #94a3b8; text-transform: uppercase; font-weight: 600; margin-bottom: 4px;">Phone Number</div>
                        <div style="font-weight: 600; color: #0f172a;"><asp:Label ID="lblCustomerPhone" runat="server"></asp:Label></div>
                    </div>
                    <div>
                        <div style="font-size: 0.75rem; color: #94a3b8; text-transform: uppercase; font-weight: 600; margin-bottom: 4px;">Email Address</div>
                        <div style="font-weight: 600; color: #0f172a;"><asp:Label ID="lblCustomerEmail" runat="server"></asp:Label></div>
                    </div>
                </div>

                <div style="font-size: 0.875rem;">
                    <div style="font-size: 0.75rem; color: #94a3b8; text-transform: uppercase; font-weight: 600; margin-bottom: 4px;">Delivery Address</div>
                    <div style="color: #334155; line-height: 1.5;"><asp:Label ID="lblDeliveryAddress" runat="server"></asp:Label></div>
                </div>
            </div>
        </div>

        <!-- Right Column: Summary & Quick Actions -->
        <div>
            <!-- Financial Summary Card -->
            <div class="card" style="margin-bottom: 24px;">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Payment Breakdown</h2>

                <div style="display: flex; flex-direction: column; gap: 12px; font-size: 0.875rem;">
                    <div style="display: flex; justify-content: space-between; color: #64748b;">
                        <span>Subtotal:</span>
                        <span style="font-weight: 600; color: #0f172a;">₹<asp:Label ID="lblSubtotal" runat="server"></asp:Label></span>
                    </div>

                    <div style="display: flex; justify-content: space-between; color: #64748b;">
                        <span>GST / Taxes (5%):</span>
                        <span style="font-weight: 600; color: #0f172a;">₹<asp:Label ID="lblTax" runat="server"></asp:Label></span>
                    </div>

                    <div style="display: flex; justify-content: space-between; color: #64748b;">
                        <span>Delivery &amp; Freight:</span>
                        <span style="font-weight: 600; color: #16a34a;">Free Shipping</span>
                    </div>

                    <div style="border-top: 1px solid #e2e8f0; padding-top: 14px; margin-top: 4px; display: flex; justify-content: space-between; font-size: 1.125rem; font-weight: 700; color: #0f172a;">
                        <span>Grand Total:</span>
                        <span style="color: #166534;">₹<asp:Label ID="lblGrandTotal" runat="server"></asp:Label></span>
                    </div>
                </div>

                <div style="margin-top: 20px; padding: 12px; border-radius: 8px; background-color: #f8fafc; font-size: 0.8125rem; color: #64748b;">
                    <div><strong>Payment Method:</strong> UPI / Direct Net Banking</div>
                    <div style="margin-top: 4px;"><strong>Transaction Status:</strong> <asp:Label ID="lblTxnStatus" runat="server"></asp:Label></div>
                </div>
            </div>

            <!-- Quick Fulfillment Actions -->
            <div class="card">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Quick Actions</h2>
                <div style="display: flex; flex-direction: column; gap: 10px;">
                    <asp:Button ID="btnMarkDelivered" runat="server" Text="Mark as Delivered" CssClass="btn btn-primary" style="background-color: #166534; width: 100%;" OnClick="btnMarkDelivered_Click" />
                    <asp:Button ID="btnCancelOrder" runat="server" Text="Cancel Order" CssClass="btn btn-secondary" style="color: #ef4444; border-color: #fecaca; width: 100%;" OnClick="btnCancelOrder_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
