using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace BookSwapDB
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
            }
        }

        private void LoadBooks()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
            SELECT b.Id, b.Title, b.Author, b.Price, b.Condition, b.Description, 
                   b.ImageUrl, b.MajorId, b.UniversitiesId, b.UserId, u.Email AS OwnerEmail
            FROM Books b
            JOIN Users u ON b.UserId = u.Id";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // ✅ التحقق من جلسة المستخدم لتحديد زر الرسائل
                int currentUserId = Session["UserId"] != null ? Convert.ToInt32(Session["UserId"]) : 0;
                dt.Columns.Add("ShowMessageButton", typeof(bool));
                foreach (DataRow row in dt.Rows)
                {
                    int ownerId = Convert.ToInt32(row["UserId"]);
                    row["ShowMessageButton"] = (currentUserId != ownerId);
                }

                rptBooks.DataSource = dt;
                rptBooks.DataBind();
            }
        }
    }
}