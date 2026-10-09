<%@ Page Title="Government Schemes & Subsidies (સરકારી યોજનાઓ)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="Schemes.aspx.cs" Inherits="KhedutPlus.Farmer.Schemes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    /* ── Grid ── */
    .schemes-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 24px;
    }
    @media (max-width: 1100px) { .schemes-grid { grid-template-columns: repeat(2, 1fr); } }
    @media (max-width: 700px)  { .schemes-grid { grid-template-columns: 1fr; } }

    /* ── Card ── */
    .gov-scheme-card {
        background-color: #ffffff;
        border-radius: 14px;
        border: 1px solid #e2e8f0;
        padding: 24px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        box-shadow: 0 1px 3px rgba(0,0,0,0.03);
        transition: transform 0.15s ease, box-shadow 0.15s ease;
        cursor: pointer;
    }
    .gov-scheme-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 16px rgba(0,0,0,0.08);
        border-color: #bbf7d0;
    }
    .gov-scheme-card.expanded {
        border-color: #166534;
        box-shadow: 0 8px 24px rgba(22,101,52,0.12);
    }
    .ministry-title {
        font-size: 0.6875rem;
        font-weight: 700;
        text-transform: uppercase;
        color: #64748b;
        letter-spacing: 0.05em;
        line-height: 1.4;
        flex: 1;
    }

    /* ── Detail Expand Panel ── */
    .scheme-detail-panel {
        display: none;
        margin-top: 20px;
        padding-top: 20px;
        border-top: 1px dashed #d1fae5;
        animation: fadeSlideIn 0.2s ease;
    }
    .scheme-detail-panel.open { display: block; }
    @keyframes fadeSlideIn {
        from { opacity: 0; transform: translateY(-6px); }
        to   { opacity: 1; transform: translateY(0); }
    }
    .detail-section-label {
        font-size: 0.7rem;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 0.08em;
        color: #166534;
        margin-bottom: 8px;
        display: flex;
        align-items: center;
        gap: 6px;
    }
    .detail-block {
        background-color: #f8fafc;
        border-radius: 10px;
        border: 1px solid #e2e8f0;
        padding: 14px 16px;
        margin-bottom: 14px;
    }
    .detail-block p {
        font-size: 0.8125rem;
        color: #334155;
        line-height: 1.7;
        margin: 0;
    }

    /* ── Document Tags ── */
    .doc-tags {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin-bottom: 14px;
    }
    .doc-tag {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 5px 12px;
        background-color: #f0fdf4;
        border: 1px solid #bbf7d0;
        border-radius: 8px;
        font-size: 0.775rem;
        color: #166534;
        font-weight: 500;
    }
    .doc-tag::before { content: "📄"; font-size: 0.7rem; }

    /* ── Apply Button ── */
    .btn-apply-portal {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 10px 22px;
        background-color: #166534;
        color: #ffffff;
        border-radius: 9px;
        font-size: 0.875rem;
        font-weight: 700;
        text-decoration: none;
        border: none;
        cursor: pointer;
        transition: background-color 0.15s, transform 0.15s;
        margin-top: 4px;
    }
    .btn-apply-portal:hover {
        background-color: #14532d;
        color: #ffffff;
        transform: translateY(-1px);
        text-decoration: none;
    }
    .btn-apply-portal svg { flex-shrink: 0; }

    /* ── Toggle Link ── */
    .toggle-details-btn {
        background: none;
        border: none;
        color: #166534;
        font-size: 0.875rem;
        font-weight: 600;
        cursor: pointer;
        padding: 0;
        display: inline-flex;
        align-items: center;
        gap: 4px;
        text-decoration: none;
    }
    .toggle-details-btn:hover { text-decoration: underline; color: #14532d; }

    /* ── Status badges ── */
    .status-badge-apply  { background-color: #dcfce7; color: #166534; }
    .status-badge-enrolled { background-color: #eff6ff; color: #1d4ed8; }
    .status-badge-active { background-color: #f0fdf4; color: #15803d; }

    /* ── Info row (deadline/apps) ── */
    .scheme-info-row {
        display: flex;
        gap: 16px;
        flex-wrap: wrap;
        margin-bottom: 14px;
    }
    .scheme-info-chip {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        font-size: 0.75rem;
        color: #64748b;
    }

    /* ── Steps ── */
    .how-steps {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .how-steps li {
        font-size: 0.8125rem;
        color: #334155;
        padding: 5px 0 5px 28px;
        position: relative;
        line-height: 1.6;
        border-bottom: 1px solid #f1f5f9;
    }
    .how-steps li:last-child { border-bottom: none; }
    .how-steps li::before {
        content: attr(data-step);
        position: absolute;
        left: 0;
        top: 5px;
        width: 20px;
        height: 20px;
        background-color: #166534;
        color: white;
        border-radius: 50%;
        font-size: 0.65rem;
        font-weight: 800;
        display: flex;
        align-items: center;
        justify-content: center;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">

    <!-- Header -->
    <div style="margin-bottom: 24px;">
        <h1 class="page-title">Government Schemes &amp; Subsidies (સરકારી યોજનાઓ)</h1>
        <p class="page-subtitle">Explore central and state level agricultural welfare schemes. Click on any scheme to view full details, required documents, and apply directly on the official government portal.</p>
    </div>

    <!-- Filters Row -->
    <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; margin-bottom: 28px;">
        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
            <asp:DropDownList ID="ddlAuthority" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterSchemes_Changed">
                <asp:ListItem Value="All" Text="All Authorities (Central / State)" Selected="True" />
                <asp:ListItem Value="Central" Text="Central Sector Schemes" />
                <asp:ListItem Value="Gujarat" Text="State Level Subsidies" />
            </asp:DropDownList>

            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterSchemes_Changed">
                <asp:ListItem Value="All" Text="All Categories" Selected="True" />
                <asp:ListItem Value="Direct Benefit" Text="Direct Benefit" />
                <asp:ListItem Value="Government Subsidy" Text="Government Subsidy" />
                <asp:ListItem Value="State Level Subsidy" Text="State Level Subsidy" />
                <asp:ListItem Value="Infrastructure Aid" Text="Infrastructure Aid" />
                <asp:ListItem Value="Fertilizer Subsidy" Text="Fertilizer Subsidy" />
                <asp:ListItem Value="Horticulture Focus" Text="Horticulture Focus" />
                <asp:ListItem Value="Crop Insurance" Text="Crop Insurance" />
            </asp:DropDownList>
        </div>

        <div class="search-box" style="max-width: 300px;">
            <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            <asp:TextBox ID="txtSearchSchemes" runat="server" CssClass="form-control" placeholder="Search schemes..." AutoPostBack="true" OnTextChanged="FilterSchemes_Changed"></asp:TextBox>
        </div>
    </div>

    <!-- Total count -->
    <p style="font-size: 0.8125rem; color: #64748b; margin-bottom: 20px;">
        Showing <strong><asp:Label ID="lblSchemeCount" runat="server">9</asp:Label></strong> schemes. Click any scheme card to expand details.
    </p>

    <!-- Schemes Grid -->
    <div class="schemes-grid">
        <asp:Repeater ID="rptSchemes" runat="server">
            <ItemTemplate>
                <div class="gov-scheme-card" id="card-<%# Eval("Id") %>" onclick="toggleSchemeDetails('<%# Eval("Id") %>', this)">

                    <!-- Card Top -->
                    <div>
                        <!-- Ministry + Category badge -->
                        <div style="display: flex; align-items: flex-start; justify-content: space-between; gap: 12px; margin-bottom: 12px;">
                            <span class="ministry-title"><%# Eval("Ministry") %></span>
                            <span class="badge" style="background-color: #f0fdf4; color: #166534; border: 1px solid #bbf7d0; white-space: nowrap;"><%# Eval("Category") %></span>
                        </div>

                        <!-- Scheme Name -->
                        <h3 style="font-size: 1.1rem; font-weight: 700; color: #0f172a; margin-bottom: 8px; line-height: 1.35;"><%# Eval("Name") %></h3>

                        <!-- Benefit Highlight -->
                        <div style="display: inline-flex; align-items: center; gap: 6px; background-color: #f0fdf4; border: 1px solid #bbf7d0; border-radius: 8px; padding: 6px 12px; margin-bottom: 12px;">
                            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#166534" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            <span style="font-size: 0.8125rem; font-weight: 700; color: #166534;"><%# Eval("BenefitBadge") %></span>
                        </div>

                        <!-- Description -->
                        <p style="font-size: 0.8125rem; color: #64748b; line-height: 1.65; margin-bottom: 14px;"><%# Eval("Description") %></p>

                        <!-- Info Chips (deadline + apps) -->
                        <div class="scheme-info-row">
                            <span class="scheme-info-chip">
                                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                                Deadline: <strong><%# Eval("Deadline") %></strong>
                            </span>
                            <span class="scheme-info-chip">
                                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                <strong><%# Eval("ActiveApps") %></strong> Actice
                            </span>
                        </div>

                        <!-- Status + Toggle -->
                        <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 8px;">
                            <span class="badge <%# GetStatusClass(Eval("Status") as string) %>" style="font-size: 0.75rem; font-weight: 700;"><%# Eval("Status") %></span>
                            <button class="toggle-details-btn" onclick="event.stopPropagation(); toggleSchemeDetails('<%# Eval("Id") %>', document.getElementById('card-<%# Eval("Id") %>'))">
<%--                                <span class="toggle-label-<%# Eval("Id") %>">View Full Details ↓</span>--%>
                            </button>
                        </div>
                    </div>

                    <!-- Expandable Detail Panel -->
                    <div class="scheme-detail-panel" id="detail-<%# Eval("Id") %>">

                        <!-- Eligibility -->
                        <div class="detail-section-label">
                            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                            Eligibility (કોણ apply કરી શકે)
                        </div>
                        <div class="detail-block">
                            <p><%# Eval("Eligibility") %></p>
                        </div>

                        <!-- Required Documents -->
                        <div class="detail-section-label">
                            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline></svg>
                            Required Documents (જરૂરી દસ્તાવેજો)
                        </div>
                        <div class="doc-tags" id="docs-<%# Eval("Id") %>">
                            <%# RenderDocTags(Eval("RequiredDocuments") as string) %>
                        </div>

                        <!-- How to Apply -->
                        <div class="detail-section-label">
                            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
                            How to Apply (અરજી કઈ રીતે કરવી)
                        </div>
                        <div class="detail-block" style="padding: 12px 16px;">
                            <%# RenderHowSteps(Eval("HowToApply") as string) %>
                        </div>

                        <!-- Apply Portal Button -->
                        <div style="padding-top: 6px;">
                            <p style="font-size: 0.75rem; color: #64748b; margin-bottom: 10px;">
                                🌐 Apply on Official Portal:
                                <strong style="color: #166534;"><%# Eval("PortalName") %></strong>
                            </p>
                            <a href="<%# Eval("PortalUrl") %>" target="_blank" class="btn-apply-portal" onclick="event.stopPropagation()">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path><polyline points="15 3 21 3 21 9"></polyline><line x1="10" y1="14" x2="21" y2="3"></line></svg>
                                Apply Now on Official Portal
                            </a>
                        </div>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Info Notice -->
    <div style="margin-top: 32px; background-color: #fffbeb; border: 1px solid #fde68a; border-radius: 12px; padding: 20px 24px; display: flex; align-items: flex-start; gap: 14px;">
        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#d97706" stroke-width="2" style="flex-shrink:0; margin-top:1px;"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>
        <div>
            <p style="font-size: 0.875rem; font-weight: 700; color: #92400e; margin-bottom: 4px;">⚠️ Important Notice (મહત્વની સૂચના)</p>
            <p style="font-size: 0.8125rem; color: #78350f; line-height: 1.6; margin: 0;">
                All scheme applications must be submitted directly on the <strong>official government portals</strong> listed above. KhedutPlus provides information and guidance only — we do not collect applications or fees. Always verify scheme deadlines on official websites before applying.
            </p>
        </div>
    </div>

    <script type="text/javascript">
        function toggleSchemeDetails(id, card) {
            var panel = document.getElementById('detail-' + id);
            var label = document.querySelector('.toggle-label-' + id);
            if (!panel) return;
            var isOpen = panel.classList.contains('open');
            panel.classList.toggle('open', !isOpen);
            card.classList.toggle('expanded', !isOpen);
            if (label) {
                label.textContent = isOpen ? 'View Full Details ↓' : 'Hide Details ↑';
            }
        }
    </script>

</asp:Content>
