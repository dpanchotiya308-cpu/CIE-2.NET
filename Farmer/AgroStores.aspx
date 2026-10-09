<%@ Page Title="Agro Stores (એગ્રો સ્ટોર્સ)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="AgroStores.aspx.cs" Inherits="KhedutPlus.Farmer.AgroStores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .store-card {
        background-color: #ffffff;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 24px;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 24px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.02);
    }
    .store-left {
        display: flex;
        align-items: center;
        gap: 20px;
        flex: 1;
    }
    .store-img-box {
        width: 110px;
        height: 110px;
        border-radius: 12px;
        overflow: hidden;
        background-color: #f1f5f9;
        flex-shrink: 0;
    }
    .store-img-box img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .store-tag-pill {
        display: inline-block;
        padding: 3px 10px;
        border-radius: 9999px;
        font-size: 0.75rem;
        font-weight: 500;
        background-color: #f0fdf4;
        color: #166534;
        border: 1px solid #bbf7d0;
        margin-right: 6px;
    }
    @media (max-width: 900px) {
        .store-card {
            flex-direction: column;
            align-items: flex-start;
        }
        .store-left {
            flex-direction: column;
            align-items: flex-start;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Header -->
    <div style="margin-bottom: 24px;">
        <h1 class="page-title">Agro Stores (એગ્રો સ્ટોર્સ)</h1>
        <p class="page-subtitle">Find verified agricultural suppliers and service centers near you.</p>
    </div>

    <!-- Filters & Search Bar -->
    <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; margin-bottom: 28px;">
        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterStores_Changed">
                <asp:ListItem Value="Ahmedabad" Text="📍 District: Ahmedabad" Selected="True" />
                <asp:ListItem Value="Rajkot" Text="📍 District: Rajkot" />
                <asp:ListItem Value="Anand" Text="📍 District: Anand" />
                <asp:ListItem Value="Mehsana" Text="📍 District: Mehsana" />
            </asp:DropDownList>

            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterStores_Changed">
                <asp:ListItem Value="All" Text="🏷 Category: Seeds & Fertilizers" Selected="True" />
                <asp:ListItem Value="Seeds" Text="Seeds" />
                <asp:ListItem Value="Fertilizers" Text="Fertilizers" />
                <asp:ListItem Value="Pesticides" Text="Pesticides" />
            </asp:DropDownList>

            <button type="button" class="btn btn-secondary btn-sm" style="border-radius: 9999px; height: 40px; padding: 0 16px; border-color: #e2e8f0;">
                <span style="color: #eab308;">★</span> Top Rated
            </button>
        </div>

        <div class="search-box" style="max-width: 340px;">
            <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            <asp:TextBox ID="txtSearchStores" runat="server" CssClass="form-control" placeholder="Search stores by name or location" AutoPostBack="true" OnTextChanged="FilterStores_Changed"></asp:TextBox>
        </div>
    </div>

    <!-- Section Title -->
    <div style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 20px;">
        Available Stores (<asp:Label ID="lblStoreCount" runat="server" Text="4"></asp:Label>)
    </div>

    <!-- Stores List -->
    <div>
        <asp:Repeater ID="rptStores" runat="server">
            <ItemTemplate>
                <div class="store-card">
                    <div class="store-left">
                        <div class="store-img-box">
                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>'
                                 onerror="this.onerror=null;this.style.display='none';this.parentElement.innerHTML='<div style=\'width:100%;height:100%;background:#f0fdf4;display:flex;align-items:center;justify-content:center;font-size:2rem;\'>🌱</div>';" />
                        </div>
                        <div>
                            <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 4px;">
                                <h3 style="font-size: 1.125rem; font-weight: 700; color: #0f172a;"><%# Eval("Name") %></h3>
                                <span style="display: inline-flex; align-items: center; gap: 3px; font-size: 0.8125rem; font-weight: 600; color: #ca8a04;">
                                    <span>★</span>
                                    <span><%# Eval("Rating", "{0:0.0}") %></span>
                                </span>
                            </div>
                            <div style="display: flex; align-items: center; gap: 6px; font-size: 0.8125rem; color: #64748b; margin-bottom: 10px;">
                                <span>📍</span>
                                <span><%# Eval("Address") %></span>
                            </div>
                            <div style="margin-bottom: 10px;">
                                <%# RenderTags(Eval("Tags") as System.Collections.Generic.List<string>) %>
                            </div>
                            <div style="font-size: 0.8125rem; color: #475569; display: flex; align-items: center; gap: 6px;">
                                <span>📞</span>
                                <span><%# Eval("Phone") %></span>
                            </div>
                        </div>
                    </div>
                    <div>
                        <a href='/Farmer/AgroStoreDetails.aspx?id=<%# Eval("Id") %>' class="btn btn-primary" style="padding: 10px 24px; border-radius: 8px;">View Details</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
