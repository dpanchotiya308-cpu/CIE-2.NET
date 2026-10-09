<%@ Page Title="Stock Updates" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="StockUpdates.aspx.cs" Inherits="KhedutPlus.Shop.StockUpdates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .stock-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 24px;
        flex-wrap: wrap;
        gap: 16px;
    }
    .qty-badge-positive {
        color: #16a34a;
        font-weight: 700;
    }
    .qty-badge-negative {
        color: #dc2626;
        font-weight: 700;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Header -->
    <div class="stock-header">
        <div>
            <h1 class="page-title">Stock Updates</h1>
        </div>

        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
            <div class="search-box" style="max-width: 280px;">
                <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                <asp:TextBox ID="txtSearchUpdates" runat="server" CssClass="form-control" placeholder="Search by product, SKU, or staff..." AutoPostBack="true" OnTextChanged="SearchUpdates_Changed" data-search-table="tblStockUpdates"></asp:TextBox>
            </div>
            <asp:Button ID="btnSearchUpdates" runat="server" Text="Search" CssClass="btn btn-secondary btn-sm" OnClick="btnSearchUpdates_Click" />

            <a href="/Shop/NewStockUpdate.aspx" class="btn btn-primary btn-sm" style="background-color: #166534; padding: 8px 16px; border-radius: 8px; display: inline-flex; align-items: center; gap: 6px; text-decoration: none;">
                <span>+</span>
                <span>New Update</span>
            </a>
        </div>
    </div>

    <!-- Filter Tabs -->
    <div class="filter-tabs">
        <asp:LinkButton ID="btnTabAll" runat="server" CssClass="filter-tab active" OnClick="FilterType_Click" CommandArgument="All">All Types</asp:LinkButton>
        <asp:LinkButton ID="btnTabRestock" runat="server" CssClass="filter-tab" OnClick="FilterType_Click" CommandArgument="RESTOCK">Restock</asp:LinkButton>
        <asp:LinkButton ID="btnTabSale" runat="server" CssClass="filter-tab" OnClick="FilterType_Click" CommandArgument="SALE">Sale</asp:LinkButton>
        <asp:LinkButton ID="btnTabAdjustment" runat="server" CssClass="filter-tab" OnClick="FilterType_Click" CommandArgument="ADJUSTMENT">Adjustment</asp:LinkButton>
        <asp:LinkButton ID="btnTabDamage" runat="server" CssClass="filter-tab" OnClick="FilterType_Click" CommandArgument="DAMAGE">Damage</asp:LinkButton>
    </div>

    <!-- Table -->
    <div class="table-container">
        <table id="tblStockUpdates" class="data-table">
            <thead>
                <tr>
                    <th>DATE &amp; TIME</th>
                    <th>PRODUCT NAME</th>
                    <th>UPDATE TYPE</th>
                    <th>QTY CHANGE</th>
                    <th>NEW STOCK</th>
                    <th>UPDATED BY</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptStockUpdates" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td style="color: #64748b; font-size: 0.8125rem; white-space: pre-line;"><%# Eval("DateTimeFormatted") %></td>
                            <td>
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <img src='<%# Eval("ProductImage") %>' alt='<%# Eval("ProductName") %>' style="width: 36px; height: 36px; border-radius: 6px; object-fit: cover;" />
                                    <div>
                                        <div style="font-weight: 600; color: #0f172a;"><%# Eval("ProductName") %></div>
                                        <div style="font-size: 0.6875rem; color: #94a3b8; font-family: monospace;">SKU: <%# Eval("Sku") %></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="badge badge-gray"><%# Eval("UpdateType") %></span>
                            </td>
                            <td>
                                <span class='<%# (int)Eval("QtyChange") > 0 ? "qty-badge-positive" : "qty-badge-negative" %>'>
                                    <%# (int)Eval("QtyChange") > 0 ? "+" + Eval("QtyChange") : Eval("QtyChange").ToString() %>
                                </span>
                            </td>
                            <td style="font-weight: 600; color: #0f172a;"><%# Eval("NewStock") %></td>
                            <td>
                                <div style="display: flex; align-items: center; gap: 8px;">
                                    <img src='<%# Eval("UpdatedByAvatar") %>' alt='<%# Eval("UpdatedBy") %>' style="width: 28px; height: 28px; border-radius: 50%; object-fit: cover;" />
                                    <span style="font-weight: 500;"><%# Eval("UpdatedBy") %></span>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <div class="table-pagination">
            <div>Showing 1 to 5 of 128 updates</div>
            <div class="pagination-controls">
                <span class="page-btn">Previous</span>
                <span class="page-btn active">1</span>
                <span class="page-btn">2</span>
                <span class="page-btn">3</span>
                <span class="page-btn">Next</span>
            </div>
        </div>
    </div>
</asp:Content>
