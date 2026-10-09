<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FarmerSidebar.ascx.cs" Inherits="KhedutPlus.UserControls.FarmerSidebar" %>
<aside class="portal-sidebar">
  <div>
    <div class="sidebar-header">
      <a href="/Farmer/Dashboard.aspx" class="brand-logo">
        <img src="/Images/icons/logo_leaf.png" alt="KhedutPlus" class="brand-logo-img" />
        <span>KhedutPlus</span>
      </a>
    </div>

    <div class="sidebar-section-title">Main Menu</div>
    <ul class="sidebar-nav">
      <li class="sidebar-nav-item">
        <a href="/Farmer/Dashboard.aspx" class="sidebar-nav-link <%= IsActive("Dashboard.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Farmer/Crops.aspx" class="sidebar-nav-link <%= IsActive("Crops.aspx", "CropDetails.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path></svg>
          <span>Crops</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Farmer/DiseaseSolutions.aspx" class="sidebar-nav-link <%= IsActive("DiseaseSolutions.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M10 2v7.31"></path><path d="M14 9.3V1.99"></path><path d="M8.5 2h7"></path><path d="M14 9.3a6.5 6.5 0 1 1-4 0"></path><path d="M5.52 16h12.96"></path></svg>
          <span>Disease Solutions</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Farmer/Schemes.aspx" class="sidebar-nav-link <%= IsActive("Schemes.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 21h18"></path><path d="M3 10h18"></path><path d="M5 6l7-3 7 3"></path><path d="M4 10v11"></path><path d="M20 10v11"></path><path d="M8 14v4"></path><path d="M12 14v4"></path><path d="M16 14v4"></path></svg>
          <span>Government Schemes</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Farmer/AgroStores.aspx" class="sidebar-nav-link <%= IsActive("AgroStores.aspx", "AgroStoreDetails.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path><line x1="3" y1="6" x2="21" y2="6"></line><path d="M16 10a4 4 0 0 1-8 0"></path></svg>
          <span>Agro Stores</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Farmer/Fertilizers.aspx" class="sidebar-nav-link <%= IsActive("Fertilizers.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="16" rx="2"></rect><line x1="8" y1="2" x2="8" y2="6"></line><line x1="16" y1="2" x2="16" y2="6"></line></svg>
          <span>Fertilizers</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Farmer/Pesticides.aspx" class="sidebar-nav-link <%= IsActive("Pesticides.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="12"></line><line x1="12" y1="16" x2="12.01" y2="16"></line></svg>
          <span>Pesticides</span>
        </a>
      </li>
    </ul>

    <div class="sidebar-section-title">Personal</div>
    <ul class="sidebar-nav">
      <li class="sidebar-nav-item">
        <a href="/Farmer/Saved.aspx" class="sidebar-nav-link <%= IsActive("Saved.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path></svg>
          <span>Saved Information</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Farmer/Profile.aspx" class="sidebar-nav-link <%= IsActive("Profile.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
          <span>Profile</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Farmer/Notifications.aspx" class="sidebar-nav-link <%= IsActive("Notifications.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
          <span>Notifications</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Farmer/Settings.aspx" class="sidebar-nav-link <%= IsActive("Settings.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
          <span>Settings</span>
        </a>
      </li>
    </ul>

    <div class="sidebar-section-title">Support &amp; Info</div>
    <ul class="sidebar-nav">
      <li class="sidebar-nav-item">
        <a href="/About.aspx" class="sidebar-nav-link <%= IsActive("About.aspx") %>">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
          <span>About Us</span>
        </a>
      </li>
      <li class="sidebar-nav-item">
        <a href="/Contact.aspx" class="sidebar-nav-link <%= IsActive("Contact.aspx") %>">
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
