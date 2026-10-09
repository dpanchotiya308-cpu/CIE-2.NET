<%@ Page Title="Manage Agro Shops" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AgroShops.aspx.cs" Inherits="KhedutPlus.Admin.AgroShops" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .verification-verified {
        color: #16a34a;
        font-weight: 600;
        display: inline-flex;
        align-items: center;
        gap: 6px;
    }
    .verification-pending {
        color: #ea580c;
        font-weight: 600;
        display: inline-flex;
        align-items: center;
        gap: 6px;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Manage Agro Shops</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Inspect vendor certificates, moderate chemical licenses, and review current inventory lists.</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="AdminContent" runat="server">
    <!-- Controls Row -->
    <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; margin-bottom: 24px;">
        <div class="search-box" style="max-width: 440px;">
            <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            <asp:TextBox ID="txtSearchShops" runat="server" CssClass="form-control" placeholder="Search agro shop or owner name..." AutoPostBack="true" OnTextChanged="FilterShops_Changed"></asp:TextBox>
        </div>

        <div>
            <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterShops_Changed">
                <asp:ListItem Value="All" Text="Status: All Status" Selected="True" />
                <asp:ListItem Value="Verified" Text="Status: Verified" />
                <asp:ListItem Value="Pending" Text="Status: Pending" />
            </asp:DropDownList>
        </div>
    </div>

    <!-- Alert -->
    <asp:Panel ID="pnlShopAlert" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblShopAlert" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Table -->
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>Shop Name</th>
                    <th>Owner</th>
                    <th>Location</th>
                    <th>Verification</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptShops" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <img src='<%# Eval("AvatarUrl") %>' alt='<%# Eval("Name") %>' style="width: 36px; height: 36px; border-radius: 8px; object-fit: cover;" />
                                    <span style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></span>
                                </div>
                            </td>
                            <td style="color: #475569;"><%# Eval("Owner") %></td>
                            <td style="color: #64748b;"><%# Eval("Location") %></td>
                            <td>
                                <span class='<%# (Eval("Verification") as string) == "Verified" ? "verification-verified" : "verification-pending" %>'>
                                    ● <%# Eval("Verification") %>
                                </span>
                            </td>
                            <td>
                                <div style="display: flex; align-items: center; gap: 8px;">
                                    <%# (Eval("Verification") as string) == "Pending" ? "<button type=\"button\" class=\"btn btn-sm\" style=\"background-color: #166534; color: #ffffff; padding: 4px 10px; border-radius: 6px; font-size: 0.75rem;\" onclick=\"alert('Verification workflow initiated.');\">Verify</button>" : "" %>
                                    <button type="button" class="btn btn-secondary btn-sm" style="padding: 4px 10px; border-radius: 6px; font-size: 0.75rem;" onclick="alert('Shop verified and approved.');">Approve</button>
                                    <a href="/Shop/Inventory.aspx" class="btn btn-secondary btn-sm" style="padding: 4px 10px; border-radius: 6px; font-size: 0.75rem; display: inline-flex; align-items: center; gap: 4px;">
                                        <span>👁</span>
                                        <span>View Products</span>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <div class="table-pagination">
            <div>Showing 1 to 5 of 14 entries</div>
            <div class="pagination-controls">
                <span class="page-btn">&lt; Previous</span>
                <span class="page-btn active">1</span>
                <span class="page-btn">2</span>
                <span class="page-btn">3</span>
                <span class="page-btn">Next &gt;</span>
            </div>
        </div>
    </div>
</asp:Content>
