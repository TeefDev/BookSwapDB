using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace BookSwapDB
{
    public partial class MyBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMyBooks();
            }
        }

        private void LoadMyBooks()
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Id, Title, Author, Price, Condition, Description, ImageUrl FROM Books WHERE UserId = @UserId";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@UserId", userId);

                DataTable dt = new DataTable();
                da.Fill(dt);

                rptMyBooks.DataSource = dt;
                rptMyBooks.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int bookId = Convert.ToInt32(btn.CommandArgument);

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "DELETE FROM Books WHERE Id = @BookId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@BookId", bookId);
                cmd.ExecuteNonQuery();
            }

            LoadMyBooks(); // تحديث القائمة بعد الحذف
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int bookId = Convert.ToInt32(btn.CommandArgument);

            // إعادة توجيه المستخدم إلى صفحة التعديل مع تمرير معرف الكتاب
            Response.Redirect("EditBook.aspx?BookId=" + bookId);
        }
    }
}