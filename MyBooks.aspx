<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyBooks.aspx.cs" Inherits="BookSwapDB.MyBooks" %>

<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="utf-8" />
    <title>📚 كتبي</title>
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
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: auto;
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
        }

        .btn-edit, .btn-delete {
            margin-top: 10px;
            padding: 8px 15px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s ease-in-out;
        }

        .btn-edit {
            background-color: #007bff;
        }

        .btn-edit:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #b02a37;
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

    <script>
        function confirmDelete() {
            return confirm("⚠️ هل أنت متأكد من حذف هذا الكتاب؟ لا يمكن التراجع عن هذا الإجراء.");
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
        <asp:Repeater ID="rptMyBooks" runat="server">
            <ItemTemplate>
                <div class="book-container">
                    <img src='<%# Eval("ImageUrl") %>' alt="غلاف الكتاب" class="book-image" />
                    <p class="book-title"><%# Eval("Title") %></p>
                    <p class="book-info">📖 <strong>المؤلف:</strong> <%# Eval("Author") %></p>
                    <p class="book-info">💰 <strong>السعر:</strong> <%# Eval("Price") %> ريال</p>

                    <!-- زر التعديل -->
                    <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-edit"
                        Text="✏️ تعديل" CommandArgument='<%# Eval("Id") %>' OnClick="btnEdit_Click" />

                    <!-- زر الحذف -->
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-delete"
                        Text="🗑️ حذف" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirmDelete();" 
                        OnClick="btnDelete_Click" />
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