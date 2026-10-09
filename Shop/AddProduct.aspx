<%@ Page Title="Add New Product" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="KhedutPlus.Shop.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .add-prod-header {
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
    <div class="add-prod-header">
        <div>
            <a href="/Shop/Inventory.aspx" style="color: #64748b; font-size: 0.875rem; display: inline-flex; align-items: center; gap: 6px; margin-bottom: 6px;">
                <span>&larr;</span>
                <span>Back to Inventory</span>
            </a>
            <h1 class="page-title">Add New Product</h1>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:Button ID="btnDiscard" runat="server" Text="Discard" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnDiscard_Click" />
            <asp:Button ID="btnSaveProduct" runat="server" Text="Save Product" CssClass="btn btn-primary" ValidationGroup="vgAddProduct" OnClick="btnSaveProduct_Click" style="background-color: #166534;" />
        </div>
    </div>

    <!-- ASP.NET ValidationSummary (Requirement 6) -->
    <asp:ValidationSummary ID="valSummaryProduct" runat="server" ValidationGroup="vgAddProduct" CssClass="validation-summary-box" HeaderText="Please correct the following input errors:" DisplayMode="BulletList" />

    <!-- Feedback Message -->
    <asp:Panel ID="pnlAddSuccess" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblAddSuccess" runat="server"></asp:Label>
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
                    <!-- (1) RequiredFieldValidator -->
                    <asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="txtProductName" ValidationGroup="vgAddProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Product name is required." />
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="ddlCategory">Category <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Text="Select category" Selected="True" />
                            <asp:ListItem Value="Fertilizers" Text="Fertilizers" />
                            <asp:ListItem Value="Seeds" Text="Seeds" />
                            <asp:ListItem Value="Pesticides" Text="Pesticides" />
                            <asp:ListItem Value="Tools" Text="Tools &amp; Equipment" />
                        </asp:DropDownList>
                        <!-- (1) RequiredFieldValidator with InitialValue -->
                        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory" InitialValue="" ValidationGroup="vgAddProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please select a product category." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtSku">SKU (Stock Keeping Unit) <span class="required">*</span></label>
                        <asp:TextBox ID="txtSku" runat="server" CssClass="form-control" placeholder="e.g. FERT-UR-46"></asp:TextBox>
                        <!-- (1) RequiredFieldValidator -->
                        <asp:RequiredFieldValidator ID="rfvSku" runat="server" ControlToValidate="txtSku" ValidationGroup="vgAddProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="SKU is required." />
                        <!-- (4) RegularExpressionValidator -->
                        <asp:RegularExpressionValidator ID="revSku" runat="server" ControlToValidate="txtSku" ValidationGroup="vgAddProduct" ValidationExpression="^[A-Za-z0-9\-]{4,15}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="SKU must be in standard format (e.g. FERT-UR-46)." />
                        <!-- (5) CustomValidator with ClientValidationFunction and ServerValidate -->
                        <asp:CustomValidator ID="cvSku" runat="server" ControlToValidate="txtSku" ValidationGroup="vgAddProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="SKU code format is invalid or already registered." ClientValidationFunction="ValidateSkuFormat" OnServerValidate="cvSku_ServerValidate" />
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
                        <label class="form-label" for="txtInitialStock">Initial Stock Quantity <span class="required">*</span></label>
                        <asp:TextBox ID="txtInitialStock" runat="server" CssClass="form-control" Text="0"></asp:TextBox>
                        <!-- (1) RequiredFieldValidator -->
                        <asp:RequiredFieldValidator ID="rfvInitialStock" runat="server" ControlToValidate="txtInitialStock" ValidationGroup="vgAddProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Initial stock quantity is required." />
                        <!-- (3) RangeValidator -->
                        <asp:RangeValidator ID="rvInitialStock" runat="server" ControlToValidate="txtInitialStock" ValidationGroup="vgAddProduct" Type="Integer" MinimumValue="0" MaximumValue="100000" Display="Dynamic" CssClass="validation-error" ErrorMessage="Initial stock must be an integer between 0 and 100,000." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtReorderLevel">Reorder Level <span class="required">*</span></label>
                        <asp:TextBox ID="txtReorderLevel" runat="server" CssClass="form-control" Text="10"></asp:TextBox>
                        <span style="font-size: 0.75rem; color: #94a3b8; margin-top: 2px; display: block;">Alert when stock falls below this level.</span>
                        <!-- (1) RequiredFieldValidator -->
                        <asp:RequiredFieldValidator ID="rfvReorderLevel" runat="server" ControlToValidate="txtReorderLevel" ValidationGroup="vgAddProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Reorder level is required." />
                        <!-- (3) RangeValidator -->
                        <asp:RangeValidator ID="rvReorderLevel" runat="server" ControlToValidate="txtReorderLevel" ValidationGroup="vgAddProduct" Type="Integer" MinimumValue="1" MaximumValue="10000" Display="Dynamic" CssClass="validation-error" ErrorMessage="Reorder level must be between 1 and 10,000." />
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtSellingPrice">Unit Selling Price (₹)  <span class="required">*</span></label>
                        <asp:TextBox ID="txtSellingPrice" runat="server" ClientIDMode="Static" CssClass="form-control" Text="0.00"></asp:TextBox>
                        <!-- (1) RequiredFieldValidator -->
                        <asp:RequiredFieldValidator ID="rfvSellingPrice" runat="server" ControlToValidate="txtSellingPrice" ValidationGroup="vgAddProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Selling price is required." />
                        <!-- (3) RangeValidator -->
                        <asp:RangeValidator ID="rvSellingPrice" runat="server" ControlToValidate="txtSellingPrice" ValidationGroup="vgAddProduct" Type="Double" MinimumValue="0.01" MaximumValue="1000000.00" Display="Dynamic" CssClass="validation-error" ErrorMessage="Selling price must be greater than ₹0.00." />
                        <!-- (2) CompareValidator: Selling price >= Cost price -->
                        <asp:CompareValidator ID="cmpSellingVsCost" runat="server" ControlToValidate="txtSellingPrice" ControlToCompare="txtCostPrice" Operator="GreaterThanEqual" Type="Double" ValidationGroup="vgAddProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Selling price must be greater than or equal to cost price." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtCostPrice">Cost Price (₹) <span class="required">*</span></label>
                        <asp:TextBox ID="txtCostPrice" runat="server" ClientIDMode="Static" CssClass="form-control" Text="0.00"></asp:TextBox>
                        <!-- (1) RequiredFieldValidator -->
                        <asp:RequiredFieldValidator ID="rfvCostPrice" runat="server" ControlToValidate="txtCostPrice" ValidationGroup="vgAddProduct" Display="Dynamic" CssClass="validation-error" ErrorMessage="Cost price is required." />
                        <!-- (3) RangeValidator -->
                        <asp:RangeValidator ID="rvCostPrice" runat="server" ControlToValidate="txtCostPrice" ValidationGroup="vgAddProduct" Type="Double" MinimumValue="0.00" MaximumValue="1000000.00" Display="Dynamic" CssClass="validation-error" ErrorMessage="Cost price cannot be negative." />
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
                    <img id="imgPreviewTarget" src="/Images/products/urea_nitrogen.jpg" class="preview-box" alt="Product Image Preview" />
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
                        <asp:ListItem Value="Active" Text="Active" Selected="True" />
                        <asp:ListItem Value="Draft" Text="Draft" />
                        <asp:ListItem Value="Archived" Text="Archived" />
                    </asp:DropDownList>
                    <span style="font-size: 0.75rem; color: #94a3b8; margin-top: 6px; display: block; line-height: 1.4;">
                        Active products are visible in inventory and sales channels.
                    </span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
