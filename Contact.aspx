<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MasterPages/Farmer.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="KhedutPlus.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FarmerHead" runat="server">
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

<asp:Content ID="Content2" ContentPlaceHolderID="FarmerContent" runat="server">
    <!-- Header Banner in Dashboard Style -->
    <div class="contact-portal-header">
        <span class="badge" style="background-color: #dcfce7; color: #166534; font-weight: 700; margin-bottom: 12px; display: inline-block;">
            📞 HELPDESK &amp; SUPPORT • સંપર્ક કેન્દ્ર
        </span>
        <h1 style="font-size: 1.85rem; font-weight: 800; color: #0f172a; margin-bottom: 10px;">
            We Are Here to Support Your Farming &amp; Business Needs
        </h1>
        <p style="color: #475569; font-size: 0.9375rem; line-height: 1.6; max-width: 800px; margin: 0;">
            Whether you have questions regarding crop remedies, government subsidy eligibility, or agro store digital onboarding, our team is available 6 days a week to help.
        </p>
    </div>

    <div class="contact-grid">
        <!-- Left Column: Form -->
        <div>
            <div class="card" style="padding: 28px; box-shadow: 0 2px 4px rgba(0,0,0,0.02);">
                <h2 style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 6px;">Send Us a Message (સંદેશો મોકલો)</h2>
                <p style="color: #64748b; font-size: 0.8125rem; margin-bottom: 20px;">Fill out the form below and an agricultural specialist will contact you shortly.</p>

                <!-- Validation Summary -->
                <asp:ValidationSummary ID="valSummaryContact" runat="server" ValidationGroup="vgContact" CssClass="validation-summary-box" HeaderText="Please correct the following input errors:" DisplayMode="BulletList" />

                <!-- Success Alert -->
                <asp:Panel ID="pnlContactSuccess" runat="server" Visible="false" CssClass="alert-success" style="margin-bottom: 20px;">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                    <asp:Label ID="lblContactSuccess" runat="server"></asp:Label>
                </asp:Panel>

                <div class="form-group">
                    <label class="form-label">I am reaching out as a: <span class="required">*</span></label>
                    <asp:DropDownList ID="ddlUserRole" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Farmer" Text="🌾 Farmer (ખેડૂત)" />
                        <asp:ListItem Value="AgroShop" Text="🏪 AgroStore Retailer / Owner (એગ્રો વેપારી)" />
                        <asp:ListItem Value="General" Text="ℹ️ General Inquiry (સામાન્ય પૂછપરછ)" />
                    </asp:DropDownList>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtContactName">Full Name (પૂરું નામ) <span class="required">*</span></label>
                        <asp:TextBox ID="txtContactName" runat="server" CssClass="form-control" placeholder="e.g. Ramesh Patel"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContactName" runat="server" ControlToValidate="txtContactName" ValidationGroup="vgContact" Display="Dynamic" CssClass="validation-error" ErrorMessage="Full name is required." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtContactPhone">Mobile Number (મોબાઈલ નંબર) <span class="required">*</span></label>
                        <asp:TextBox ID="txtContactPhone" runat="server" CssClass="form-control" placeholder="e.g. +91 98765 43210"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContactPhone" runat="server" ControlToValidate="txtContactPhone" ValidationGroup="vgContact" Display="Dynamic" CssClass="validation-error" ErrorMessage="Mobile phone is required." />
                        <asp:RegularExpressionValidator ID="revContactPhone" runat="server" ControlToValidate="txtContactPhone" ValidationGroup="vgContact" ValidationExpression="^(\+91[\-\s]?)?[0]?[6789][0-9\s\-]{8,12}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid 10-digit Indian mobile number." />
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtContactEmail">Email Address (ઈમેઈલ)</label>
                        <asp:TextBox ID="txtContactEmail" runat="server" CssClass="form-control" placeholder="name@example.com"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revContactEmail" runat="server" ControlToValidate="txtContactEmail" ValidationGroup="vgContact" ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid email address." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="ddlDistrict">District (જિલ્લો) <span class="required">*</span></label>
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
                    <label class="form-label" for="txtContactSubject">Subject (વિષય) <span class="required">*</span></label>
                    <asp:TextBox ID="txtContactSubject" runat="server" CssClass="form-control" placeholder="e.g. Need assistance with Cotton pink bollworm remedy"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContactSubject" runat="server" ControlToValidate="txtContactSubject" ValidationGroup="vgContact" Display="Dynamic" CssClass="validation-error" ErrorMessage="Subject is required." />
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtContactMessage">Your Message (તમારો સંદેશો) <span class="required">*</span></label>
                    <asp:TextBox ID="txtContactMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Please describe your crop problem, store onboarding inquiry, or feedback in detail..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContactMessage" runat="server" ControlToValidate="txtContactMessage" ValidationGroup="vgContact" Display="Dynamic" CssClass="validation-error" ErrorMessage="Message cannot be empty." />
                </div>

                <div style="margin-top: 14px;">
                    <asp:Button ID="btnSendMessage" runat="server" Text="Send Message (સંદેશો મોકલો)" CssClass="btn btn-primary" ValidationGroup="vgContact" OnClick="btnSendMessage_Click" style="background-color: #166534; padding: 12px 28px; font-weight: 600; width: 100%; font-size: 0.9375rem;" />
                </div>
            </div>
        </div>

        <!-- Right Column: Info & FAQs -->
        <div>
            <!-- Direct Contact Details -->
            <div class="contact-info-card">
                <h3 style="font-size: 1.1rem; font-weight: 700; color: #0f172a; margin-bottom: 14px;">Direct Contact Details</h3>

                <div class="info-item">
                    <div class="info-icon">📍</div>
                    <div>
                        <div style="font-size: 0.75rem; color: #94a3b8; text-transform: uppercase; font-weight: 700;">Head Office</div>
                        <div style="font-weight: 600; color: #0f172a; margin-top: 2px;">Trikon Bagh, Rajkot, Gujarat - 360001</div>
                        <div style="font-size: 0.8125rem; color: #64748b;">Ground Floor, Agricultural Complex</div>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon">📞</div>
                    <div>
                        <div style="font-size: 0.75rem; color: #94a3b8; text-transform: uppercase; font-weight: 700;">Farmer &amp; Store Helpline</div>
                        <div style="font-weight: 700; color: #166534; font-size: 1.05rem; margin-top: 2px;">+91 96011 04603</div>
                        <div style="font-size: 0.8125rem; color: #64748b;">Mon - Sat: 9:00 AM to 7:00 PM IST</div>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon">✉️</div>
                    <div>
                        <div style="font-size: 0.75rem; color: #94a3b8; text-transform: uppercase; font-weight: 700;">Official Support Email</div>
                        <div style="font-weight: 600; color: #0f172a; margin-top: 2px;">khedutplus@gmail.com</div>
                        <div style="font-size: 0.8125rem; color: #64748b;">Guaranteed reply within 24 hours</div>
                    </div>
                </div>
            </div>

            <!-- Quick Help FAQ -->
            <div class="contact-info-card">
                <h3 style="font-size: 1.1rem; font-weight: 700; color: #0f172a; margin-bottom: 14px;">Quick Answers</h3>

                <div style="margin-bottom: 12px;">
                    <div style="font-weight: 600; color: #0f172a; font-size: 0.875rem; margin-bottom: 2px;">Is KhedutPlus free for farmers?</div>
                    <div style="font-size: 0.8125rem; color: #64748b; line-height: 1.5;">Yes! All crop advisories, disease identification, and subsidy information are 100% free.</div>
                </div>

                <div>
                    <div style="font-weight: 600; color: #0f172a; font-size: 0.875rem; margin-bottom: 2px;">How do agro stores register?</div>
                    <div style="font-size: 0.8125rem; color: #64748b; line-height: 1.5;">Shop owners can click 'Register' in the top bar or contact our helpline with valid dealer license details.</div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
