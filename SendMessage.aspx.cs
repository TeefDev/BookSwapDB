using System;
using System.Data.SqlClient;
using System.Configuration;

namespace BookSwapDB
{
    public partial class SendMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ReceiverId"] != null && Request.QueryString["BookId"] != null)
                {
                    hfReceiverId.Value = Request.QueryString["ReceiverId"];
                    hfBookId.Value = Request.QueryString["BookId"];
                }
                else
                {
                    Response.Redirect("Books.aspx");
                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string messageText = txtMessage.Text.Trim();
            int senderId = Convert.ToInt32(Session["UserId"]);
            int receiverId = Convert.ToInt32(hfReceiverId.Value);
            int bookId = Convert.ToInt32(hfBookId.Value);

            if (!string.IsNullOrEmpty(messageText))
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO Messages (SenderId, ReceiverId, BookId, MessageText, SentAt) VALUES (@SenderId, @ReceiverId, @BookId, @MessageText, GETDATE())";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@SenderId", senderId);
                    cmd.Parameters.AddWithValue("@ReceiverId", receiverId);
                    cmd.Parameters.AddWithValue("@BookId", bookId);
                    cmd.Parameters.AddWithValue("@MessageText", messageText);
                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("Books.aspx");
            }
        }
    }
}