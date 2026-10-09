<%@ Page Title="Record Stock Movement" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="NewStockUpdate.aspx.cs" Inherits="KhedutPlus.Shop.NewStockUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .stock-update-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 24px;
        flex-wrap: wrap;
        gap: 16px;
    }
    .stock-form-grid {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 28px;
    }
    .stock-summary-box {
        background-color: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        padding: 20px;
    }
    .stock-stat-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px solid #f1f5f9;
        font-size: 0.875rem;
    }
    .stock-stat-row:last-child {
        border-bottom: none;
        padding-top: 14px;
        font-weight: 700;
        font-size: 1rem;
    }
    @media (max-width: 900px) {
        .stock-form-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Header -->
    <div class="stock-update-header">
        <div>
            <a href="/Shop/StockUpdates.aspx" style="color: #64748b; font-size: 0.875rem; display: inline-flex; align-items: center; gap: 6px; margin-bottom: 6px; text-decoration: none;">
                <span>&larr;</span>
                <span>Back to Stock Updates</span>
            </a>
            <h1 class="page-title">Record Stock Movement</h1>
            <p class="page-subtitle">Log stock restocking, direct counter sales, physical audit adjustments, or damaged goods.</p>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:Button ID="btnDiscard" runat="server" Text="Discard" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnDiscard_Click" />
            <asp:Button ID="btnSaveUpdate" runat="server" Text="Save Stock Movement" CssClass="btn btn-primary" ValidationGroup="vgStockUpdate" OnClick="btnSaveUpdate_Click" style="background-color: #166534;" />
        </div>
    </div>

    <!-- Validation Summary -->
    <asp:ValidationSummary ID="valSummaryStock" runat="server" ValidationGroup="vgStockUpdate" CssClass="validation-summary-box" HeaderText="Please correct the following input errors:" DisplayMode="BulletList" />

    <!-- Feedback Message -->
    <asp:Panel ID="pnlStockSuccess" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblStockSuccess" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Two-Column Form -->
    <div class="stock-form-grid">
        <!-- Left Column -->
        <div>
            <div class="card" style="margin-bottom: 24px;">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 20px;">Movement Details</h2>

                <div class="form-group">
                    <label class="form-label" for="ddlProduct">Select Product <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvProduct" runat="server" ControlToValidate="ddlProduct" InitialValue="" ValidationGroup="vgStockUpdate" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please select a product to update." />
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="ddlUpdateType">Movement Type <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlUpdateType" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlUpdateType_SelectedIndexChanged">
                            <asp:ListItem Value="RESTOCK" Text="Restock (Incoming +)" Selected="True" />
                            <asp:ListItem Value="SALE" Text="Counter Sale (Outgoing -)" />
                            <asp:ListItem Value="ADJUSTMENT" Text="Inventory Adjustment (+)" />
                            <asp:ListItem Value="DAMAGE" Text="Damaged / Expired (-)" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtQuantity">Quantity Change <span class="required">*</span></label>
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" placeholder="e.g. 50" AutoPostBack="true" OnTextChanged="txtQuantity_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity" ValidationGroup="vgStockUpdate" Display="Dynamic" CssClass="validation-error" ErrorMessage="Quantity change is required." />
                        <asp:RangeValidator ID="rvQuantity" runat="server" ControlToValidate="txtQuantity" ValidationGroup="vgStockUpdate" Type="Integer" MinimumValue="1" MaximumValue="100000" Display="Dynamic" CssClass="validation-error" ErrorMessage="Quantity must be a positive integer between 1 and 100,000." />
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtBatchNumber">Batch / Reference Number</label>
                        <asp:TextBox ID="txtBatchNumber" runat="server" CssClass="form-control" placeholder="e.g. BATCH-2023-094"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="ddlStaff">Updated By Staff Member <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlStaff" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Rajesh Patel" Text="Rajesh Patel (Store Admin)" Selected="True" />
                            <asp:ListItem Value="Rahul Sharma" Text="Rahul Sharma (Inventory Manager)" />
                            <asp:ListItem Value="Priya Patel" Text="Priya Patel (Cashier / Sales)" />
                            <asp:ListItem Value="Amit Varma" Text="Amit Varma (Warehouse Staff)" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtNotes">Reason / Notes</label>
                    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Enter reason for stock adjustment or supplier reference..."></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div>
            <!-- Stock Impact Preview Card -->
            <div class="card" style="margin-bottom: 24px;">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Stock Impact Summary</h2>

                <div class="stock-summary-box">
                    <div class="stock-stat-row">
                        <span style="color: #64748b;">Current Stock:</span>
                        <span style="font-weight: 600; color: #0f172a;"><asp:Label ID="lblCurrentStock" runat="server" Text="400"></asp:Label> units</span>
                    </div>

                    <div class="stock-stat-row">
                        <span style="color: #64748b;">Movement:</span>
                        <span><asp:Label ID="lblMovementPreview" runat="server" Text="+50" ForeColor="#16a34a" FontBold="true"></asp:Label></span>
                    </div>

                    <div class="stock-stat-row">
                        <span style="color: #0f172a;">Projected New Stock:</span>
                        <span style="color: #166534;"><asp:Label ID="lblNewStockPreview" runat="server" Text="450 units"></asp:Label></span>
                    </div>
                </div>

                <div style="margin-top: 16px; font-size: 0.75rem; color: #94a3b8; line-height: 1.5;">
                    ℹ️ Saving will immediately append an audit record in the Stock Updates log and adjust live product quantity in inventory.
                </div>
            </div>
        </div>
    </div>
</asp:Content>
