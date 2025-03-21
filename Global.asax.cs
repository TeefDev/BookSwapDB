using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;

namespace BookSwapDB
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Application_BeginRequest(object sender, EventArgs e)
        {
            // ✅ التحقق أولًا من أن HttpContext.Current و Session ليست null
            if (HttpContext.Current != null && HttpContext.Current.Session != null)
            {
                // 🔹 معرفة الصفحة التي يحاول المستخدم فتحها
                string currentPage = HttpContext.Current.Request.Url.AbsolutePath.ToLower();

                // 🔹 السماح فقط بفتح Login.aspx و Register.aspx بدون تسجيل دخول
                bool isAuthPage = currentPage.EndsWith("login.aspx") || currentPage.EndsWith("register.aspx");

                // 🔹 إذا لم يكن المستخدم مسجل دخولًا ويريد فتح صفحة أخرى، يتم إرجاعه إلى Login.aspx
                if (HttpContext.Current.Session["UserEmail"] == null && !isAuthPage)
                {
                    HttpContext.Current.Response.Redirect("Login.aspx");
                }
            }
        }
    }
}