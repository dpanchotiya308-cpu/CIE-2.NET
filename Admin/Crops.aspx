<%@ Page Title="Manage Crops" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Crops.aspx.cs" Inherits="KhedutPlus.Admin.Crops" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
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
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
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

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Manage Crops Database</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Add, edit, or remove crop information, varieties, and cultivation guides displayed on Farmer portal.</asp:Content>

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
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search crop name, Gujarati name..." AutoPostBack="true" OnTextChanged="Filter_Changed"></asp:TextBox>
            </div>
            <asp:DropDownList ID="ddlCategoryFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
                <asp:ListItem Value="All" Text="Category: All" Selected="True" />
                <asp:ListItem Value="Cereal" Text="Cereal" />
                <asp:ListItem Value="Cash Crop" Text="Cash Crop" />
                <asp:ListItem Value="Pulse" Text="Pulse" />
                <asp:ListItem Value="Oilseed" Text="Oilseed" />
                <asp:ListItem Value="Fruit / Horticulture" Text="Horticulture" />
                <asp:ListItem Value="Vegetable" Text="Vegetable" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnAddCrop" runat="server" Text="+ Add New Crop" CssClass="btn btn-primary" OnClick="btnAddCrop_Click" style="background-color: #166534; font-weight: 600;" />
    </div>

    <!-- Data Table -->
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>CROP NAME</th>
                    <th>CATEGORY</th>
                    <th>DURATION</th>
                    <th>AVG YIELD</th>
                    <th>MARKET RATE</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptCrops" runat="server" OnItemCommand="rptCrops_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>'
                                         style="width: 44px; height: 44px; border-radius: 8px; border: 1px solid #e2e8f0; object-fit: cover;"
                                         onerror="this.onerror=null;this.src='/Images/crops/wheat_banner.jpg';" />
                                    <div>
                                        <div style="font-weight: 700; color: #0f172a;"><%# Eval("Name") %></div>
                                        <div style="font-size: 0.8125rem; color: #166534; font-weight: 600;"><%# Eval("LocalName") %></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="badge" style="background-color: #f0fdf4; color: #166534; border: 1px solid #bbf7d0;"><%# Eval("Category") %></span>
                            </td>
                            <td style="color: #475569; font-size: 0.875rem;"><%# Eval("Duration") %></td>
                            <td style="color: #475569; font-size: 0.875rem; font-weight: 600;"><%# Eval("AvgYield") %></td>
                            <td style="color: #0f172a; font-weight: 700;"><%# Eval("MarketRate") %></td>
                            <td>
                                <div style="display: flex; gap: 8px;">
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #166534; font-weight: 600;">✎ Edit</asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #dc2626; font-weight: 600;" OnClientClick="return confirm('Are you sure you want to delete this crop?');">🗑 Delete</asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

    <!-- Modal Form overlay for Add/Edit -->
    <asp:Panel ID="pnlModal" runat="server" Visible="false" CssClass="modal-overlay">
        <div class="modal-card">
            <div class="modal-header">
                <h3 style="font-size: 1.25rem; font-weight: 700; color: #0f172a;">
                    <asp:Label ID="lblModalTitle" runat="server" Text="Add New Crop"></asp:Label>
                </h3>
                <asp:Button ID="btnCloseModal" runat="server" Text="✕" CssClass="btn btn-secondary btn-sm" OnClick="btnCancel_Click" style="border: none; font-size: 1.1rem; padding: 2px 8px;" />
            </div>

            <asp:HiddenField ID="hfEditCropId" runat="server" />

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Crop English Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtCropName" runat="server" CssClass="form-control" placeholder="e.g. Wheat"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Gujarati Local Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtLocalName" runat="server" CssClass="form-control" placeholder="e.g. ઘઉં (Wheat)"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Scientific Botanical Name</label>
                    <asp:TextBox ID="txtScientificName" runat="server" CssClass="form-control" placeholder="e.g. Triticum aestivum"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Category <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlCropCategory" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Cereal" Text="Cereal" />
                        <asp:ListItem Value="Cash Crop" Text="Cash Crop" />
                        <asp:ListItem Value="Pulse" Text="Pulse" />
                        <asp:ListItem Value="Oilseed" Text="Oilseed" />
                        <asp:ListItem Value="Fruit / Horticulture" Text="Fruit / Horticulture" />
                        <asp:ListItem Value="Vegetable" Text="Vegetable" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Duration (Days / Months)</label>
                    <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" placeholder="e.g. 110 - 130 Days"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Average Yield</label>
                    <asp:TextBox ID="txtAvgYield" runat="server" CssClass="form-control" placeholder="e.g. 4.5 - 5.5 t/ha"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Market Rate / MSP</label>
                    <asp:TextBox ID="txtMarketRate" runat="server" CssClass="form-control" placeholder="e.g. ₹2,275 / Quintal"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Ideal Climate</label>
                    <asp:TextBox ID="txtClimate" runat="server" CssClass="form-control" placeholder="e.g. Cool & Dry Climate"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Sowing Season</label>
                    <asp:TextBox ID="txtSowingSeason" runat="server" CssClass="form-control" placeholder="e.g. October - November (Rabi)"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Water Management</label>
                    <asp:TextBox ID="txtWater" runat="server" CssClass="form-control" placeholder="e.g. Moderate (4-6 Irrigations)"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Soil Requirement</label>
                <asp:TextBox ID="txtSoil" runat="server" CssClass="form-control" placeholder="e.g. Well-drained fertile loamy soil"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Image URL / Path</label>
                <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" placeholder="/Images/crops/wheat.jpg"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Crop Overview / Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Detailed crop description..."></asp:TextBox>
            </div>

            <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 20px;">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Save Crop" CssClass="btn btn-primary" OnClick="btnSave_Click" style="background-color: #166534; font-weight: 600;" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
