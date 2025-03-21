using System;

namespace BookSwapDB
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                if (!Request.Url.AbsolutePath.Contains("Login.aspx")) // ✅ منع التكرار
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        // ✅ زر استعراض الكتب المتاحة
        protected void RedirectToBooks(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx"); // توجيه المستخدم إلى صفحة الكتب المتاحة
        }

        // ✅ زر تسجيل الخروج
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // حذف بيانات الجلسة وإعادة التوجيه إلى صفحة تسجيل الدخول
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}