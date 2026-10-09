<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminSidebar.ascx.cs" Inherits="KhedutPlus.UserControls.AdminSidebar" %>
<aside class="portal-sidebar admin-sidebar">
  <div>
    <div class="sidebar-header" style="padding: 24px 20px;">
      <div style="display: flex; align-items: center; gap: 12px;">
        <div style="width: 40px; height: 40px; border-radius: 10px; background-color: #ffffff; display: flex; align-items: center; justify-content: center; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
          <img src="/Images/icons/logo_leaf.png" alt="Logo" style="width: 24px; height: 24px;" />
        </div>
        <div>
          <div class="sidebar-brand-title">Khedut Plus</div>
          <div class="sidebar-brand-subtitle">AGRO MANAGEMENT</div>
        </div>
      </div>
    </div>

    <ul class="sidebar-nav" style="margin-top: 16px;">
      <li class="sidebar-nav-item">
        <a href="/Admin/Dashboard.aspx" class="sidebar-nav-link <%= IsActive("Dashboard.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/Farmers.aspx" class="sidebar-nav-link <%= IsActive("Farmers.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
          <span>Manage Farmers</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/AgroShops.aspx" class="sidebar-nav-link <%= IsActive("AgroShops.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
          <span>Manage Agro Shops</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/Products.aspx" class="sidebar-nav-link <%= IsActive("Products.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line></svg>
          <span>Manage Products</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/Schemes.aspx" class="sidebar-nav-link <%= IsActive("Schemes.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 21h18"></path><path d="M3 10h18"></path><path d="M5 6l7-3 7 3"></path><path d="M4 10v11"></path><path d="M20 10v11"></path><path d="M8 14v4"></path><path d="M12 14v4"></path><path d="M16 14v4"></path></svg>
          <span>Government Schemes</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/Users.aspx" class="sidebar-nav-link <%= IsActive("Users.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
          <span>Manage Users</span>
        </a>
      </li>
      <li class="sidebar-nav-item" style="margin-top:12px; padding-top:12px; border-top:1px solid rgba(255,255,255,0.1);">
        <span style="font-size:0.65rem;font-weight:700;text-transform:uppercase;letter-spacing:0.08em;color:rgba(255,255,255,0.4);padding:0 20px;display:block;margin-bottom:4px;">DATA &amp; CONTENT</span>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/Crops.aspx" class="sidebar-nav-link <%= IsActive("Crops.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path></svg>
          <span>Manage Crops</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/DiseaseSolutions.aspx" class="sidebar-nav-link <%= IsActive("DiseaseSolutions.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01"></path></svg>
          <span>Disease Solutions</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/Fertilizers.aspx" class="sidebar-nav-link <%= IsActive("Fertilizers.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2a9 9 0 0 1 9 9c0 4.17-2.84 7.67-6.7 8.7L12 22l-2.3-2.3C5.84 18.67 3 15.17 3 11a9 9 0 0 1 9-9z"></path><path d="M12 8v8M8 12h8"></path></svg>
          <span>Fertilizers</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/Pesticides.aspx" class="sidebar-nav-link <%= IsActive("Pesticides.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
          <span>Pesticides</span>
        </a>
      </li>
      <li class="sidebar-nav-item" style="margin-top:12px; padding-top:12px; border-top:1px solid rgba(255,255,255,0.1);">
        <span style="font-size:0.65rem;font-weight:700;text-transform:uppercase;letter-spacing:0.08em;color:rgba(255,255,255,0.4);padding:0 20px;display:block;margin-bottom:4px;">COMMUNICATION</span>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/Announcements.aspx" class="sidebar-nav-link <%= IsActive("Announcements.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
          <span>Announcements</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/Contact.aspx" class="sidebar-nav-link <%= IsActive("Contact.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
          <span>Contact &amp; Queries</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/About.aspx" class="sidebar-nav-link <%= IsActive("About.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>
          <span>About KhedutPlus</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Admin/Profile.aspx" class="sidebar-nav-link <%= IsActive("Profile.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
          <span>My Profile</span>
        </a>
      </li>
    </ul>
  </div>

  <div class="sidebar-footer">
    <div class="admin-user-card">
      <a href="/Admin/Profile.aspx" class="admin-user-info" style="text-decoration: none; cursor: pointer; display: flex; align-items: center; gap: 12px; flex: 1;">
        <% if (!string.IsNullOrEmpty(GetAdminAvatar())) { %>
          <img src="<%= GetAdminAvatar() %>" alt="Admin" style="width:36px;height:36px;border-radius:50%;object-fit:cover;border:2px solid #22c55e;" />
        <% } else { %>
          <div class="admin-user-avatar"><%= GetAdminInitials() %></div>
        <% } %>
        <div>
          <div style="font-weight: 600; font-size: 0.875rem; color: #ffffff;"><%= GetAdminName() %></div>
          <div style="font-size: 0.6875rem; color: #86efac;">System Administrator</div>
        </div>
      </a>
      <a href="/Admin/Login.aspx" class="logout-link" title="Logout">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
      </a>
    </div>
  </div>
</aside>
