using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace KhedutPlus.Models
{
    /// <summary>
    /// Central database helper for KhedutPlusDB.
    /// Handles all 3 tables: AdminUsers, Farmers, AgroStoreOwners.
    /// </summary>
    public static class DbHelper
    {
        private static string ConnStr
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["KhedutPlusDB"].ConnectionString;
            }
        }

        // ─────────────────────────────────────────────────────────────
        // Utility: SHA-256 password hashing
        // ─────────────────────────────────────────────────────────────
        public static string HashPassword(string plainText)
        {
            using (var sha = SHA256.Create())
            {
                byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(plainText));
                var sb = new StringBuilder();
                foreach (byte b in bytes) sb.Append(b.ToString("x2"));
                return sb.ToString();
            }
        }

        // ─────────────────────────────────────────────────────────────
        // ADMIN USERS
        // ─────────────────────────────────────────────────────────────

        /// <summary>Register a new admin. Returns true on success, false if email already exists.</summary>
        public static bool AdminRegister(string fullName, string email, string role, string password, out string errorMsg)
        {
            errorMsg = "";
            try
            {
                using (var conn = new SqlConnection(ConnStr))
                {
                    conn.Open();
                    // Check duplicate email
                    using (var chk = new SqlCommand("SELECT COUNT(1) FROM AdminUsers WHERE Email = @Email", conn))
                    {
                        chk.Parameters.AddWithValue("@Email", email.Trim().ToLower());
                        int count = (int)chk.ExecuteScalar();
                        if (count > 0) { errorMsg = "An admin account with this email already exists."; return false; }
                    }
                    // Insert
                    const string sql = @"INSERT INTO AdminUsers (FullName, Email, Role, PasswordHash)
                                         VALUES (@FullName, @Email, @Role, @PasswordHash)";
                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@FullName", fullName.Trim());
                        cmd.Parameters.AddWithValue("@Email", email.Trim().ToLower());
                        cmd.Parameters.AddWithValue("@Role", role.Trim());
                        cmd.Parameters.AddWithValue("@PasswordHash", HashPassword(password));
                        cmd.ExecuteNonQuery();
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                errorMsg = "Database error: " + ex.Message;
                return false;
            }
        }

        /// <summary>Authenticate admin login. Returns admin row or null.</summary>
        public static DataRow AdminLogin(string email, string password)
        {
            try
            {
                using (var conn = new SqlConnection(ConnStr))
                {
                    conn.Open();
                    const string sql = @"SELECT Id, FullName, Email, Role
                                         FROM AdminUsers
                                         WHERE Email = @Email
                                           AND PasswordHash = @PasswordHash
                                           AND IsActive = 1";
                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email.Trim().ToLower());
                        cmd.Parameters.AddWithValue("@PasswordHash", HashPassword(password));
                        var da = new SqlDataAdapter(cmd);
                        var dt = new DataTable();
                        da.Fill(dt);
                        return dt.Rows.Count > 0 ? dt.Rows[0] : null;
                    }
                }
            }
            catch { return null; }
        }

        // ─────────────────────────────────────────────────────────────
        // FARMERS
        // ─────────────────────────────────────────────────────────────

        /// <summary>Register a new farmer. Returns true on success.</summary>
        public static bool FarmerRegister(string fullName, string mobile, string language, string password, out string errorMsg)
        {
            errorMsg = "";
            try
            {
                // Clean mobile to digits only for storage
                string cleanMobile = CleanMobile(mobile);
                using (var conn = new SqlConnection(ConnStr))
                {
                    conn.Open();
                    using (var chk = new SqlCommand("SELECT COUNT(1) FROM Farmers WHERE MobileNumber = @Mobile", conn))
                    {
                        chk.Parameters.AddWithValue("@Mobile", cleanMobile);
                        int count = (int)chk.ExecuteScalar();
                        if (count > 0) { errorMsg = "A farmer account with this mobile number already exists."; return false; }
                    }
                    const string sql = @"INSERT INTO Farmers (FullName, MobileNumber, PreferredLanguage, PasswordHash)
                                         VALUES (@FullName, @Mobile, @Language, @PasswordHash)";
                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@FullName", fullName.Trim());
                        cmd.Parameters.AddWithValue("@Mobile", cleanMobile);
                        cmd.Parameters.AddWithValue("@Language", language ?? "gu");
                        cmd.Parameters.AddWithValue("@PasswordHash", HashPassword(password));
                        cmd.ExecuteNonQuery();
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                errorMsg = "Database error: " + ex.Message;
                return false;
            }
        }

        /// <summary>Authenticate farmer by mobile + password. Returns farmer row or null.</summary>
        public static DataRow FarmerLogin(string mobile, string password)
        {
            try
            {
                string cleanMobile = CleanMobile(mobile);
                using (var conn = new SqlConnection(ConnStr))
                {
                    conn.Open();
                    const string sql = @"SELECT Id, FullName, MobileNumber, PreferredLanguage
                                         FROM Farmers
                                         WHERE MobileNumber = @Mobile
                                           AND PasswordHash = @PasswordHash
                                           AND IsActive = 1";
                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@Mobile", cleanMobile);
                        cmd.Parameters.AddWithValue("@PasswordHash", HashPassword(password));
                        var da = new SqlDataAdapter(cmd);
                        var dt = new DataTable();
                        da.Fill(dt);
                        return dt.Rows.Count > 0 ? dt.Rows[0] : null;
                    }
                }
            }
            catch { return null; }
        }

        // ─────────────────────────────────────────────────────────────
        // AGRO STORE OWNERS
        // ─────────────────────────────────────────────────────────────

        /// <summary>Register a new agro store owner. Returns true on success.</summary>
        public static bool AgroStoreRegister(string storeName, string ownerName, string address, string licenseId, string mobile, string password, out string errorMsg)
        {
            errorMsg = "";
            try
            {
                string cleanMobile = CleanMobile(mobile);
                using (var conn = new SqlConnection(ConnStr))
                {
                    conn.Open();
                    // Check mobile duplicate
                    using (var chk = new SqlCommand("SELECT COUNT(1) FROM AgroStoreOwners WHERE MobileNumber = @Mobile OR LicenseId = @License", conn))
                    {
                        chk.Parameters.AddWithValue("@Mobile", cleanMobile);
                        chk.Parameters.AddWithValue("@License", licenseId.Trim().ToUpper());
                        int count = (int)chk.ExecuteScalar();
                        if (count > 0) { errorMsg = "An agro store with this mobile number or license ID already exists."; return false; }
                    }
                    const string sql = @"INSERT INTO AgroStoreOwners (StoreName, OwnerName, StoreAddress, LicenseId, MobileNumber, PasswordHash)
                                         VALUES (@StoreName, @OwnerName, @Address, @LicenseId, @Mobile, @PasswordHash)";
                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@StoreName", storeName.Trim());
                        cmd.Parameters.AddWithValue("@OwnerName", ownerName.Trim());
                        cmd.Parameters.AddWithValue("@Address", address.Trim());
                        cmd.Parameters.AddWithValue("@LicenseId", licenseId.Trim().ToUpper());
                        cmd.Parameters.AddWithValue("@Mobile", cleanMobile);
                        cmd.Parameters.AddWithValue("@PasswordHash", HashPassword(password));
                        cmd.ExecuteNonQuery();
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                errorMsg = "Database error: " + ex.Message;
                return false;
            }
        }

        /// <summary>Authenticate agro store owner by mobile + password. Returns store row or null.</summary>
        public static DataRow AgroStoreLogin(string mobile, string password)
        {
            try
            {
                string cleanMobile = CleanMobile(mobile);
                using (var conn = new SqlConnection(ConnStr))
                {
                    conn.Open();
                    const string sql = @"SELECT Id, StoreName, OwnerName, MobileNumber, LicenseId
                                         FROM AgroStoreOwners
                                         WHERE MobileNumber = @Mobile
                                           AND PasswordHash = @PasswordHash
                                           AND IsActive = 1";
                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@Mobile", cleanMobile);
                        cmd.Parameters.AddWithValue("@PasswordHash", HashPassword(password));
                        var da = new SqlDataAdapter(cmd);
                        var dt = new DataTable();
                        da.Fill(dt);
                        return dt.Rows.Count > 0 ? dt.Rows[0] : null;
                    }
                }
            }
            catch { return null; }
        }

        // ─────────────────────────────────────────────────────────────
        // Utility
        // ─────────────────────────────────────────────────────────────
        private static string CleanMobile(string mobile)
        {
            if (string.IsNullOrWhiteSpace(mobile)) return "";
            // Remove +91, spaces, dashes — keep last 10 digits
            string digits = System.Text.RegularExpressions.Regex.Replace(mobile, @"\D", "");
            return digits.Length >= 10 ? digits.Substring(digits.Length - 10) : digits;
        }
    }
}
