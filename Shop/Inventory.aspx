<%@ Page Title="Pesticides Inventory" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="KhedutPlus.Shop.Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .inv-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 24px;
        flex-wrap: wrap;
        gap: 16px;
    }
    .prod-cell {
        display: flex;
        align-items: center;
        gap: 14px;
    }
    .prod-thumb {
        width: 44px;
        height: 44px;
        border-radius: 8px;
        border: 1px solid #e2e8f0;
        object-fit: cover;
        background-color: #f8fafc;
    }
    .prod-sku {
        font-size: 0.6875rem;
        color: #94a3b8;
        font-family: monospace;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Header -->
    <div class="inv-header">
        <div>
            <h1 class="page-title"><asp:Label ID="lblPageTitle" runat="server" Text="Shop Inventory"></asp:Label></h1>
            <p class="page-subtitle"><asp:Label ID="lblPageSubtitle" runat="server" Text="Manage and track your agricultural seeds, fertilizers, and pesticides inventory."></asp:Label></p>
        </div>

        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
            <div class="search-box" style="max-width: 280px;">
                <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                <asp:TextBox ID="txtSearchInventory" runat="server" CssClass="form-control" placeholder="Search product or SKU..." AutoPostBack="true" OnTextChanged="SearchInventory_Changed" data-search-table="tblStandardProducts"></asp:TextBox>
            </div>
            <asp:Button ID="btnSearchInventory" runat="server" Text="Search" CssClass="btn btn-secondary btn-sm" OnClick="btnSearchInventory_Click" />
            <a href="/Shop/AddProduct.aspx" class="btn btn-primary btn-sm" style="background-color: #166534; padding: 8px 16px; border-radius: 8px; display: inline-flex; align-items: center; gap: 6px;">
                <span>+</span>
                <span>Add Product</span>
            </a>
        </div>
    </div>

    <!-- Alert Feedback -->
    <asp:Panel ID="pnlInvFeedback" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblInvFeedback" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Filter Tabs (Matches PDF 2 Pages 7, 8, 9, 10) -->
    <div class="filter-tabs">
        <asp:LinkButton ID="btnTabAll" runat="server" CssClass="filter-tab active" OnClick="FilterTab_Click" CommandArgument="All">All</asp:LinkButton>
        <asp:LinkButton ID="btnTabSeeds" runat="server" CssClass="filter-tab" OnClick="FilterTab_Click" CommandArgument="Seeds">Seeds</asp:LinkButton>
        <asp:LinkButton ID="btnTabFertilizers" runat="server" CssClass="filter-tab" OnClick="FilterTab_Click" CommandArgument="Fertilizers">Fertilizers</asp:LinkButton>
        <asp:LinkButton ID="btnTabPesticides" runat="server" CssClass="filter-tab" OnClick="FilterTab_Click" CommandArgument="Pesticides">Pesticides</asp:LinkButton>
    </div>

    <!-- Standard View (All & Seeds) -->
    <asp:Panel ID="pnlStandardView" runat="server">
        <div class="table-container">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>PRODUCT NAME</th>
                        <th>CATEGORY</th>
                        <th>STOCK LEVEL</th>
                        <th>PRICE</th>
                        <th>STATUS</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptStandardProducts" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="prod-cell">
                                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="prod-thumb" />
                                        <div>
                                            <div style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></div>
                                            <div class="prod-sku">SKU: <%# Eval("Sku") %></div>
                                        </div>
                                    </div>
                                </td>
                                <td style="color: #64748b;"><%# Eval("Category") %></td>
                                <td style="font-weight: 500;"><%# Eval("StockLevel") %></td>
                                <td style="font-weight: 600;">₹<%# Eval("Price", "{0:N0}") %></td>
                                <td>
                                    <%# RenderStatusPill(Eval("Status") as string) %>
                                </td>
                                <td>
                                    <div style="display: flex; gap: 8px; align-items: center;">
                                        <a href='/Shop/EditInventory.aspx?sku=<%# Eval("Sku") %>' class="btn btn-secondary btn-sm" style="padding: 4px 10px; font-size: 0.75rem; color: #166534; font-weight: 600; text-decoration: none;">✎ Edit</a>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <div class="table-pagination">
                <div>Showing 1 to 4 of 24 products</div>
                <div class="pagination-controls">
                    <span class="page-btn">Previous</span>
                    <span class="page-btn active">1</span>
                    <span class="page-btn">2</span>
                    <span class="page-btn">3</span>
                    <span class="page-btn">Next</span>
                </div>
            </div>
        </div>
    </asp:Panel>

    <!-- Fertilizers Dynamic View (PDF 2 Page 9) -->
    <asp:Panel ID="pnlFertilizerView" runat="server" Visible="false">
        <div class="table-container">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>PRODUCT NAME</th>
                        <th>TYPE</th>
                        <th>N-P-K RATIO</th>
                        <th>STOCK LEVEL</th>
                        <th>PRICE (₹)</th>
                        <th>STATUS</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptFertilizerProducts" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="prod-cell">
                                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="prod-thumb" />
                                        <div>
                                            <div style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></div>
                                            <div class="prod-sku">SKU: <%# Eval("Sku") %></div>
                                        </div>
                                    </div>
                                </td>
                                <td style="color: #64748b;"><%# Eval("Type") %></td>
                                <td style="color: #64748b;"><%# Eval("NpkRatio") %></td>
                                <td style="font-weight: 500;"><%# Eval("StockLevel") %></td>
                                <td style="font-weight: 600;">₹<%# Eval("Price", "{0:N0}") %></td>
                                <td>
                                    <%# RenderStatusPill(Eval("Status") as string) %>
                                </td>
                                <td>
                                    <div style="display: flex; gap: 8px; align-items: center;">
                                        <a href='/Shop/EditInventory.aspx?sku=<%# Eval("Sku") %>' class="btn btn-secondary btn-sm" style="padding: 4px 10px; font-size: 0.75rem; color: #166534; font-weight: 600; text-decoration: none;">✎ Edit</a>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <div class="table-pagination">
                <div>Showing 1 to 4 of 24 products</div>
                <div class="pagination-controls">
                    <span class="page-btn">Previous</span>
                    <span class="page-btn active">1</span>
                    <span class="page-btn">2</span>
                    <span class="page-btn">3</span>
                    <span class="page-btn">Next</span>
                </div>
            </div>
        </div>
    </asp:Panel>

    <!-- Pesticides Dynamic View (PDF 2 Page 10) -->
    <asp:Panel ID="pnlPesticideView" runat="server" Visible="false">
        <div class="table-container">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>PRODUCT NAME</th>
                        <th>TARGET PEST</th>
                        <th>TOXICITY LEVEL</th>
                        <th>EXPIRY DATE</th>
                        <th>STOCK LEVEL</th>
                        <th>STATUS</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptPesticideProducts" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="prod-cell">
                                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="prod-thumb" />
                                        <div>
                                            <div style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></div>
                                            <div class="prod-sku">SKU: <%# Eval("Sku") %></div>
                                        </div>
                                    </div>
                                </td>
                                <td style="color: #64748b;"><%# Eval("TargetPest") %></td>
                                <td>
                                    <span class="badge" style="background-color: #f1f5f9; color: #475569;"><%# Eval("ToxicityLevel") %></span>
                                </td>
                                <td style="color: #64748b;"><%# Eval("ExpiryDate") %></td>
                                <td style="font-weight: 500;"><%# Eval("StockLevel") %></td>
                                <td>
                                    <div style="display: flex; align-items: center; gap: 6px; font-weight: 500;">
                                        <span class='badge-dot <%# (Eval("Status") as string) == "In Stock" ? "success" : "warning" %>'></span>
                                        <span><%# Eval("Status") %></span>
                                    </div>
                                </td>
                                <td>
                                    <div style="display: flex; gap: 8px; align-items: center;">
                                        <a href='/Shop/EditInventory.aspx?sku=<%# Eval("Sku") %>' class="btn btn-secondary btn-sm" style="padding: 4px 10px; font-size: 0.75rem; color: #166534; font-weight: 600; text-decoration: none;">✎ Edit</a>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <div class="table-pagination">
                <div>Showing 1 to 4 of 24 products</div>
                <div class="pagination-controls">
                    <span class="page-btn">Previous</span>
                    <span class="page-btn active">1</span>
                    <span class="page-btn">2</span>
                    <span class="page-btn">3</span>
                    <span class="page-btn">Next</span>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
