<%@ Page Title="Contact AgroShop Support" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="KhedutPlus.Shop.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .contact-portal-header {
        background: linear-gradient(135deg, #f0fdf4 0%, #ecfdf5 100%);
        border: 1px solid #bbf7d0;
        border-radius: 16px;
        padding: 32px 28px;
        margin-bottom: 28px;
        position: relative;
        overflow: hidden;
    }
    .contact-portal-header::after {
        content: "📞";
        position: absolute;
        right: 24px;
        bottom: 10px;
        font-size: 5rem;
        opacity: 0.15;
    }
    .contact-grid {
        display: grid;
        grid-template-columns: 1.3fr 0.9fr;
        gap: 28px;
        margin-bottom: 32px;
    }
    .contact-info-card {
        background-color: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 16px;
        padding: 24px;
        margin-bottom: 20px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.02);
    }
    .info-item {
        display: flex;
        align-items: flex-start;
        gap: 14px;
        padding: 14px 0;
        border-bottom: 1px solid #f1f5f9;
    }
    .info-item:last-child {
        border-bottom: none;
        padding-bottom: 0;
    }
    .info-icon {
        width: 42px;
        height: 42px;
        border-radius: 10px;
        background-color: #ecfdf5;
        color: #166534;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.25rem;
        flex-shrink: 0;
    }
    @media (max-width: 900px) {
        .contact-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Header Banner -->
    <div class="contact-portal-header">
        <span class="badge" style="background-color: #dcfce7; color: #166534; font-weight: 700; margin-bottom: 12px; display: inline-block;">
            📞 MERCHANT HELPDESK &amp; SUPPORT • વેપારી સંપર્ક કેન્દ્ર
        </span>
        <h1 style="font-size: 1.85rem; font-weight: 800; color: #0f172a; margin-bottom: 10px;">
            AgroShop Merchant Support &amp; Onboarding Assistance
        </h1>
        <p style="color: #475569; font-size: 0.9375rem; line-height: 1.6; max-width: 800px; margin: 0;">
            Have questions regarding stock inventory listing, license updates, order processing, or retailer verification? Contact our support team directly.
        </p>
    </div>

    <div class="contact-grid">
        <!-- Left Column: Form -->
        <div>
            <div class="card" style="padding: 28px; box-shadow: 0 2px 4px rgba(0,0,0,0.02);">
                <h2 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 6px;">Contact Support (વેપારી મદદ)</h2>
                <p style="color: #64748b; font-size: 0.8125rem; margin-bottom: 20px;">Submit your inquiry below and our merchant support representative will reach out to you.</p>

                <!-- Validation Summary -->
                <asp:ValidationSummary ID="valSummaryContact" runat="server" ValidationGroup="vgShopContact" CssClass="validation-summary-box" HeaderText="Please correct the following input errors:" DisplayMode="BulletList" />

                <!-- Success Alert -->
                <asp:Panel ID="pnlContactSuccess" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom: 20px;">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                    <asp:Label ID="lblContactSuccess" runat="server"></asp:Label>
                </asp:Panel>

                <div class="form-group">
                    <label class="form-label">Inquiry Category: <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlInquiryCategory" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Inventory" Text="📦 Inventory & Stock Management Support" />
                        <asp:ListItem Value="Orders" Text="🛒 Order Fulfillment & Processing" />
                        <asp:ListItem Value="License" Text="📄 Fertilizer / Seed License Verification" />
                        <asp:ListItem Value="Technical" Text="💻 Technical Issue / Account Support" />
                    </asp:DropDownList>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtShopName">Shop / Owner Name <span class="required">*</span></label>
                        <asp:TextBox ID="txtShopName" runat="server" CssClass="form-control" placeholder="e.g. Kisan Agro Center"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvShopName" runat="server" ControlToValidate="txtShopName" ValidationGroup="vgShopContact" Display="Dynamic" CssClass="validation-error" ErrorMessage="Shop / Owner name is required." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtContactPhone">Mobile Number <span class="required">*</span></label>
                        <asp:TextBox ID="txtContactPhone" runat="server" CssClass="form-control" placeholder="e.g. +91 98765 43210"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContactPhone" runat="server" ControlToValidate="txtContactPhone" ValidationGroup="vgShopContact" Display="Dynamic" CssClass="validation-error" ErrorMessage="Mobile phone is required." />
                        <asp:RegularExpressionValidator ID="revContactPhone" runat="server" ControlToValidate="txtContactPhone" ValidationGroup="vgShopContact" ValidationExpression="^(\+91[\-\s]?)?[0]?[6789][0-9\s\-]{8,12}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid 10-digit Indian mobile number." />
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtContactEmail">Email Address</label>
                        <asp:TextBox ID="txtContactEmail" runat="server" CssClass="form-control" placeholder="store@example.com"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revContactEmail" runat="server" ControlToValidate="txtContactEmail" ValidationGroup="vgShopContact" ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid email address." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="ddlDistrict">District <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Rajkot" Text="Rajkot (રાજકોટ)" />
                            <asp:ListItem Value="Anand" Text="Anand (આણંદ)" />
                            <asp:ListItem Value="Ahmedabad" Text="Ahmedabad (અમદાવાદ)" />
                            <asp:ListItem Value="Junagadh" Text="Junagadh (જૂનાગઢ)" />
                            <asp:ListItem Value="Mehsana" Text="Mehsana (મહેસાણા)" />
                            <asp:ListItem Value="Bhavnagar" Text="Bhavnagar (ભાવનગર)" />
                            <asp:ListItem Value="Surat" Text="Surat (સૂરત)" />
                            <asp:ListItem Value="Vadodara" Text="Vadodara (વડોદરા)" />
                            <asp:ListItem Value="Other" Text="Other District (અન્ય જિલ્લો)" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtContactSubject">Subject <span class="required">*</span></label>
                    <asp:TextBox ID="txtContactSubject" runat="server" CssClass="form-control" placeholder="e.g. Assistance with restocking Urea SKU stock"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContactSubject" runat="server" ControlToValidate="txtContactSubject" ValidationGroup="vgShopContact" Display="Dynamic" CssClass="validation-error" ErrorMessage="Subject is required." />
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtContactMessage">Message Details <span class="required">*</span></label>
                    <asp:TextBox ID="txtContactMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Describe your question or issue in detail..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContactMessage" runat="server" ControlToValidate="txtContactMessage" ValidationGroup="vgShopContact" Display="Dynamic" CssClass="validation-error" ErrorMessage="Message cannot be empty." />
                </div>

                <div style="margin-top: 14px;">
                    <asp:Button ID="btnSendMessage" runat="server" Text="Submit Inquiry (સંદેશો મોકલો)" CssClass="btn btn-primary" ValidationGroup="vgShopContact" OnClick="btnSendMessage_Click" style="background-color: #166534; padding: 12px 28px; font-weight: 600; width: 100%; font-size: 0.9375rem;" />
                </div>
            </div>
        </div>

        <!-- Right Column: Info & FAQs -->
        <div>
            <!-- Direct Contact Details -->
            <div class="contact-info-card">
                <h3 style="font-size: 1.1rem; font-weight: 700; color: #0f172a; margin-bottom: 14px;">AgroShop Merchant Helpdesk</h3>

                <div class="info-item">
                    <div class="info-icon">📍</div>
                    <div>
                        <div style="font-size: 0.75rem; color: #94a3b8; text-transform: uppercase; font-weight: 700;">Regional Merchant Center</div>
                        <div style="font-weight: 600; color: #0f172a; margin-top: 2px;">Trikon Bagh, Rajkot, Gujarat - 360001</div>
                        <div style="font-size: 0.8125rem; color: #64748b;">Agro Retailer Support Desk, 2nd Floor</div>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon">📞</div>
                    <div>
                        <div style="font-size: 0.75rem; color: #94a3b8; text-transform: uppercase; font-weight: 700;">Merchant Helpline</div>
                        <div style="font-weight: 700; color: #166534; font-size: 1.05rem; margin-top: 2px;">+91 96011 04603</div>
                        <div style="font-size: 0.8125rem; color: #64748b;">Mon - Sat: 9:00 AM to 7:00 PM IST</div>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon">✉️</div>
                    <div>
                        <div style="font-size: 0.75rem; color: #94a3b8; text-transform: uppercase; font-weight: 700;">Merchant Support Email</div>
                        <div style="font-weight: 600; color: #0f172a; margin-top: 2px;">khedutplus.shop@gmail.com</div>
                        <div style="font-size: 0.8125rem; color: #64748b;">Response within 24 business hours</div>
                    </div>
                </div>
            </div>

            <!-- Quick Help FAQ -->
            <div class="contact-info-card">
                <h3 style="font-size: 1.1rem; font-weight: 700; color: #0f172a; margin-bottom: 14px;">Merchant FAQs</h3>

                <div style="margin-bottom: 12px;">
                    <div style="font-weight: 600; color: #0f172a; font-size: 0.875rem; margin-bottom: 2px;">How to update stock quantities?</div>
                    <div style="font-size: 0.8125rem; color: #64748b; line-height: 1.5;">Navigate to 'Stock Updates' in the sidebar menu and click 'Log New Stock Arrival' to adjust inventory levels.</div>
                </div>

                <div>
                    <div style="font-weight: 600; color: #0f172a; font-size: 0.875rem; margin-bottom: 2px;">How to update shop profile details?</div>
                    <div style="font-size: 0.8125rem; color: #64748b; line-height: 1.5;">Click 'Shop Profile' under Business menu to update contact number, store address, or banner image.</div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
