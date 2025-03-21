using System;
using System.Data.SqlClient;
using System.Configuration;

namespace BookSwapDB
{
    public partial class EditBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["BookId"] != null && int.TryParse(Request.QueryString["BookId"], out int bookId))
                {
                    LoadBookData(bookId);
                }
            }
        }

        private void LoadBookData(int bookId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Title, Author, Description, Price, ExchangeOption, MajorId, UniversitiesId " +
                               "FROM Books WHERE Id = @BookId";  // ❌ تم حذف BookCondition
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@BookId", bookId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtTitle.Text = reader["Title"].ToString();
                    txtAuthor.Text = reader["Author"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtPrice.Text = reader["Price"].ToString();

                    // ✅ تحديث خيار التبادل إذا كان موجودًا
                    if (!string.IsNullOrEmpty(reader["ExchangeOption"].ToString()))
                    {
                        ddlExchangeOption.SelectedValue = reader["ExchangeOption"].ToString();
                    }

                    txtMajor.Text = reader["MajorId"].ToString();
                    txtUniversity.Text = reader["UniversitiesId"].ToString();
                }
                reader.Close();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["BookId"] != null && int.TryParse(Request.QueryString["BookId"], out int bookId))
            {
                string title = txtTitle.Text.Trim();
                string author = txtAuthor.Text.Trim();
                string description = txtDescription.Text.Trim();
                decimal price = Convert.ToDecimal(txtPrice.Text.Trim());
                string exchangeOption = ddlExchangeOption.SelectedValue;
                string majorId = txtMajor.Text.Trim();
                string universityId = txtUniversity.Text.Trim();

                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "UPDATE Books SET Title = @Title, Author = @Author, Description = @Description, " +
                                   "Price = @Price, ExchangeOption = @ExchangeOption, " +
                                   "MajorId = @MajorId, UniversitiesId = @UniversitiesId " +
                                   "WHERE Id = @BookId"; // ❌ لم يعد يتم تحديث BookCondition

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@BookId", bookId);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Author", author);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@ExchangeOption", exchangeOption);
                    cmd.Parameters.AddWithValue("@MajorId", majorId);
                    cmd.Parameters.AddWithValue("@UniversitiesId", universityId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // ✅ تأكيد الحفظ عبر Alert ثم إعادة التوجيه
                Response.
                    Write("<script>alert('✅ تم تحديث بيانات الكتاب بنجاح!'); window.location='MyBooks.aspx';</script>");
            }
        }
    }
}