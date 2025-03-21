<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BookSwapDB.Home" %>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="utf-8" />
    <title>📚 BookSwap - الصفحة الرئيسية</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@400;700&display=swap');

        body {
            font-family: 'Tajawal', Arial, sans-serif;
            background: linear-gradient(to right, #6aa8b0, #b2e4ed);
            color: #333;
            text-align: center;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        .navbar {
            background: rgba(255, 255, 255, 0.2);
            padding: 15px;
            border-radius: 0 0 10px 10px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            transition: background 0.3s ease-in-out, transform 0.2s ease-in-out;
            border-radius: 5px;
        }
        
        .navbar a:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }
        
        .home-container {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 80px 20px;
        }
        
        .home-container h1 {
            font-size: 38px;
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            color: #004d61;
        }
        
        .home-container p {
            font-size: 18px;
            max-width: 600px;
            margin: auto;
            color: #333;
            margin-bottom: 40px;
        }
        
        .btn-browse {
            margin-top: 20px;
            padding: 14px 35px;
            font-size: 22px;
            font-weight: bold;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s ease-in-out;
        }
        
        .btn-browse:hover {
            background: linear-gradient(to right, #feb47b, #ff7e5f);
            transform: scale(1.1);
        }

        .btn-logout {
            margin-top: 20px;
            padding: 10px 25px;
            font-size: 18px;
            background: #ff4d4d;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s ease-in-out;
        }

        .btn-logout:hover {
            background: #e63946;
            transform: scale(1.05);
        }

        .footer {
            background: rgba(0, 0, 0, 0.1);
            padding: 15px;
            text-align: center;
            color: white;
            font-size: 14px;
            border-radius: 10px 10px 0 0;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Contact.aspx">📞 تواصل معنا</a>
        <a href="MyBooks.aspx">📖 كتبي</a>
        <a href="AddBook.aspx">➕ إضافة كتاب</a>
        <a href="Books.aspx">📚 الكتب المتاحة</a>
        <a href="Home.aspx">🏠 الصفحة الرئيسية</a>
    </div>

    <form id="form1" runat="server">
        <div class="home-container">
            <h1>📚 BookSwap مرحبًا بك في منصة </h1>
            <p>.منصة لبيع، تبادل الكتب حسب التخصص والجامعة</p>

            <!-- ✅ عرض اسم المستخدم المسجل -->
            <asp:Label ID="lblWelcome" runat="server" CssClass="fw-bold fs-4 text-primary"></asp:Label>

            <!-- ✅ زر استعراض الكتب -->
            <asp:Button ID="btnBrowseBooks" runat="server" CssClass="btn-browse" Text="📖 استعرض الكتب المتاحة" OnClick="RedirectToBooks" />

            <!-- ✅ زر تسجيل الخروج -->
            <asp:Button ID="btnLogout" runat="server" CssClass="btn-logout" Text="🚪 تسجيل الخروج" OnClick="btnLogout_Click" />
        </div>
    </form>

    <div class="footer">
        <p>© 2025 BookSwap | جميع الحقوق محفوظة.</p>
    </div>
</body>
</html>