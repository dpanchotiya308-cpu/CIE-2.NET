<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="KhedutPlus.Admin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .user-avatar-initials {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        background-color: #64748b;
        color: #ffffff;
        font-weight: 700;
        font-size: 0.8125rem;
        display: flex;
        align-items: center;
        justify-content: center;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Manage Users</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Administer platform access, assign roles to field officers and shop owners, and manage permissions across the system.</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="AdminContent" runat="server">
    <!-- Controls Row -->
    <div style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 16px; margin-bottom: 24px;">
        <div class="search-box" style="max-width: 440px;">
            <svg class="search-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            <asp:TextBox ID="txtSearchUsers" runat="server" CssClass="form-control" placeholder="Search user by name, email or ID..." AutoPostBack="true" OnTextChanged="FilterUsers_Changed"></asp:TextBox>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:DropDownList ID="ddlRoleFilter" runat="server" CssClass="form-control" style="width: auto; height: 40px; padding: 6px 14px;" AutoPostBack="true" OnSelectedIndexChanged="FilterUsers_Changed">
                <asp:ListItem Value="All" Text="Role: All Roles" Selected="True" />
                <asp:ListItem Value="Field Officer" Text="Field Officer" />
                <asp:ListItem Value="Shop Owner" Text="Shop Owner" />
                <asp:ListItem Value="Admin" Text="Admin" />
            </asp:DropDownList>

            <!--<button type="button" class="btn btn-primary" style="background-color: #166534; padding: 9px 20px; border-radius: 8px;" onclick="alert('Create New System User dialog: enter Name, Organization Email, Role and Region.');">
                <span>+</span>
                <span>Create New User</span>
            </button>-->
        </div>
    </div>

    <!-- Users Table -->
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>USER NAME</th>
                    <th>ROLE</th>
                    <th>REGION/LOCATION</th>
                    <th>LAST LOGIN</th>
                    <th>STATUS</th>
                    <th>ACTIONS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptUsers" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="display: flex; align-items: center; gap: 12px;">
                                    <%# RenderUserAvatar(Eval("AvatarUrl") as string, Eval("Initials") as string, Eval("Name") as string) %>
                                    <div>
                                        <div style="font-weight: 600; color: #0f172a;"><%# Eval("Name") %></div>
                                        <div style="font-size: 0.75rem; color: #64748b;"><%# Eval("Email") %></div>
                                    </div>
                                </div>
                            </td>
                            <td style="color: #475569; font-weight: 500;"><%# Eval("Role") %></td>
                            <td style="color: #64748b;"><%# Eval("Region") %></td>
                            <td style="color: #64748b;"><%# Eval("LastLogin") %></td>
                            <td>
                                <span class="badge" style='<%# (Eval("Status") as string) == "Active" ? "background-color: #f1f5f9; color: #334155;" : "background-color: #f8fafc; color: #94a3b8;" %>'>
                                    ● <%# Eval("Status") %>
                                </span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 12px; font-size: 1rem; color: #64748b; cursor: pointer;">
                                    <span title="Permissions / Keys" onclick="alert('Manage permissions for <%# Eval("Name") %>');">🔑</span>
                                    <span title="Revoke Access" onclick="confirm('Revoke access for <%# Eval("Name") %>?');">🚫</span>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <div class="table-pagination">
            <div>Showing 1 to 4 of 45 entries</div>
            <div class="pagination-controls">
                <span class="page-btn">&lt; Previous</span>
                <span class="page-btn active">1</span>
                <span class="page-btn">2</span>
                <span class="page-btn">3</span>
                <span>...</span>
                <span class="page-btn">Next &gt;</span>
            </div>
        </div>
    </div>
</asp:Content>
