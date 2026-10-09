<%@ Page Title="Edit Inventory Product" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="EditInventory.aspx.cs" Inherits="KhedutPlus.Shop.EditInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .edit-prod-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 24px;
        flex-wrap: wrap;
        gap: 16px;
    }
    .form-layout-grid {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 28px;
    }
    .image-preview-wrapper {
        background-color: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        padding: 16px;
        text-align: center;
        margin-bottom: 14px;
        min-height: 180px;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }
    .preview-box {
        max-width: 100%;
        max-height: 180px;
        width: auto;
        height: auto;
        object-fit: contain;
        border-radius: 8px;
        display: block;
        box-shadow: 0 1px 3px rgba(0,0,0,0.08);
    }
    @media (max-width: 900px) {
        .form-layout-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Top Action Bar -->
    <div class="edit-prod-header">
        <div>
            <a href="/Shop/Inventory.aspx" style="color: #64748b; font-size: 0.875rem; display: inline-flex; align-items: center; gap: 6px; margin-bottom: 6px; text-decoration: none;">
                <span>&larr;</span>
                <span>Back to Inventory</span>
            </a>
            <h1 class="page-title"><asp:Label ID="lblEditTitle" runat="server" Text="Edit Inventory Product"></asp:Label></h1>
            <p class="page-subtitle">Update stock count, pricing, category, and specifications.</p>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnCancel_Click" />
            <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="btn btn-primary" ValidationGroup="vgEditProduct" OnClick="btnSaveChanges_Click" style="background-color: #166534;" />
        </div>
    </div>

    <!-- ASP.NET ValidationSummary -->
    <asp:ValidationSummary ID="valSummaryEditProduct" runat="server" ValidationGroup="vgEditProduct" CssClass="validation-summary-box" HeaderText="Please correct the following input errors:" DisplayMode="BulletList" />

    <!-- Feedback Message -->
    <asp:Panel ID="pnlEditSuccess" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblEditSuccess" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Two-Column Form -->
    <div class="form-layout-grid">
        <!-- Left Column -->
        <div>
            <!-- Basic Information Card -->
            <div class="card" style="margin-bottom: 24px;">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 20px;">Basic Information</h2>

                <div class="form-group">
                    <label class="form-label" for="txtProductName">Product Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" placeholder="e.g. Urea Nitrogen 46%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="txtProductName" ValidationGroup="vgEditProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Product name is required." />
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="ddlCategory">Category <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Text="Select category" />
                            <asp:ListItem Value="Fertilizers" Text="Fertilizers" />
                            <asp:ListItem Value="Seeds" Text="Seeds" />
                            <asp:ListItem Value="Pesticides" Text="Pesticides" />
                            <asp:ListItem Value="Tools" Text="Tools &amp; Equipment" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory" InitialValue="" ValidationGroup="vgEditProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please select a product category." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtSku">SKU (Stock Keeping Unit) <span class="required">*</span></label>
                        <asp:TextBox ID="txtSku" runat="server" CssClass="form-control" ReadOnly="true" style="background-color: #f1f5f9; cursor: not-allowed;"></asp:TextBox>
                        <span style="font-size: 0.75rem; color: #94a3b8; margin-top: 4px; display: block;">SKU is locked as unique item identifier.</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtProductDescription">Product Description</label>
                    <asp:TextBox ID="txtProductDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Enter detailed product description..."></asp:TextBox>
                </div>
            </div>

            <!-- Inventory & Pricing Card -->
            <div class="card">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 20px;">Inventory &amp; Pricing</h2>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtCurrentStock">Stock Quantity <span class="required">*</span></label>
                        <asp:TextBox ID="txtCurrentStock" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCurrentStock" runat="server" ControlToValidate="txtCurrentStock" ValidationGroup="vgEditProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Stock quantity is required." />
                        <asp:RangeValidator ID="rvCurrentStock" runat="server" ControlToValidate="txtCurrentStock" ValidationGroup="vgEditProduct" Type="Integer" MinimumValue="0" MaximumValue="100000" Display="Dynamic" CssClass="validation-error" ErrorMessage="Stock must be between 0 and 100,000." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtReorderLevel">Reorder Level <span class="required">*</span></label>
                        <asp:TextBox ID="txtReorderLevel" runat="server" CssClass="form-control"></asp:TextBox>
                        <span style="font-size: 0.75rem; color: #94a3b8; margin-top: 2px; display: block;">Alert when stock falls below this level.</span>
                        <asp:RequiredFieldValidator ID="rfvReorderLevel" runat="server" ControlToValidate="txtReorderLevel" ValidationGroup="vgEditProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Reorder level is required." />
                        <asp:RangeValidator ID="rvReorderLevel" runat="server" ControlToValidate="txtReorderLevel" ValidationGroup="vgEditProduct" Type="Integer" MinimumValue="1" MaximumValue="10000" Display="Dynamic" CssClass="validation-error" ErrorMessage="Reorder level must be between 1 and 10,000." />
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtSellingPrice">Unit Selling Price (₹) <span class="required">*</span></label>
                        <asp:TextBox ID="txtSellingPrice" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSellingPrice" runat="server" ControlToValidate="txtSellingPrice" ValidationGroup="vgEditProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Selling price is required." />
                        <asp:RangeValidator ID="rvSellingPrice" runat="server" ControlToValidate="txtSellingPrice" ValidationGroup="vgEditProduct" Type="Double" MinimumValue="0.01" MaximumValue="1000000.00" Display="Dynamic" CssClass="validation-error" ErrorMessage="Selling price must be greater than ₹0.00." />
                        <asp:CompareValidator ID="cmpSellingVsCost" runat="server" ControlToValidate="txtSellingPrice" ControlToCompare="txtCostPrice" Operator="GreaterThanEqual" Type="Double" ValidationGroup="vgEditProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Selling price must be greater than or equal to cost price." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtCostPrice">Cost Price (₹) <span class="required">*</span></label>
                        <asp:TextBox ID="txtCostPrice" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCostPrice" runat="server" ControlToValidate="txtCostPrice" ValidationGroup="vgEditProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Cost price is required." />
                        <asp:RangeValidator ID="rvCostPrice" runat="server" ControlToValidate="txtCostPrice" ValidationGroup="vgEditProduct" Type="Double" MinimumValue="0.00" MaximumValue="1000000.00" Display="Dynamic" CssClass="validation-error" ErrorMessage="Cost price cannot be negative." />
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div>
            <!-- Product Image -->
            <div class="card" style="margin-bottom: 24px;">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Product Image</h2>
                
                <div class="image-preview-wrapper">
                    <img id="imgPreviewTarget" src="/Images/products/urea_nitrogen.jpg" class="preview-box" alt="Product Image" />
                </div>

                <label for="fuProductImage" class="btn btn-secondary btn-sm" style="width: 100%; text-align: center; display: block; cursor: pointer; font-weight: 600; padding: 10px;">
                    <span>📷 Update Product Image</span>
                </label>
                <asp:FileUpload ID="fuProductImage" runat="server" ClientIDMode="Static" data-preview-target="imgPreviewTarget" style="display: none;" />
                <span style="font-size: 0.75rem; color: #94a3b8; display: block; text-align: center; margin-top: 8px;">PNG, JPG or WEBP (Max 5MB)</span>
            </div>

            <!-- Status Card -->
            <div class="card">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Status</h2>

                <div class="form-group">
                    <label class="form-label" for="ddlProductStatus">Product Status</label>
                    <asp:DropDownList ID="ddlProductStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="In Stock" Text="In Stock" />
                        <asp:ListItem Value="Low Stock" Text="Low Stock" />
                        <asp:ListItem Value="Out of Stock" Text="Out of Stock" />
                        <asp:ListItem Value="Archived" Text="Archived" />
                    </asp:DropDownList>
                    <span style="font-size: 0.75rem; color: #94a3b8; margin-top: 6px; display: block; line-height: 1.4;">
                        Control product visibility in store catalogue and inventory audits.
                    </span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
