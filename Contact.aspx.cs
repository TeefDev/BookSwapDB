using System;
using System.Data.SqlClient;
using System.Configuration;

namespace BookSwapDB
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
            {
                lblMessage.Text = "❌ الرجاء ملء جميع الحقول.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO ContactMessages (FullName, Email, Message, CreatedAt) " +
                               "VALUES (@FullName, @Email, @Message, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Message", message);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "✅ تم إرسال رسالتك بنجاح!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    // مسح الحقول بعد الإرسال
                    txtFullName.Text = "";
                    txtEmail.Text = "";
                    txtMessage.Text = "";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "❌ حدث خطأ أثناء إرسال الرسالة.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }
    }
}