/**
 * KhedutPlus Vanilla JavaScript Library
 * Zero jQuery - Native Modern JavaScript
 */

document.addEventListener('DOMContentLoaded', function () {
    initTabs();
    initImagePreviews();
    initLiveSearch();
    initMobileNav();
});

// Client Validation Functions for ASP.NET Web Forms CustomValidator controls
function ValidateOtpFormat(source, args) {
    var val = args.Value ? args.Value.trim() : '';
    // OTP must be exactly 6 digits
    var isValid = /^\d{6}$/.test(val);
    args.IsValid = isValid;
}

function ValidateMobileIndian(source, args) {
    var val = args.Value ? args.Value.trim() : '';
    // Format: 10 digits starting with 6, 7, 8, or 9 (with optional +91 prefix)
    var cleanVal = val.replace(/^(\+91|91|0)/, '').replace(/\s+/g, '');
    var isValid = /^[6-9]\d{9}$/.test(cleanVal);
    args.IsValid = isValid;
}

function ValidateSkuFormat(source, args) {
    var val = args.Value ? args.Value.trim().toUpperCase() : '';
    // SKU format: e.g. FERT-UR-46 or SEED-CRN-01
    var isValid = /^[A-Z]{3,4}-[A-Z0-9]{2,4}-\d{2,4}$/.test(val);
    args.IsValid = isValid;
}

function ValidateSellingPriceGteCost(source, args) {
    var costInput = document.getElementById('txtCostPrice');
    var sellingVal = parseFloat(args.Value);
    var costVal = costInput ? parseFloat(costInput.value) : 0;
    if (isNaN(sellingVal)) {
        args.IsValid = false;
        return;
    }
    if (isNaN(costVal)) {
        args.IsValid = true;
        return;
    }
    args.IsValid = (sellingVal >= costVal);
}

function ValidateAdminOrgEmail(source, args) {
    var val = args.Value ? args.Value.trim().toLowerCase() : '';
    // Check email domain ends with valid extension and not empty
    var isValid = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(val);
    args.IsValid = isValid;
}

// Tab Switching
function initTabs() {
    var tabButtons = document.querySelectorAll('[data-tab-target]');
    tabButtons.forEach(function (btn) {
        btn.addEventListener('click', function (e) {
            var targetId = btn.getAttribute('data-tab-target');
            var targetGroup = btn.getAttribute('data-tab-group') || 'default';
            
            // Deactivate tabs in this group
            document.querySelectorAll('[data-tab-group="' + targetGroup + '"]').forEach(function (b) {
                b.classList.remove('active');
            });
            btn.classList.add('active');

            // Hide pane containers
            document.querySelectorAll('[data-tab-pane="' + targetGroup + '"]').forEach(function (pane) {
                pane.style.display = 'none';
            });
            var activePane = document.getElementById(targetId);
            if (activePane) {
                activePane.style.display = 'block';
            }
        });
    });
}

// Image File Upload Preview
function initImagePreviews() {
    var fileInputs = document.querySelectorAll('input[type="file"][data-preview-target]');
    fileInputs.forEach(function (input) {
        input.addEventListener('change', function () {
            var targetId = input.getAttribute('data-preview-target');
            var previewImg = document.getElementById(targetId);
            if (input.files && input.files[0] && previewImg) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    previewImg.src = e.target.result;
                    previewImg.style.display = 'block';
                };
                reader.readAsDataURL(input.files[0]);
            }
        });
    });
}

// Client-side quick filter/search
function initLiveSearch() {
    var searchInputs = document.querySelectorAll('[data-search-table]');
    searchInputs.forEach(function (input) {
        var tableId = input.getAttribute('data-search-table');
        var table = document.getElementById(tableId);
        if (!table) return;

        input.addEventListener('keyup', function () {
            var query = input.value.toLowerCase();
            var rows = table.querySelectorAll('tbody tr');
            rows.forEach(function (row) {
                var text = row.textContent.toLowerCase();
                if (text.indexOf(query) > -1) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    });

    var cardSearchInputs = document.querySelectorAll('[data-search-cards]');
    cardSearchInputs.forEach(function (input) {
        var containerId = input.getAttribute('data-search-cards');
        var container = document.getElementById(containerId);
        if (!container) return;

        input.addEventListener('keyup', function () {
            var query = input.value.toLowerCase();
            var cards = container.querySelectorAll('.searchable-card');
            cards.forEach(function (card) {
                var text = card.textContent.toLowerCase();
                if (text.indexOf(query) > -1) {
                    card.style.display = '';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });
}

// Mobile Navigation Toggle
function initMobileNav() {
    var toggleBtn = document.getElementById('mobileMenuToggle');
    var navLinks = document.getElementById('navbarLinks');
    if (toggleBtn && navLinks) {
        toggleBtn.addEventListener('click', function () {
            if (navLinks.style.display === 'flex') {
                navLinks.style.display = 'none';
            } else {
                navLinks.style.display = 'flex';
                navLinks.style.flexDirection = 'column';
                navLinks.style.position = 'absolute';
                navLinks.style.top = '100%';
                navLinks.style.left = '0';
                navLinks.style.width = '100%';
                navLinks.style.backgroundColor = '#ffffff';
                navLinks.style.padding = '16px';
                navLinks.style.borderBottom = '1px solid #e2e8f0';
            }
        });
    }
}
