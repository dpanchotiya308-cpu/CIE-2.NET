<%@ Page Title="Crop Disease Solutions (રોગ અને ઉપાયો)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="DiseaseSolutions.aspx.cs" Inherits="KhedutPlus.Farmer.DiseaseSolutions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .disease-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 24px;
    }
    @media (max-width: 900px) {
        .disease-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Header -->
    <div style="margin-bottom: 24px;">
        <h1 class="page-title">Crop Disease Solutions (રોગ અને ઉપાયો)</h1>
        <p class="page-subtitle">Identify and treat common crop diseases with expert-recommended solutions and preventative measures.</p>
    </div>

    <!-- Filters Row -->
    <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; margin-bottom: 28px;">
        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
            <asp:DropDownList ID="ddlCropFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
                <asp:ListItem Value="All" Text="All Crop Types (Paddy, Wheat, Cotton)" Selected="True" />
                <asp:ListItem Value="PADDY" Text="Paddy (Rice)" />
                <asp:ListItem Value="COTTON" Text="Cotton" />
                <asp:ListItem Value="WHEAT" Text="Wheat" />
            </asp:DropDownList>

            <asp:DropDownList ID="ddlCategoryFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="Filter_Changed">
                <asp:ListItem Value="All" Text="Filter by Disease Category" Selected="True" />
                <asp:ListItem Value="FUNGAL" Text="Fungal" />
                <asp:ListItem Value="VIRAL" Text="Viral" />
                <asp:ListItem Value="BACTERIAL" Text="Bacterial" />
            </asp:DropDownList>
        </div>

        <div class="search-box" style="max-width: 300px;">
            <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            <asp:TextBox ID="txtSearchDisease" runat="server" CssClass="form-control" placeholder="Search diseases..." AutoPostBack="true" OnTextChanged="Filter_Changed"></asp:TextBox>
        </div>
    </div>

    <!-- Disease Cards Grid -->
    <div class="disease-grid">
        <asp:Repeater ID="rptDiseases" runat="server">
            <ItemTemplate>
                <div class="item-card searchable-card">
                    <div class="item-card-image-wrapper" style="height: 220px;">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="item-card-image" />
                        <span class="item-card-badge" style="background-color: #ffffff; color: #475569; border: 1px solid #e2e8f0;"><%# Eval("Category") %></span>
                    </div>

                    <div class="item-card-body">
                        <div style="font-size: 0.6875rem; font-weight: 700; text-transform: uppercase; color: #94a3b8; letter-spacing: 0.05em; margin-bottom: 4px;">
                            AFFECTS: <%# Eval("AffectsCrop") %>
                        </div>
                        <h3 class="item-card-title" style="margin-bottom: 8px;"><%# Eval("Name") %></h3>
                        
                        <div style="font-size: 0.8125rem; font-weight: 600; color: #334155; margin-bottom: 10px;">
                            Symptom: <span style="font-weight: 400; color: #64748b;"><%# Eval("Symptom") %></span>
                        </div>

                        <p class="item-card-desc"><%# Eval("Description") %></p>

                        <div style="margin-top: 16px; padding-top: 14px; border-top: 1px solid #f1f5f9;">
                            <a href='/Farmer/DiseaseDetails.aspx?id=<%# Eval("Id") %>' style="color: #166534; font-weight: 600; font-size: 0.875rem; display: inline-flex; align-items: center; gap: 4px;">
                                <span>View Treatment Guide</span>
                                <span>&rarr;</span>
                            </a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
