<%@ Page Title="Edit Customer" Language="C#" MasterPageFile="~/MasterPages/Shop.Master" AutoEventWireup="true" CodeBehind="EditCustomer.aspx.cs" Inherits="KhedutPlus.Shop.EditCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ShopHead" runat="server">
<style>
    .cust-edit-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 24px;
        flex-wrap: wrap;
        gap: 16px;
    }
    .cust-form-grid {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 28px;
    }
    @media (max-width: 900px) {
        .cust-form-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ShopContent" runat="server">
    <!-- Header -->
    <div class="cust-edit-header">
        <div>
            <a href="/Shop/Customers.aspx" style="color: #64748b; font-size: 0.875rem; display: inline-flex; align-items: center; gap: 6px; margin-bottom: 6px; text-decoration: none;">
                <span>&larr;</span>
                <span>Back to Customers</span>
            </a>
            <h1 class="page-title"><asp:Label ID="lblCustTitle" runat="server" Text="Edit Customer Profile"></asp:Label></h1>
            <p class="page-subtitle">Update customer information, contact numbers, address, and account status.</p>
        </div>

        <div style="display: flex; align-items: center; gap: 12px;">
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnCancel_Click" />
            <asp:Button ID="btnSaveCustomer" runat="server" Text="Save Customer Changes" CssClass="btn btn-primary" ValidationGroup="vgEditCustomer" OnClick="btnSaveCustomer_Click" style="background-color: #166534;" />
        </div>
    </div>

    <!-- Validation Summary -->
    <asp:ValidationSummary ID="valSummaryCustomer" runat="server" ValidationGroup="vgEditCustomer" CssClass="validation-summary-box" HeaderText="Please correct the following errors:" DisplayMode="BulletList" />

    <!-- Feedback Message -->
    <asp:Panel ID="pnlCustomerSuccess" runat="server" Visible="false" CssClass="alert-success">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"></polyline></svg>
        <asp:Label ID="lblCustomerSuccess" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Two-Column Form -->
    <div class="cust-form-grid">
        <!-- Left Column -->
        <div>
            <!-- Personal & Contact Information -->
            <div class="card" style="margin-bottom: 24px;">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 20px;">Customer Profile</h2>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtCustomerId">Customer ID</label>
                        <asp:TextBox ID="txtCustomerId" runat="server" CssClass="form-control" ReadOnly="true" style="background-color: #f1f5f9; cursor: not-allowed; font-weight: 600;"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtCustomerName">Full Name <span class="required">*</span></label>
                        <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName" ValidationGroup="vgEditCustomer" Display="Dynamic" CssClass="validation-error" ErrorMessage="Customer name is required." />
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="txtPhone">Mobile Number <span class="required">*</span></label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ValidationGroup="vgEditCustomer" Display="Dynamic" CssClass="validation-error" ErrorMessage="Mobile phone is required." />
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" ValidationGroup="vgEditCustomer" ValidationExpression="^(\+91[\-\s]?)?[0]?[6789][0-9\s\-]{8,12}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid 10-digit Indian mobile number." />
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtEmail">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="vgEditCustomer" ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" Display="Dynamic" CssClass="validation-error" ErrorMessage="Please enter a valid email address." />
                    </div>
                </div>

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label" for="ddlLocation">Service Location / Area <span class="required">*</span></label>
                        <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Anand" Text="Anand" />
                            <asp:ListItem Value="Mehsana" Text="Mehsana" />
                            <asp:ListItem Value="Rajkot" Text="Rajkot" />
                            <asp:ListItem Value="Sanand" Text="Sanand" />
                            <asp:ListItem Value="Bavla" Text="Bavla" />
                            <asp:ListItem Value="Viramgam" Text="Viramgam" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="txtLandSize">Farmland Size / Primary Crops</label>
                        <asp:TextBox ID="txtLandSize" runat="server" CssClass="form-control" placeholder="e.g. 10 Acres - Wheat, Cotton"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtAddress">Village / Farm Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Village name, Survey number, Taluka, Gujarat"></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div>
            <!-- Status Card -->
            <div class="card" style="margin-bottom: 24px;">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Account Status</h2>

                <div class="form-group">
                    <label class="form-label" for="ddlStatus">Customer Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Active" Text="Active" />
                        <asp:ListItem Value="Inactive" Text="Inactive" />
                    </asp:DropDownList>
                    <span style="font-size: 0.75rem; color: #94a3b8; margin-top: 6px; display: block; line-height: 1.4;">
                        Active customers receive product arrival alerts, discounts, and can place credit orders.
                    </span>
                </div>
            </div>

            <!-- Customer Stats Summary Card -->
            <div class="card">
                <h2 style="font-size: 1.125rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Spending &amp; Order Activity</h2>
                
                <div style="font-size: 0.875rem; color: #64748b; line-height: 1.8;">
                    <div><strong>Total Spent:</strong> ₹<asp:Label ID="lblTotalSpent" runat="server" Text="0.00" FontBold="true" ForeColor="#0f172a"></asp:Label></div>
                    <div><strong>Last Order Date:</strong> <asp:Label ID="lblLastOrderDate" runat="server" Text="Never"></asp:Label></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
