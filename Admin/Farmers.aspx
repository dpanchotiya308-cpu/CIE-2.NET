<%@ Page Title="Manage Farmers" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Farmers.aspx.cs" Inherits="KhedutPlus.Admin.Farmers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .status-text-active {
        color: #16a34a;
        font-weight: 600;
    }
    .status-text-blocked {
        color: #dc2626;
        font-weight: 600;
    }
    .action-icon-btn {
        background: none;
        border: none;
        color: #64748b;
        cursor: pointer;
        padding: 4px;
        font-size: 1rem;
        transition: color 0.15s;
    }
    .action-icon-btn:hover {
        color: #0f172a;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Manage Farmers</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Verify identity, review locations, update active statuses, or block unauthorized accounts.</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="AdminContent" runat="server">
    <!-- Controls Row -->
    <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; margin-bottom: 24px;">
        <div class="search-box" style="max-width: 440px;">
            <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            <asp:TextBox ID="txtSearchFarmers" runat="server" CssClass="form-control" placeholder="Search farmers by name, district, or mobile..." AutoPostBack="true" OnTextChanged="FilterFarmers_Changed"></asp:TextBox>
        </div>

        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
            <asp:DropDownList ID="ddlDistrictFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterFarmers_Changed">
                <asp:ListItem Value="All" Text="District: All" Selected="True" />
                <asp:ListItem Value="Anand" Text="District: Anand" />
                <asp:ListItem Value="Mehsana" Text="District: Mehsana" />
                <asp:ListItem Value="Rajkot" Text="District: Rajkot" />
                <asp:ListItem Value="Kutch" Text="District: Kutch" />
            </asp:DropDownList>

            <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterFarmers_Changed">
                <asp:ListItem Value="All" Text="Status: All" />
                <asp:ListItem Value="Active" Text="Status: Active" Selected="True" />
                <asp:ListItem Value="Blocked" Text="Status: Blocked" />
            </asp:DropDownList>

            <asp:Button ID="btnExportFarmers" runat="server" Text="Export" CssClass="btn btn-primary" style="background-color: #166534; padding: 9px 20px; border-radius: 8px;" OnClick="btnExportFarmers_Click" />
        </div>
    </div>

    <!-- Alert -->
    <asp:Panel ID="pnlFarmerAlert" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblFarmerAlert" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Farmers Table -->
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>Farmer Name</th>
                    <th>Location</th>
                    <th>Contact Number</th>
                    <th>Registered Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptFarmers" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <img src='<%# Eval("AvatarUrl") %>' alt='<%# Eval("Name") %>' style="width: 36px; height: 36px; border-radius: 50%; object-fit: cover;" />
                                    <span style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></span>
                                </div>
                            </td>
                            <td style="color: #64748b;"><%# Eval("Location") %></td>
                            <td style="color: #475569; font-weight: 500;"><%# Eval("ContactNumber") %></td>
                            <td style="color: #64748b;"><%# Eval("RegisteredDate") %></td>
                            <td>
                                <span class='<%# (Eval("Status") as string) == "Active" ? "status-text-active" : "status-text-blocked" %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 12px; align-items: center; color: #64748b;">
                                    <button type="button" class="action-icon-btn" title="View Details" onclick="alert('Viewing profile of <%# Eval("Name") %>');">👁</button>
                                    <button type="button" class="action-icon-btn" title="Lock / Unlock" onclick="alert('Updated status for <%# Eval("Name") %>');">🔒</button>
                                    <button type="button" class="action-icon-btn" title="Delete" style="color: #ef4444;" onclick="confirm('Are you sure you want to remove this account?');">🗑</button>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <div class="table-pagination">
            <div>Showing 1 to 5 of 24 entries</div>
            <div class="pagination-controls">
                <span class="page-btn">&lt; Previous</span>
                <span class="page-btn active">1</span>
                <span class="page-btn">2</span>
                <span class="page-btn">3</span>
                <span class="page-btn">4</span>
                <span class="page-btn">5</span>
                <span class="page-btn">Next &gt;</span>
            </div>
        </div>
    </div>
</asp:Content>
