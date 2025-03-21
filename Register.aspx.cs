using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace BookSwapDB
{
    public partial class Register : Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // ✅ التحقق من أن جميع الحقول ممتلئة
            if (string.IsNullOrWhiteSpace(txtFullName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblMessage.Text = "❌ جميع الحقول مطلوبة!";
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();

                    // ✅ التحقق مما إذا كان البريد الإلكتروني مسجلاً مسبقًا
                    string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        int count = (int)checkCmd.ExecuteScalar();
                        if (count > 0)
                        {
                            lblMessage.Text = "❌ البريد الإلكتروني مسجل مسبقًا! استخدم بريدًا آخر.";
                            return;
                        }
                    }

                    // ✅ إدخال المستخدم الجديد بعد التحقق
                    string query = "INSERT INTO Users (FullName, Email, PasswordHash) OUTPUT INSERTED.Id VALUES (@FullName, @Email, @Password)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@FullName", fullName);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        object userId = cmd.ExecuteScalar();

                        if (userId != null)
                        {
                            lblMessage.Text = "✅ تم تسجيل الحساب بنجاح! جاري تحويلك...";
                            Response.Redirect("Login.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();
                        }
                        else
                        {
                            lblMessage.Text = "❌ فشل في إنشاء الحساب!";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "❌ خطأ: " + ex.Message;
                }
            }
        }
    }
}