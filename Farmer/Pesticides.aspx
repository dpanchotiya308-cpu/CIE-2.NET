<%@ Page Title="Pesticides (જંતુનાશકો)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="Pesticides.aspx.cs" Inherits="KhedutPlus.Farmer.Pesticides" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .pesticides-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 20px;
    }
    @media (max-width: 1100px) {
        .pesticides-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }
    @media (max-width: 650px) {
        .pesticides-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Header with Back -->
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px; flex-wrap: wrap; gap: 16px;">
        <div style="display: flex; align-items: center; gap: 12px;">
            <a href="/Farmer/Dashboard.aspx" style="color: #64748b; font-size: 1.25rem;">&larr;</a>
            <h1 class="page-title" style="font-size: 1.5rem;">Pesticides (જંતુનાશકો)</h1>
        </div>

        <div style="display: flex; gap: 10px; max-width: 400px; width: 100%;">
            <asp:TextBox ID="txtSearchPesticides" runat="server" CssClass="form-control" placeholder="Search in your saved information..."></asp:TextBox>
            <asp:Button ID="btnSearchPesticides" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearchPesticides_Click" />
        </div>
    </div>

    <!-- Filter Tabs -->
    <div class="filter-tabs">
        <asp:LinkButton ID="btnTabAll" runat="server" CssClass="filter-tab active" OnClick="FilterPesticide_Click" CommandArgument="All">All Pesticides</asp:LinkButton>
        <asp:LinkButton ID="btnTabInsecticides" runat="server" CssClass="filter-tab" OnClick="FilterPesticide_Click" CommandArgument="Insecticides">Insecticides</asp:LinkButton>
        <asp:LinkButton ID="btnTabFungicides" runat="server" CssClass="filter-tab" OnClick="FilterPesticide_Click" CommandArgument="Fungicides">Fungicides</asp:LinkButton>
        <asp:LinkButton ID="btnTabHerbicides" runat="server" CssClass="filter-tab" OnClick="FilterPesticide_Click" CommandArgument="Herbicides">Herbicides</asp:LinkButton>
        <asp:LinkButton ID="btnTabBio" runat="server" CssClass="filter-tab" OnClick="FilterPesticide_Click" CommandArgument="Bio-pesticides">Bio-pesticides</asp:LinkButton>
    </div>

    <!-- Pesticides Grid -->
    <div class="pesticides-grid">
        <asp:Repeater ID="rptPesticides" runat="server">
            <ItemTemplate>
                <div class="item-card searchable-card">
                    <div class="item-card-image-wrapper" style="height: 200px; background-color: #f8fafc; padding: 16px; display: flex; align-items: center; justify-content: center; position: relative;">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' style="max-height: 160px; width: auto; object-fit: contain;" />
                        <div style="position: absolute; top: 10px; left: 10px; display: flex; gap: 6px;">
                            <span class="badge" style="background-color: #1e293b; color: #ffffff;"><%# Eval("ToxicityLevel") %></span>
                            <span class="badge" style="background-color: #ffffff; color: #475569; border: 1px solid #e2e8f0;"><%# Eval("Category") %></span>
                        </div>
                    </div>

                    <div class="item-card-body">
                        <h3 class="item-card-title"><%# Eval("Name") %></h3>
                        <p class="item-card-desc"><%# Eval("Description") %></p>

                        <div style="margin-bottom: 16px; display: flex; flex-direction: column; gap: 6px; font-size: 0.8125rem; color: #475569;">
                            <div>
                                <span style="font-weight: 600;">Targets:</span>
                                <span><%# Eval("Targets") %></span>
                            </div>
                            <div>
                                <span style="font-weight: 600;">Dosage:</span>
                                <span><%# Eval("Dosage") %></span>
                            </div>
                        </div>

                        <a href='/Farmer/PesticideDetails.aspx?id=<%# Eval("Id") %>' class="btn btn-secondary w-full" style="border-radius: 8px; font-weight: 600; text-align: center; display: block;">View Details & Safety</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
