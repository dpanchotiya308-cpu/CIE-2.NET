<%@ Page Title="Product Management Catalog" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="KhedutPlus.Admin.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .type-chip {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        padding: 3px 10px;
        border-radius: 8px;
        font-size: 0.75rem;
        font-weight: 600;
        background-color: #f0fdf4;
        color: #166534;
        border: 1px solid #bbf7d0;
    }
    .desc-cell {
        max-width: 200px;
        font-size: 0.8125rem;
        color: #64748b;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(15, 23, 42, 0.6);
        backdrop-filter: blur(4px);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 9999;
        padding: 20px;
    }
    .modal-card {
        background-color: #ffffff;
        border-radius: 16px;
        width: 100%;
        max-width: 720px;
        max-height: 90vh;
        overflow-y: auto;
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        padding: 28px;
    }
    .modal-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 20px;
        padding-bottom: 14px;
        border-bottom: 1px solid #e2e8f0;
    }
    .grid-2col {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 16px;
    }
    @media (max-width: 640px) {
        .grid-2col { grid-template-columns: 1fr; }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Product Management Catalog</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Add, edit, or remove agricultural products in the central catalog.</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="AdminContent" runat="server">
    <!-- Feedback Alert -->
    <asp:Panel ID="pnlFeedback" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom: 20px;">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblFeedback" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Controls Row -->
    <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; margin-bottom: 24px;">
        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap; flex: 1;">
            <div class="search-box" style="max-width: 360px;">
                <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                <asp:TextBox ID="txtSearchProducts" runat="server" CssClass="form-control" placeholder="Search product name, SKU..." AutoPostBack="true" OnTextChanged="FilterProducts_Changed"></asp:TextBox>
            </div>
            <asp:DropDownList ID="ddlCategoryFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterProducts_Changed">
                <asp:ListItem Value="All" Text="Category: All" Selected="True" />
                <asp:ListItem Value="Fertilizer" Text="Fertilizer" />
                <asp:ListItem Value="Seeds" Text="Seeds" />
                <asp:ListItem Value="Pesticide" Text="Pesticide" />
                <asp:ListItem Value="Tools" Text="Tools" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnAddProduct" runat="server" Text="+ Add Product" CssClass="btn btn-primary" OnClick="btnAddProduct_Click" style="background-color: #166534; font-weight: 600;" />
    </div>

    <!-- Table -->
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>PRODUCT NAME</th>
                    <th>CATEGORY</th>
                    <th>PRICE (₹)</th>
                    <th>STOCK</th>
                    <th>STATUS</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptAdminProducts" runat="server" OnItemCommand="rptAdminProducts_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>'
                                         style="width: 42px; height: 42px; border-radius: 8px; border: 1px solid #e2e8f0; object-fit: cover;"
                                         onerror="this.onerror=null;this.src='/Images/products/urea_nitrogen.jpg';" />
                                    <div>
                                        <div style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></div>
                                        <div style="font-size: 0.6875rem; color: #94a3b8; font-family: monospace;">SKU: <%# Eval("Sku") %></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="badge" style="background-color: #f1f5f9; color: #475569;"><%# Eval("Category") %></span>
                            </td>
                            <td style="font-weight: 700; color: #0f172a;">₹<%# Eval("Price", "{0:N2}") %></td>
                            <td style="font-weight: 600;"><%# Eval("StockLevel") %></td>
                            <td>
                                <span class="badge" style='background-color:<%# GetStatusBg(Eval("Status") as string) %>;color:<%# GetStatusColor(Eval("Status") as string) %>;'>
                                    <%# Eval("Status") %>
                                </span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 8px;">
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditItem" CommandArgument='<%# Eval("Sku") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #166534; font-weight: 600;">✎ Edit</asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("Sku") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #dc2626; font-weight: 600;" OnClientClick="return confirm('Are you sure you want to delete this product?');">🗑 Delete</asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

    <!-- Modal Form Overlay -->
    <asp:Panel ID="pnlModal" runat="server" Visible="false" CssClass="modal-overlay">
        <div class="modal-card">
            <div class="modal-header">
                <h3 style="font-size: 1.25rem; font-weight: 700; color: #0f172a;">
                    <asp:Label ID="lblModalTitle" runat="server" Text="Add Product"></asp:Label>
                </h3>
                <asp:Button ID="btnCloseModal" runat="server" Text="✕" CssClass="btn btn-secondary btn-sm" OnClick="btnCancel_Click" style="border: none; font-size: 1.1rem; padding: 2px 8px;" />
            </div>

            <asp:HiddenField ID="hfEditId" runat="server" />

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Product Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtProdName" runat="server" CssClass="form-control" placeholder="e.g. Neem Oil Organic Concentrate"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">SKU Code <span class="required">*</span></label>
                    <asp:TextBox ID="txtSku" runat="server" CssClass="form-control" placeholder="e.g. PEST-NEEM-100"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Category <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Fertilizer" Text="Fertilizer" />
                        <asp:ListItem Value="Seeds" Text="Seeds" />
                        <asp:ListItem Value="Pesticide" Text="Pesticide" />
                        <asp:ListItem Value="Tools" Text="Tools" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label">Product Sub-type / Grade</label>
                    <asp:TextBox ID="txtType" runat="server" CssClass="form-control" placeholder="e.g. Organic Bio-Pesticide"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Price (₹)</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="e.g. 350.00"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Stock Level</label>
                    <asp:TextBox ID="txtStockLevel" runat="server" CssClass="form-control" placeholder="e.g. 150"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">NPK Ratio (if applicable)</label>
                    <asp:TextBox ID="txtNpkRatio" runat="server" CssClass="form-control" placeholder="e.g. 46-0-0"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Target Pest (if applicable)</label>
                    <asp:TextBox ID="txtTargetPest" runat="server" CssClass="form-control" placeholder="e.g. Aphids, Whiteflies"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="In Stock" Text="In Stock" />
                        <asp:ListItem Value="Low Stock" Text="Low Stock" />
                        <asp:ListItem Value="Out of Stock" Text="Out of Stock" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label">Image URL / Path</label>
                    <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" placeholder="/Images/products/neem_oil_concentrate.jpg"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Product Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Detailed product description..."></asp:TextBox>
            </div>

            <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 20px;">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Save Product" CssClass="btn btn-primary" OnClick="btnSave_Click" style="background-color: #166534; font-weight: 600;" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
