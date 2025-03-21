using System;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace BookSwapDB
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadExchangeOptions();
                LoadBookConditions();
            }
        }

        private void LoadExchangeOptions()
        {
            ddlExchangeOption.Items.Clear();
            ddlExchangeOption.Items.Add(new ListItem("اختر", ""));
            ddlExchangeOption.Items.Add(new ListItem("بيع", "بيع"));
            ddlExchangeOption.Items.Add(new ListItem("تبادل", "تبادل"));
        }

        private void LoadBookConditions()
        {
            ddlBookCondition.Items.Clear();
            ddlBookCondition.Items.Add(new ListItem("اختر", ""));
            ddlBookCondition.Items.Add(new ListItem("جديد", "جديد"));
            ddlBookCondition.Items.Add(new ListItem("مستعمل", "مستعمل"));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // ✅ استرجاع القيم من الحقول
                string title = txtTitle.Text.Trim();
                string author = txtAuthor.Text.Trim();
                string description = txtDescription.Text.Trim();
                string universitiesId = txtUniversity.Text.Trim();
                string majorId = txtMajor.Text.Trim();
                string exchangeOption = ddlExchangeOption.SelectedValue;
                string bookCondition = ddlBookCondition.SelectedValue; // ✅ التأكد من تخزينها
                decimal price = (exchangeOption == "بيع") ? Convert.ToDecimal(txtPrice.Text.Trim()) : 0;
                int userId = Convert.ToInt32(Session["UserId"]);

                // ✅ التحقق من أن جميع الحقول المطلوبة ليست فارغة
                if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(author) ||  string.IsNullOrEmpty(exchangeOption) || string.IsNullOrEmpty(bookCondition))
                {
                    lblMessage.Text = "⚠️ يرجى ملء جميع الحقول المطلوبة!";
                    return;
                }

                string imageUrl = "";
                if (fileUploadImage.HasFile)
                {
                    string folderPath = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }
                    imageUrl = "Uploads/" + Path.GetFileName(fileUploadImage.FileName);
                    fileUploadImage.SaveAs(Server.MapPath("~/" + imageUrl));
                }

                // ✅ التأكد من إدخال الحالة حتى لا تكون NULL
                if (string.IsNullOrEmpty(bookCondition))
                {
                    bookCondition = "جديد"; // القيمة الافتراضية
                }

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO Books (Title, Author, Description, UniversitiesId, MajorId, ExchangeOption, Condition, Price, UserId, ImageUrl, CreatedAt) " +
                                   "VALUES (@Title, @Author, @Description, @UniversitiesId, @MajorId, @ExchangeOption, @Condition, @Price, @UserId, @ImageUrl, GETDATE())";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Author", author);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@UniversitiesId", universitiesId);
                    cmd.Parameters.AddWithValue("@MajorId", majorId);
                    cmd.Parameters.AddWithValue("@ExchangeOption", exchangeOption);
                    cmd.Parameters.
                        AddWithValue("@Condition", bookCondition); // ✅ الآن يتم تخزينها بشكل صحيح
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);

                    cmd.ExecuteNonQuery();
                    Response.Redirect("Books.aspx");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "❌ حدث خطأ أثناء إضافة الكتاب: " + ex.Message;
            }
        }

        protected void ddlExchangeOption_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlExchangeOption.SelectedValue == "بيع")
            {
                txtPrice.Visible = true;
            }
            else
            {
                txtPrice.Visible = false;
                txtPrice.Text = ""; // ✅ تصفير السعر إذا لم يكن بيع
            }
        }
    }
}