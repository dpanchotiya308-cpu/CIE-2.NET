<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShopSidebar.ascx.cs" Inherits="KhedutPlus.UserControls.ShopSidebar" %>
<aside class="portal-sidebar" style="background-color: #ffffff; border-right: 1px solid #e2e8f0;">
  <div>
    <div class="sidebar-header" style="border-bottom: 1px solid #f1f5f9; padding: 20px;">
      <a href="/Shop/Dashboard.aspx" class="brand-logo" style="gap: 12px;">
        <div style="width: 36px; height: 36px; border-radius: 8px; background-color: #22c55e; display: flex; align-items: center; justify-content: center;">
          <img src="/Images/icons/logo_leaf.png" alt="AgroShop" style="width: 20px; height: 20px; filter: brightness(0) invert(1);" />
        </div>
        <span style="font-size: 1.25rem; font-weight: 700; color: #0f172a;">AgroShop</span>
      </a>
    </div>

    <div class="sidebar-section-title">Shop Menu</div>
    <ul class="sidebar-nav">
      <li class="sidebar-nav-item">
        <a href="/Shop/Dashboard.aspx" class="sidebar-nav-link <%= IsActive("Dashboard.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Shop/Inventory.aspx" class="sidebar-nav-link <%= IsActive("Inventory.aspx", "AddProduct.aspx", "EditInventory.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
          <span>Inventory</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Shop/StockUpdates.aspx" class="sidebar-nav-link <%= IsActive("StockUpdates.aspx", "NewStockUpdate.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
          <span>Stock Updates</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Shop/Orders.aspx" class="sidebar-nav-link <%= IsActive("Orders.aspx", "EditOrder.aspx", "OrderDetails.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
          <span>Orders</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Shop/Customers.aspx" class="sidebar-nav-link <%= IsActive("Customers.aspx", "AddCustomer.aspx", "EditCustomer.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
          <span>Customers</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Shop/Notifications.aspx" class="sidebar-nav-link <%= IsActive("Notifications.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
          <span>Notifications</span>
        </a>
      </li>
    </ul>

    <div class="sidebar-section-title">Business</div>
    <ul class="sidebar-nav">
      <li class="sidebar-nav-item">
        <a href="/Shop/Settings.aspx" class="sidebar-nav-link <%= IsActive("Settings.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
          <span>Shop Profile</span>
        </a>
      </li>
    </ul>

    <div class="sidebar-section-title">Support &amp; Info</div>
    <ul class="sidebar-nav">
      <li class="sidebar-nav-item">
        <a href="/Shop/About.aspx" class="sidebar-nav-link <%= IsActive("About.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
          <span>About Us</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Shop/Contact.aspx" class="sidebar-nav-link <%= IsActive("Contact.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
          <span>Contact Us</span>
        </a>
      </li>
    </ul>
  </div>

  <div class="sidebar-footer">
    <a href="/Default.aspx" class="logout-link">
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
      <span>Logout</span>
    </a>
  </div>
</aside>
