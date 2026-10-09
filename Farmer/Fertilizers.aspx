<%@ Page Title="Fertilizers Information (ખાતરની માહિતી)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="Fertilizers.aspx.cs" Inherits="KhedutPlus.Farmer.Fertilizers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .fertilizers-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 24px;
    }
    @media (max-width: 900px) {
        .fertilizers-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Top back link -->
    <div style="margin-bottom: 16px;">
        <a href="/Farmer/Pesticides.aspx" style="color: #64748b; font-size: 0.875rem; display: inline-flex; align-items: center; gap: 6px;">
            <span>&larr;</span>
            <span>Pesticides (જંતુનાશકો)</span>
        </a>
    </div>

    <!-- Header -->
    <div style="margin-bottom: 24px;">
        <h1 class="page-title">Fertilizers Information (ખાતરની માહિતી)</h1>
        <p class="page-subtitle">Explore different types of fertilizers and their recommended usage.</p>
    </div>

    <!-- Search Row -->
    <div style="display: flex; gap: 12px; margin-bottom: 24px; max-width: 600px;">
        <asp:TextBox ID="txtSearchFertilizer" runat="server" CssClass="form-control" placeholder="Search for fertilizers..."></asp:TextBox>
        <asp:Button ID="btnSearchFertilizer" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearchFertilizer_Click" />
    </div>

    <!-- Filter Tabs -->
    <div class="filter-tabs">
        <asp:LinkButton ID="btnTabAll" runat="server" CssClass="filter-tab active" OnClick="FilterFertilizer_Click" CommandArgument="All">All Fertilizers</asp:LinkButton>
        <asp:LinkButton ID="btnTabNitrogenous" runat="server" CssClass="filter-tab" OnClick="FilterFertilizer_Click" CommandArgument="Nitrogenous">Nitrogenous</asp:LinkButton>
        <asp:LinkButton ID="btnTabPhosphatic" runat="server" CssClass="filter-tab" OnClick="FilterFertilizer_Click" CommandArgument="Phosphatic">Phosphatic</asp:LinkButton>
        <asp:LinkButton ID="btnTabPotassic" runat="server" CssClass="filter-tab" OnClick="FilterFertilizer_Click" CommandArgument="Potassic">Potassic</asp:LinkButton>
        <asp:LinkButton ID="btnTabComplex" runat="server" CssClass="filter-tab" OnClick="FilterFertilizer_Click" CommandArgument="Complex">Complex</asp:LinkButton>
        <asp:LinkButton ID="btnTabOrganic" runat="server" CssClass="filter-tab" OnClick="FilterFertilizer_Click" CommandArgument="Organic/Bio">Organic/Bio</asp:LinkButton>
    </div>

    <!-- Fertilizers Grid -->
    <div class="fertilizers-grid">
        <asp:Repeater ID="rptFertilizers" runat="server">
            <ItemTemplate>
                <div class="item-card searchable-card">
                    <div class="item-card-image-wrapper" style="height: 220px; background-color: #f8fafc; padding: 20px; display: flex; align-items: center; justify-content: center;">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' style="max-height: 180px; width: auto; object-fit: contain;" />
                        <span class="item-card-badge" style="background-color: #ffffff; color: #475569; border: 1px solid #e2e8f0;"><%# Eval("Category") %></span>
                    </div>

                    <div class="item-card-body">
                        <h3 class="item-card-title"><%# Eval("Name") %></h3>
                        <p class="item-card-desc"><%# Eval("Description") %></p>

                        <div style="margin-bottom: 20px; display: flex; flex-direction: column; gap: 8px; font-size: 0.8125rem; color: #475569;">
                            <div style="display: flex; align-items: center; gap: 8px;">
                                <span style="color: #166534;">🌾</span>
                                <span><%# Eval("KeyFeature1") %></span>
                            </div>
                            <div style="display: flex; align-items: center; gap: 8px;">
                                <span style="color: #2563eb;">💧</span>
                                <span><%# Eval("KeyFeature2") %></span>
                            </div>
                        </div>

                        <a href='/Farmer/FertilizerDetails.aspx?id=<%# Eval("Id") %>' class="btn btn-secondary w-full" style="border-radius: 8px; font-weight: 600; text-align: center; display: block;">View Usage Guide</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
