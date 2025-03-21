<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="BookSwapDB.Books" %>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="utf-8" />
    <title>📚 الكتب المتاحة</title>
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

        .books-container {
            flex-grow: 1;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 50px 20px;
        }

        .book-container {
            width: 280px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            padding: 15px;
            text-align: center;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .book-container:hover {
            transform: scale(1.05);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
        }

        .book-image {
            width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .book-title {
            font-size: 20px;
            font-weight: bold;
            color: #004d61;
        }

        .book-info {
            font-size: 16px;
            margin: 5px 0;
            text-align: right; /* جعل النصوص تبدأ من اليمين */
            direction: rtl;
        }

        .btn-toggle, .btn-message {
            margin-top: 10px;
            padding: 8px 15px;
            background-color: #ff7e5f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s ease-in-out;
            text-decoration: none; /* إزالة الخط تحت النص */
        }

        .btn-toggle:hover, .btn-message:hover {
            background-color: #e64a3b;
            transform: scale(1.05);
        }

        .details {
            display: none;
            margin-top: 10px;
            padding-top: 10px;
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

    <script>
        function toggleDetails(id, event) {
            event.preventDefault();
            var details = document.getElementById("details_" + id);
            details.style.display = (details.style.display === "none" || details.style.display === "") ? "block" : "none";
        }
    </script>
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
    <div class="books-container">
   <asp:Repeater ID="rptBooks" runat="server">
    <ItemTemplate>
        <div class="book-container">
            <img src='<%# Eval("ImageUrl") %>' alt="غلاف الكتاب" class="book-image" />
            <p class="book-title"><%# Eval("Title") %></p>
            <p class="book-info">📖 <strong>المؤلف:</strong> <%# Eval("Author") %></p>
            <p class="book-info">💰 <strong>السعر:</strong> <%# Eval("Price") %> ريال</p>

            <button class="btn-toggle" onclick="toggleDetails('<%# Eval("Id") %>', event)">📘 عرض التفاصيل</button>

            <div id="details_<%# Eval("Id") %>" class="details">
    <!-- ✅ عرض الحالة فقط إن وُجدت -->
    <%# !string.IsNullOrEmpty(Eval("Condition").ToString()) ? "<p class='book-info'><strong>📌 الحالة:</strong> " + Eval("Condition") + "</p>" : "" %>

    <!-- ✅ عرض التخصص فقط إن وُجد -->
    <%# !string.IsNullOrEmpty(Eval("MajorId").ToString()) ? "<p class='book-info'><strong>🎓 التخصص:</strong> " + Eval("MajorId") + "</p>" : "" %>

    <!-- ✅ عرض الجامعة فقط إن وُجدت -->
    <%# !string.IsNullOrEmpty(Eval("UniversitiesId").ToString()) ? "<p class='book-info'><strong>🏛️ الجامعة:</strong> " + Eval("UniversitiesId") + "</p>" : "" %>

    <!-- ✅ عرض الوصف فقط إن وُجد -->
    <%# !string.IsNullOrEmpty(Eval("Description").ToString()) ? "<p class='book-info'><strong>📝 الوصف:</strong> " + Eval("Description") + "</p>" : "" %>

    <!-- ✅ زر إرسال الرسالة يظهر فقط لمن ليسوا أصحاب الكتب -->
    <asp:PlaceHolder runat="server" Visible='<%# Convert.ToBoolean(Eval("ShowMessageButton")) %>'>
        <a href='mailto:<%# Eval("OwnerEmail") %>?subject=طلب بشأن كتاب: <%# Eval("Title") %>'
            class='btn btn-primary btn-message' style='display:block; margin:10px auto;'>✉️ إرسال رسالة</a>
    </asp:PlaceHolder>
</div>
        </div>
    </ItemTemplate>
</asp:Repeater>
    </div>
</form>

<div class="footer">
    <p>© 2025 BookSwap | جميع الحقوق محفوظة.</p>
</div>

</body>
</html>