<%@ Page Title="Agro Store Details (એગ્રો સ્ટોર વિગતો)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="AgroStoreDetails.aspx.cs" Inherits="KhedutPlus.Farmer.AgroStoreDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
    .store-hero-img-box {
        position: relative;
        width: 100%;
        height: 300px;
        border-radius: 16px;
        overflow: hidden;
        margin-bottom: 24px;
        background-color: #f0fdf4;
    }
    .store-hero-img-box img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .store-hero-placeholder {
        width: 100%;
        height: 100%;
        background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 12px;
    }
    .verified-badge {
        position: absolute;
        top: 20px;
        right: 20px;
        background-color: #1e293b;
        color: #ffffff;
        padding: 6px 14px;
        border-radius: 9999px;
        font-size: 0.75rem;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 6px;
        letter-spacing: 0.05em;
    }
    .store-info-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 32px;
        margin-bottom: 32px;
    }
    .service-tag {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 8px 16px;
        background-color: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 8px;
        font-size: 0.875rem;
        color: #334155;
        font-weight: 500;
    }
    /* Products Grid */
    .product-grid-3 {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }
    .product-card {
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        padding: 16px;
        transition: transform 0.15s, box-shadow 0.15s;
    }
    .product-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0,0,0,0.06);
    }
    .product-img-box {
        width: 100%;
        height: 120px;
        border-radius: 8px;
        overflow: hidden;
        background-color: #f8fafc;
        margin-bottom: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .product-img-box img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    @media (max-width: 900px) {
        .store-info-grid { grid-template-columns: 1fr; }
        .product-grid-3 { grid-template-columns: repeat(2, 1fr); }
    }
    @media (max-width: 600px) {
        .product-grid-3 { grid-template-columns: 1fr; }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">

    <!-- Back Header -->
    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px; flex-wrap: wrap; gap: 16px;">
        <div style="display: flex; align-items: center; gap: 12px;">
            <a href="/Farmer/AgroStores.aspx" style="color: #64748b; font-size: 1.25rem;">&larr;</a>
            <h1 class="page-title" style="font-size: 1.5rem;">
                <asp:Label ID="lblPageTitle" runat="server">Agro Store Details</asp:Label>
            </h1>
        </div>
    </div>

    <!-- Not Found Panel -->
    <asp:Panel ID="pnlNotFound" runat="server" Visible="false">
        <div style="background:#fff7f7;border:1px solid #fecaca;border-radius:12px;padding:32px;text-align:center;">
            <p style="font-size:1.125rem;font-weight:700;color:#dc2626;">Store not found.</p>
            <a href="/Farmer/AgroStores.aspx" class="btn btn-secondary" style="margin-top:12px;display:inline-block;">← Back to Stores</a>
        </div>
    </asp:Panel>

    <!-- Store Detail Card -->
    <asp:Panel ID="pnlStoreDetail" runat="server" Visible="false">
        <div class="card" style="padding: 32px; margin-bottom: 32px;">

            <!-- Store Title & Rating & Store Photo -->
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px; padding-bottom: 20px; border-bottom: 1px solid #f1f5f9; flex-wrap: wrap; gap: 16px;">
                <div style="display: flex; align-items: center; gap: 20px;">
                    <div style="width: 80px; height: 80px; border-radius: 14px; overflow: hidden; border: 3px solid #e2e8f0; flex-shrink: 0; background: #f8fafc; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.06);">
                        <asp:Image ID="imgStoreLogo" runat="server" AlternateText="Store Photo"
                            Style="width:100%;height:100%;object-fit:cover;" onerror="this.onerror=null;this.src='/Images/stores/kisan_agro.jpg';" />
                    </div>
                    <div>
                        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap; margin-bottom: 6px;">
                            <h2 style="font-size: 1.75rem; font-weight: 700; color: #0f172a; margin: 0;">
                                <asp:Label ID="lblStoreName" runat="server"></asp:Label>
                            </h2>
                            <asp:Panel ID="pnlVerified" runat="server" Visible="false" style="display: inline-flex; align-items: center; gap: 4px; background-color: #f0fdf4; color: #166534; border: 1px solid #bbf7d0; padding: 4px 10px; border-radius: 9999px; font-size: 0.75rem; font-weight: 700;">
                                <span style="color: #22c55e;">✔</span>
                                <span>VERIFIED STORE</span>
                            </asp:Panel>
                        </div>
                        <div style="display: flex; align-items: center; gap: 8px; font-size: 0.9375rem; color: #64748b;">
                            <span style="color: #eab308; font-weight: 700;">★ <asp:Label ID="lblRating" runat="server"></asp:Label></span>
                            <span>(<asp:Label ID="lblReviews" runat="server"></asp:Label> Reviews)</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Info Grid -->
            <div class="store-info-grid">
                <!-- Left: Store Details -->
                <div>
                    <h3 style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; color: #94a3b8; letter-spacing: 0.05em; margin-bottom: 16px;">STORE DETAILS</h3>

                    <div style="margin-bottom: 16px; display: flex; gap: 12px;">
                        <span style="font-size: 1.125rem;">📍</span>
                        <div>
                            <div style="font-weight: 600; color: #0f172a; font-size: 0.875rem;">Address</div>
                            <div style="color: #64748b; font-size: 0.875rem; line-height: 1.5;">
                                <asp:Label ID="lblAddress" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div style="margin-bottom: 16px; display: flex; gap: 12px;">
                        <span style="font-size: 1.125rem;">📞</span>
                        <div>
                            <div style="font-weight: 600; color: #0f172a; font-size: 0.875rem;">Phone</div>
                            <div style="color: #64748b; font-size: 0.875rem;">
                                <asp:Label ID="lblPhone" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div style="display: flex; gap: 12px;">
                        <span style="font-size: 1.125rem;">🕒</span>
                        <div>
                            <div style="font-weight: 600; color: #0f172a; font-size: 0.875rem;">Store Timings</div>
                            <div style="color: #15803d; font-weight: 600; font-size: 0.875rem;">
                                <asp:Label ID="lblTimings" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right: Services & Categories -->
                <div>
                    <h3 style="font-size: 0.75rem; font-weight: 700; text-transform: uppercase; color: #94a3b8; letter-spacing: 0.05em; margin-bottom: 16px;">SERVICES & CATEGORIES</h3>
                    <div style="display: flex; flex-wrap: wrap; gap: 10px; margin-bottom: 20px;">
                        <asp:Label ID="lblServiceTags" runat="server"></asp:Label>
                    </div>

                    <div style="background:#f8fafc;border:1px solid #e2e8f0;border-radius:10px;padding:16px;">
                        <div style="font-size:0.8125rem;color:#64748b;line-height:1.6;">
                            📊 <strong>District:</strong> <asp:Label ID="lblDistrict" runat="server"></asp:Label><br />
                            🌟 <strong>Status:</strong>
                            <asp:Label ID="lblVerifiedStatus" runat="server" style="color:#166534;font-weight:700;"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Action Buttons -->
            <div style="display: flex; gap: 16px; flex-wrap: wrap;">
                <asp:HyperLink ID="lnkCall" runat="server" CssClass="btn" style="background-color: #166534; color: #ffffff; padding: 12px 32px; border-radius: 8px;">
                    📞 Call Now
                </asp:HyperLink>
                <a href="https://maps.google.com" target="_blank" class="btn btn-secondary" style="padding: 12px 32px; border-radius: 8px;">
                    🧭 Get Directions
                </a>
            </div>
        </div>

        <!-- Products Available Section -->
        <div>
            <div style="margin-bottom: 20px;">
                <h2 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 4px;">
                    Products Available at This Store
                </h2>
                <p class="page-subtitle">Products stocked by this agro shop from their inventory.</p>
            </div>

            <!-- Products Grid -->
            <asp:Panel ID="pnlProducts" runat="server">
                <div class="product-grid-3">
                    <asp:Repeater ID="rptProducts" runat="server">
                        <ItemTemplate>
                            <div class="product-card">
                                <div class="product-img-box">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>'
                                         onerror="this.onerror=null;this.src='';this.style.display='none';this.parentElement.innerHTML='<div style=\'width:100%;height:100%;display:flex;align-items:center;justify-content:center;font-size:2rem;\'>📦</div>';" />
                                </div>
                                <div>
                                    <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:6px;">
                                        <span class="badge" style="background-color:#f0fdf4;color:#166534;border:1px solid #bbf7d0;"><%# Eval("Category") %></span>
                                        <span style="font-size:0.7rem;color:#94a3b8;font-family:monospace;"><%# Eval("Sku") %></span>
                                    </div>
                                    <h4 style="font-size:0.9375rem;font-weight:700;color:#0f172a;margin-bottom:6px;line-height:1.35;"><%# Eval("Name") %></h4>
                                    <p style="font-size:0.8rem;color:#64748b;line-height:1.6;margin-bottom:8px;"><%# TruncateDesc(Eval("Description") as string, 90) %></p>
                                    <div style="display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:4px;">
                                        <span class="badge" style='background-color:<%# GetStatusBg(Eval("Status") as string) %>;color:<%# GetStatusColor(Eval("Status") as string) %>;'>
                                            <%# Eval("Status") %>
                                        </span>
                                        <%# RenderExtraInfo(Eval("NpkRatio") as string, Eval("TargetPest") as string, Eval("Type") as string) %>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </asp:Panel>

            <!-- No Products Panel -->
            <asp:Panel ID="pnlNoProducts" runat="server" Visible="false">
                <div style="background:#f8fafc;border:1px dashed #e2e8f0;border-radius:12px;padding:32px;text-align:center;">
                    <span style="font-size:2.5rem;">📦</span>
                    <p style="font-size:0.9375rem;font-weight:600;color:#64748b;margin-top:12px;">No products listed for this store yet.</p>
                </div>
            </asp:Panel>
        </div>
    </asp:Panel>

</asp:Content>
