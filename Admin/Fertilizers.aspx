<%@ Page Title="Manage Fertilizers Database" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Fertilizers.aspx.cs" Inherits="KhedutPlus.Admin.Fertilizers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .npk-chip {
        display: inline-block;
        background-color: #f0fdf4;
        color: #166534;
        border: 1px solid #bbf7d0;
        border-radius: 6px;
        padding: 2px 10px;
        font-size: 0.75rem;
        font-weight: 700;
        font-family: monospace;
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

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Manage Fertilizers Database</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Add, edit, or delete fertilizer information, NPK composition, and usage guides.</asp:Content>

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
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search fertilizer name or SKU..." AutoPostBack="true" OnTextChanged="Filter_Changed"></asp:TextBox>
            </div>
            <asp:DropDownList ID="ddlCategoryFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
                <asp:ListItem Value="All" Text="Category: All" Selected="True" />
                <asp:ListItem Value="Nitrogenous" Text="Nitrogenous" />
                <asp:ListItem Value="Complex" Text="Complex" />
                <asp:ListItem Value="Potassic" Text="Potassic" />
                <asp:ListItem Value="Organic/Bio" Text="Organic/Bio" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnAddFertilizer" runat="server" Text="+ Add Fertilizer" CssClass="btn btn-primary" OnClick="btnAddFertilizer_Click" style="background-color: #166534; font-weight: 600;" />
    </div>

    <!-- Table -->
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>FERTILIZER NAME</th>
                    <th>CATEGORY</th>
                    <th>NPK RATIO</th>
                    <th>PRICE (₹)</th>
                    <th>PRIMARY BENEFIT</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptFertilizers" runat="server" OnItemCommand="rptFertilizers_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>'
                                         onerror="this.onerror=null;this.src='/Images/fertilizers/urea.jpg';"
                                         style="width: 40px; height: 40px; border-radius: 8px; border: 1px solid #e2e8f0; object-fit: contain; background: #f8fafc;" />
                                    <div>
                                        <div style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></div>
                                        <div style="font-size: 0.6875rem; color: #94a3b8; font-family: monospace;">SKU: <%# Eval("Sku") %></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="badge" style="background-color: #f1f5f9; color: #475569;"><%# Eval("Category") %></span>
                            </td>
                            <td>
                                <span class="npk-chip"><%# Eval("NpkRatio") %></span>
                            </td>
                            <td style="color: #0f172a; font-weight: 700;">₹<%# Eval("Price", "{0:N2}") %></td>
                            <td style="color: #64748b; font-size: 0.8125rem;"><%# Eval("KeyFeature1") %></td>
                            <td>
                                <div style="display: flex; gap: 8px;">
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #166534; font-weight: 600;">✎ Edit</asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #dc2626; font-weight: 600;" OnClientClick="return confirm('Are you sure you want to delete this fertilizer?');">🗑 Delete</asp:LinkButton>
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
                    <asp:Label ID="lblModalTitle" runat="server" Text="Add Fertilizer"></asp:Label>
                </h3>
                <asp:Button ID="btnCloseModal" runat="server" Text="✕" CssClass="btn btn-secondary btn-sm" OnClick="btnCancel_Click" style="border: none; font-size: 1.1rem; padding: 2px 8px;" />
            </div>

            <asp:HiddenField ID="hfEditId" runat="server" />

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Fertilizer Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtFertName" runat="server" CssClass="form-control" placeholder="e.g. Urea 46% N"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">SKU Code <span class="required">*</span></label>
                    <asp:TextBox ID="txtSku" runat="server" CssClass="form-control" placeholder="e.g. FERT-UREA-46"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Category <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Nitrogenous" Text="Nitrogenous" />
                        <asp:ListItem Value="Complex" Text="Complex" />
                        <asp:ListItem Value="Potassic" Text="Potassic" />
                        <asp:ListItem Value="Organic/Bio" Text="Organic/Bio" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label">NPK Composition Ratio</label>
                    <asp:TextBox ID="txtNpkRatio" runat="server" CssClass="form-control" placeholder="e.g. 46-0-0"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Price per Bag (₹)</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="e.g. 266.50"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Image URL / Path</label>
                    <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" placeholder="/Images/fertilizers/urea.jpg"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Primary Benefit / Key Feature 1</label>
                    <asp:TextBox ID="txtKeyFeature1" runat="server" CssClass="form-control" placeholder="e.g. High nitrogen content for foliage growth"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Secondary Feature / Key Feature 2</label>
                    <asp:TextBox ID="txtKeyFeature2" runat="server" CssClass="form-control" placeholder="e.g. Quick-release water soluble formulation"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Recommended Dosage</label>
                <asp:TextBox ID="txtRecommendedDosage" runat="server" CssClass="form-control" placeholder="e.g. 45-50 kg per acre in split doses"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Application Method</label>
                <asp:TextBox ID="txtApplicationMethod" runat="server" CssClass="form-control" placeholder="e.g. Broadcast evenly before irrigation"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Suitable Crops</label>
                <asp:TextBox ID="txtSuitableCrops" runat="server" CssClass="form-control" placeholder="e.g. Wheat, Paddy, Cotton, Maize, Vegetables"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Safety & Storage Instructions</label>
                <asp:TextBox ID="txtSafetyTips" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Store in cool dry place away from humidity..."></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Product Overview Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Detailed fertilizer description..."></asp:TextBox>
            </div>

            <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 20px;">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Save Fertilizer" CssClass="btn btn-primary" OnClick="btnSave_Click" style="background-color: #166534; font-weight: 600;" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
