<%@ Page Title="Contact Us & User Queries" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="KhedutPlus.Admin.Contact" %>

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
    .form-group { margin-bottom: 20px; }
    .form-input, .form-textarea {
        width: 100%;
        border: 1px solid #d1d5db;
        border-radius: 8px;
        padding: 10px 14px;
        font-size: 0.875rem;
        color: #0f172a;
        box-sizing: border-box;
    }
    .form-textarea { resize: vertical; min-height: 100px; }
    .status-open     { background-color: #fef9c3; color: #854d0e; }
    .status-resolved { background-color: #f0fdf4; color: #166534; }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="AdminPageTitle" runat="server">Contact Us &amp; User Queries</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminPageSubtitle" runat="server">View farmer and agro shop queries, and respond to support tickets.</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="AdminContent" runat="server">

    <!-- Response sent success -->
    <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
        <div style="background-color:#f0fdf4;border:1px solid #bbf7d0;border-radius:8px;padding:14px 20px;margin-bottom:24px;color:#166534;font-weight:600;">
            ✔ Response sent successfully!
        </div>
    </asp:Panel>

    <!-- Admin Response Form -->
    <div class="form-card">
        <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 20px; padding-bottom: 12px; border-bottom: 1px solid #f1f5f9;">💬 Send Response to Query</h3>
        <asp:ValidationSummary ID="valSummary" runat="server" ValidationGroup="vgContact"
            CssClass="alert-error" style="background:#fff7f7;border:1px solid #fecaca;border-radius:8px;padding:12px 16px;margin-bottom:20px;color:#991b1b;font-size:0.8125rem;" />

        <div class="form-group">
            <label class="form-label">Query Reference No. <span style="color:#dc2626;">*</span></label>
            <asp:TextBox ID="txtQueryRef" runat="server" CssClass="form-input" placeholder="e.g. QRY-2026-001"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvQueryRef" runat="server" ControlToValidate="txtQueryRef"
                ValidationGroup="vgContact" ErrorMessage="Query reference number is required." Display="None" />
        </div>
        <div class="form-group">
            <label class="form-label">Response Message <span style="color:#dc2626;">*</span></label>
            <asp:TextBox ID="txtResponse" runat="server" TextMode="MultiLine" CssClass="form-textarea" Rows="4" placeholder="Type your response here..."></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvResponse" runat="server" ControlToValidate="txtResponse"
                ValidationGroup="vgContact" ErrorMessage="Response message is required." Display="None" />
        </div>
        <asp:Button ID="btnSend" runat="server" Text="Send Response" CssClass="btn btn-primary"
            style="background-color: #166534; color: #ffffff; padding: 10px 28px; border-radius: 8px; font-weight: 600;"
            ValidationGroup="vgContact" OnClick="btnSend_Click" />
    </div>

    <!-- User Queries Table -->
    <h3 style="font-size: 1rem; font-weight: 700; color: #0f172a; margin-bottom: 16px;">Support Tickets</h3>
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>FROM</th>
                    <th>TYPE</th>
                    <th>SUBJECT</th>
                    <th>DATE</th>
                    <th>STATUS</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptQueries" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td style="font-weight: 600; color: #0f172a;"><%# System.Web.HttpUtility.HtmlEncode(Eval("From") as string) %></td>
                            <td><span class="badge" style="background-color:#f1f5f9;color:#475569;"><%# System.Web.HttpUtility.HtmlEncode(Eval("Type") as string) %></span></td>
                            <td style="color: #475569;"><%# System.Web.HttpUtility.HtmlEncode(Eval("Subject") as string) %></td>
                            <td style="color: #64748b;"><%# System.Web.HttpUtility.HtmlEncode(Eval("Date") as string) %></td>
                            <td><span class='badge <%# GetStatusCss(Eval("Status") as string) %>'><%# System.Web.HttpUtility.HtmlEncode(Eval("Status") as string) %></span></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
