<%@ Page Title="Notifications (સૂચનાઓ)" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="KhedutPlus.Farmer.Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
<style>
  .notif-card-item {
    background-color: #ffffff;
    border-radius: 12px;
    border: 1px solid #e2e8f0;
    padding: 20px 24px;
    margin-bottom: 16px;
    display: flex;
    align-items: flex-start;
    gap: 20px;
    box-shadow: 0 1px 2px rgba(0,0,0,0.02);
  }
  .notif-icon-circle {
    width: 44px;
    height: 44px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.25rem;
    flex-shrink: 0;
  }
  .notif-content {
    flex: 1;
  }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
  <!-- Header -->
  <div style="margin-bottom: 24px;">
    <h1 class="page-title">Notifications (સૂચનાઓ)</h1>
    <p class="page-subtitle">Stay updated with alerts for your crops, weather, and government schemes.</p>
  </div>

  <!-- Filter Tabs -->
  <div class="filter-tabs">
    <asp:LinkButton ID="btnTabAll" runat="server" CssClass="filter-tab active" OnClick="FilterNotif_Click" CommandArgument="All">All Items</asp:LinkButton>
    <asp:LinkButton ID="btnTabCrops" runat="server" CssClass="filter-tab" OnClick="FilterNotif_Click" CommandArgument="Crops">Crops</asp:LinkButton>
    <asp:LinkButton ID="btnTabSchemes" runat="server" CssClass="filter-tab" OnClick="FilterNotif_Click" CommandArgument="Schemes">Schemes</asp:LinkButton>
    <asp:LinkButton ID="btnTabDisease" runat="server" CssClass="filter-tab" OnClick="FilterNotif_Click" CommandArgument="Disease Alerts">Disease Alerts</asp:LinkButton>
  </div>

  <!-- Notification Items -->
  <div style="margin-bottom: 32px;">
    <asp:Repeater ID="rptNotifications" runat="server">
      <ItemTemplate>
        <div class="notif-card-item">
          <div class="notif-icon-circle" style='<%# GetIconBg(Eval("Category") as string) %>'>
            <%# GetIconEmoji(Eval("Category") as string) %>
          </div>
          <div class="notif-content">
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 6px;">
              <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a;"><%# Eval("Title") %></h3>
              <span style="font-size: 0.75rem; color: #94a3b8;"><%# Eval("TimeAgo") %></span>
            </div>
            <p style="font-size: 0.875rem; color: #64748b; line-height: 1.5; margin-bottom: 12px;"><%# Eval("Description") %></p>
            <a href='<%# Eval("ActionUrl") %>' style="color: #166534; font-weight: 600; font-size: 0.8125rem;"><%# Eval("ActionText") %></a>
          </div>
        </div>
      </ItemTemplate>
    </asp:Repeater>
  </div>

<%--  <div style="text-align: center;">
    <button type="button" class="btn btn-secondary" style="padding: 10px 28px; border-radius: 8px;">Load More</button>
  </div>--%>
</asp:Content>
