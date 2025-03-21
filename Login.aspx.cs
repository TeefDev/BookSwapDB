using System;
using System.Data.SqlClient;
using System.Configuration;

namespace BookSwapDB
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null && !IsPostBack) // ✅ منع إعادة التوجيه المتكرر
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "❌ الرجاء إدخال البريد الإلكتروني وكلمة المرور!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // ✅ البحث عن المستخدم وإحضار Id و FullName إن كان موجودًا
                string query = "SELECT Id, FullName FROM Users WHERE Email = @Email AND PasswordHash = @Password";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read()) // ✅ المستخدم موجود
                {
                    int userId = Convert.ToInt32(reader["Id"]);
                    string fullName = reader["FullName"].ToString();

                    // ✅ حفظ بيانات المستخدم في الجلسة
                    Session["UserEmail"] = email;
                    Session["UserId"] = userId;
                    Session["UserName"] = fullName; // ✅ لإظهار اسم المستخدم لاحقًا

                    // ✅ التوجيه إلى الصفحة الرئيسية بعد تسجيل الدخول
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblMessage.Text = "❌ البريد الإلكتروني أو كلمة المرور غير صحيحة!";
                }
            }
        }
    }
}