<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FarmerNavbar.ascx.cs" Inherits="KhedutPlus.UserControls.FarmerNavbar" %>
<header class="public-navbar">
  <div class="navbar-container">
    <a href="/Default.aspx" class="brand-logo">
      <img src="/Images/icons/logo_leaf.png" alt="KhedutPlus" class="brand-logo-img" />
      <span>KhedutPlus</span>
    </a>

    <% if (!IsAuthPage) { %>
    <ul class="nav-links" id="navbarLinks">
      <li><a href="/Default.aspx" class="nav-link <%= IsActive("/Default.aspx") %>">Home</a></li>
      <li><a href="/Farmer/Crops.aspx" class="nav-link <%= IsActive("/Farmer/Crops.aspx") %>">Crops</a></li>
      <li><a href="/Farmer/DiseaseSolutions.aspx" class="nav-link <%= IsActive("/Farmer/DiseaseSolutions.aspx") %>">Disease Solutions</a></li>
      <li><a href="/Farmer/Schemes.aspx" class="nav-link <%= IsActive("/Farmer/Schemes.aspx") %>">Schemes</a></li>
      <li><a href="/Farmer/AgroStores.aspx" class="nav-link <%= IsActive("/Farmer/AgroStores.aspx") %>">Agro Stores</a></li>
    </ul>
    <% } %>

    <div class="nav-actions">
      <% if (!IsAuthPage) { %>
      <div style="display: flex; align-items: center; gap: 6px; color: #475569; font-size: 0.875rem; cursor: pointer;">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
        <span>English</span>
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"></polyline></svg>
      </div>
      <% } %>

      <% if (IsRegisterPage) { %>
        <a href="/Default.aspx" class="btn btn-primary btn-sm" style="border-radius: 8px; padding: 8px 18px; background-color: #166534; font-weight: 600;">Sign In</a>
      <% } else if (IsAuthPage) { %>
        <a href="/Register.aspx" class="btn btn-primary btn-sm" style="border-radius: 8px; padding: 8px 18px; background-color: #166534; font-weight: 600;">Register</a>
      <% } else { %>
        <a href="/Register.aspx" class="btn btn-primary btn-sm" style="border-radius: 8px; padding: 8px 18px; background-color: #166534; font-weight: 600;">Register</a>
        <button type="button" id="mobileMenuToggle" style="display: none; background: none; border: none; cursor: pointer;" aria-label="Toggle menu">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
        </button>
      <% } %>
    </div>
  </div>
</header>
