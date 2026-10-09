<%@ Page Title="Announcements Manager" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Announcements.aspx.cs" Inherits="KhedutPlus.Admin.Announcements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminHead" runat="server">
<style>
    .form-card {
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        padding: 28px 32px;
        margin-bottom: 32px;
    }
    .form-label {
        display: block;
        font-weight: 600;
        color: #374151;
        font-size: 0.875rem;
        margin-bottom: 6px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-input, .form-select, .form-textarea {
        width: 100%;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        padding: 10px 14px;
        font-size: 0.875rem;
        color: #0f172a;
        background-color: #ffffff;
        box-sizing: border-box;
    }
    .form-textarea {
        resize: vertical;
        min-height: 100px;
    }
    .priority-normal  { background-color: #f1f5f9; color: #334155; }
    .priority-important { background-color: #fef9c3; color: #854d0e; }
    .priority-urgent  { background-color: #fee2e2; color: #991b1b; }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Announcements Manager</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">Create and manage announcements for registered farmers and agro shop owners.</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="AdminContent" runat="server">
    <!-- Success Panel -->
    <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
        <div style="background-color:#f0fdf4;border:1px solid #bbf7d0;border-radius:8px;padding:14px 20px;margin-bottom:24px;color:#166534;font-weight:600;">
            ✔ Announcement posted successfully!
        </div>
    </asp:Panel>

    <!-- Create Announcement Form -->
    <div class="form-card">
        <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 20px; padding-bottom: 12px; border-bottom: 1px solid #f1f5f9;">📢 Create New Announcement</h3>
        <asp:ValidationSummary ID="valSummary" runat="server" ValidationGroup="vgAnnouncement"
            CssClass="alert-error" style="background:#fff7f7;border:1px solid #fecaca;border-radius:8px;padding:12px 16px;margin-bottom:20px;color:#991b1b;font-size:0.8125rem;" />

        <div class="form-group">
            <label class="form-label">Announcement Title <span style="color:#dc2626;">*</span></label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-input" placeholder="e.g. Kharif Season Subsidy Update" MaxLength="150"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
                ValidationGroup="vgAnnouncement" ErrorMessage="Announcement title is required." Display="None" />
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
            <div class="form-group">
                <label class="form-label">Target Audience <span style="color:#dc2626;">*</span></label>
                <asp:DropDownList ID="ddlAudience" runat="server" CssClass="form-input form-select">
                    <asp:ListItem Value="All" Text="All Users" />
                    <asp:ListItem Value="Farmers" Text="Farmers Only" />
                    <asp:ListItem Value="Shops" Text="Agro Shop Owners Only" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="form-label">Priority <span style="color:#dc2626;">*</span></label>
                <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-input form-select">
                    <asp:ListItem Value="Normal" Text="Normal" />
                    <asp:ListItem Value="Important" Text="Important" />
                    <asp:ListItem Value="Urgent" Text="Urgent" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">Message <span style="color:#dc2626;">*</span></label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="form-textarea" Rows="4" placeholder="Write your announcement message here..."></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
                ValidationGroup="vgAnnouncement" ErrorMessage="Message body is required." Display="None" />
        </div>

        <asp:Button ID="btnPost" runat="server" Text="📢 Post Announcement" CssClass="btn btn-primary"
            style="background-color: #166534; color: #ffffff; padding: 10px 28px; border-radius: 8px; font-weight: 600;"
            ValidationGroup="vgAnnouncement" OnClick="btnPost_Click" />
    </div>

    <!-- Recent Announcements Table -->
    <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Recent Announcements</h3>
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>TITLE</th>
                    <th>TARGET</th>
                    <th>POSTED DATE</th>
                    <th>PRIORITY</th>
                    <th>STATUS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptAnnouncements" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td style="font-weight: 600; color: #0f172a;"><%# System.Web.HttpUtility.HtmlEncode(Eval("Title") as string) %></td>
                            <td><span class="badge" style="background-color:#f1f5f9;color:#475569;"><%# System.Web.HttpUtility.HtmlEncode(Eval("Target") as string) %></span></td>
                            <td style="color:#64748b;"><%# System.Web.HttpUtility.HtmlEncode(Eval("PostedDate") as string) %></td>
                            <td><span class='badge <%# GetPriorityCss(Eval("Priority") as string) %>'><%# System.Web.HttpUtility.HtmlEncode(Eval("Priority") as string) %></span></td>
                            <td><span class="badge" style="background-color:#f0fdf4;color:#166534;">Active</span></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
