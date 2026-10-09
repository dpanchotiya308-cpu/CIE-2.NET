<%@ Page Title="Government Schemes Management" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Schemes.aspx.cs" Inherits="KhedutPlus.Admin.Schemes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .scheme-icon-circle {
        width: 36px;
        height: 36px;
        border-radius: 8px;
        background-color: #f1f5f9;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.125rem;
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

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Government Schemes Management</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Add, edit, or delete government subsidies, welfare schemes, and application portals for farmers.</asp:Content>

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
                <asp:TextBox ID="txtSearchSchemesAdmin" runat="server" CssClass="form-control" placeholder="Search schemes by title or category..." AutoPostBack="true" OnTextChanged="FilterSchemesAdmin_Changed"></asp:TextBox>
            </div>
            <asp:DropDownList ID="ddlAdminCategoryFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterSchemesAdmin_Changed">
                <asp:ListItem Value="All" Text="Category: All" Selected="True" />
                <asp:ListItem Value="Financial Support" Text="Financial Support" />
                <asp:ListItem Value="Solar Subsidy" Text="Solar Subsidy" />
                <asp:ListItem Value="Crop Insurance" Text="Crop Insurance" />
                <asp:ListItem Value="Equipment Subsidy" Text="Equipment Subsidy" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnAddScheme" runat="server" Text="+ Add Scheme" CssClass="btn btn-primary" OnClick="btnAddScheme_Click" style="background-color: #166534; font-weight: 600;" />
    </div>

    <!-- Table -->
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>SCHEME NAME</th>
                    <th>CATEGORY</th>
                    <th>SUBSIDY / BENEFIT</th>
                    <th>STATUS</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptAdminSchemes" runat="server" OnItemCommand="rptAdminSchemes_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 14px;">
                                    <div class="scheme-icon-circle">🏛️</div>
                                    <div>
                                        <div style="font-weight: 700; color: #0f172a;"><%# Eval("Name") %></div>
                                        <div style="font-size: 0.75rem; color: #166534; font-weight: 600;"><%# Eval("Ministry") %></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="badge" style="background-color: #f1f5f9; color: #475569;"><%# Eval("Category") %></span>
                            </td>
                            <td style="font-weight: 700; color: #166534;"><%# Eval("BenefitBadge") %></td>
                            <td>
                                <span class="badge" style="background-color: #dcfce7; color: #166534; font-weight: 700;"><%# Eval("Status") %></span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 8px;">
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #166534; font-weight: 600;">✎ Edit</asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #dc2626; font-weight: 600;" OnClientClick="return confirm('Are you sure you want to delete this scheme?');">🗑 Delete</asp:LinkButton>
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
                    <asp:Label ID="lblModalTitle" runat="server" Text="Add Government Scheme"></asp:Label>
                </h3>
                <asp:Button ID="btnCloseModal" runat="server" Text="✕" CssClass="btn btn-secondary btn-sm" OnClick="btnCancel_Click" style="border: none; font-size: 1.1rem; padding: 2px 8px;" />
            </div>

            <asp:HiddenField ID="hfEditId" runat="server" />

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Scheme Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtSchemeTitle" runat="server" CssClass="form-control" placeholder="e.g. PM-Kisan Samman Nidhi"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Ministry / Department <span class="required">*</span></label>
                    <asp:TextBox ID="txtMinistry" runat="server" CssClass="form-control" placeholder="e.g. Ministry of Agriculture"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Category <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Financial Support" Text="Financial Support" />
                        <asp:ListItem Value="Solar Subsidy" Text="Solar Subsidy" />
                        <asp:ListItem Value="Crop Insurance" Text="Crop Insurance" />
                        <asp:ListItem Value="Equipment Subsidy" Text="Equipment Subsidy" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label">Subsidy / Benefit Percentage</label>
                    <asp:TextBox ID="txtSubsidyPercentage" runat="server" CssClass="form-control" placeholder="e.g. 100% Direct Benefit (₹6,000/yr)"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Eligibility Criteria</label>
                <asp:TextBox ID="txtEligibility" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Small and marginal farmers holding cultivable land..."></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Key Benefits</label>
                <asp:TextBox ID="txtBenefits" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Financial benefit of ₹6,000 per year in 3 equal installments..."></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Required Documents</label>
                <asp:TextBox ID="txtRequiredDocuments" runat="server" CssClass="form-control" placeholder="Aadhaar Card, Bank Passbook, Land 7/12 & 8A extract"></asp:TextBox>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Official Application Portal URL</label>
                    <asp:TextBox ID="txtApplyUrl" runat="server" CssClass="form-control" placeholder="https://pmkisan.gov.in"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Active" Text="Active" />
                        <asp:ListItem Value="Upcoming" Text="Upcoming" />
                        <asp:ListItem Value="Closed" Text="Closed" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Scheme Description Overview</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Detailed scheme description..."></asp:TextBox>
            </div>

            <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 20px;">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Save Scheme" CssClass="btn btn-primary" OnClick="btnSave_Click" style="background-color: #166534; font-weight: 600;" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
