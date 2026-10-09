<%@ Page Title="Manage Pesticides Database" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Pesticides.aspx.cs" Inherits="KhedutPlus.Admin.Pesticides" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .toxicity-high     { background-color: #fee2e2; color: #991b1b; }
    .toxicity-moderate { background-color: #fef9c3; color: #854d0e; }
    .toxicity-safe     { background-color: #f0fdf4; color: #166534; }
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

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Manage Pesticides Database</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Add, edit, or delete pesticide information, safety instructions, and dosage protocols.</asp:Content>

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
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search pesticide name or target pest..." AutoPostBack="true" OnTextChanged="Filter_Changed"></asp:TextBox>
            </div>
            <asp:DropDownList ID="ddlTypeFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
                <asp:ListItem Value="All" Text="Type: All" Selected="True" />
                <asp:ListItem Value="Insecticides" Text="Insecticides" />
                <asp:ListItem Value="Fungicides" Text="Fungicides" />
                <asp:ListItem Value="Bio-pesticides" Text="Bio-pesticides" />
                <asp:ListItem Value="Herbicide" Text="Herbicide" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnAddPesticide" runat="server" Text="+ Add Pesticide" CssClass="btn btn-primary" OnClick="btnAddPesticide_Click" style="background-color: #166534; font-weight: 600;" />
    </div>

    <!-- Table -->
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>PESTICIDE NAME</th>
                    <th>CATEGORY</th>
                    <th>TARGET PESTS</th>
                    <th>TOXICITY LEVEL</th>
                    <th>DOSAGE PROTOCOL</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptPesticides" runat="server" OnItemCommand="rptPesticides_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>'
                                         onerror="this.onerror=null;this.src='/Images/pesticides/chlorpyrifos.jpg';"
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
                            <td style="color: #475569; font-size: 0.8125rem;"><%# Eval("Targets") %></td>
                            <td>
                                <span class='badge <%# GetToxicityCss(Eval("ToxicityLevel") as string) %>'><%# Eval("ToxicityLevel") %></span>
                            </td>
                            <td style="color: #64748b; font-size: 0.8125rem;"><%# Eval("Dosage") %></td>
                            <td>
                                <div style="display: flex; gap: 8px;">
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #166534; font-weight: 600;">✎ Edit</asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #dc2626; font-weight: 600;" OnClientClick="return confirm('Are you sure you want to delete this pesticide?');">🗑 Delete</asp:LinkButton>
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
                    <asp:Label ID="lblModalTitle" runat="server" Text="Add Pesticide"></asp:Label>
                </h3>
                <asp:Button ID="btnCloseModal" runat="server" Text="✕" CssClass="btn btn-secondary btn-sm" OnClick="btnCancel_Click" style="border: none; font-size: 1.1rem; padding: 2px 8px;" />
            </div>

            <asp:HiddenField ID="hfEditId" runat="server" />

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Pesticide Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtPestName" runat="server" CssClass="form-control" placeholder="e.g. Chlorpyrifos 20% EC"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">SKU Code <span class="required">*</span></label>
                    <asp:TextBox ID="txtSku" runat="server" CssClass="form-control" placeholder="e.g. PEST-CHLOR-20"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Category / Type <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Insecticides" Text="Insecticides" />
                        <asp:ListItem Value="Fungicides" Text="Fungicides" />
                        <asp:ListItem Value="Bio-pesticides" Text="Bio-pesticides" />
                        <asp:ListItem Value="Herbicide" Text="Herbicide" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label">Toxicity Level <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlToxicityLevel" runat="server" CssClass="form-control">
                        <asp:ListItem Value="High Toxicity" Text="High Toxicity (Warning Red)" />
                        <asp:ListItem Value="Moderate Toxicity" Text="Moderate Toxicity (Yellow)" />
                        <asp:ListItem Value="Safe/Organic" Text="Safe / Organic (Green)" />
                        <asp:ListItem Value="Low Toxicity" Text="Low Toxicity" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Target Pests & Insects</label>
                    <asp:TextBox ID="txtTargets" runat="server" CssClass="form-control" placeholder="e.g. Termites, stem borers, aphids, cutworms"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Recommended Dosage</label>
                    <asp:TextBox ID="txtDosage" runat="server" CssClass="form-control" placeholder="e.g. 2.0 ml per liter of water"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Spraying & Application Method</label>
                <asp:TextBox ID="txtApplicationMethod" runat="server" CssClass="form-control" placeholder="e.g. Foliar spray during early morning or evening hours"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Suitable Crops</label>
                <asp:TextBox ID="txtSuitableCrops" runat="server" CssClass="form-control" placeholder="e.g. Paddy, Cotton, Sugarcane, Pulses, Vegetables"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Safety Precautions & PPE Required</label>
                <asp:TextBox ID="txtSafetyPrecautions" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Wear full protective gloves, face mask, goggles..."></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Emergency Antidote & First Aid</label>
                <asp:TextBox ID="txtAntidoteFirstAid" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="If swallowed induce vomiting, rinse eyes with water..."></asp:TextBox>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Image URL / Path</label>
                    <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" placeholder="/Images/pesticides/chlorpyrifos.jpg"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="In Stock" Text="In Stock" />
                        <asp:ListItem Value="Low Stock" Text="Low Stock" />
                        <asp:ListItem Value="Out of Stock" Text="Out of Stock" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Product Overview Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Detailed pesticide description..."></asp:TextBox>
            </div>

            <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 20px;">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Save Pesticide" CssClass="btn btn-primary" OnClick="btnSave_Click" style="background-color: #166534; font-weight: 600;" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
