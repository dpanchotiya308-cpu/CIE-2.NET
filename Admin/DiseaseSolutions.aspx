<%@ Page Title="Disease Solutions Management" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="DiseaseSolutions.aspx.cs" Inherits="KhedutPlus.Admin.DiseaseSolutions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .severity-badge {
        display: inline-block;
        padding: 3px 10px;
        border-radius: 9999px;
        font-size: 0.75rem;
        font-weight: 600;
    }
    .severity-fungal  { background-color: #fef9c3; color: #854d0e; }
    .severity-viral   { background-color: #fee2e2; color: #991b1b; }
    .severity-bacterial { background-color: #dbeafe; color: #1e40af; }
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

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Disease Solutions Management</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Add, edit, or delete crop disease solutions, remedies, and treatment guides.</asp:Content>

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
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search disease name, crop..." AutoPostBack="true" OnTextChanged="Filter_Changed"></asp:TextBox>
            </div>
            <asp:DropDownList ID="ddlTypeFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
                <asp:ListItem Value="All" Text="Type: All" Selected="True" />
                <asp:ListItem Value="Fungal" Text="Fungal" />
                <asp:ListItem Value="Viral" Text="Viral" />
                <asp:ListItem Value="Bacterial" Text="Bacterial" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnAddDisease" runat="server" Text="+ Add Disease Solution" CssClass="btn btn-primary" OnClick="btnAddDisease_Click" style="background-color: #166534; font-weight: 600;" />
    </div>

    <!-- Table -->
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>DISEASE NAME</th>
                    <th>AFFECTED CROP</th>
                    <th>CATEGORY</th>
                    <th>SYMPTOM SUMMARY</th>
                    <th>SEVERITY</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptDiseases" runat="server" OnItemCommand="rptDiseases_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>'
                                         onerror="this.onerror=null;this.src='/Images/diseases/paddy_blast.jpg';"
                                         style="width: 40px; height: 40px; border-radius: 8px; border: 1px solid #e2e8f0; object-fit: cover;" />
                                    <div style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></div>
                                </div>
                            </td>
                            <td>
                                <span class="badge" style="background-color: #f0fdf4; color: #166534; border: 1px solid #bbf7d0;"><%# Eval("AffectsCrop") %></span>
                            </td>
                            <td>
                                <span class='<%# GetTypeCss(Eval("Category") as string) %> severity-badge'><%# Eval("Category") %></span>
                            </td>
                            <td style="color: #475569; font-size: 0.8125rem; max-width: 240px;"><%# TruncateText(Eval("Symptom") as string, 70) %></td>
                            <td>
                                <span class='<%# GetTypeCss(Eval("Category") as string) %> severity-badge'><%# GetSeverity(Eval("Category") as string) %></span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 8px;">
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #166534; font-weight: 600;">✎ Edit</asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-secondary btn-sm" style="padding: 4px 10px; color: #dc2626; font-weight: 600;" OnClientClick="return confirm('Are you sure you want to delete this disease solution?');">🗑 Delete</asp:LinkButton>
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
                    <asp:Label ID="lblModalTitle" runat="server" Text="Add Disease Solution"></asp:Label>
                </h3>
                <asp:Button ID="btnCloseModal" runat="server" Text="✕" CssClass="btn btn-secondary btn-sm" OnClick="btnCancel_Click" style="border: none; font-size: 1.1rem; padding: 2px 8px;" />
            </div>

            <asp:HiddenField ID="hfEditId" runat="server" />

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Disease Name <span class="required">*</span></label>
                    <asp:TextBox ID="txtDiseaseName" runat="server" CssClass="form-control" placeholder="e.g. Paddy Blast"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Affected Crop <span class="required">*</span></label>
                    <asp:TextBox ID="txtAffectsCrop" runat="server" CssClass="form-control" placeholder="e.g. Paddy / Rice"></asp:TextBox>
                </div>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Category <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Fungal" Text="Fungal" />
                        <asp:ListItem Value="Viral" Text="Viral" />
                        <asp:ListItem Value="Bacterial" Text="Bacterial" />
                        <asp:ListItem Value="Insect" Text="Insect / Pest" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label">Severity Level</label>
                    <asp:DropDownList ID="ddlSeverity" runat="server" CssClass="form-control">
                        <asp:ListItem Value="High" Text="High Priority" />
                        <asp:ListItem Value="Moderate" Text="Moderate" />
                        <asp:ListItem Value="Low" Text="Low / Seasonal" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Key Symptoms & Identification</label>
                <asp:TextBox ID="txtSymptom" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Spindle-shaped lesions on leaves..."></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Chemical & Biological Treatment Protocol</label>
                <asp:TextBox ID="txtTreatment" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Spray Tricyclazole 75% WP @ 0.6 g/L..."></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Prevention & Cultural Controls</label>
                <asp:TextBox ID="txtPrevention" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Use disease-resistant seed varieties..."></asp:TextBox>
            </div>

            <div class="grid-2col">
                <div class="form-group">
                    <label class="form-label">Recommended Agro Products</label>
                    <asp:TextBox ID="txtRecommendedProducts" runat="server" CssClass="form-control" placeholder="Tricyclazole 75% WP, Carbendazim"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Image URL / Path</label>
                    <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" placeholder="/Images/diseases/paddy_blast.jpg"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Overview Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Detailed disease information..."></asp:TextBox>
            </div>

            <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 20px;">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Save Disease Solution" CssClass="btn btn-primary" OnClick="btnSave_Click" style="background-color: #166534; font-weight: 600;" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
