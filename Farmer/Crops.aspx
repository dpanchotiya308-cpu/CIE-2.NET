<%@ Page Title="Crops Information (પાકની માહિતી)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="Crops.aspx.cs" Inherits="KhedutPlus.Farmer.Crops" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .crops-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 24px;
        flex-wrap: wrap;
        gap: 16px;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <div class="crops-header">
        <div>
            <h1 class="page-title">Crops Information (પાકની માહિતી)</h1>
        </div>
    </div>

    <!-- Category Filter Tabs -->
    <div class="filter-tabs">
        <asp:LinkButton ID="btnCatAll" runat="server" CssClass="filter-tab active" OnClick="FilterCategory_Click" CommandArgument="All">All Crops</asp:LinkButton>
        <asp:LinkButton ID="btnCatGrains" runat="server" CssClass="filter-tab" OnClick="FilterCategory_Click" CommandArgument="Grains">Grains</asp:LinkButton>
        <asp:LinkButton ID="btnCatVegetables" runat="server" CssClass="filter-tab" OnClick="FilterCategory_Click" CommandArgument="Vegetables">Vegetables</asp:LinkButton>
        <asp:LinkButton ID="btnCatFruits" runat="server" CssClass="filter-tab" OnClick="FilterCategory_Click" CommandArgument="Fruits">Fruits</asp:LinkButton>
        <asp:LinkButton ID="btnCatSpices" runat="server" CssClass="filter-tab" OnClick="FilterCategory_Click" CommandArgument="Spices">Spices</asp:LinkButton>
        <asp:LinkButton ID="btnCatPulses" runat="server" CssClass="filter-tab" OnClick="FilterCategory_Click" CommandArgument="Pulses">Pulses</asp:LinkButton>
    </div>

    <!-- Crops Grid -->
    <div class="cards-grid-4">
        <asp:Repeater ID="rptCrops" runat="server">
            <ItemTemplate>
                <div class="item-card searchable-card">
                    <div class="item-card-image-wrapper">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="item-card-image" />
                        <span class="item-card-badge"><%# Eval("Category") %></span>
                    </div>

                    <div class="item-card-body">
                        <h3 class="item-card-title">
                            <%# Eval("Name") %> <%# string.IsNullOrEmpty(Eval("LocalName") as string) ? "" : "(" + Eval("LocalName") + ")" %>
                        </h3>
                        <p class="item-card-desc"><%# Eval("Description") %></p>

                        <div class="item-card-meta">
                            <div class="item-card-meta-row">
                                <span style="font-weight: 600;">Season:</span>
                                <span><%# Eval("Season") %></span>
                            </div>
                            <div class="item-card-meta-row">
                                <span style="font-weight: 600;">Water:</span>
                                <span><%# Eval("Water") %></span>
                            </div>
                            <div class="item-card-meta-row">
                                <span style="font-weight: 600;">Soil:</span>
                                <span><%# Eval("Soil") %></span>
                            </div>
                        </div>

                        <a href='/Farmer/CropDetails.aspx?id=<%# Eval("Id") %>' class="btn btn-secondary w-full" style="border-radius: 8px; font-weight: 600;">View Details</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
