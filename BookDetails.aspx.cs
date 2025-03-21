using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BookSwapDB
{
    public partial class BookDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string bookID = Request.QueryString["id"]; // تأكدي أن اسم البراميتر مطابق للـ Query String في الرابط
                if (!string.IsNullOrEmpty(bookID))
                {
                    LoadBookDetails(bookID);
                }
            }
        }

        private void LoadBookDetails(string bookID)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["BookSwapDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Title, Author, Condition, Description FROM Books WHERE BookID = @BookID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@BookID", bookID);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblTitle.Text = reader["Title"].ToString();
                    lblAuthor.Text = reader["Author"].ToString();
                    lblCondition.Text = reader["Condition"].ToString();
                    lblDescription.Text = reader["Description"].ToString();
                }
                conn.Close();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx");
        }
    }
}